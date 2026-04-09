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

# Model info
model=$(echo "$input" | jq -r '.model.id // .model // ""')

# Rate limits
five_hr_used=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day_used=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Color palette
# Bold magenta bg-style for dir segment: bright white text on magenta
# Dim blue for branch segment
# Segment separator: powerline right arrow solid
SEP=$(printf '\xee\x82\xb0')        # U+E0B0 powerline right solid arrow
BRANCH_SYM=$(printf '\xef\x90\x87') # U+F407 git-merge (Octicons)
FOLDER_SYM=$(printf '\xef\x81\xbc') # U+F07C folder open icon (Nerd Font)
ROBOT=$(printf '\xf3\xb0\x9a\xa9')  # U+F06A9 robot (Nerd Font)
GAUGE=$(printf '\xf0\x9f\x93\x8a')      # 📊 chart icon

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

if [ -n "$model" ]; then
  # Model icon and color
  case "$model" in
    *opus*)
      model_icon=$(printf '\xf0\x9f\x8e\xb5')  # 🎵
      model_label="Opus"
      model_color="\033[1;35m"  # magenta
      ;;
    *sonnet*)
      model_icon=$(printf '\xf0\x9f\x93\x9c')  # 📜
      model_label="Sonnet"
      model_color="\033[1;34m"  # blue
      ;;
    *haiku*)
      model_icon=$(printf '\xf0\x9f\x8d\x83')  # 🍃
      model_label="Haiku"
      model_color="\033[1;32m"  # green
      ;;
    *)
      model_icon=""
      model_label="$model"
      model_color="\033[0;37m"
      ;;
  esac

  printf " | "
  printf "%s ${model_color}%s\033[0m" "$model_icon" "$model_label"
fi

if [ -n "$five_hr_used" ]; then
  five_hr_int=$(printf "%.0f" "$five_hr_used")
  if [ "$five_hr_int" -ge 80 ]; then
    hr_color="\033[1;31m"   # red
  elif [ "$five_hr_int" -ge 50 ]; then
    hr_color="\033[1;33m"   # yellow
  else
    hr_color="\033[1;32m"   # green
  fi
  printf " | "
  printf "%s ${hr_color}5h: %s%%\033[0m" "$GAUGE" "$five_hr_int"

  if [ -n "$seven_day_used" ]; then
    seven_day_int=$(printf "%.0f" "$seven_day_used")
    if [ "$seven_day_int" -ge 80 ]; then
      day_color="\033[1;31m"
    elif [ "$seven_day_int" -ge 50 ]; then
      day_color="\033[1;33m"
    else
      day_color="\033[1;32m"
    fi
    printf " ${day_color}7d: %s%%\033[0m" "$seven_day_int"
  fi
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
