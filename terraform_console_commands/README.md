<pre>
<h1> Terraform Console commands </h1>

ahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform apply

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

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.my_iam_users[2]: Creating...
aws_iam_user.my_iam_users[0]: Creating...
aws_iam_user.my_iam_users[1]: Creating...
aws_iam_user.my_iam_users[1]: Creation complete after 0s [id=my_iam_user_1]
aws_iam_user.my_iam_users[2]: Creation complete after 0s [id=my_iam_user_2]
aws_iam_user.my_iam_users[0]: Creation complete after 0s [id=my_iam_user_0]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

<b>mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform show </b>

# aws_iam_user.my_iam_users[0]:
resource "aws_iam_user" "my_iam_users" {
    arn           = "arn:aws:iam::954854060441:user/my_iam_user_0"
    force_destroy = false
    id            = "my_iam_user_0"
    name          = "my_iam_user_0"
    path          = "/"
    tags_all      = {}
    unique_id     = "AIDA54UN4WGMURGOJKEJL"
}

# aws_iam_user.my_iam_users[1]:
resource "aws_iam_user" "my_iam_users" {
    arn           = "arn:aws:iam::954854060441:user/my_iam_user_1"
    force_destroy = false
    id            = "my_iam_user_1"
    name          = "my_iam_user_1"
    path          = "/"
    tags_all      = {}
    unique_id     = "AIDA54UN4WGMUXISKMFV5"
}

# aws_iam_user.my_iam_users[2]:
resource "aws_iam_user" "my_iam_users" {
    arn           = "arn:aws:iam::954854060441:user/my_iam_user_2"
    force_destroy = false
    id            = "my_iam_user_2"
    name          = "my_iam_user_2"
    path          = "/"
    tags_all      = {}
    unique_id     = "AIDA54UN4WGMTKQUYM2QL"
}
mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ 

<b>mahsan@vmmint:~/NewGit/terraform/terraform_multipale_iam.tf$ terraform console</b>
> aws_iam_user.my_iam_users[0].arn
"arn:aws:iam::954854060441:user/my_iam_user_0"
> aws_iam_user.my_iam_users[2].arn
"arn:aws:iam::954854060441:user/my_iam_user_2"
> aws_iam_user.my_iam_name.arn
╷
│ Error: Reference to undeclared resource
│ 
│   on <console-input> line 1:
│   (source code not available)
│ 
│ A managed resource "aws_iam_user" "my_iam_name" has not been declared in the root module.
╵


> aws_iam_user.my_iam_users[2].name
"my_iam_user_2"
> aws_iam_user.my_iam_users[0].name
"my_iam_user_0"
> aws_iam_user.my_iam_users[0].path
"/"
>  

</pre>


