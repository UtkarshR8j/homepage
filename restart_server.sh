#!/bin/bash

# Define session name
SESSION_NAME="homepage"

# Run the build command
echo "Running npm run build..."
npm run build

# Check if the tmux session exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

# If the session exists, kill it
if [ $? -eq 0 ]; then
  echo "Killing existing tmux session: $SESSION_NAME"
  tmux kill-session -t "$SESSION_NAME"
else
  echo "No existing tmux session named $SESSION_NAME found."
fi

# Create a new tmux session in detached mode and run npm start --verbose
echo "Creating a new tmux session: $SESSION_NAME"
tmux new-session -d -s "$SESSION_NAME" "npm start --verbose"

# Confirm success
echo "Session $SESSION_NAME restarted with npm start --verbose"
