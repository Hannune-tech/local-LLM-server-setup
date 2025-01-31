# Setting Static IP Address for Ubuntu Machine

## Prerequisites
- Ubuntu 20.04 LTS or later
- sudo privileges

## Steps

### 1. Check Network Connection
`ping yahoo.com`


### 2. Identify Current IP Configuration
`ip addr show`


### 3. Determine Network Interface and Gateway
`ip route show`

Network interface could be `eth0`, `eth1`, `ens33`, ...


### 4. Edit Netplan Configuration(yaml)
The file name could be different<br>
`sudo nano /etc/netplan/00-installer-config.yaml`

Replace the content with:
```
network:
    ethernets:
        ens33: # Replace with your network interface
            addresses: [192.168.0.50/24] # Replace with your desired IP
            gateway4: 182.168.0.1 # Replace with your gateway
            nameservers:
                addresses: [1.1.1.1,8.8.8.8] # DNS servers
    version: 2
```


### 5. Apply New Configuration
`sudo netplan apply`


### 6. Verify New Configuration
`ping yahoo.com`
or 
`ip addr show`


## Notes
- Replace example IP addresses, gateway, and network interface with your specific network details
- Netmask is set to /24 (255.255.255.0) in this example; adjust if necessary
- You can use Google's DNS (8.8.8.8) or any other preferred DNS server

## Troubleshooting
- Ensure all network information is correct
- Verify that the YAML file is properly formatted
- Reboot the system if changes don't take effect immediately

