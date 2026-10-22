#!/bin/bash
fail_count=0
# Create a unique directory in /tmp using the current timestamp
LOG_DIR="/tmp/crystal_failures_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$LOG_DIR"

for i in $(seq 1 100); do
  # Run the spec and temporarily capture output
  if ! crystal spec > temp_spec.log 2>&1; then
    fail_count=$((fail_count + 1))
    # Move the log to the /tmp directory
    mv temp_spec.log "$LOG_DIR/failure_run_${i}.log"
    echo "Iteration $i failed. Saved to $LOG_DIR"
  else
    rm -f temp_spec.log
  fi
done

echo "Testing complete. Total failures: $fail_count"
echo "All failure logs are saved in: $LOG_DIR"
