#!/bin/bash

# Total countdown time in seconds (30 minutes * 60 seconds)
total_seconds=$(( 27 * 60))

while [ $total_seconds -ge 0 ]; do
  # Calculate minutes and seconds
  minutes=$((total_seconds / 60))
  seconds=$((total_seconds % 60))

  # Use printf to format the output with leading zeros and overwrite the current line
  printf "Time remaining: %02d:%02d\r" "$minutes" "$seconds"

  # Pause for one second
  sleep 1

  # Decrement the total time
  total_seconds=$((total_seconds - 1))
done

# Print a final message on a new line
echo -e "\nCountdown ending...!"
echo -e "\n"
echo -e "\n"
echo -e "\n"
echo -e "\nCountdown ending...!"
echo -e "\n"
echo -e "\n"
echo -e "\n"
echo -e "\nCountdown ending...!"
echo -e "\n"
echo -e "\n"

#beep -f 2000 -l 1000
#sleep 3
