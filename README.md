# speak

A Claude Code plugin. It reads Claude's replies aloud with the macOS `say` command.
Speech is off by default. You turn it on and off when you tell Claude in plain words.

## Use

- "Turn speech on" creates the flag file `~/.claude/speak-on`. Claude then reads each reply aloud.
- "Turn speech off" removes the flag file and stops the current speech.
- "Stop" or "be quiet" stops the current reply only.
- "Is speech on?" tells you the status.
- Claude keeps replies short while speech is on. The hook does not read code blocks aloud.
- A new reply stops the previous reply if that reply is still in progress.

To use a different voice, set `CLAUDE_SAY_VOICE` before you start Claude Code.
Run `say -v '?'` to see the voices.

```
export CLAUDE_SAY_VOICE=Samantha
```

## Install

At the prompt of a Claude Code terminal session:

```
/plugin install speak --marketplace giladmanor/claude-speak
```

Press `y` to add the marketplace, then select the **user** scope, so that every session has speech.

From a shell:

```
claude plugin install speak --marketplace giladmanor/claude-speak
```

## Permissions (optional)

A plugin cannot add permission rules. To stop the permission prompts, add these rules to
`permissions.allow` in `~/.claude/settings.json`:

```json
"Bash(touch ~/.claude/speak-on)",
"Bash(rm -f ~/.claude/speak-on)",
"Bash(pkill -x say)",
"Bash(test -f ~/.claude/speak-on)"
```

## Requirements

- macOS (the plugin uses `say`)
- `jq`

## Parts

- `hooks/hooks.json`: an async `Stop` hook that runs the script.
- `scripts/speak.sh`: reads the last reply, removes code blocks and markdown symbols, and speaks the text.
- `skills/speak/SKILL.md`: tells Claude how to turn speech on and off.
