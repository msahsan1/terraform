<pre>

<h2> Terraform provisioner </h2>

 mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ terraform fmt
main.tf
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ cat main.tf 
provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "myec2" {
  ami                    = "ami-01103fb68b3569475"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}




mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ 
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.myec2 will be created
  + resource "aws_instance" "myec2" {
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
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_security_group.allow_ssh will be created
  + resource "aws_security_group" "allow_ssh" {
      + arn                    = (known after apply)
      + description            = "Allow SSH inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Outbound Allowed"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 65535
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "SSH into VPC"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "allow_ssh"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
apply" now.
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.myec2 will be created
  + resource "aws_instance" "myec2" {
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
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_security_group.allow_ssh will be created
  + resource "aws_security_group" "allow_ssh" {
      + arn                    = (known after apply)
      + description            = "Allow SSH inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Outbound Allowed"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 65535
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "SSH into VPC"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "allow_ssh"
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

aws_security_group.allow_ssh: Creating...
aws_security_group.allow_ssh: Creation complete after 3s [id=sg-0ed4cfc8f4ea974b9]
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Provisioning with 'remote-exec'...
aws_instance.myec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.myec2 (remote-exec):   Host: 3.16.213.221
aws_instance.myec2 (remote-exec):   User: ec2-user
aws_instance.myec2 (remote-exec):   Password: false
aws_instance.myec2 (remote-exec):   Private key: true
aws_instance.myec2 (remote-exec):   Certificate: false
aws_instance.myec2 (remote-exec):   SSH Agent: true
aws_instance.myec2 (remote-exec):   Checking Host Key: false
aws_instance.myec2 (remote-exec):   Target Platform: unix
aws_instance.myec2 (remote-exec): Connected!
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): Amazon   29 MB/s |  10 MB     00:00 ETA
aws_instance.myec2 (remote-exec): Amazon   18 MB/s |  18 MB     00:01
aws_instance.myec2: Still creating... [40s elapsed]
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): Amazon  506 kB/s | 160 kB     00:00
aws_instance.myec2 (remote-exec): Dependencies resolved.
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec):  Package    Arch   Version
aws_instance.myec2 (remote-exec):                       Repository   Size
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec): Installing:
aws_instance.myec2 (remote-exec):  nginx      x86_64 1:1.24.0-1.amzn2023.0.1
aws_instance.myec2 (remote-exec):                       amazonlinux  32 k
aws_instance.myec2 (remote-exec): Installing dependencies:
aws_instance.myec2 (remote-exec):  generic-logos-httpd
aws_instance.myec2 (remote-exec):             noarch 18.0.0-12.amzn2023.0.3
aws_instance.myec2 (remote-exec):                       amazonlinux  19 k
aws_instance.myec2 (remote-exec):  gperftools-libs
aws_instance.myec2 (remote-exec):             x86_64 2.9.1-1.amzn2023.0.2
aws_instance.myec2 (remote-exec):                       amazonlinux 309 k
aws_instance.myec2 (remote-exec):  libunwind  x86_64 1.4.0-5.amzn2023.0.2
aws_instance.myec2 (remote-exec):                       amazonlinux  66 k
aws_instance.myec2 (remote-exec):  nginx-core x86_64 1:1.24.0-1.amzn2023.0.1
aws_instance.myec2 (remote-exec):                       amazonlinux 586 k
aws_instance.myec2 (remote-exec):  nginx-filesystem
aws_instance.myec2 (remote-exec):             noarch 1:1.24.0-1.amzn2023.0.1
aws_instance.myec2 (remote-exec):                       amazonlinux 9.0 k
aws_instance.myec2 (remote-exec):  nginx-mimetypes
aws_instance.myec2 (remote-exec):             noarch 2.1.49-3.amzn2023.0.3
aws_instance.myec2 (remote-exec):                       amazonlinux  21 k

aws_instance.myec2 (remote-exec): Transaction Summary
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec): Install  7 Packages

