<pre>
<h1> S3 Bucket on Terraform </h1>

ahsan@vmmint:~/Project$ vim s3_bucket.tf
mahsan@vmmint:~/Project$ cat s3_bucket.tf 
provider "aws"  {
  region     = "us-east-2"
}

resource "aws_s3_bucket" "my_s3_bucket" {
        bucket = "msa-bucket3-2023"
    }

mahsan@vmmint:~/Project$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.my_s3_bucket will be created
  + resource "aws_s3_bucket" "my_s3_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "msa-bucket3-2023"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
mahsan@vmmint:~/Project$ 


ahsan@vmmint:~/Project$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.my_s3_bucket will be created
  + resource "aws_s3_bucket" "my_s3_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "msa-bucket3-2023"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.my_s3_bucket: Creating...
aws_s3_bucket.my_s3_bucket: Creation complete after 2s [id=msa-bucket3-2023]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/Project$ 


ahsan@vmmint:~/Project$ terraform destroy
aws_s3_bucket.my_s3_bucket: Refreshing state... [id=msa-bucket3-2023]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_s3_bucket.my_s3_bucket will be destroyed
  - resource "aws_s3_bucket" "my_s3_bucket" {
      - arn                         = "arn:aws:s3:::msa-bucket3-2023" -> null
      - bucket                      = "msa-bucket3-2023" -> null
      - bucket_domain_name          = "msa-bucket3-2023.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "msa-bucket3-2023.s3.us-east-2.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z2O1EMRO9K5GLX" -> null
      - id                          = "msa-bucket3-2023" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-2" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - grant {
          - id          = "5d341e857a25bd7a6bce1f897ec7b9fd9e4ef478fe0a529a4db9dd49c281fe68" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm = "AES256" -> null
                }
            }
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_s3_bucket.my_s3_bucket: Destroying... [id=msa-bucket3-2023]
aws_s3_bucket.my_s3_bucket: Destruction complete after 1s

Destroy complete! Resources: 1 destroyed.
mahsan@vmmint:~/Project$ 

mahsan@vmmint:~/Project$ cat s3_bucket.tf 
provider "aws"  {
  region     = "us-east-2"
}

resource "aws_s3_bucket" "my_s3_bucket" {
        bucket = "my-s3-bucket-in28minutes-rangak-002"
     #   versioning {
     #       enabled = true
     #   }
    }
     
    resource "aws_s3_bucket_versioning" "versioning_example" {
      bucket = aws_s3_bucket.my_s3_bucket.id
      versioning_configuration {
        status = "Enabled"
      }
    }

mahsan@vmmint:~/Project$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.my_s3_bucket will be created
  + resource "aws_s3_bucket" "my_s3_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-s3-bucket-in28minutes-rangak-002"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_bucket_versioning.versioning_example will be created
  + resource "aws_s3_bucket_versioning" "versioning_example" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
mahsan@vmmint:~/Project$ 

<b> N </b>

ahsan@vmmint:~/Project$ cat s3_bucket.tf 
provider "aws"  {
  region     = "us-east-2"
}


resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-in28minutes-rangak-005"
 #   versioning {
 #       enabled = true
 #   }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_abc_updated"
}

ahsan@vmmint:~/Project$ terraform plan
aws_iam_user.my_iam_user: Refreshing state... [id=my_iam_user_abc_updated]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.my_s3_bucket will be created
  + resource "aws_s3_bucket" "my_s3_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-s3-bucket-in28minutes-rangak-005"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_bucket_versioning.versioning_example will be created
  + resource "aws_s3_bucket_versioning" "versioning_example" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
mahsan@vmmint:~/Project$ terraform apply
aws_iam_user.my_iam_user: Refreshing state... [id=my_iam_user_abc_updated]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.my_s3_bucket will be created
  + resource "aws_s3_bucket" "my_s3_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-s3-bucket-in28minutes-rangak-005"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_bucket_versioning.versioning_example will be created
  + resource "aws_s3_bucket_versioning" "versioning_example" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


aws_s3_bucket.my_s3_bucket: Creating...
aws_s3_bucket.my_s3_bucket: Creation complete after 3s [id=my-s3-bucket-in28minutes-rangak-005]
aws_s3_bucket_versioning.versioning_example: Creating...
aws_s3_bucket_versioning.versioning_example: Creation complete after 1s [id=my-s3-bucket-in28minutes-rangak-005]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

<h1> S3 output </h1>
mahsan@vmmint:~/Project$ cat s3_bucket02.tf 
provider "aws"  {
  region     = "us-east-2"
}

resource "aws_s3_bucket" "my_s3_bucket_07" {
    bucket = "my-s3-bucket-07"
    versioning {
        enabled = true
   }
}

