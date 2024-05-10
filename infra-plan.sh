# echo "*****************************************************************"
#  echo "Deploying s3 backend module"
#  echo "*****************************************************************"
#  cd terraform/resources/s3
#  terraform init
#  terraform fmt
#  terraform plan
#  cd -

echo "*****************************************************************"
echo "Deploying the VPC module"
echo "*****************************************************************"
cd terraform/resources/vpc
terraform init
terraform fmt
terraform plan
cd -


echo "*****************************************************************"
echo "Deploying the SEC-GRP module"
echo "*****************************************************************"
cd terraform/resources/sec-grp
terraform init
terraform fmt
terraform plan
cd -

echo "*****************************************************************"
echo "Deploying the bastion host module"
echo "*****************************************************************"
cd terraform/resources/bastion-host
terraform init
terraform fmt
terraform plan
cd -
