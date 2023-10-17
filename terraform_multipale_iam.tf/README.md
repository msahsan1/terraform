
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


mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform destroy
aws_iam_user.my_iam_users[1]: Refreshing state... [id=my_iam_user_1]
aws_iam_user.my_iam_users[0]: Refreshing state... [id=my_iam_user_0]
aws_iam_user.my_iam_users[2]: Refreshing state... [id=my_iam_user_2]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  - destroy

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users[0] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/my_iam_user_0" -> null
      - force_destroy = false -> null
      - id            = "my_iam_user_0" -> null
      - name          = "my_iam_user_0" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGMW6XFEDVK6" -> null
    }

  # aws_iam_user.my_iam_users[1] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/my_iam_user_1" -> null
      - force_destroy = false -> null
      - id            = "my_iam_user_1" -> null
      - name          = "my_iam_user_1" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGM3LNV4WMQP" -> null
    }

  # aws_iam_user.my_iam_users[2] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/my_iam_user_2" -> null
      - force_destroy = false -> null
      - id            = "my_iam_user_2" -> null
      - name          = "my_iam_user_2" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGMRW4YQKR3Y" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_iam_user.my_iam_users[1]: Destroying... [id=my_iam_user_1]
aws_iam_user.my_iam_users[0]: Destroying... [id=my_iam_user_0]
aws_iam_user.my_iam_users[2]: Destroying... [id=my_iam_user_2]
aws_iam_user.my_iam_users[2]: Destruction complete after 1s
aws_iam_user.my_iam_users[1]: Destruction complete after 1s
aws_iam_user.my_iam_users[0]: Destruction complete after 1s

Destroy complete! Resources: 3 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ 
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform destroy
aws_iam_user.my_iam_users[2]: Refreshing state... [id=my_iam_user_2]
aws_iam_user.my_iam_users[1]: Refreshing state... [id=my_iam_user_1]
aws_iam_user.my_iam_users[0]: Refreshing state... [id=my_iam_user_0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  - destroy

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users[0] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/my_iam_user_0" -> null
      - force_destroy = false -> null
      - id            = "my_iam_user_0" -> null
      - name          = "my_iam_user_0" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGMURGOJKEJL" -> null
    }

  # aws_iam_user.my_iam_users[1] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/my_iam_user_1" -> null
      - force_destroy = false -> null
      - id            = "my_iam_user_1" -> null
      - name          = "my_iam_user_1" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGMUXISKMFV5" -> null
    }

  # aws_iam_user.my_iam_users[2] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/my_iam_user_2" -> null
      - force_destroy = false -> null
      - id            = "my_iam_user_2" -> null
      - name          = "my_iam_user_2" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGMTKQUYM2QL" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_iam_user.my_iam_users[0]: Destroying... [id=my_iam_user_0]
aws_iam_user.my_iam_users[1]: Destroying... [id=my_iam_user_1]
aws_iam_user.my_iam_users[2]: Destroying... [id=my_iam_user_2]
aws_iam_user.my_iam_users[2]: Destruction complete after 0s
aws_iam_user.my_iam_users[1]: Destruction complete after 0s
aws_iam_user.my_iam_users[0]: Destruction complete after 0s

Destroy complete! Resources: 3 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ 




</pre>



