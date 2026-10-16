#!/bin/bash

THRESHOLD=80
LOG_FILE="/root/devops-lab/scripts/logs/disk-alert.log"
USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
	STATUS="Warning: Disk Usage is above threshold!"
else
	STATUS="OK: Disk Usage is normal"
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') | Disk Usage: ${USAGE}% | ${STATUS}" |  tee -a "$LOG_FILE"

