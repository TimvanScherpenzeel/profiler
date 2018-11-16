#!/bin/bash

# Script to start the Chrome Canary V8 profiler

# Configuration

# Fall back to regular chrome if Canary doesn't exist
LOCATION="${1:-http://localhost:8080}"
LOG_DIRECTORY="${2:-logs}"
LOG_OUTPUT="${3:-logs/chrome_canary_output.log}"
LOG_ERROR="${5:-logs/chrome_canary_error.log}"

# Helper functions

function log () {
  echo -e "\033[36m"
  echo "#########################################################"
  echo "#### $1 "
  echo "#########################################################"
  echo -e "\033[m"
}

run() {
    log "Starting the Chrome Canary V8 profiler"

    mkdir -p $LOG_DIRECTORY
    touch $LOG_OUTPUT
    touch $LOG_ERROR

    echo -e "Starting Chrome Canary with custom profiling flags\n"

    # Opening chrome://tracing is not allowed from the command line
    echo -e "Please open \"chrome://tracing\" to start V8 tracing in a new browser tab\n"

    /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary $LOCATION --incognito --allow-file-access-from-files --disable-gpu-vsync --disable-frame-rate-limit --js-flags="--trace-file-names --trace-opt --trace-deopt --print-opt-source --code-comments" 1> $LOG_OUTPUT 2> $LOG_ERROR
}

# Main script

run

log "Done!"