aws_instance.myec2 (remote-exec): Total download size: 1.0 M
aws_instance.myec2 (remote-exec): Installed size: 3.4 M
aws_instance.myec2 (remote-exec): Downloading Packages:
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): (1/7):  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): (1/7):  632 kB/s |  66 kB     00:00
aws_instance.myec2 (remote-exec): (2-3/7) 632 kB/s |  66 kB     00:01 ETA
aws_instance.myec2 (remote-exec): (2/7):  4.7 MB/s | 586 kB     00:00
aws_instance.myec2 (remote-exec): (3-4/7) 747 kB/s | 651 kB     00:00 ETA
aws_instance.myec2 (remote-exec): (3/7):  1.5 MB/s |  32 kB     00:00
aws_instance.myec2 (remote-exec): (4-5/7) 753 kB/s | 684 kB     00:00 ETA
aws_instance.myec2 (remote-exec): (4/7):  2.2 MB/s | 309 kB     00:00
aws_instance.myec2 (remote-exec): (5-6/7) 813 kB/s | 993 kB     00:00 ETA
aws_instance.myec2 (remote-exec): (5/7):  1.0 MB/s |  19 kB     00:00
aws_instance.myec2 (remote-exec): (6-7/7) 818 kB/s | 1.0 MB     00:00 ETA
aws_instance.myec2 (remote-exec): (6/7):  486 kB/s | 9.0 kB     00:00
aws_instance.myec2 (remote-exec): (7/7):  818 kB/s | 1.0 MB     00:00 ETA
aws_instance.myec2 (remote-exec): (7/7):  1.3 MB/s |  21 kB     00:00
aws_instance.myec2 (remote-exec): ----------------------------------------
aws_instance.myec2 (remote-exec): Total   4.0 MB/s | 1.0 MB     00:00
aws_instance.myec2 (remote-exec): Running transaction check
aws_instance.myec2 (remote-exec): Transaction check succeeded.
aws_instance.myec2 (remote-exec): Running transaction test
aws_instance.myec2 (remote-exec): Transaction test succeeded.
aws_instance.myec2 (remote-exec): Running transaction
aws_instance.myec2 (remote-exec):   Preparing        :  [=          ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [===        ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [====       ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [======     ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [=======    ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [=========  ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :                1/1
aws_instance.myec2 (remote-exec):   Running scriptlet: nginx-filesy   1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [=     ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [==    ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===   ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [====  ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-filesy   1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 2/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [====  ] 2/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 2/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-mimety   2/7
aws_instance.myec2 (remote-exec):   Installing       : gener [      ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : gener [====  ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : gener [===== ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : generic-logo   3/7
aws_instance.myec2 (remote-exec):   Installing       : libun [      ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : libun [=     ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : libun [===   ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : libun [====  ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : libun [===== ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : libunwind-1.   4/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [      ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [=     ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [==    ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [===   ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [====  ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [===== ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : gperftools-l   5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [=     ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [==    ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===   ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [====  ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-core-1   6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [==    ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===   ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-1:1.24   7/7
aws_instance.myec2 (remote-exec):   Running scriptlet: nginx-1:1.24   7/7
aws_instance.myec2: Still creating... [50s elapsed]
aws_instance.myec2 (remote-exec):   Verifying        : libunwind-1.   1/7
aws_instance.myec2 (remote-exec):   Verifying        : gperftools-l   2/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-core-1   3/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-1:1.24   4/7
aws_instance.myec2 (remote-exec):   Verifying        : generic-logo   5/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-filesy   6/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-mimety   7/7
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec): WARNING:
aws_instance.myec2 (remote-exec):   A newer release of "Amazon Linux" is available.

aws_instance.myec2 (remote-exec):   Available Versions:

aws_instance.myec2 (remote-exec):   Version 2023.2.20230920:
aws_instance.myec2 (remote-exec):     Run the following command to upgrade to 2023.2.20230920:

aws_instance.myec2 (remote-exec):       dnf upgrade --releasever=2023.2.20230920

aws_instance.myec2 (remote-exec):     Release notes:
aws_instance.myec2 (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20230920.html

aws_instance.myec2 (remote-exec):   Version 2023.2.20231002:
aws_instance.myec2 (remote-exec):     Run the following command to upgrade to 2023.2.20231002:

aws_instance.myec2 (remote-exec):       dnf upgrade --releasever=2023.2.20231002

aws_instance.myec2 (remote-exec):     Release notes:
aws_instance.myec2 (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20231002.html

aws_instance.myec2 (remote-exec):   Version 2023.2.20231011:
aws_instance.myec2 (remote-exec):     Run the following command to upgrade to 2023.2.20231011:

aws_instance.myec2 (remote-exec):       dnf upgrade --releasever=2023.2.20231011

aws_instance.myec2 (remote-exec):     Release notes:
aws_instance.myec2 (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20231011.html

aws_instance.myec2 (remote-exec):   Version 2023.2.20231016:
aws_instance.myec2 (remote-exec):     Run the following command to upgrade to 2023.2.20231016:

aws_instance.myec2 (remote-exec):       dnf upgrade --releasever=2023.2.20231016

aws_instance.myec2 (remote-exec):     Release notes:
aws_instance.myec2 (remote-exec):      https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.2.20231016.html

aws_instance.myec2 (remote-exec): ========================================

aws_instance.myec2 (remote-exec): Installed:
aws_instance.myec2 (remote-exec):   generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch
aws_instance.myec2 (remote-exec):   gperftools-libs-2.9.1-1.amzn2023.0.2.x86_64
aws_instance.myec2 (remote-exec):   libunwind-1.4.0-5.amzn2023.0.2.x86_64
aws_instance.myec2 (remote-exec):   nginx-1:1.24.0-1.amzn2023.0.1.x86_64
aws_instance.myec2 (remote-exec):   nginx-core-1:1.24.0-1.amzn2023.0.1.x86_64
aws_instance.myec2 (remote-exec):   nginx-filesystem-1:1.24.0-1.amzn2023.0.1.noarch
aws_instance.myec2 (remote-exec):   nginx-mimetypes-2.1.49-3.amzn2023.0.3.noarch

aws_instance.myec2 (remote-exec): Complete!
aws_instance.myec2: Creation complete after 52s [id=i-094d80840426ad940]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ 



<h2> Destroy </h2>
ahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ terraform destroy
aws_security_group.allow_ssh: Refreshing state... [id=sg-0ed4cfc8f4ea974b9]
aws_instance.myec2: Refreshing state... [id=i-094d80840426ad940]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.myec2 will be destroyed
  - resource "aws_instance" "myec2" {
      - ami                                  = "ami-01103fb68b3569475" -> null
      - arn                                  = "arn:aws:ec2:us-east-2:954854060441:instance/i-094d80840426ad940" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-2c" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-094d80840426ad940" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "terraform-key" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-000df0827fcd3a11d" -> null
      - private_dns                          = "ip-172-31-36-200.us-east-2.compute.internal" -> null
      - private_ip                           = "172.31.36.200" -> null
      - public_dns                           = "ec2-3-16-213-221.us-east-2.compute.amazonaws.com" -> null
      - public_ip                            = "3.16.213.221" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [
          - "allow_ssh",
        ] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0827b91bd9f405f68" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0ed4cfc8f4ea974b9",
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
          - volume_id             = "vol-04a45ede80b26be80" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # aws_security_group.allow_ssh will be destroyed
  - resource "aws_security_group" "allow_ssh" {
      - arn                    = "arn:aws:ec2:us-east-2:954854060441:security-group/sg-0ed4cfc8f4ea974b9" -> null
      - description            = "Allow SSH inbound traffic" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Outbound Allowed"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 65535
            },
        ] -> null
      - id                     = "sg-0ed4cfc8f4ea974b9" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "SSH into VPC"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
        ] -> null
      - name                   = "allow_ssh" -> null
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

aws_instance.myec2: Destroying... [id=i-094d80840426ad940]
aws_instance.myec2: Still destroying... [id=i-094d80840426ad940, 10s elapsed]
aws_instance.myec2: Still destroying... [id=i-094d80840426ad940, 20s elapsed]
aws_instance.myec2: Still destroying... [id=i-094d80840426ad940, 30s elapsed]
aws_instance.myec2: Destruction complete after 30s
aws_security_group.allow_ssh: Destroying... [id=sg-0ed4cfc8f4ea974b9]
aws_security_group.allow_ssh: Destruction complete after 1s

Destroy complete! Resources: 2 destroyed.
mahsan@vmmint:~/NewGit/terraform/terraform_provisinor$ 


</pre>
