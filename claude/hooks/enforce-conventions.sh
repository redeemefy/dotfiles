#!/bin/bash
# enforce-conventions.sh — PreToolUse hook for Edit|Write
# Blocks source code edits until tests have been written/modified in the current session.
# Reminds about SOLID and DRY on every allowed source edit.

set -euo pipefail

input=$(cat)
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
session_id=$(echo "$input" | jq -r '.session_id // empty')

# No file path — nothing to check
if [ -z "$file_path" ]; then
  exit 0
fi

# State file tracks whether tests have been edited this session
state_file="/tmp/claude-tdd-${session_id}"

# --- Classify the file ---

# Extract filename and extension
filename=$(basename "$file_path")
extension="${filename##*.}"

# 1. Non-code files — always allow silently
case "$filename" in
  *.md|*.mdx|*.json|*.yaml|*.yml|*.toml|*.css|*.scss|*.less|*.svg|*.png|*.jpg|*.ico|*.lock|*.env*|*.gitignore|*.prettierrc*|*.eslintrc*|*.config.*|Makefile|Dockerfile|*.prisma|*.sql|*.graphql|*.gql|*.html)
    exit 0
    ;;
esac

# Also allow package manifests and configs by path patterns
case "$file_path" in
  */prisma/*|*/migrations/*|*/.github/*|*/.vscode/*|*/public/*|*/styles/*|*/reference/*)
    exit 0
    ;;
esac

# 2. Test files — record state and allow
case "$file_path" in
  *__tests__/*|*__test__/*|*.test.*|*.spec.*|*_test.*|*_spec.*)
    # Mark that tests have been edited in this session
    echo "$file_path" >> "$state_file"
    exit 0
    ;;
esac

# Also catch test directories by convention
case "$file_path" in
  */test/*|*/tests/*|*/spec/*|*/specs/*)
    echo "$file_path" >> "$state_file"
    exit 0
    ;;
esac

# 3. Source code files — check TDD state
case "$extension" in
  ts|tsx|js|jsx|py|go|rs|ex|exs|rb|java|kt|swift|c|cpp|h|hpp)
    # Check if tests have been written this session
    if [ -f "$state_file" ]; then
      # Tests exist — allow with SOLID/DRY reminder
      echo "CONVENTION REMINDER:"
      echo "- SOLID: Does this file have a single responsibility? Extend, don't modify existing contracts."
      echo "- DRY: Did you search for existing functions/utilities to reuse? Don't duplicate code."
      exit 0
    else
      # No tests yet — BLOCK
      cat >&2 <<'BLOCK'
{"hookSpecificOutput":{"permissionDecision":"deny"},"systemMessage":"BLOCKED: TDD Convention — You must write or update tests BEFORE modifying source code.\n\n1. Write or modify the relevant test file first (*.test.*, *.spec.*, __tests__/*)\n2. Then come back and edit this source file.\n\nIf removing a feature, update or remove the tests first.\nIf refactoring, ensure tests exist and pass before changing source code.\n\nThis is a non-negotiable convention. Write tests first."}
BLOCK
      exit 2
    fi
    ;;
esac

# 4. Anything else — allow silently
exit 0
