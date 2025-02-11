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
            gateway4: 192.168.0.1 # Replace with your gateway
            nameservers:
                addresses: [1.1.1.1,8.8.8.8] # DNS servers
    version: 2
```


### 5. Apply New Configuration
`sudo netplan apply`


### 6. Verify New Configuration
`ping yahoo.com`
or 
`ip addr show`(ubuntu22.04 works with `ifconfig`)

### 7. Other Cases
This method is useful when yaml file is not presence and when netplan and networking isn't available.
In my case I made LAN cable connection but unable to change it's ip address because previous setting from manufacturer.

#### Method 1: Using NetworkManager
1. Identify your network interface: `ip addr show`
2. Check NetworkManager status: `systemctl status NetworkManager`
3. Modify the NetworkManager configuration: `sudo nano /etc/NetworkManager/NetworkManager.conf` file
    ```
    [keyfile]
    unmanaged-devices=none
    ```
4. Restart NetworkManager: `systemctl restart NetworkManager`
5. Configure your static IP address:
    ```
    sudo nmcli con mod <your network interface> ipv4.addresses <your desired ip address>/24
    sudo nmcli con mod <your network interface> ipv4.gateway <your gateway address>
    sudo nmcli con mod <your network interface> ipv4.dns "8.8.8.8 8.8.4.4"
    sudo nmcli con mod <your network interface> ipv4.method manual
    ```
6. Apply the new configuration: `nmcli con up <your network interface>`
7. Verify the new configuration: `ip addr show`

### Method 2: Manual Configuration (Temporary)
Use this method when Method 1 doesn't work. <br>
**Note: This method does not set the IP address permanently and will revert after a system reboot.**
```
ip addr del <current ip addr>/24 dev <your network interface>
ip addr add <your desired ip address>/24 dev <your network interface>
ip route add default via <your gateway address> dev <your network interface>
echo "nameserver 8.8.8.8" | tee /etc/resolv.conf
```
Setting crontab or system service and running it everytime when boot or when ip changes can be done.


## Notes
- Replace example IP addresses, gateway, and network interface with your specific network details
- Netmask is set to /24 (255.255.255.0) in this example; adjust if necessary
- You can use Google's DNS (8.8.8.8) or any other preferred DNS server

## Troubleshooting
- Ensure all network information is correct
- Verify that the YAML file is properly formatted
- Reboot the system if changes don't take effect immediately

