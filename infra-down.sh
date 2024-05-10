#!/bin/bash

echo "*****************************************************************"
echo "Deleting the eks-node-group module"
echo "*****************************************************************"
cd terraform/resources/eks-node-group
terraform init
terraform fmt
terraform destroy --auto-approve
cd -


echo "*****************************************************************"
echo "Deleting the aws-auth-config module"
echo "*****************************************************************"
cd terraform/resources/aws-auth-config
terraform init
terraform fmt
terraform destroy --auto-approve
cd -


echo "*****************************************************************"
echo "Deleting the eks-control-plane module"
echo "*****************************************************************"
cd terraform/resources/eks-control-plane
terraform init
terraform fmt
terraform destroy --auto-approve
cd -

echo "*****************************************************************"
echo "Deleting the bastion host"
echo "*****************************************************************"
sleep 3
cd terraform/resources/bastion-host
terraform init
terraform destroy --auto-approve
cd -



echo "*****************************************************************"
echo "Deleting the SEC-GRP module"
echo "*****************************************************************"
cd terraform/resources/sec-grp
terraform init
terraform fmt
terraform destroy --auto-approve
cd -



echo "*****************************************************************"
echo "Deleting the VPC module"
echo "*****************************************************************"
sleep 3
cd terraform/resources/vpc
terraform init
terraform destroy --auto-approve
cd -

