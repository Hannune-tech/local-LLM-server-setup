#!/bin/bash

ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# Reboot is required. After reboot check with nvidia-smi
# sudo reboot