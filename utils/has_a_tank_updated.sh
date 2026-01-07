#!/bin/bash

# Configuration
FILE_TO_CHECK="/lfs/h1/ops/prod/dcom/20251211/b021/xx203"  # <--- **CHANGE THIS PATH after 16:30UTC**
EMAIL_RECIPIENT="iliana.genkova@noaa.gov" # <--- **CHANGE THIS EMAIL ADDRESS**
TIME_LIMIT_MINUTES="15" # Check if updated in the last X minutes

# --- Script Logic ---

# Check if the file exists
if [ ! -f "$FILE_TO_CHECK" ]; then
    echo "Error: File not found at $FILE_TO_CHECK"
    # Send an alert about the missing file as well
    mail -s "ALERT: b021/xx203 File Check Failed - File Not Found" "$EMAIL_RECIPIENT" <<< "The script attempted to check the file '$FILE_TO_CHECK' but it does not exist."
    exit 1
fi

# Use 'find' to check for files modified *before* 15 minutes ago.
# -mmin +15: Find files modified MORE THAN 15 minutes ago.
# -mmin -15: Find files modified LESS THAN 15 minutes ago. (We want the inverse)
# -print: Print the path of the found file.
# -quit: Exit immediately after finding the first match (improves efficiency).

FILE_MODIFIED_RECENTLY=$(find "$FILE_TO_CHECK" -mmin -"$TIME_LIMIT_MINUTES" -print -quit)

# Check the result of the find command
if [ -z "$FILE_MODIFIED_RECENTLY" ]; then
    # The 'find' command returned nothing, meaning the file was *not* modified
    # in the last 15 minutes (i.e., it was modified MORE than 15 minutes ago).

    SUBJECT="ALERT: File Stale - $FILE_TO_CHECK"
    BODY="The file '$FILE_TO_CHECK' has not been updated in the last $TIME_LIMIT_MINUTES minutes.
    
    Last modification time: $(stat -c '%y' "$FILE_TO_CHECK")"

    # Send the email
    echo -e "$BODY" | mail -s "$SUBJECT" "$EMAIL_RECIPIENT"
    echo "Alert sent: $FILE_TO_CHECK is stale."
else
    # The 'find' command returned a file path, meaning the file *was* modified
    # in the last 15 minutes.
    echo "Success: $FILE_TO_CHECK was recently updated."
fi
