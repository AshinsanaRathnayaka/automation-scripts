# This terraform script to set up an aws ec2 instance and run the nginx web server in it. 

Please fallow the Below steps for the Deploy new nginx server in AWS.

#Requirements
    
   * terraform version >= 0.13.1
       how to install terraform - https://learn.hashicorp.com/tutorials/terraform/install-cli
   * AWS account , AWS > = 3.51
   * Get a Clone of the GIT Repo to Local machine
        
(1) Before run this scripts need to set AWS credentials. There are two ways to do that with this script.

   (i) Using AWS CLI
      
        * The aws CLI must be installed on the machine running this script if it is not already installed.
              how to install AWS cli - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

        * Run fallowing command to set your aws profile using access_key & secret_key.
             
                  $ aws configure --profile <profile_name>

   OR

  (ii)  Directly add AWS credentials (access_key & secret_key) in provider.tf file

(2) Custormise the resouce inputs (nginx_instance_type, ssh_public_key... etc) in terraform.tfvars file with requiremet.
                   
(3) Run terraform script. There are two ways to do this with this script.

   (i) Run manually fallowing commands
   
          $ terraform init
          $ terraform plan
          $ terraform apply

    OR

   (ii) Run bash file (run.sh) for deploy.


# take the ip of the nginx server and browse to see if you get the message "hello world"

