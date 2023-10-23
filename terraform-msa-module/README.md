<pre>

drwxrwxr-x 3 mahsan mahsan  4096 Oct 22 09:06 terraform_provisinor_multiple_https
drwxrwxr-x 4 mahsan mahsan  4096 Oct 23 10:45 terraform-msa-module
mahsan@vmmint:~/NewGit/terraform$ tree terraform-msa-module
terraform-msa-module
├── module
│   └── ec2
│       └── ec2.tf
└── projects
    ├── A
    │   ├── myec2.tf
    │   └── providers.tf
    └── B

5 directories, 3 files
mahsan@vmmint:~/NewGit/terraform$ 


</pre>

mahsan@vmmint:~/NewGit/terraform/terraform-msa-module/projects/A$ terraform init

Initializing the backend...
Initializing modules...
- ec2module in ../../module/ec2

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.22.0...
- Installed hashicorp/aws v5.22.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module/projects/A$ terraform validate
Success! The configuration is valid.

mahsan@vmmint:~/NewGit/terraform/terraform-msa-module/projects/A$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ec2module.aws_instance.myec2 will be created
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

Plan: 1 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module/projects/A$ 


