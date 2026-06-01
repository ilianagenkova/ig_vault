#!/bin/bash

# --- Configuration ---
# Set the partition/filesystem to monitor (e.g., /lfs/h2/emc/obsproc/noscrub)
PARTITION="/lfs/h2/emc/da/noscrub"

# Set the alert threshold for DISK USAGE (95% used = 5% left)
THRESHOLD=90 #was at 87% on 3/26/2026 9am EST

# Email address to send the alert to
ADMIN="iliana.genkova@noaa.gov"

# --- Script Logic ---
# Get the usage percentage for the monitored partition
# The command uses 'df -h' and extracts the 5th column (Use%) and removes the '%' sign
USAGE=$(df -h $PARTITION | tail -n 1 | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than or equal to the threshold
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    # Define the email content
    SUBJECT="CRITICAL: emc/da/noscrub Disk Space Alert - $PARTITION at ${USAGE}%"
    BODY="The disk partition $PARTITION is at ${USAGE}% usage. Please take action immediately."

    # Send the email using the 'mail' command (common on Linux/UNIX systems)
    echo "$BODY" | mail -s "$SUBJECT" "$ADMIN"
    echo "$BODY" | mail -s "$SUBJECT"  hyundeok.choi@noaa.gov 
fi

# --- Configuration ---
# Set the partition/filesystem to monitor (e.g., /lfs/h2/emc/obsproc/noscrub)
PARTITION="/lfs/h2/emc/obsproc/noscrub"

# Set the alert threshold for DISK USAGE (95% used = 5% left)
THRESHOLD=90 #was at 87% on 3/26/2026 9am EST

# Email address to send the alert to
ADMIN="iliana.genkova@noaa.gov"

# --- Script Logic ---
# Get the usage percentage for the monitored partition
# The command uses 'df -h' and extracts the 5th column (Use%) and removes the '%' sign
USAGE=$(df -h $PARTITION | tail -n 1 | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than or equal to the threshold
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    # Define the email content
    SUBJECT="CRITICAL: emc/obsproc/noscrub Disk Space Alert - $PARTITION at ${USAGE}%"
    BODY="The disk partition $PARTITION is at ${USAGE}% usage. Please take action immediately."

    # Send the email using the 'mail' command (common on Linux/UNIX systems)
    echo "$BODY" | mail -s "$SUBJECT" "$ADMIN"
    echo "$BODY" | mail -s "$SUBJECT" steve.stegall@noaa.gov
fi
