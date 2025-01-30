#!/bin/bash

# The AMD graphic card should support rocm

sudo apt-get update
# Check for versions from following url(https://repo.radeon.com/amdgpu-install/)
wget https://repo.radeon.com/amdgpu-install/6.3/ubuntu/jammy/amdgpu-install_6.3.60300-1_all.deb
sudo apt-get install ./amdgpu-install_5.4.50400-1_all.deb
sudo amdgpu-install --usecase=rocm

sudo usermod -aG render $USER
sudo chown root:render /dev/kfd 
sudo chmod 660 /dev/kfd

# Reboot is required. After reboot check with rocm-smi
# sudo reboot

