#!/bin/bash

echo "*****************************************************************"
echo "Deleting the bastion host"
echo "*****************************************************************"
sleep 3
cd resources/bastion-host
terraform init
terraform destroy --auto-approve
cd -


echo "*****************************************************************"
echo "Deleting the VPC module"
echo "*****************************************************************"
sleep 3
cd resources/vpc
terraform init
terraform destroy --auto-approve
cd -


echo "*****************************************************************"
echo "Deleting s3 backend module"
echo "*****************************************************************"
sleep 3
cd resources/s3
terraform init
terraform destroy --auto-approve
cd -