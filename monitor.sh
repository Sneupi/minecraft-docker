#!/bin/bash

# Prevent multiple instances from running
if [ "${1}" != "--background" ]; then
    # Check if the background process is already running
    if pgrep -f "$(basename "$0") --background" > /dev/null; then
        echo "Monitor is already running. Exiting."
        exit 1
    fi

    # Run script in background (with logging)
    nohup "$0" --background "$@" > $(basename "${0%.*}").log 2>&1 &
    echo "Monitor started in background."
    exit 0
fi
shift

# Import env variables
set -a
source .env
set +a

# Run script
previous=2
while true
do
    # Get server status
    api=https://api.mcstatus.io/v2/status/java/$TUNNEL_ADDRESS
    curl -sf $api | grep -q '"online":true'
    status=$?
    
    # Trigger on status change
    if [ $status -ne $previous ]; then
        str=$([ $status -eq 0 ] && echo "ONLINE" || echo "OFFLINE")
        printf '%(%F %T %Z)T [%s] %s\n' -1 $TUNNEL_ADDRESS $str
        previous=$status
    fi
    
    # Delay between checks
    sleep 1
done
