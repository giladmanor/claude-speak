---
name: speak
description: Turn on or turn off the speech of Claude's replies, stop the current reply, or tell if speech is on. Use when the user asks to turn speech, voice, or reading aloud on or off, asks Claude to stop talking or be quiet, or asks if speech is on.
---

# Speech output

A Stop hook reads each reply aloud with the macOS `say` command.
The hook speaks only while the flag file `~/.claude/speak-on` exists.

## Commands

- To turn speech **on**, run `touch ~/.claude/speak-on`.
- To turn speech **off**, run `rm -f ~/.claude/speak-on` and `pkill -x say`.
- To stop the current reply only ("stop", "be quiet"), run `pkill -x say`.
- To tell if speech is on, run `test -f ~/.claude/speak-on`.

## Replies while speech is on

- Keep replies short and conversational.
- Do not use tables.
- Put code in code blocks. The hook does not read code blocks aloud.
