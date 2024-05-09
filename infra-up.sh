#!/bin/bash

# echo "*****************************************************************"
# echo "Deploying s3 backend module"
# echo "*****************************************************************"
# sleep 3
# cd resources/s3
# terraform init
# terraform fmt
# terraform apply --auto-approve
# cd -


# echo "*****************************************************************"
# echo "Deploying the VPC module"
# echo "*****************************************************************"
# sleep 3
# cd resources/vpc
# terraform init
# terraform fmt
# terraform apply --auto-approve
# cd -


# echo "*****************************************************************"
# echo "Deploying the bastion host module"
# echo "*****************************************************************"
# sleep 3
# cd resources/bastion-host
# terraform init
# terraform fmt
# terraform apply --auto-approve
# cd -


echo "*****************************************************************"
echo "Deploying the eks-control-plane module"
echo "*****************************************************************"
cd resources/eks
terraform init 
terraform fmt
terraform apply --auto-approve
cd -


echo "*****************************************************************"
echo "Deploying the aws-auth-config module"
echo "*****************************************************************"
cd resources/aws-auth-config
terraform init 
terraform fmt
terraform apply --auto-approve
cd -


echo "*****************************************************************"
echo "Deploying the eks-node-group module"
echo "*****************************************************************"
cd resources/eks
terraform init 
terraform fmt
terraform apply --auto-approve
cd -