> aws_s3_bucket.my_s3_bucket_07
{
  "acceleration_status" = ""
  "acl" = tostring(null)
  "arn" = "arn:aws:s3:::my-s3-bucket-07"
  "bucket" = "my-s3-bucket-07"
  "bucket_domain_name" = "my-s3-bucket-07.s3.amazonaws.com"
  "bucket_prefix" = ""
  "bucket_regional_domain_name" = "my-s3-bucket-07.s3.us-east-2.amazonaws.com"
  "cors_rule" = tolist([])
  "force_destroy" = false
  "grant" = toset([
    {
      "id" = "5d341e857a25bd7a6bce1f897ec7b9fd9e4ef478fe0a529a4db9dd49c281fe68"
      "permissions" = toset([
        "FULL_CONTROL",
      ])
      "type" = "CanonicalUser"
      "uri" = ""
    },
  ])
  "hosted_zone_id" = "Z2O1EMRO9K5GLX"
  "id" = "my-s3-bucket-07"
  "lifecycle_rule" = tolist([])
  "logging" = tolist([])
  "object_lock_configuration" = tolist([])
  "object_lock_enabled" = false
  "policy" = ""
  "region" = "us-east-2"
  "replication_configuration" = tolist([])
  "request_payer" = "BucketOwner"
  "server_side_encryption_configuration" = tolist([
    {
      "rule" = tolist([
        {
          "apply_server_side_encryption_by_default" = tolist([
            {
              "kms_master_key_id" = ""
              "sse_algorithm" = "AES256"
            },
          ])
          "bucket_key_enabled" = false
        },
      ])
    },
  ])
  "tags" = tomap(null) /* of string */
  "tags_all" = tomap({})
  "timeouts" = null /* object */
  "versioning" = tolist([
    {
      "enabled" = true
      "mfa_delete" = false
    },
  ])
  "website" = tolist([])
  "website_domain" = tostring(null)
  "website_endpoint" = tostring(null)
}
>  

ahsan@vmmint:~/Project$ cat s3_bucket02.tf 
provider "aws"  {
  region     = "us-east-2"
}



resource "aws_s3_bucket" "my_s3_bucket_07" {
    bucket = "my-s3-bucket-07"
    versioning {
        enabled = true
   }
}

output "my_s3_bucket_complete" {
   value = aws_s3_bucket.my_s3_bucket_07

}

mahsan@vmmint:~/Project$ terraform apply -refresh=false

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
╷
│ Warning: Argument is deprecated
│ 
│   with aws_s3_bucket.my_s3_bucket_07,
│   on s3_bucket02.tf line 7, in resource "aws_s3_bucket" "my_s3_bucket_07":
│    7: resource "aws_s3_bucket" "my_s3_bucket_07" {
│ 
│ Use the aws_s3_bucket_versioning resource instead
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

my_s3_bucket_complete = {
  "acceleration_status" = ""
  "acl" = tostring(null)
  "arn" = "arn:aws:s3:::my-s3-bucket-07"
  "bucket" = "my-s3-bucket-07"
  "bucket_domain_name" = "my-s3-bucket-07.s3.amazonaws.com"
  "bucket_prefix" = ""
  "bucket_regional_domain_name" = "my-s3-bucket-07.s3.us-east-2.amazonaws.com"
  "cors_rule" = tolist([])
  "force_destroy" = false
  "grant" = toset([
    {
      "id" = "5d341e857a25bd7a6bce1f897ec7b9fd9e4ef478fe0a529a4db9dd49c281fe68"
      "permissions" = toset([
        "FULL_CONTROL",
      ])
      "type" = "CanonicalUser"
      "uri" = ""
    },
  ])
  "hosted_zone_id" = "Z2O1EMRO9K5GLX"
  "id" = "my-s3-bucket-07"
  "lifecycle_rule" = tolist([])
  "logging" = tolist([])
  "object_lock_configuration" = tolist([])
  "object_lock_enabled" = false
  "policy" = ""
  "region" = "us-east-2"
  "replication_configuration" = tolist([])
  "request_payer" = "BucketOwner"
  "server_side_encryption_configuration" = tolist([
    {
      "rule" = tolist([
        {
          "apply_server_side_encryption_by_default" = tolist([
            {
              "kms_master_key_id" = ""
              "sse_algorithm" = "AES256"
            },
          ])
          "bucket_key_enabled" = false
        },
      ])
    },
  ])
  "tags" = tomap(null) /* of string */
  "tags_all" = tomap({})
  "timeouts" = null /* object */
  "versioning" = tolist([
    {
      "enabled" = true
      "mfa_delete" = false
    },
  ])
  "website" = tolist([])
  "website_domain" = tostring(null)
  "website_endpoint" = tostring(null)
}
mahsan@vmmint:~/Project$ 







</pre>
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-103120.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-103200.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-103220.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-103229.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-103239.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-104643.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-110153.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_s3_bucket/ksnip_20231015-110234.png "msahsan1@gmail.com")
