#!/bin/bash
# Claude Code Stop hook: read Claude's last reply aloud with macOS `say`.
# Only speaks while ~/.claude/speak-on exists (toggle with: touch / rm).

[ -f "$HOME/.claude/speak-on" ] || exit 0

msg=$(jq -r '.last_assistant_message // empty')
[ -n "$msg" ] || exit 0

# Drop code blocks and markdown symbols so it reads naturally
text=$(printf '%s\n' "$msg" | sed -E \
  -e '/^```/,/^```/d' \
  -e 's/\[([^]]*)\]\([^)]*\)/\1/g' \
  -e 's/[`*#>_|]//g')

pkill -x say 2>/dev/null          # cut off any previous reply still speaking
printf '%s' "$text" | say ${CLAUDE_SAY_VOICE:+-v "$CLAUDE_SAY_VOICE"}
