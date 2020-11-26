# assignment
install Terraform on Linux
Download Terraform unzip file
sudo wget "here past terraform link"
Extract the downloaded file:
sudo unzip "terraform zip file name"
After installed terraform,verify that Terraform accepts commands
=>terraform -version, it's fine then,
Configure AWS to local host & Configure terraform to AWS
RUN aws configure command
it will ask  access key ID and secret access key, then give key ID and secret access key

To initialize Terraform, enter the following 
   =>terraform init
   
The "terraform plan" command is used to create an execution plan   

The "terraform apply" command is used to apply the changes required to reach the desired state of the configuration,

-----------------------------------------------------------------------------------------------------------------------
I have created jump host and web instance,app instance using terraform

on local host done the key pair, using ssh-keygen with name
like "ssh-keygen -f tf_demo"
Provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances

Currently this resource requires an existing user-supplied key pair. This key pair's public key will be registered with AWS to allow logging-in to EC2 instances.
