 <pre>
<h2> TerraForm Provision HTTP server </h2>


<b>mahsan@vmmint:~/NewGit/terraform/terraform_provisinor_ami$ cat main.tf </b>
provider "aws" {
  region = "us-east-2"
}

resource "aws_default_vpc" "default" {

}


data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default.id]
  }
}

data "aws_ami" "aws_linux_2_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

data "aws_ami_ids" "aws_linux_2_latest_ids" {
  owners = ["amazon"]
}



resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  ##vpc_id = "vpc-0c867cff15e80e304"
  vpc_id = aws_default_vpc.default.id

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

resource "aws_instance" "http_servers" {
##ami                    = "ami-01103fb68b3569475"
  ami                    = data.aws_ami.aws_linux_2_latest.id
  key_name               = "terraform-key"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  // subnet_id              = "subnet-0d807dc28683ac161"
  //   subnet_id = data.aws_subnets.default_subnets.ids[0]
  subnet_id = data.aws_subnets.default_subnets.ids[0]



  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo Welcome to in28minutes - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }

}
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor_ami$ 



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

  # aws_instance.http_servers will be created
  + resource "aws_instance" "http_servers" {
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
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "terraform-key"
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
      + subnet_id                            = "subnet-0d807dc28683ac161"
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
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

Plan: 3 to add, 0 to change, 0 to destroy.

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

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
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

  # aws_instance.http_servers will be created
  + resource "aws_instance" "http_servers" {
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
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "terraform-key"
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
      + subnet_id                            = "subnet-0d807dc28683ac161"
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
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

Plan: 3 to add, 0 to change, 0 to destroy.

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
aws_default_vpc.default: Creation complete after 2s [id=vpc-0c867cff15e80e304]
aws_security_group.http_server_sg: Creation complete after 3s [id=sg-07865e69310aed24e]
aws_instance.http_servers: Creating...
aws_instance.http_servers: Still creating... [10s elapsed]
aws_instance.http_servers: Still creating... [20s elapsed]
aws_instance.http_servers: Provisioning with 'remote-exec'...
aws_instance.http_servers (remote-exec): Connecting to remote host via SSH...
aws_instance.http_servers (remote-exec):   Host: 18.220.14.113
aws_instance.http_servers (remote-exec):   User: ec2-user
aws_instance.http_servers (remote-exec):   Password: false
aws_instance.http_servers (remote-exec):   Private key: true
aws_instance.http_servers (remote-exec):   Certificate: false
aws_instance.http_servers (remote-exec):   SSH Agent: true
aws_instance.http_servers (remote-exec):   Checking Host Key: false
aws_instance.http_servers (remote-exec):   Target Platform: unix
aws_instance.http_servers: Still creating... [30s elapsed]
aws_instance.http_servers (remote-exec): Connecting to remote host via SSH...
aws_instance.http_servers (remote-exec):   Host: 18.220.14.113
aws_instance.http_servers (remote-exec):   User: ec2-user
aws_instance.http_servers (remote-exec):   Password: false
aws_instance.http_servers (remote-exec):   Private key: true
aws_instance.http_servers (remote-exec):   Certificate: false
aws_instance.http_servers (remote-exec):   SSH Agent: true
aws_instance.http_servers (remote-exec):   Checking Host Key: false
aws_instance.http_servers (remote-exec):   Target Platform: unix
aws_instance.http_servers (remote-exec): Connected!
aws_instance.http_servers (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.http_servers (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.http_servers (remote-exec): Amazon   23 MB/s |  18 MB     00:00
aws_instance.http_servers: Still creating... [40s elapsed]
aws_instance.http_servers (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.http_servers (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.http_servers (remote-exec): Amazon  517 kB/s | 160 kB     00:00
aws_instance.http_servers (remote-exec): Last metadata expiration check: 0:00:01 ago on Fri Oct 20 15:16:17 2023.
aws_instance.http_servers (remote-exec): Dependencies resolved.
aws_instance.http_servers (remote-exec): ========================================
aws_instance.http_servers (remote-exec):  Package     Arch   Version
aws_instance.http_servers (remote-exec):                       Repository   Size
aws_instance.http_servers (remote-exec): ========================================
aws_instance.http_servers (remote-exec): Installing:
aws_instance.http_servers (remote-exec):  httpd       x86_64 2.4.56-1.amzn2023
aws_instance.http_servers (remote-exec):                       amazonlinux  48 k
aws_instance.http_servers (remote-exec): Installing dependencies:
aws_instance.http_servers (remote-exec):  apr         x86_64 1.7.2-2.amzn2023.0.2
aws_instance.http_servers (remote-exec):                       amazonlinux 129 k
aws_instance.http_servers (remote-exec):  apr-util    x86_64 1.6.3-1.amzn2023.0.1
aws_instance.http_servers (remote-exec):                       amazonlinux  98 k
aws_instance.http_servers (remote-exec):  generic-logos-httpd
aws_instance.http_servers (remote-exec):              noarch 18.0.0-12.amzn2023.0.3
aws_instance.http_servers (remote-exec):                       amazonlinux  19 k
aws_instance.http_servers (remote-exec):  httpd-core  x86_64 2.4.56-1.amzn2023
aws_instance.http_servers (remote-exec):                       amazonlinux 1.4 M
aws_instance.http_servers (remote-exec):  httpd-filesystem
aws_instance.http_servers (remote-exec):              noarch 2.4.56-1.amzn2023
aws_instance.http_servers (remote-exec):                       amazonlinux  15 k
aws_instance.http_servers (remote-exec):  httpd-tools x86_64 2.4.56-1.amzn2023
aws_instance.http_servers (remote-exec):                       amazonlinux  82 k
aws_instance.http_servers (remote-exec):  libbrotli   x86_64 1.0.9-4.amzn2023.0.2
aws_instance.http_servers (remote-exec):                       amazonlinux 315 k
aws_instance.http_servers (remote-exec):  mailcap     noarch 2.1.49-3.amzn2023.0.3
aws_instance.http_servers (remote-exec):                       amazonlinux  33 k
aws_instance.http_servers (remote-exec): Installing weak dependencies:
aws_instance.http_servers (remote-exec):  apr-util-openssl
aws_instance.http_servers (remote-exec):              x86_64 1.6.3-1.amzn2023.0.1
aws_instance.http_servers (remote-exec):                       amazonlinux  17 k
aws_instance.http_servers (remote-exec):  mod_http2   x86_64 2.0.11-2.amzn2023
aws_instance.http_servers (remote-exec):                       amazonlinux 150 k
aws_instance.http_servers (remote-exec):  mod_lua     x86_64 2.4.56-1.amzn2023
aws_instance.http_servers (remote-exec):                       amazonlinux  62 k

aws_instance.http_servers (remote-exec): Transaction Summary
aws_instance.http_servers (remote-exec): ========================================
aws_instance.http_servers (remote-exec): Install  12 Packages

aws_instance.http_servers (remote-exec): Total download size: 2.3 M
aws_instance.http_servers (remote-exec): Installed size: 6.9 M
aws_instance.http_servers (remote-exec): Downloading Packages:
aws_instance.http_servers (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.http_servers (remote-exec): (1/12): ---  B/s |   0  B     --:-- ETA
aws_instance.http_servers (remote-exec): (1/12): 156 kB/s |  17 kB     00:00
aws_instance.http_servers (remote-exec): (2-3/12 155 kB/s |  17 kB     00:15 ETA
aws_instance.http_servers (remote-exec): (2/12): 854 kB/s |  98 kB     00:00
aws_instance.http_servers (remote-exec): (3-4/12 185 kB/s | 165 kB     00:11 ETA
aws_instance.http_servers (remote-exec): (3/12): 2.4 MB/s | 315 kB     00:00
aws_instance.http_servers (remote-exec): (4-5/12 237 kB/s | 429 kB     00:08 ETA
aws_instance.http_servers (remote-exec): (4/12): 4.3 MB/s |  82 kB     00:00
aws_instance.http_servers (remote-exec): (5-6/12 270 kB/s | 595 kB     00:06 ETA
aws_instance.http_servers (remote-exec): (5/12): 5.0 MB/s | 150 kB     00:00
aws_instance.http_servers (remote-exec): (6-7/12 283 kB/s | 662 kB     00:06 ETA
aws_instance.http_servers (remote-exec): (6/12): 5.7 MB/s | 129 kB     00:00
aws_instance.http_servers (remote-exec): (7-8/12 408 kB/s | 1.3 MB     00:02 ETA
aws_instance.http_servers (remote-exec): (7/12): 2.3 MB/s |  62 kB     00:00
aws_instance.http_servers (remote-exec): (8-9/12 429 kB/s | 1.4 MB     00:02 ETA
aws_instance.http_servers (remote-exec): (8/12): 3.3 MB/s |  48 kB     00:00
aws_instance.http_servers (remote-exec): (9-10/1 503 kB/s | 1.7 MB     00:01 ETA
aws_instance.http_servers (remote-exec): (9/12):  22 MB/s | 1.4 MB     00:00
aws_instance.http_servers (remote-exec): (10-11/ 605 kB/s | 2.2 MB     00:00 ETA
aws_instance.http_servers (remote-exec): (10/12) 1.1 MB/s |  33 kB     00:00
aws_instance.http_servers (remote-exec): (11-12/ 615 kB/s | 2.3 MB     00:00 ETA
aws_instance.http_servers (remote-exec): (11/12) 695 kB/s |  19 kB     00:00
aws_instance.http_servers (remote-exec): (12/12) 615 kB/s | 2.3 MB     00:00 ETA
aws_instance.http_servers (remote-exec): (12/12) 850 kB/s |  15 kB     00:00
aws_instance.http_servers (remote-exec): ----------------------------------------
aws_instance.http_servers (remote-exec): Total   7.5 MB/s | 2.3 MB     00:00
aws_instance.http_servers (remote-exec): Running transaction check
aws_instance.http_servers (remote-exec): Transaction check succeeded.
aws_instance.http_servers (remote-exec): Running transaction test
aws_instance.http_servers (remote-exec): Transaction test succeeded.
aws_instance.http_servers (remote-exec): Running transaction
aws_instance.http_servers (remote-exec):   Preparing        :  [           ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [=          ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [==         ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [===        ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [====       ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [=====      ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [======     ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [=======    ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [========   ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [=========  ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :  [========== ] 1/1
aws_instance.http_servers (remote-exec):   Preparing        :                1/1
aws_instance.http_servers (remote-exec):   Installing       : apr-   1/12
aws_instance.http_servers (remote-exec):   Installing       : apr-1.7.2-    1/12
aws_instance.http_servers (remote-exec):   Installing       : apr-   2/12
aws_instance.http_servers (remote-exec):   Installing       : apr-util-o    2/12
aws_instance.http_servers (remote-exec):   Installing       : apr-   3/12
aws_instance.http_servers (remote-exec):   Installing       : apr-util-1    3/12
aws_instance.http_servers (remote-exec):   Installing       : mail   4/12
aws_instance.http_servers (remote-exec):   Installing       : mailcap-2.    4/12
aws_instance.http_servers (remote-exec):   Installing       : http   5/12
aws_instance.http_servers (remote-exec):   Installing       : httpd-tool    5/12
aws_instance.http_servers (remote-exec):   Running scriptlet: httpd-file    6/12
aws_instance.http_servers (remote-exec):   Installing       : http   6/12
aws_instance.http_servers (remote-exec):   Installing       : httpd-file    6/12
aws_instance.http_servers (remote-exec):   Installing       : http   7/12
aws_instance.http_servers (remote-exec):   Installing       : httpd-core    7/12
aws_instance.http_servers (remote-exec):   Installing       : mod_   8/12
aws_instance.http_servers (remote-exec):   Installing       : mod_http2-    8/12
aws_instance.http_servers (remote-exec):   Installing       : mod_   9/12
aws_instance.http_servers (remote-exec):   Installing       : mod_lua-2.    9/12
aws_instance.http_servers (remote-exec):   Installing       : gene  10/12
aws_instance.http_servers (remote-exec):   Installing       : generic-lo   10/12
aws_instance.http_servers (remote-exec):   Installing       : libb  11/12
aws_instance.http_servers (remote-exec):   Installing       : libbrotli-   11/12
aws_instance.http_servers (remote-exec):   Installing       : http  12/12
aws_instance.http_servers (remote-exec):   Installing       : httpd-2.4.   12/12
aws_instance.http_servers (remote-exec):   Running scriptlet: httpd-2.4.   12/12
aws_instance.http_servers: Still creating... [50s elapsed]
aws_instance.http_servers (remote-exec):   Verifying        : apr-util-1    1/12
aws_instance.http_servers (remote-exec):   Verifying        : libbrotli-    2/12
aws_instance.http_servers (remote-exec):   Verifying        : apr-util-o    3/12
aws_instance.http_servers (remote-exec):   Verifying        : mod_http2-    4/12
aws_instance.http_servers (remote-exec):   Verifying        : httpd-tool    5/12
aws_instance.http_servers (remote-exec):   Verifying        : httpd-core    6/12
aws_instance.http_servers (remote-exec):   Verifying        : apr-1.7.2-    7/12
aws_instance.http_servers (remote-exec):   Verifying        : mod_lua-2.    8/12
aws_instance.http_servers (remote-exec):   Verifying        : httpd-2.4.    9/12
aws_instance.http_servers (remote-exec):   Verifying        : mailcap-2.   10/12
aws_instance.http_servers (remote-exec):   Verifying        : generic-lo   11/12
aws_instance.http_servers (remote-exec):   Verifying        : httpd-file   12/12
aws_instance.http_servers (remote-exec): ========================================
aws_instance.http_servers (remote-exec): WARNING:
aws_instance.http_servers (remote-exec):   A newer release of "Amazon Linux" is available.

aws_instance.http_servers (remote-exec):   Available Versions:

aws_instance.http_servers (remote-exec):   Version 2023.2.20230920:
aws_instance.http_servers (remote-exec):     Run the following command to upgrade to 2023.2.20230920:

aws_instance.http_servers (remote-exec):       dnf upgrade --releasever=2023.2.20230920

aws_instance.http_servers (remote-exec):     Release notes:
aws_instance.http_servers (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20230920.html

aws_instance.http_servers (remote-exec):   Version 2023.2.20231002:
aws_instance.http_servers (remote-exec):     Run the following command to upgrade to 2023.2.20231002:

aws_instance.http_servers (remote-exec):       dnf upgrade --releasever=2023.2.20231002

aws_instance.http_servers (remote-exec):     Release notes:
aws_instance.http_servers (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20231002.html

aws_instance.http_servers (remote-exec):   Version 2023.2.20231011:
aws_instance.http_servers (remote-exec):     Run the following command to upgrade to 2023.2.20231011:

aws_instance.http_servers (remote-exec):       dnf upgrade --releasever=2023.2.20231011

aws_instance.http_servers (remote-exec):     Release notes:
aws_instance.http_servers (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20231011.html

aws_instance.http_servers (remote-exec):   Version 2023.2.20231016:
aws_instance.http_servers (remote-exec):     Run the following command to upgrade to 2023.2.20231016:

aws_instance.http_servers (remote-exec):       dnf upgrade --releasever=2023.2.20231016

aws_instance.http_servers (remote-exec):     Release notes:
aws_instance.http_servers (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20231016.html

aws_instance.http_servers (remote-exec): ========================================

aws_instance.http_servers (remote-exec): Installed:
aws_instance.http_servers (remote-exec):   apr-1.7.2-2.amzn2023.0.2.x86_64
aws_instance.http_servers (remote-exec):   apr-util-1.6.3-1.amzn2023.0.1.x86_64
aws_instance.http_servers (remote-exec):   apr-util-openssl-1.6.3-1.amzn2023.0.1.x86_64
aws_instance.http_servers (remote-exec):   generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch
aws_instance.http_servers (remote-exec):   httpd-2.4.56-1.amzn2023.x86_64
aws_instance.http_servers (remote-exec):   httpd-core-2.4.56-1.amzn2023.x86_64
aws_instance.http_servers (remote-exec):   httpd-filesystem-2.4.56-1.amzn2023.noarch
aws_instance.http_servers (remote-exec):   httpd-tools-2.4.56-1.amzn2023.x86_64
aws_instance.http_servers (remote-exec):   libbrotli-1.0.9-4.amzn2023.0.2.x86_64
aws_instance.http_servers (remote-exec):   mailcap-2.1.49-3.amzn2023.0.3.noarch
aws_instance.http_servers (remote-exec):   mod_http2-2.0.11-2.amzn2023.x86_64
aws_instance.http_servers (remote-exec):   mod_lua-2.4.56-1.amzn2023.x86_64

aws_instance.http_servers (remote-exec): Complete!
aws_instance.http_servers (remote-exec): Redirecting to /bin/systemctl start httpd.service
aws_instance.http_servers (remote-exec): Welcome to in28minutes - Virtual Server is at ec2-18-220-14-113.us-east-2.compute.amazonaws.com
aws_instance.http_servers: Creation complete after 52s [id=i-0b66602183f03b27d]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

aws_security_group_http_server_details = {
  "arn" = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-07865e69310aed24e"
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
  "id" = "sg-07865e69310aed24e"
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
<h2> Destroy </h2>
mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ terraform destroy
aws_security_group.http_server_sg: Refreshing state... [id=sg-07865e69310aed24e]
aws_default_vpc.default: Refreshing state... [id=vpc-0c867cff15e80e304]
aws_instance.http_servers: Refreshing state... [id=i-0b66602183f03b27d]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_default_vpc.default will be destroyed
  - resource "aws_default_vpc" "default" {
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:vpc/vpc-0c867cff15e80e304" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "172.31.0.0/16" -> null
      - default_network_acl_id               = "acl-09d30acb33996e81a" -> null
      - default_route_table_id               = "rtb-015d742020cb7cc60" -> null
      - default_security_group_id            = "sg-04e04295a2cc4a9aa" -> null
      - dhcp_options_id                      = "dopt-094c63531b0751a2a" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - existing_default_vpc                 = true -> null
      - force_destroy                        = false -> null
      - id                                   = "vpc-0c867cff15e80e304" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-015d742020cb7cc60" -> null
      - owner_id                             = "954854060441" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
    }

  # aws_instance.http_servers will be destroyed
  - resource "aws_instance" "http_servers" {
      - ami                                  = "ami-01103fb68b3569475" -> null
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:instance/i-0b66602183f03b27d" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-2a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0b66602183f03b27d" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "terraform-key" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-053c1b1dd34794888" -> null
      - private_dns                          = "ip-172-31-9-73.us-east-2.compute.internal" -> null
      - private_ip                           = "172.31.9.73" -> null
      - public_dns                           = "ec2-18-220-14-113.us-east-2.compute.amazonaws.com" -> null
      - public_ip                            = "18.220.14.113" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [
          - "http_server_sg",
        ] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0d807dc28683ac161" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-07865e69310aed24e",
        ] -> null

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
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
          - volume_id             = "vol-0ff4d5da5e5cbd288" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # aws_security_group.http_server_sg will be destroyed
  - resource "aws_security_group" "http_server_sg" {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-07865e69310aed24e" -> null
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
      - id                     = "sg-07865e69310aed24e" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
        ] -> null
      - name                   = "http_server_sg" -> null
      - owner_id               = "954854060441" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "name" = "http_server_sg"
        } -> null
      - tags_all               = {
          - "name" = "http_server_sg"
        } -> null
      - vpc_id                 = "vpc-0c867cff15e80e304" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Changes to Outputs:
  - aws_security_group_http_server_details = {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-07865e69310aed24e"
      - description            = "Managed by Terraform"
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
        ]
      - id                     = "sg-07865e69310aed24e"
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
        ]
      - name                   = "http_server_sg"
      - name_prefix            = ""
      - owner_id               = "954854060441"
      - revoke_rules_on_delete = false
      - tags                   = {
          - name = "http_server_sg"
        }
      - tags_all               = {
          - name = "http_server_sg"
        }
      - timeouts               = null
      - vpc_id                 = "vpc-0c867cff15e80e304"
    } -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_default_vpc.default: Destroying... [id=vpc-0c867cff15e80e304]
aws_instance.http_servers: Destroying... [id=i-0b66602183f03b27d]
aws_default_vpc.default: Destruction complete after 0s
aws_instance.http_servers: Still destroying... [id=i-0b66602183f03b27d, 10s elapsed]
aws_instance.http_servers: Still destroying... [id=i-0b66602183f03b27d, 20s elapsed]
aws_instance.http_servers: Still destroying... [id=i-0b66602183f03b27d, 30s elapsed]
aws_instance.http_servers: Destruction complete after 30s
aws_security_group.http_server_sg: Destroying... [id=sg-07865e69310aed24e]
aws_security_group.http_server_sg: Destruction complete after 1s

Destroy complete! Resources: 3 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_EC2_instance$ 

<h2> Destroy </h2>


mahsan@vmmint:~/NewGit/terraform/terraform_provisinor_ami$ terraform destroy
data.aws_ami_ids.aws_linux_2_latest_ids: Reading...
aws_default_vpc.default: Refreshing state... [id=vpc-0c867cff15e80e304]
data.aws_ami.aws_linux_2_latest: Reading...
data.aws_ami.aws_linux_2_latest: Read complete after 0s [id=ami-08b880b2d952935ec]
data.aws_subnets.default_subnets: Reading...
aws_security_group.http_server_sg: Refreshing state... [id=sg-010527dd40f7cd0e4]
data.aws_subnets.default_subnets: Read complete after 0s [id=us-east-2]
aws_instance.http_servers: Refreshing state... [id=i-0e4ac70b02c7f3818]
data.aws_ami_ids.aws_linux_2_latest_ids: Read complete after 5s [id=3130646356]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_default_vpc.default will be destroyed
  - resource "aws_default_vpc" "default" {
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:vpc/vpc-0c867cff15e80e304" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "172.31.0.0/16" -> null
      - default_network_acl_id               = "acl-09d30acb33996e81a" -> null
      - default_route_table_id               = "rtb-015d742020cb7cc60" -> null
      - default_security_group_id            = "sg-04e04295a2cc4a9aa" -> null
      - dhcp_options_id                      = "dopt-094c63531b0751a2a" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - existing_default_vpc                 = true -> null
      - force_destroy                        = false -> null
      - id                                   = "vpc-0c867cff15e80e304" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-015d742020cb7cc60" -> null
      - owner_id                             = "954854060441" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
    }

  # aws_instance.http_servers will be destroyed
  - resource "aws_instance" "http_servers" {
      - ami                                  = "ami-08b880b2d952935ec" -> null
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:instance/i-0e4ac70b02c7f3818" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-2a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0e4ac70b02c7f3818" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "terraform-key" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-009b9031922e04359" -> null
      - private_dns                          = "ip-172-31-2-211.us-east-2.compute.internal" -> null
      - private_ip                           = "172.31.2.211" -> null
      - public_dns                           = "ec2-3-142-131-62.us-east-2.compute.amazonaws.com" -> null
      - public_ip                            = "3.142.131.62" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [
          - "http_server_sg",
        ] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0d807dc28683ac161" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-010527dd40f7cd0e4",
        ] -> null

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
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
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
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
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-06057c9b9b2af0153" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

  # aws_security_group.http_server_sg will be destroyed
  - resource "aws_security_group" "http_server_sg" {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-010527dd40f7cd0e4" -> null
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
      - id                     = "sg-010527dd40f7cd0e4" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
        ] -> null
      - name                   = "http_server_sg" -> null
      - owner_id               = "954854060441" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "name" = "http_server_sg"
        } -> null
      - tags_all               = {
          - "name" = "http_server_sg"
        } -> null
      - vpc_id                 = "vpc-0c867cff15e80e304" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Changes to Outputs:
  - aws_security_group_http_server_details = {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-010527dd40f7cd0e4"
      - description            = "Managed by Terraform"
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
        ]
      - id                     = "sg-010527dd40f7cd0e4"
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
        ]
      - name                   = "http_server_sg"
      - name_prefix            = ""
      - owner_id               = "954854060441"
      - revoke_rules_on_delete = false
      - tags                   = {
          - name = "http_server_sg"
        }
      - tags_all               = {
          - name = "http_server_sg"
        }
      - timeouts               = null
      - vpc_id                 = "vpc-0c867cff15e80e304"
    } -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.http_servers: Destroying... [id=i-0e4ac70b02c7f3818]
aws_instance.http_servers: Still destroying... [id=i-0e4ac70b02c7f3818, 10s elapsed]
aws_instance.http_servers: Still destroying... [id=i-0e4ac70b02c7f3818, 20s elapsed]
aws_instance.http_servers: Still destroying... [id=i-0e4ac70b02c7f3818, 30s elapsed]
aws_instance.http_servers: Still destroying... [id=i-0e4ac70b02c7f3818, 40s elapsed]
aws_instance.http_servers: Destruction complete after 40s
aws_security_group.http_server_sg: Destroying... [id=sg-010527dd40f7cd0e4]
aws_security_group.http_server_sg: Destruction complete after 1s
aws_default_vpc.default: Destroying... [id=vpc-0c867cff15e80e304]
aws_default_vpc.default: Destruction complete after 0s

Destroy complete! Resources: 3 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor_ami$ 





</pre>
