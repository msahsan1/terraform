<pre>
<h2> Terraform Module Output </h2>
mahsan@vmmint:~/NewGit/terraform$ tree terraform-msa-module-output/
terraform-msa-module-output/
├── module
│   └── sg
│       └── sg.tf
└── projects
    └── C
        ├── my-sg.tf
        └── providers.tf

4 directories, 3 files
mahsan@vmmint:~/NewGit/terraform$

mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/module/sg$ pwd
/home/mahsan/NewGit/terraform/terraform-msa-module-output/module/sg
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/module/sg$ cat sg.tf 
resource "aws_security_group" "ec2-sg" {
  name        = "myec2-sg"

  ingress {
    description      = "Allow Inbound from Secret Application"
    from_port        = 8433
    to_port          = 8433
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

output "sg_id" {
  value = aws_security_group.ec2-sg.id
}
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/module/sg$ 


mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ cat my-sg.tf 
module "sgmodule" {
  source = "../../module/sg"
}

resource "aws_instance" "web" {
  ami           = "ami-01103fb68b3569475"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}

output "sg_id_output" {
  value = module.sgmodule.sg_id
}
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ cat providers.tf 
provider "aws"  {
  region     = "us-east-2"
}

mahsan@vmmint:~/NewGit/terraf

mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ terraform init 

Initializing the backend...
Initializing modules...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.22.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-01103fb68b3569475"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

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

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + sg_id_output = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-01103fb68b3569475"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

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

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + sg_id_output = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.sgmodule.aws_security_group.ec2-sg: Creating...
module.sgmodule.aws_security_group.ec2-sg: Creation complete after 2s [id=sg-0064d3e9fc0e5de68]
aws_instance.web: Creating...
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Creation complete after 13s [id=i-04f8a88c56e873b1d]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

sg_id_output = "sg-0064d3e9fc0e5de68"
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ 

<h2> Destroy </h2>

ahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ terraform destroy
module.sgmodule.aws_security_group.ec2-sg: Refreshing state... [id=sg-0064d3e9fc0e5de68]
aws_instance.web: Refreshing state... [id=i-04f8a88c56e873b1d]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.web will be destroyed
  - resource "aws_instance" "web" {
      - ami                                  = "ami-01103fb68b3569475" -> null
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:instance/i-04f8a88c56e873b1d" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-2b" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-04f8a88c56e873b1d" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0682e642958b0cf82" -> null
      - private_dns                          = "ip-172-31-25-118.us-east-2.compute.internal" -> null
      - private_ip                           = "172.31.25.118" -> null
      - public_dns                           = "ec2-3-142-51-60.us-east-2.compute.amazonaws.com" -> null
      - public_ip                            = "3.142.51.60" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [
          - "myec2-sg",
        ] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-03852e1095ae7efbc" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0064d3e9fc0e5de68",
        ] -> null

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 2 -> null
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-075fbf888ba562082" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # module.sgmodule.aws_security_group.ec2-sg will be destroyed
  - resource "aws_security_group" "ec2-sg" {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-0064d3e9fc0e5de68" -> null
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
      - id                     = "sg-0064d3e9fc0e5de68" -> null
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

Plan: 0 to add, 0 to change, 2 to destroy.

Changes to Outputs:
  - sg_id_output = "sg-0064d3e9fc0e5de68" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.web: Destroying... [id=i-04f8a88c56e873b1d]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 10s elapsed]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 20s elapsed]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 30s elapsed]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 40s elapsed]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 50s elapsed]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 1m0s elapsed]
aws_instance.web: Still destroying... [id=i-04f8a88c56e873b1d, 1m10s elapsed]
aws_instance.web: Destruction complete after 1m11s
module.sgmodule.aws_security_group.ec2-sg: Destroying... [id=sg-0064d3e9fc0e5de68]
module.sgmodule.aws_security_group.ec2-sg: Destruction complete after 1s

Destroy complete! Resources: 2 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/projects/C$ 




</pre>

![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform-msa-module-output/ksnip_20231023-215934.png "msahsan1@gmail.com" )
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform-msa-module-output/ksnip_20231023-220023.png "msahsan1@gmail.com")

