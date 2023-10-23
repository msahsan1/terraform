<pre>
<h2> Terraform Module Locals </h2>
 mahsan@vmmint:~/NewGit/terraform$ tree terraform-msa-module-local/
terraform-msa-module-local/
├── module
│   └── sg
│       └── sg.tf
└── projects
    └── B
        ├── my-sg.tf
        ├── providers.tf
        └── terraform.tfstate

4 directories, 4 files
mahsan@vmmint:~/NewGit/terraform$ 


ahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ cat my-sg.tf 
module "sgmodule" {
  source = "../../module/sg"
}
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ cat providers.tf 
provider "aws" {
  region = "us-east-2"
}
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ 


ahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.sgmodule.aws_security_group.ec2-sg will be created
  + resource "aws_security_group" "ec2-sg" {
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
              + description      = "Allow Inbound from Secret Application"
              + from_port        = 8433
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8433
            },
        ]
      + name                   = "myec2-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # module.sgmodule.aws_security_group.elb-sg will be created
  + resource "aws_security_group" "elb-sg" {
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
              + description      = "Allow Inbound from Secret Application"
              + from_port        = 8433
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8433
            },
        ]
      + name                   = "myelb-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ 


mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.sgmodule.aws_security_group.ec2-sg will be created
  + resource "aws_security_group" "ec2-sg" {
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
              + description      = "Allow Inbound from Secret Application"
              + from_port        = 8433
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8433
            },
        ]
      + name                   = "myec2-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # module.sgmodule.aws_security_group.elb-sg will be created
  + resource "aws_security_group" "elb-sg" {
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
              + description      = "Allow Inbound from Secret Application"
              + from_port        = 8433
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8433
            },
        ]
      + name                   = "myelb-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.sgmodule.aws_security_group.elb-sg: Creating...
module.sgmodule.aws_security_group.ec2-sg: Creating...
module.sgmodule.aws_security_group.ec2-sg: Creation complete after 3s [id=sg-037d1b168c745ecc6]
module.sgmodule.aws_security_group.elb-sg: Creation complete after 3s [id=sg-0bd5c22e3c2b41874]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ 

<h2> Destroy </h2>

mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-local/projects/B$ terraform destroy
module.sgmodule.aws_security_group.elb-sg: Refreshing state... [id=sg-0bd5c22e3c2b41874]
module.sgmodule.aws_security_group.ec2-sg: Refreshing state... [id=sg-037d1b168c745ecc6]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.sgmodule.aws_security_group.ec2-sg will be destroyed
  - resource "aws_security_group" "ec2-sg" {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-037d1b168c745ecc6" -> null
      - description            = "Managed by Terraform" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-037d1b168c745ecc6" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow Inbound from Secret Application"
              - from_port        = 8433
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8433
            },
        ] -> null
      - name                   = "myec2-sg" -> null
      - owner_id               = "954854060441" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {} -> null
      - tags_all               = {} -> null
      - vpc_id                 = "vpc-0c867cff15e80e304" -> null
    }

  # module.sgmodule.aws_security_group.elb-sg will be destroyed
  - resource "aws_security_group" "elb-sg" {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-0bd5c22e3c2b41874" -> null
      - description            = "Managed by Terraform" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0bd5c22e3c2b41874" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow Inbound from Secret Application"
              - from_port        = 8433
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8433
            },
        ] -> null
      - name                   = "myelb-sg" -> null
      - owner_id               = "954854060441" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {} -> null
      - tags_all               = {} -> null
      - vpc_id                 = "vpc-0c867cff15e80e304" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.sgmodule.aws_security_group.ec2-sg: Destroying... [id=sg-037d1b168c745ecc6]
module.sgmodule.aws_security_group.elb-sg: Destroying... [id=sg-0bd5c22e3c2b41874]
module.sgmodule.aws_security_group.elb-sg: Destruction complete after 1s
module.sgmodule.aws_security_group.ec2-sg: Destruction complete after 1s

Destroy complete! Resources: 2 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-



</pre>

