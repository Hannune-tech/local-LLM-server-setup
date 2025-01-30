#!/bin/bash

CONTAINER="container-name"

trap 'echo -e "\nScript terminated. Monitoring stopped."; exit 0' INT

nohup bash -c '
pid=$$
echo "Monitor script started with PID: $pid" > monitor.log

while true; do
    output=$(docker exec $CONTAINER nvidia-smi 2>&1)
    
    if [[ $output == *"Failed to initialize NVML: Unknown Error"* ]]; then
        echo "Error detected, restarting container $CONTAINER..."
        docker restart $CONTAINER
    fi
    
    sleep 60
done' >> monitor.log 2>&1 &

echo "Monitoring started in background. Check monitor.log for output."
echo "PID: $!"