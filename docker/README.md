# Docker Setup and Configuration
This directory contains scripts and instructions for setting up Docker with GPU support for AI services.

## Motivation
Docker provides an efficient way to deploy and manage AI services. Proper setup ensures that your containers can utilize GPU resources effectively, which is crucial for running large language models and other AI workloads.

## Contents
1. `installation.sh`: Install Docker and configure root privileges.
    - The command can be changed
    - scr: https://docs.docker.com/engine/install/ubuntu/    
2. `gpu_driver_nvidia2.sh`: Additional configuration for running nvidia driver in container.
3. `monitor_nvidia_container.sh`: Restart container when `nvidia-smi` doesn't work in a container.

## Option to utilize gpu when running container
### Nvidia
- `docker run --gpus all ...`: Utilize all graphic card available
- `docker run --gpus 0 ...`: Utilize gpu 0 index
- `docker run --gpus "device=0" ...`: Another way to utilize gpu 0 index
### AMD
- `docker run --device=/dev/kfd --device=/dev/dri --group-add video ...` 
























