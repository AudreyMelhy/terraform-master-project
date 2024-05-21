steps to log into VM from cloud shell:
on your main.tf specify the public key file
when login for first time
on your home directory of cloud shell create a private key file and paste content of your host private key
vim .ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh -i ~/.ssh/id_rsa adminuser@[public_ip]
while still connected on VM, verify the Public Key in Azure 
cat ~/.ssh/authorized_keys

