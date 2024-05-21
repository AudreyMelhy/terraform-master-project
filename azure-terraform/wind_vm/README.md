steps to log into VM from cloud shell:
on your main.tf specify the public key file
when login for first time
on your home directory of cloud shell create a private key file and paste content of your host private key
vim .ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh -i ~/.ssh/id_rsa adminuser@[public_ip]
while still connected on VM, verify the Public Key in Azure 
cat ~/.ssh/authorized_keys

private_ip_address_allocation = "Dynamic" = DHCP
DHCP = Dynamic Host Configuration Protocol = server that dynamically assigns IP addresses and other network configurations parameters to devices on a network. parameters include IP addresses, subnet masks, default gateways, DNS server addresses , ...
This also means ip addresses are allocated for a specific amount of time until you do not need them no more, release them so that ip addresses can be assigned to other users. lease is usually 2 hours and get renewed if still needed and if not being used, the DHCP gets to assign IP address to another user

RDP stands for Remote Desktop Protocol, which is a proprietary protocol developed by Microsoft. It allows users to remotely access and control a Windows-based computer over a network connection. The default port for RDP is TCP port 3389.

Standardization: RDP port 3389 is standardized by Microsoft for remote desktop connections. In contrast, regular ports can be used for a wide range of network services and applications, each with its own specific purpose and protocol.

Protocol: RDP is a specific protocol designed for remote desktop connections, whereas regular ports can be associated with various protocols such as HTTP (port 80), HTTPS (port 443), FTP (port 21), SSH (port 22), etc.

Service: Ports like 80 (HTTP) and 443 (HTTPS) are commonly used for web services, port 21 for FTP, port 22 for SSH, and so on. Each port is associated with a specific network service or application, while RDP (port 3389) is dedicated to remote desktop access.

Security: Because RDP provides direct access to the desktop environment of a remote machine, it is often targeted by attackers. Therefore, it's important to secure RDP connections with strong authentication mechanisms and to restrict access to trusted users and networks.

LRS = Locally Redundant Storage

how to secure password credential in windows:
- save it in azure key vault- store it in key vault and query credential from key vault at run time
- in aws use secret manager - same 
- store it in jenkins data base and behind the scne supply it to terraform at run time
- also on windows, we can substitute the password value at run time using set command in a shell script

