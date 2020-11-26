# assignment
1. install Terraform on Linux

2. Download Terraform unzip file

3. sudo wget "here past terraform link"

4. Extract the downloaded file

5. sudo unzip "terraform zip file name"

6. After installed terraform,verify that Terraform accepts commands

      =>terraform -version, it's fine then,


7. Configure AWS to local host & Configure terraform to AWS

8. RUN aws configure command

9. It will ask  access key ID and secret access key, then give key ID and secret access key

10. To initialize Terraform, enter the following 

   =>terraform init
   
11. The "terraform plan" command is used to create an execution plan   

12. The "terraform apply" command is used to apply the changes required to reach the desired state of the configuration,

-----------------------------------------------------------------------------------------------------------------------
               on local host done the key pair, using ssh-keygen with name

                                        like "ssh-keygen -f tf_demo"

13 Provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances

14. Currently this resource requires an existing user-supplied key pair. This key pair's public key will be registered with AWS to allow logging-in to EC2 instances.

15. I have created jump host and web instance,app instance using terraform

