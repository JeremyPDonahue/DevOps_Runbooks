#!/bin/bash

# Test script for logme commands

LOGME_SCRIPT="$(which logme)"
TODAY="$(date +%m/%d/%y)"

run_test() {
  echo "> Testing: $1"
  eval "$1"
  echo "---"
}

run_test "$LOGME_SCRIPT -help"
run_test "$LOGME_SCRIPT -daily 'Test daily log entry'"
run_test "$LOGME_SCRIPT -date $TODAY"
run_test "$LOGME_SCRIPT -todo 'Test todo item'"
run_test "$LOGME_SCRIPT -todo-view"
echo "1" | run_test "$LOGME_SCRIPT -todo-done"
run_test "$LOGME_SCRIPT -show-done"
run_test "$LOGME_SCRIPT -q 'Test question?'"
echo -e "1\\nTest answer" | run_test "$LOGME_SCRIPT -qs-view"
run_test "$LOGME_SCRIPT -qs-answered"
# Skip -edit as it opens vi interactively

echo "Test completed."