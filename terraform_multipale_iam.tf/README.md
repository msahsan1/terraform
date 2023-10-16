
<pre>
<h1> Terraform create multiple iam</h1>

ahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ cat main.tf 
provider "aws"  {
  region     = "us-east-2"
}


resource "aws_iam_user" "my_iam_users" {
      count = 2 
    name = "my_iam_user_${count.index}"

}



mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users[0] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_0"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users[1] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_1"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
apply" now.
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users[0] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_0"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users[1] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_1"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.my_iam_users[1]: Creating...
aws_iam_user.my_iam_users[0]: Creating...
aws_iam_user.my_iam_users[0]: Creation complete after 0s [id=my_iam_user_0]
aws_iam_user.my_iam_users[1]: Creation complete after 0s [id=my_iam_user_1]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ 

mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform plan
aws_iam_user.my_iam_users[0]: Refreshing state... [id=my_iam_user_0]
aws_iam_user.my_iam_users[1]: Refreshing state... [id=my_iam_user_1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users[2] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_2"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
apply" now.
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform apply
aws_iam_user.my_iam_users[1]: Refreshing state... [id=my_iam_user_1]
aws_iam_user.my_iam_users[0]: Refreshing state... [id=my_iam_user_0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users[2] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_2"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.my_iam_users[2]: Creating...
aws_iam_user.my_iam_users[2]: Creation complete after 1s [id=my_iam_user_2]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

ahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ cat main.tf 
provider "aws"  {
  region     = "us-east-2"
}


resource "aws_iam_user" "my_iam_users" {
      count = 3 
    name = "my_iam_user_${count.index}"

}

<pre>
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_multipale_iam.tf/ksnip_20231016-160158.png "msahsan1@gmail.com")


