<pre>
<h1> Terraform splat expression</h1>

ahsan@vmmint:~/Project$ cat terraform_sppat_expression.tf 
provider "aws"  {
  region     = "us-east-2"
}


resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}



mahsan@vmmint:~/Project$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb[0] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "iamuser.0"
      + path          = "/system/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[1] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "iamuser.1"
      + path          = "/system/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[2] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "iamuser.2"
      + path          = "/system/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + arns = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
mahsan@vmmint:~/Project$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb[0] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "iamuser.0"
      + path          = "/system/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[1] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "iamuser.1"
      + path          = "/system/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[2] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "iamuser.2"
      + path          = "/system/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + arns = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.lb[0]: Creating...
aws_iam_user.lb[1]: Creating...
aws_iam_user.lb[2]: Creating...
aws_iam_user.lb[0]: Creation complete after 1s [id=iamuser.0]
aws_iam_user.lb[1]: Creation complete after 1s [id=iamuser.1]
aws_iam_user.lb[2]: Creation complete after 1s [id=iamuser.2]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

arns = [
  "arn:aws:iam::954854060441:user/system/iamuser.0",
  "arn:aws:iam::954854060441:user/system/iamuser.1",
  "arn:aws:iam::954854060441:user/system/iamuser.2",
]
mahsan@vmmint:~/Project$ 

<pre>

![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_splat_expression/ksnip_20231014-100559.png "msahsan1@gmail.com")


