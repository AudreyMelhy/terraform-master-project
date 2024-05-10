echo "*****************************************************************"
echo "Deploying the eks-control-plane module"
echo "*****************************************************************"
cd terraform/resources/eks-control-plane
terraform init
terraform fmt
terraform plan
cd -
