<pre>
<h2> terraform list </h2>
mahsan@vmmint:~/NewGit/terraform/terraform_list$ cat main.tf 
provider "aws"  {
  region     = "us-east-2"
}


variable "names" {
  default = ["Muhammad", "Shahid", "Ahsan"]


}

resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names)
  name = each.value
}


mahsan@vmmint:~/NewGit/terraform/terraform_list$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users["Ahsan"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "Ahsan"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["Muhammad"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "Muhammad"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["Shahid"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "Shahid"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
mahsan@vmmint:~/NewGit/terraform/terraform_list$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users["Ahsan"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "Ahsan"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["Muhammad"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "Muhammad"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["Shahid"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "Shahid"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.my_iam_users["Shahid"]: Creating...
aws_iam_user.my_iam_users["Ahsan"]: Creating...
aws_iam_user.my_iam_users["Muhammad"]: Creating...
aws_iam_user.my_iam_users["Ahsan"]: Creation complete after 0s [id=Ahsan]
aws_iam_user.my_iam_users["Muhammad"]: Creation complete after 0s [id=Muhammad]
aws_iam_user.my_iam_users["Shahid"]: Creation complete after 0s [id=Shahid]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_list$ 

mahsan@vmmint:~/NewGit/terraform/terraform_list$ terraform destroy
aws_iam_user.my_iam_users["Shahid"]: Refreshing state... [id=Shahid]
aws_iam_user.my_iam_users["Ahsan"]: Refreshing state... [id=Ahsan]
aws_iam_user.my_iam_users["Muhammad"]: Refreshing state... [id=Muhammad]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users["Ahsan"] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/Ahsan" -> null
      - force_destroy = false -> null
      - id            = "Ahsan" -> null
      - name          = "Ahsan" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGM6S6ULYILB" -> null
    }

  # aws_iam_user.my_iam_users["Muhammad"] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/Muhammad" -> null
      - force_destroy = false -> null
      - id            = "Muhammad" -> null
      - name          = "Muhammad" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGM7MRXB67EZ" -> null
    }

  # aws_iam_user.my_iam_users["Shahid"] will be destroyed
  - resource "aws_iam_user" "my_iam_users" {
      - arn           = "arn:aws:iam::954854060441:user/Shahid" -> null
      - force_destroy = false -> null
      - id            = "Shahid" -> null
      - name          = "Shahid" -> null
      - path          = "/" -> null
      - tags          = {} -> null
      - tags_all      = {} -> null
      - unique_id     = "AIDA54UN4WGMWNTFHXJS3" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_iam_user.my_iam_users["Ahsan"]: Destroying... [id=Ahsan]
aws_iam_user.my_iam_users["Shahid"]: Destroying... [id=Shahid]
aws_iam_user.my_iam_users["Muhammad"]: Destroying... [id=Muhammad]
aws_iam_user.my_iam_users["Shahid"]: Destruction complete after 0s
aws_iam_user.my_iam_users["Ahsan"]: Destruction complete after 0s
aws_iam_user.my_iam_users["Muhammad"]: Destruction complete after 0s

Destroy complete! Resources: 3 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_list$ 


</pre>
