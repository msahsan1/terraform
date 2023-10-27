
<pre>
<h2> Terraform VPC" </h2>


mahsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-terraform-VPC$ cat main.tf 
provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    name        = "JavaHomeVpc"
    environment = "Dev"

  }
}

output "vpc_cidr" {

  value = aws_vpc.my_vpc.cidr_block
}

mahsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-terraform-VPC$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.my_vpc will be created
  + resource "aws_vpc" "my_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "environment" = "Dev"
          + "name"        = "JavaHomeVpc"
        }
      + tags_all                             = {
          + "environment" = "Dev"
          + "name"        = "JavaHomeVpc"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vpc_cidr = "10.0.0.0/16"

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you
run "terraform apply" now.
mahsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-

ahsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-terraform-VPC$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.my_vpc will be created
  + resource "aws_vpc" "my_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "environment" = "Dev"
          + "name"        = "JavaHomeVpc"
        }
      + tags_all                             = {
          + "environment" = "Dev"
          + "name"        = "JavaHomeVpc"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vpc_cidr = "10.0.0.0/16"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.my_vpc: Creating...
aws_vpc.my_vpc: Creation complete after 3s [id=vpc-08d927d16fa695634]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

vpc_cidr = "10.0.0.0/16"
mahsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-terraform-VPC$ 

<h2> Destroy <h2>

hsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-terraform-VPC$ terraform destroy
aws_vpc.my_vpc: Refreshing state... [id=vpc-08d927d16fa695634]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_vpc.my_vpc will be destroyed
  - resource "aws_vpc" "my_vpc" {
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:vpc/vpc-08d927d16fa695634" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0e8f35d26cb059a6b" -> null
      - default_route_table_id               = "rtb-02deb57c1d5c7f8cc" -> null
      - default_security_group_id            = "sg-05a3509452547e3cd" -> null
      - dhcp_options_id                      = "dopt-094c63531b0751a2a" -> null
      - enable_dns_hostnames                 = false -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-08d927d16fa695634" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-02deb57c1d5c7f8cc" -> null
      - owner_id                             = "954854060441" -> null
      - tags                                 = {
          - "environment" = "Dev"
          - "name"        = "JavaHomeVpc"
        } -> null
      - tags_all                             = {
          - "environment" = "Dev"
          - "name"        = "JavaHomeVpc"
        } -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - vpc_cidr = "10.0.0.0/16" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_vpc.my_vpc: Destroying... [id=vpc-08d927d16fa695634]
aws_vpc.my_vpc: Destruction complete after 1s

Destroy complete! Resources: 1 destroyed.
mahsan@vmmint:~/NewGit/terraform/TerraForm2-2023/01-ter




</pre>
