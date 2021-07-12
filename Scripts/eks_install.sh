#download the terraform
https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
#unzip terraform
unzip terraform_1.0.1_linux_amd64.zip 
#change permissions
chmod 755 terraform
#move terraform 
mv terraform /usr/local/bin/
#download kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl
2.chmod 755 kubectl
#change permissions
chmod 755 kubectl
#move kubectl
mv kubectl /usr/local/bin/
#install git
yum install git -y
#download terraform files
git clone https://github.com/hashicorp/learn-terraform-provision-eks-cluster
#change directory
cd learn-terraform-provision-eks-cluster
#some terraform commands
terraform init
terraform plan