echo "*****************************************************************"
 echo "Deploying s3 backend module"
 echo "*****************************************************************"
 cd terraform/resources/s3
 terraform init
 terraform fmt
 terraform plan
 cd -
