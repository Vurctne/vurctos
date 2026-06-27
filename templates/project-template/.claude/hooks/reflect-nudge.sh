#!/bin/sh
# SessionStart nudge: if this project has session day-logs that have not
# been consolidated into durable memory yet, remind the assistant once at
# session start, including the oldest unreflected date and a short digest
# of the freshest entries (so recent lessons get re-read, not just
# counted). Escalates the wording when the backlog builds. Read-only;
# prints nothing when there is nothing to do.
dir="${CLAUDE_PROJECT_DIR:-.}"
[ -d "$dir/sessions" ] || exit 0
last=""
[ -f "$dir/reflections/.last-reflected" ] && \
  last=$(cat "$dir/reflections/.last-reflected" 2>/dev/null)
n=0
oldest=""
newest=""
for f in "$dir"/sessions/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].md; do
  [ -e "$f" ] || continue
  d=$(basename "$f" .md)
  if [ -z "$last" ] || [ "$d" \> "$last" ]; then
    n=$((n+1))
    if [ -z "$oldest" ] || [ "$d" \< "$oldest" ]; then oldest="$d"; fi
    newest="$f"
  fi
done
[ "$n" -gt 0 ] || exit 0
# Digest: the last three entries of the newest unreflected day-log,
# made JSON-safe (tab to space, every other control char deleted since
# JSON forbids them in strings, then backslash and quote escaped) and
# joined onto one line.
digest=$(grep '^- \[' "$newest" 2>/dev/null | tail -3 \
  | tr '\011' ' ' | tr -d '\001-\010\013-\037' \
  | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' \
  | awk 'NR>1{printf " ; "}{printf "%s", $0}')
[ -n "$digest" ] || digest="(no parsed entries)"
if [ "$n" -ge 7 ]; then
  urgency="Backlog is building; consolidate soon"
else
  urgency="When convenient, consolidate"
fi
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"This VurctOS project has %s session day-log(s) not yet consolidated into durable memory (oldest: %s). Latest entries: %s. %s: run vurctos reflect --project . to stage a proposal, review it, then vurctos reflect-apply --project ."}}\n' "$n" "$oldest" "$digest" "$urgency"
