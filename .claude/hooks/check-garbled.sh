#!/usr/bin/env bash
# PostToolUse hook: detect U+FFFD (garbled characters) in written/edited files.
# Exits 2 (blocking error) if corruption is found, so Claude must fix it immediately.

set -euo pipefail

# Read JSON input from stdin
input=$(cat)

# Extract file_path from tool_input
file_path=$(printf '%s' "$input" | python3 -c "
import sys, json
data = json.load(sys.stdin)
print(data.get('tool_input', {}).get('file_path', ''))
")

# Skip if no file path or file doesn't exist
[[ -z "$file_path" || ! -f "$file_path" ]] && exit 0

# Only check text files (skip binaries)
if ! file --brief --mime-type "$file_path" 2>/dev/null | grep -q '^text/'; then
    exit 0
fi

# Scan for U+FFFD (UTF-8 bytes: ef bf bd)
matches=$(grep -Pn $'\xef\xbf\xbd' "$file_path" 2>/dev/null || true)

if [[ -n "$matches" ]]; then
    # Count occurrences
    count=$(echo "$matches" | wc -l | tr -d ' ')

    # Format error message for Claude
    cat >&2 <<EOF
❌ GARBLED CHARACTER DETECTED in: $file_path
Found $count line(s) containing U+FFFD replacement characters (乱码):

$matches

You MUST fix these corrupted characters immediately using the Edit tool.
Common corruptions: 子��息→子消息, 投��→投递, etc.
After fixing, re-read the file to verify the fix.
EOF
    exit 2
fi

exit 0
