#!/bin/bash

THRESHOLD=80
LOG_FILE="/root/devops-lab/scripts/logs/disk-alert-1.log"

echo "=======Disk Usage Report========"
date

df -h -x tmpfs -x devtmpfs

echo 

echo "========Disk Usage Alerts (>= ${THRESHOLD}%) =====)"

df -P -x tmpfs -x devtmpfs | awk -v threshold="$THRESHOLD" '
NR > 1 {
     usage = $5
     gsub(/%/,"",usage)
     
     if (usage >= threshold) {
	     printf "WARNING: %s is %s%% full (Mounted on: %s)\n", $1, usage, $6
     }
 }'

echo

echo "===== End of Report ====="



