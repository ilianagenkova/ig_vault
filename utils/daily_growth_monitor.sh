#!/bin/bash

# --- Configuration Section ---

# The email address to send critical alerts to.
RECIPIENT_EMAIL="your_email@example.com"

# The log file path where all checks and non-critical alerts will be recorded.
LOG_FILE="/var/log/file_growth_monitor.log"

# The email subject line for the 30% alert.
EMAIL_SUBJECT="CRITICAL ALERT: File Size Exceeded 30% Threshold"

# Define the expected date format for file naming. 
# Assuming files are named like: <BASE_NAME>_<YYYYMMDD> (e.g., data_export_20251027)
DATE_SUFFIX_FORMAT="_%Y%m%d" 

# --- End Configuration Section ---

# Check for required argument (the base name of the file)
if [ -z "$1" ]; then
    echo "Usage: $0 <file_base_name>"
    echo "Example: If your files are named 'daily_report_20251027', use: $0 daily_report"
    exit 1
fi

FILE_BASE_NAME="$1"

# Calculate today's and yesterday's date strings
TODAY_DATE_STR=$(date +%Y%m%d)
YESTERDAY_DATE_STR=$(date -d "yesterday" +%Y%m%d)

# Construct file paths (assuming the files are in the current working directory)
TODAY_FILE="${FILE_BASE_NAME}_${TODAY_DATE_STR}"
YESTERDAY_FILE="${FILE_BASE_NAME}_${YESTERDAY_DATE_STR}"

# Function to append a message to the log file
log_message() {
    # Ensure the directory for the log file exists
    mkdir -p "$(dirname "$LOG_FILE")"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# --- 1. File Existence Check ---

if [ ! -f "$TODAY_FILE" ]; then
    log_message "ERROR: Today's file not found: $TODAY_FILE"
    exit 1
fi

if [ ! -f "$YESTERDAY_FILE" ]; then
    log_message "WARNING: Yesterday's file not found: $YESTERDAY_FILE. Cannot compare size."
    exit 0 # Exit successfully, as the comparison dependency is missing, but the script didn't fail.
fi

# --- 2. Get Sizes in Bytes ---
# Use stat to get the size in bytes (%s)
SIZE_TODAY=$(stat -c%s "$TODAY_FILE")
SIZE_YESTERDAY=$(stat -c%s "$YESTERDAY_FILE")

# Handle case where yesterday's file is empty (avoid division by zero or misleading results)
if [ "$SIZE_YESTERDAY" -eq 0 ]; then
    if [ "$SIZE_TODAY" -gt 0 ]; then
        # If yesterday was empty and today is not, treat it as a significant increase
        PERCENT_INCREASE=1000000 
        log_message "WARNING: Yesterday's file ($YESTERDAY_FILE) was 0 bytes, but today's is $SIZE_TODAY bytes. Triggering high alert."
    else
        log_message "INFO: Both files are 0 bytes. No action needed."
        exit 0
    fi
else
    # --- 3. Calculate Percentage Increase using 'bc' for floating-point math ---
    # Formula: ((SIZE_TODAY - SIZE_YESTERDAY) / SIZE_YESTERDAY) * 100
    PERCENT_INCREASE=$(echo "scale=2; (($SIZE_TODAY - $SIZE_YESTERDAY) / $SIZE_YESTERDAY) * 100" | bc)
fi

# Convert sizes to human-readable format for messages
SIZE_TODAY_HR=$(du -h "$TODAY_FILE" | awk '{print $1}')
SIZE_YESTERDAY_HR=$(du -h "$YESTERDAY_FILE" | awk '{print $1}')

# Build a standard message string
MESSAGE="File: $FILE_BASE_NAME. Today: $TODAY_FILE ($SIZE_TODAY_HR). Yesterday: $YESTERDAY_FILE ($SIZE_YESTERDAY_HR). Growth: ${PERCENT_INCREASE}%"

# --- 4. Comparison and Action Logic ---

# Check the 30% threshold (Critical Alert)
if (echo "$PERCENT_INCREASE > 30.00" | bc -l); then
    log_message "CRITICAL: ${MESSAGE}. Exceeded 30% threshold. Sending email."
    
    EMAIL_BODY="
    File Size Anomaly Detected!
    
    The file '$FILE_BASE_NAME' has grown significantly in size compared to yesterday's version.
    
    Details:
    --------------------------------------------------
    Today's File ($TODAY_FILE): $SIZE_TODAY_HR ($SIZE_TODAY bytes)
    Yesterday's File ($YESTERDAY_FILE): $SIZE_YESTERDAY_HR ($SIZE_YESTERDAY bytes)
    Percentage Increase: ${PERCENT_INCREASE}%
    Threshold: 30%
    
    Action required: Investigate potential data corruption or unexpected volume increase.
    --------------------------------------------------
    "
    # The 'mail' command is typically used for sending emails in Bash
    echo "$EMAIL_BODY" | mail -s "$EMAIL_SUBJECT" "$RECIPIENT_EMAIL"
    
# Check the 20% threshold (Log Only Alert)
elif (echo "$PERCENT_INCREASE > 20.00" | bc -l); then
    log_message "ALERT: ${MESSAGE}. Exceeded 20% threshold."
else
    log_message "INFO: ${MESSAGE}. Within normal growth limits (<= 20%)."
fi

exit 0
