#!/bin/sh
# Claude Code status line — powerline block style
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir=$(echo "$cwd" | sed "s|^$HOME|~|")
[ -z "$dir" ] && dir="~"

# Git info (skip optional locks)
branch=""
dirty_marker=""
if [ -n "$cwd" ]; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
  if [ -z "$branch" ]; then
    branch=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  fi
  if [ -n "$branch" ]; then
    if ! git -C "$cwd" --no-optional-locks diff --quiet 2>/dev/null || \
       ! git -C "$cwd" --no-optional-locks diff --cached --quiet 2>/dev/null; then
      dirty_marker="*"
    fi
  fi
fi

# Context usage
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Session cost
raw_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
cost=$(printf "%.2f" "$raw_cost")

# Color palette
# Bold magenta bg-style for dir segment: bright white text on magenta
# Dim blue for branch segment
# Segment separator: powerline right arrow solid
SEP=$(printf '\xee\x82\xb0')        # U+E0B0 powerline right solid arrow
BRANCH_SYM=$(printf '\xef\x90\x87') # U+F407 git-merge (Octicons)
FOLDER_SYM=$(printf '\xef\x81\xbc') # U+F07C folder open icon (Nerd Font)
ROBOT=$(printf '\xf3\xb0\x9a\xa9')  # U+F06A9 robot (Nerd Font)
MONEYBAG=$(printf '\xf0\x9f\x92\xb0') # U+1F4B0 money bag emoji

# Segment 1 — directory: magenta text, bold, with folder icon
printf "\033[0;30m%s\033[0m\033[1;35m  %s\033[0m" "$FOLDER_SYM" "$dir"

if [ -n "$branch" ]; then
  printf " | "
  if [ -n "$dirty_marker" ]; then
    printf "\033[0;30m%s\033[0m\033[1;33m %s\033[1;31m%s\033[0m" "$BRANCH_SYM" "$branch" "$dirty_marker"
  else
    printf "\033[0;30m%s\033[0m\033[1;33m %s\033[0m" "$BRANCH_SYM" "$branch"
  fi
fi

if [ -n "$cost" ]; then
  printf " | "
  printf "%s\033[1;32m $%s\033[0m" "$MONEYBAG" "$cost"
fi

if [ -n "$remaining" ]; then
  printf " | "
  # Convert remaining to integer for threshold coloring
  rem_int=$(printf "%.0f" "$remaining")
  if [ "$rem_int" -le 15 ]; then
    ctx_color="\033[1;31m"   # red — low
  elif [ "$rem_int" -le 40 ]; then
    ctx_color="\033[1;33m"   # yellow — medium
  else
    ctx_color="\033[0;37m"   # dim white — healthy
  fi
  printf " \033[0;30m%s\033[0m ${ctx_color}%s%% context remaining\033[0m" "$ROBOT" "$remaining"
fi

printf "\n"
