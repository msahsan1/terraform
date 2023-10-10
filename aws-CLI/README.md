
ahsan@vmmint:~/Project$ cat aws-provider-config.tf 
provider "aws"  {
  region     = "us-east-2"
  access_key = "XXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXX"
}


resource "aws_iam_user" "demouser" {

    name = "msa-demo-user"
}mahsan@vmmint:~/Project

mahsan@vmmint:~/Project$ terraform  plan

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.demouser will be created
  + resource "aws_iam_user" "demouser" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "msa-demo-user"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly
these actions if you run "terraform apply" now.
mahsan@vmmint:~/Project$ terraform  apply 

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.demouser will be created
  + resource "aws_iam_user" "demouser" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "msa-demo-user"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.demouser: Creating...
aws_iam_user.demouser: Creation complete after 0s [id=msa-demo-user]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/Project$ 

*******INSTALL AWS CLI

ahsan@vmmint:~/Project$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 55.8M  100 55.8M    0     0  1368k      0  0:00:41  0:00:41 --:--:-- 1427k
Archive:  awscliv2.zip
   creating: aws/
   creating: aws/dist/
  inflating: aws/THIRD_PARTY_LICENSES  
  inflating: aws/README.md           
  inflating: aws/install             

ahsan@vmmint:~/Project$ /usr/local/bin/aws --version
aws-cli/2.13.20 Python/3.11.5 Linux/5.15.0-76-generic exe/x86_64.linuxmint.21 prompt/off
mahsan@vmmint:~/Project$ 

mahsan@vmmint:~$ aws configure
AWS Access Key ID [None]: XXXXXXXXXXXXXX
AWS Secret Access Key [None]: XXXXXXXXXXXXXXXXXX
Default region name [None]: us-east-2
Default output format [None]: 

mahsan@vmmint:~/.aws$ pwd
/home/mahsan/.aws
mahsan@vmmint:~/.aws$ ls -ltr
total 8
-rw------- 1 mahsan mahsan 116 Sep 22 10:58 credentials
-rw------- 1 mahsan mahsan  29 Sep 22 10:58 config
mahsan@vmmint:~/.aws$ 


mahsan@vmmint:~/.aws$ cat config 
[default]
region = us-east-2
mahsan@vmmint:~/.aws$ 




