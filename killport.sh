#!/bin/bash

# Check if the port number is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

# Find the process ID (PID) using the port number
PID=$(lsof -ti:$1)

# Check if any PID is found
if [ -z "$PID" ]; then
  echo "No process is running on port $1"
  exit 1
fi

# Kill the process running on the provided port
echo "Killing process on port $1 with PID $PID"
kill -9 $PID

echo "Process on port $1 has been killed."
