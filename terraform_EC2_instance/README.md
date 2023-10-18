<pre>
 <h2> Terraform EC2 Creation </h2>
mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ cat main.tf 
provider "aws" {
  region = "us-east-2"
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-0c867cff15e80e304"
  ##  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}
mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ cat output.tf 

output "aws_security_group_http_server_details" {
  value = aws_security_group.http_server_sg

}

mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_default_vpc.default will be created
  + resource "aws_default_vpc" "default" {
      + arn                                  = (known after apply)
      + cidr_block                           = (known after apply)
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + existing_default_vpc                 = (known after apply)
      + force_destroy                        = false
      + id                                   = (known after apply)
      + instance_tenancy                     = (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags_all                             = (known after apply)
    }

  # aws_security_group.http_server_sg will be created
  + resource "aws_security_group" "http_server_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "http_server_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "name" = "http_server_sg"
        }
      + tags_all               = {
          + "name" = "http_server_sg"
        }
      + vpc_id                 = "vpc-0c867cff15e80e304"
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aws_security_group_http_server_details = {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "http_server_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + name = "http_server_sg"
        }
      + tags_all               = {
          + name = "http_server_sg"
        }
      + timeouts               = null
      + vpc_id                 = "vpc-0c867cff15e80e304"
    }

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_default_vpc.default will be created
  + resource "aws_default_vpc" "default" {
      + arn                                  = (known after apply)
      + cidr_block                           = (known after apply)
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + existing_default_vpc                 = (known after apply)
      + force_destroy                        = false
      + id                                   = (known after apply)
      + instance_tenancy                     = (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags_all                             = (known after apply)
    }

  # aws_security_group.http_server_sg will be created
  + resource "aws_security_group" "http_server_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "http_server_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "name" = "http_server_sg"
        }
      + tags_all               = {
          + "name" = "http_server_sg"
        }
      + vpc_id                 = "vpc-0c867cff15e80e304"
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aws_security_group_http_server_details = {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "http_server_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + name = "http_server_sg"
        }
      + tags_all               = {
          + name = "http_server_sg"
        }
      + timeouts               = null
      + vpc_id                 = "vpc-0c867cff15e80e304"
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_default_vpc.default: Creating...
aws_security_group.http_server_sg: Creating...
aws_default_vpc.default: Creation complete after 3s [id=vpc-0c867cff15e80e304]
aws_security_group.http_server_sg: Creation complete after 4s [id=sg-0c8ba7b263a0505e1]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

<h2> Outputs: </h2>

aws_security_group_http_server_details = {
  "arn" = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-0c8ba7b263a0505e1"
  "description" = "Managed by Terraform"
  "egress" = toset([
    {
      "cidr_blocks" = tolist([
        "0.0.0.0/0",
      ])
      "description" = ""
      "from_port" = 0
      "ipv6_cidr_blocks" = tolist([])
      "prefix_list_ids" = tolist([])
      "protocol" = "-1"
      "security_groups" = toset([])
      "self" = false
      "to_port" = 0
    },
  ])
  "id" = "sg-0c8ba7b263a0505e1"
  "ingress" = toset([
    {
      "cidr_blocks" = tolist([
        "0.0.0.0/0",
      ])
      "description" = ""
      "from_port" = 22
      "ipv6_cidr_blocks" = tolist([])
      "prefix_list_ids" = tolist([])
      "protocol" = "tcp"
      "security_groups" = toset([])
      "self" = false
      "to_port" = 22
    },
    {
      "cidr_blocks" = tolist([
        "0.0.0.0/0",
      ])
      "description" = ""
      "from_port" = 80
      "ipv6_cidr_blocks" = tolist([])
      "prefix_list_ids" = tolist([])
      "protocol" = "tcp"
      "security_groups" = toset([])
      "self" = false
      "to_port" = 80
    },
  ])
  "name" = "http_server_sg"
  "name_prefix" = ""
  "owner_id" = "954854060441"
  "revoke_rules_on_delete" = false
  "tags" = tomap({
    "name" = "http_server_sg"
  })
  "tags_all" = tomap({
    "name" = "http_server_sg"
  })
  "timeouts" = null /* object */
  "vpc_id" = "vpc-0c867cff15e80e304"
}
mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ 

</pre>


![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_EC2_instance/ksnip_20231018-091224.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_EC2_instance/ksnip_20231018-091248.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_EC2_instance/ksnip_20231018-091257.png "msahsan1@gmail.com")
