# Assignment
1. Download Terraform unzip file

2. Install Terraform on Linux or Windows
     sudo wget "here past terraform link"

4. Extract the downloaded file
      sudo unzip "terraform zip file name"

5. After installed terraform,verify that shell  accepts Terraform commands

      =>terraform -version

6. Configure AWS to bash or power shell & Configure terraform to AWS

7. RUN 'aws configure' command

    It will ask  access key ID and secret access key, please provide  key ID and secret access key

8. On local machine  the key pair is required, using ssh-keygen with name like "ssh-keygen -f tf_demo" which provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances

9. To initialize Terraform, enter the following command

   =>terraform init
   
10. The "terraform plan" command is used to create an execution plan

11. The "terraform apply" command is used to apply the changes required to reach the desired state of the configuration

13. Currently this resource requires an existing user-supplied key pair. This key pair's public key will be registered with AWS to allow logging-in to EC2 instances.

14. Jump host and web instance,app instance scripts will provision resources using terraform

How would you make the deployment fault tolerant and highly available 

1. By using terraform creation of resources has many advantages, terraform makes sure creation of resources in order specified which we easliy verifies by using Terratest(unit test framework which validates script is correct or not)
2. By using cluster mechanism or replicas we can provision based on the need , yes we can able to do it by using terraform

