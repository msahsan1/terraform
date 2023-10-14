<pre>
<h1> Terraform Taint </h1>
mahsan@vmmint:~/BackupForP7-2023-10-13/Project$ terraform validate
Success! The configuration is valid.

mahsan@vmmint:~/BackupForP7-2023-10-13/Project$ terraform apply

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

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Creation complete after 32s [id=i-0fdf85774fe806f9a]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

mahsan@vmmint:~/BackupForP7-2023-10-13/Project$ terraform apply -replace="aws_instance.myec2"
aws_instance.myec2: Refreshing state... [id=i-0fdf85774fe806f9a]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.myec2 will be replaced, as requested
-/+ resource "aws_instance" "myec2" {
      ~ arn                                  = "arn:aws:ec2:us-east-2:954854060441:instance/i-0fdf85774fe806f9a" -> (known after apply)
      ~ associate_public_ip_address          = true -> (known after apply)
      ~ availability_zone                    = "us-east-2b" -> (known after apply)
      ~ cpu_core_count                       = 1 -> (known after apply)
      ~ cpu_threads_per_core                 = 1 -> (known after apply)
      ~ disable_api_stop                     = false -> (known after apply)
      ~ disable_api_termination              = false -> (known after apply)
      ~ ebs_optimized                        = false -> (known after apply)
      - hibernation                          = false -> null
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      ~ id                                   = "i-0fdf85774fe806f9a" -> (known after apply)
      ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
      + instance_lifecycle                   = (known after apply)
      ~ instance_state                       = "running" -> (known after apply)
      ~ ipv6_address_count                   = 0 -> (known after apply)
      ~ ipv6_addresses                       = [] -> (known after apply)
      + key_name                             = (known after apply)
      ~ monitoring                           = false -> (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      ~ placement_partition_number           = 0 -> (known after apply)
      ~ primary_network_interface_id         = "eni-02e25bf54b83769eb" -> (known after apply)
      ~ private_dns                          = "ip-172-31-22-198.us-east-2.compute.internal" -> (known after apply)
      ~ private_ip                           = "172.31.22.198" -> (known after apply)
      ~ public_dns                           = "ec2-3-136-84-98.us-east-2.compute.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "3.136.84.98" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [
          - "default",
        ] -> (known after apply)
      + spot_instance_request_id             = (known after apply)
      ~ subnet_id                            = "subnet-03852e1095ae7efbc" -> (known after apply)
      - tags                                 = {} -> null
      ~ tags_all                             = {} -> (known after apply)
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-04e04295a2cc4a9aa",
        ] -> (known after apply)
        # (5 unchanged attributes hidden)

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
          - volume_id             = "vol-0cf3856aeeb21a64a" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.myec2: Destroying... [id=i-0fdf85774fe806f9a]
aws_instance.myec2: Still destroying... [id=i-0fdf85774fe806f9a, 10s elapsed]
aws_instance.myec2: Still destroying... [id=i-0fdf85774fe806f9a, 20s elapsed]
aws_instance.myec2: Still destroying... [id=i-0fdf85774fe806f9a, 30s elapsed]
aws_instance.myec2: Still destroying... [id=i-0fdf85774fe806f9a, 40s elapsed]
aws_instance.myec2: Destruction complete after 40s
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Still creating... [40s elapsed]
aws_instance.myec2: Still creating... [50s elapsed]
aws_instance.myec2: Still creating... [1m0s elapsed]
aws_instance.myec2: Still creating... [1m10s elapsed]
aws_instance.myec2: Still creating... [1m20s elapsed]
aws_instance.myec2: Still creating... [1m30s elapsed]
aws_instance.myec2: Still creating... [1m40s elapsed]
aws_instance.myec2: Still creating... [1m50s elapsed]
aws_instance.myec2: Still creating... [2m0s elapsed]
aws_instance.myec2: Still creating... [2m10s elapsed]
aws_instance.myec2: Creation complete after 2m14s [id=i-0281304cd461fefdf]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
mahsan@vmmint:~/BackupForP7-2023-10-13/Project$ 
</pre>


