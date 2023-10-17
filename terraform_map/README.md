<pre>
<h2> Terraform Map </h2>

ahsan@vmmint:~/NewGit/terraform/terraform-map.tf$ cat main.tf 
provider "aws"  {
  region     = "us-east-2"
}


variable "users" {
  default = {
    muhammad : { country : "Canada", department : "Unix Team" },
    shahid : { country : "USA", department : "Storage Team" },
    ahsan : { country : "Korea", department : "Network Team" }
  }
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    department : each.value.department
  }
}
mahsan@vmmint:~/NewGit/terraform/terraform-map.tf$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users["ahsan"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "ahsan"
      + path          = "/"
      + tags          = {
          + "country"    = "Korea"
          + "department" = "Network Team"
        }
      + tags_all      = {
          + "country"    = "Korea"
          + "department" = "Network Team"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["muhammad"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "muhammad"
      + path          = "/"
      + tags          = {
          + "country"    = "Canada"
          + "department" = "Unix Team"
        }
      + tags_all      = {
          + "country"    = "Canada"
          + "department" = "Unix Team"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["shahid"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "shahid"
      + path          = "/"
      + tags          = {
          + "country"    = "USA"
          + "department" = "Storage Team"
        }
      + tags_all      = {
          + "country"    = "USA"
          + "department" = "Storage Team"
        }
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
mahsan@vmmint:~/NewGit/terraform/terraform-map.tf$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_users["ahsan"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "ahsan"
      + path          = "/"
      + tags          = {
          + "country"    = "Korea"
          + "department" = "Network Team"
        }
      + tags_all      = {
          + "country"    = "Korea"
          + "department" = "Network Team"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["muhammad"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "muhammad"
      + path          = "/"
      + tags          = {
          + "country"    = "Canada"
          + "department" = "Unix Team"
        }
      + tags_all      = {
          + "country"    = "Canada"
          + "department" = "Unix Team"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.my_iam_users["shahid"] will be created
  + resource "aws_iam_user" "my_iam_users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "shahid"
      + path          = "/"
      + tags          = {
          + "country"    = "USA"
          + "department" = "Storage Team"
        }
      + tags_all      = {
          + "country"    = "USA"
          + "department" = "Storage Team"
        }
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.my_iam_users["ahsan"]: Creating...
aws_iam_user.my_iam_users["muhammad"]: Creating...
aws_iam_user.my_iam_users["shahid"]: Creating...
aws_iam_user.my_iam_users["muhammad"]: Creation complete after 1s [id=muhammad]
aws_iam_user.my_iam_users["ahsan"]: Creation complete after 1s [id=ahsan]
aws_iam_user.my_iam_users["shahid"]: Creation complete after 1s [id=shahid]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform-map.tf$ 

</pre>
