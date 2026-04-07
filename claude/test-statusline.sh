#!/bin/sh
# Tests for statusline-command.sh
SCRIPT="$(dirname "$0")/statusline-command.sh"
PASS=0
FAIL=0

assert_contains() {
  label="$1"; input="$2"; expected="$3"
  # Strip ANSI escape codes for matching
  output=$(echo "$input" | sh "$SCRIPT" | sed 's/\x1b\[[0-9;]*m//g')
  if echo "$output" | grep -qF "$expected"; then
    PASS=$((PASS + 1))
  else
    FAIL=$((FAIL + 1))
    printf "FAIL: %s\n  expected to contain: %s\n  got: %s\n" "$label" "$expected" "$output"
  fi
}

# Test: cost rounds to two decimal places
assert_contains \
  "rounds long decimal cost to 2 places" \
  '{"cost":{"total_cost_usd":0.32964994999999997},"workspace":{"current_dir":"/tmp"}}' \
  '$0.33'

# Test: cost keeps clean values
assert_contains \
  "reads clean cost correctly" \
  '{"cost":{"total_cost_usd":2.45},"workspace":{"current_dir":"/tmp"}}' \
  '$2.45'

# Test: cost defaults to 0.00 when missing
assert_contains \
  "defaults cost to 0.00 when missing" \
  '{"workspace":{"current_dir":"/tmp"}}' \
  '$0.00'

# Test: cost from zero value
assert_contains \
  "shows $0 cost correctly" \
  '{"cost":{"total_cost_usd":0},"workspace":{"current_dir":"/tmp"}}' \
  '$0.00'

printf "\n%d passed, %d failed\n" "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ] || exit 1
