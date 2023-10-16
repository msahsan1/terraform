
<pre> 
<h1>S3 and iam user creation </h1>

mahsan@vmmint:~/Project$ cat terraform_iam_s3_bucket02.tf 
provider "aws"  {
  region     = "us-east-2"
}



resource "aws_s3_bucket" "my_s3_bucket_07" {
    bucket = "my-s3-bucket-07"
    versioning {
        enabled = true
   }
}

resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_abc"

}

 perform exactly these actions, run the following command to apply:
    terraform apply "iam.tfplan"
mahsan@vmmint:~/Project$ ls -ltr
total 57204
-rw-rw-r-- 1 mahsan mahsan 58522646 Sep 22 10:51 awscliv2.zip
drwxr-xr-x 4 mahsan mahsan     4096 Sep 25 10:56 aws
-rw------- 1 mahsan mahsan     1674 Oct  5 11:19 ec2-key.pem
drwxrwxr-x 2 mahsan mahsan     4096 Oct  5 11:20 terraform_varable
-r-------- 1 mahsan mahsan      399 Oct  9 09:33 id_rsa.pub
-rw-rw-r-- 1 mahsan mahsan     3566 Oct 14 12:10 demopath
-rw-rw-r-- 1 mahsan mahsan    13504 Oct 16 11:22 terraform.tfstate.backup
-rw-rw-r-- 1 mahsan mahsan      181 Oct 16 11:22 terraform.tfstate
drwxrwxr-x 3 mahsan mahsan     4096 Oct 16 11:37 Backup-TF
-rw-rw-r-- 1 mahsan mahsan      248 Oct 16 11:39 terraform_iam_s3_bucket02.tf
-rw-rw-r-- 1 mahsan mahsan     3388 Oct 16 11:39 iam.tfplan
mahsan@vmmint:~/Project$ terraform apply iam.tfplan 
aws_iam_user.my_iam_user: Creating...
aws_s3_bucket.my_s3_bucket_07: Creating...
aws_iam_user.my_iam_user: Creation complete after 1s [id=my_iam_user_abc]
aws_s3_bucket.my_s3_bucket_07: Creation complete after 4s [id=my-s3-bucket-07]
╷
│ Warning: Argument is deprecated
│ 
│   with aws_s3_bucket.my_s3_bucket_07,
│   on terraform_iam_s3_bucket02.tf line 7, in resource "aws_s3_bucket" "my_s3_bucket_07":
│    7: resource "aws_s3_bucket" "my_s3_bucket_07" {
│ 
│ Use the aws_s3_bucket_versioning resource instead
╵

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
mahsan@vmmint:~/Project$ 



mahsan@vmmint:~/Project$ terraform plan -out iam.tfplan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_user will be created
  + resource "aws_iam_user" "my_iam_user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "my_iam_user_abc"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_s3_bucket.my_s3_bucket_07 will be created
  + resource "aws_s3_bucket" "my_s3_bucket_07" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-s3-bucket-07"
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

      + versioning {
          + enabled    = true
          + mfa_delete = false
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
╷
│ Warning: Argument is deprecated
│ 
│   with aws_s3_bucket.my_s3_bucket_07,
│   on terraform_iam_s3_bucket02.tf line 7, in resource "aws_s3_bucket" "my_s3_bucket_07":
│    7: resource "aws_s3_bucket" "my_s3_bucket_07" {
│ 
│ Use the aws_s3_bucket_versioning resource instead
│ 
│ (and one more similar warning elsewhere)
╵

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: iam.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "iam.tfplan"
mahsan@vmmint:~/Project$ 

<h1> S3 OutPut </h1>


mahsan@vmmint:~/Project$ cat terraform_iam_s3_bucket02.tf 
provider "aws"  {
  region     = "us-east-2"
}



resource "aws_s3_bucket" "my_s3_bucket_07" {
    bucket = "my-s3-bucket-07"
    versioning {
        enabled = true
   }
}

resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_abc"

}

output "my_s3_bucket_complete_details" {
        value = aws_s3_bucket.my_s3_bucket_07

}

output "my_iam_user_compleate_details" {
   value = aws_iam_user.my_iam_user

}


ahsan@vmmint:~/Project$ vim terraform_iam_s3_bucket02.tf 
mahsan@vmmint:~/Project$ terraform apply -refresh=false

Changes to Outputs:
  + my_iam_user_compleate_details = {
      + arn                  = "arn:aws:iam::954854060441:user/my_iam_user_abc"
      + force_destroy        = false
      + id                   = "my_iam_user_abc"
      + name                 = "my_iam_user_abc"
      + path                 = "/"
      + permissions_boundary = null
      + tags                 = null
      + tags_all             = {}
      + unique_id            = "AIDA54UN4WGMWJE6PITCD"
    }
  + my_s3_bucket_complete_details = {
      + acceleration_status                  = ""
      + acl                                  = null
      + arn                                  = "arn:aws:s3:::my-s3-bucket-07"
      + bucket                               = "my-s3-bucket-07"
      + bucket_domain_name                   = "my-s3-bucket-07.s3.amazonaws.com"
      + bucket_prefix                        = ""
      + bucket_regional_domain_name          = "my-s3-bucket-07.s3.us-east-2.amazonaws.com"
      + cors_rule                            = []
      + force_destroy                        = false
      + grant                                = [
          + {
              + id          = "5d341e857a25bd7a6bce1f897ec7b9fd9e4ef478fe0a529a4db9dd49c281fe68"
              + permissions = [
                  + "FULL_CONTROL",
                ]
              + type        = "CanonicalUser"
              + uri         = ""
            },
        ]
      + hosted_zone_id                       = "Z2O1EMRO9K5GLX"
      + id                                   = "my-s3-bucket-07"
      + lifecycle_rule                       = []
      + logging                              = []
      + object_lock_configuration            = []
      + object_lock_enabled                  = false
      + policy                               = ""
      + region                               = "us-east-2"
      + replication_configuration            = []
      + request_payer                        = "BucketOwner"
      + server_side_encryption_configuration = [
          + {
              + rule = [
                  + {
                      + apply_server_side_encryption_by_default = [
                          + {
                              + kms_master_key_id = ""
                              + sse_algorithm     = "AES256"
                            },
                        ]
                      + bucket_key_enabled                      = false
                    },
                ]
            },
        ]
      + tags                                 = null
      + tags_all                             = {}
      + timeouts                             = null
      + versioning                           = [
          + {
              + enabled    = true
              + mfa_delete = false
            },
        ]
      + website                              = []
      + website_domain                       = null
      + website_endpoint                     = null
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.
╷
│ Warning: Argument is deprecated
│ 
│   with aws_s3_bucket.my_s3_bucket_07,
│   on terraform_iam_s3_bucket02.tf line 7, in resource "aws_s3_bucket" "my_s3_bucket_07":
│    7: resource "aws_s3_bucket" "my_s3_bucket_07" {
│ 
│ Use the aws_s3_bucket_versioning resource instead
│ 
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

my_iam_user_compleate_details = {
  "arn" = "arn:aws:iam::954854060441:user/my_iam_user_abc"
  "force_destroy" = false
  "id" = "my_iam_user_abc"
  "name" = "my_iam_user_abc"
  "path" = "/"
  "permissions_boundary" = tostring(null)
  "tags" = tomap(null) /* of string */
  "tags_all" = tomap({})
  "unique_id" = "AIDA54UN4WGMWJE6PITCD"
}
my_s3_bucket_complete_details = {
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

![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_S3_iam_user_creation/ksnip_20231016-114349.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_S3_iam_user_creation/ksnip_20231016-114423.png "msahsan1@gmail.com")
