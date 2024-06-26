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

echo "*****************************************************************"
echo "Deploying the eks-control-plane module"
echo "*****************************************************************"
cd terraform/resources/eks-control-plane
terraform init
terraform fmt
terraform plan
cd -

