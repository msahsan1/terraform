<pre>
<h1>  Data_type_for_variables </h1>

ahsan@vmmint:~/Project$ cat elb.tf 
provider "aws" {
region     = "us-east-2"
}

resource "aws_elb" "bar" {
name               = var.elb_name
availability_zones = var.az

listener {
instance_port     = 8000
instance_protocol = "http"
lb_port           = 80
lb_protocol       = "http"
}

health_check {
healthy_threshold   = 2
unhealthy_threshold = 2
timeout             = 3
target              = "HTTP:8000/"
interval            = 30
}

cross_zone_load_balancing   = true
idle_timeout                = var.timeout
connection_draining         = true
connection_draining_timeout = var.timeout

tags = {
Name = "foobar-terraform-elb"
}
}
mahsan@vmmint:~/Project$ cat variables.tf 
variable "usernumber" {
type = number
}

variable "elb_name" {
type = string
}

variable "az" {
type = list
}

variable "timeout" {
type = number
}
mahsan@vmmint:~/Project$ cat terraform.tf
terraform.tfstate         terraform.tfstate.backup  terraform.tfvars          
mahsan@vmmint:~/Project$ cat terraform.tfvars 
elb_name="myelb"
timeout="400"
az=["us-east-1","us-east-2"]


mahsan@vmmint:~/Project$ 



ahsan@vmmint:~/Project$ terraform plan
var.usernumber
Enter a value: asd


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
+ create

Terraform planned the following actions, but then encountered a problem:

# aws_elb.bar will be created
+ resource "aws_elb" "bar" {
+ arn                         = (known after apply)
+ availability_zones          = [
  + "us-east-1",
  + "us-east-2",
]
+ connection_draining         = true
+ connection_draining_timeout = 400
+ cross_zone_load_balancing   = true
+ desync_mitigation_mode      = "defensive"
+ dns_name                    = (known after apply)
+ id                          = (known after apply)
+ idle_timeout                = 400
+ instances                   = (known after apply)
+ internal                    = (known after apply)
+ name                        = "myelb"
+ security_groups             = (known after apply)
+ source_security_group       = (known after apply)
+ source_security_group_id    = (known after apply)
+ subnets                     = (known after apply)
+ tags                        = {
  + "Name" = "foobar-terraform-elb"
}
+ tags_all                    = {
  + "Name" = "foobar-terraform-elb"
}
+ zone_id                     = (known after apply)

+ health_check {
  + healthy_threshold   = 2
  + interval            = 30
  + target              = "HTTP:8000/"
  + timeout             = 3
  + unhealthy_threshold = 2
}

+ listener {
  + instance_port     = 8000
  + instance_protocol = "http"
  + lb_port           = 80
  + lb_protocol       = "http"
}
}

Plan: 1 to add, 0 to change, 0 to destroy.
╷
│ Error: Invalid value for input variable
│ 
│   on variables.tf line 1:
│    1: variable "usernumber" {
│ 
│ Unsuitable value for var.usernumber set using an interactive prompt: a number is required.
╵
mahsan@vmmint:~/Project$ terraform plan
var.usernumber
Enter a value: 786


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
+ create

Terraform will perform the following actions:

# aws_elb.bar will be created
+ resource "aws_elb" "bar" {
+ arn                         = (known after apply)
+ availability_zones          = [
  + "us-east-1",
  + "us-east-2",
]
+ connection_draining         = true
+ connection_draining_timeout = 400
+ cross_zone_load_balancing   = true
+ desync_mitigation_mode      = "defensive"
+ dns_name                    = (known after apply)
+ id                          = (known after apply)
+ idle_timeout                = 400
+ instances                   = (known after apply)
+ internal                    = (known after apply)
+ name                        = "myelb"
+ security_groups             = (known after apply)
+ source_security_group       = (known after apply)
+ source_security_group_id    = (known after apply)
+ subnets                     = (known after apply)
+ tags                        = {
  + "Name" = "foobar-terraform-elb"
}
+ tags_all                    = {
  + "Name" = "foobar-terraform-elb"
}
+ zone_id                     = (known after apply)

+ health_check {
  + healthy_threshold   = 2
  + interval            = 30
  + target              = "HTTP:8000/"
  + timeout             = 3
  + unhealthy_threshold = 2
}

+ listener {
  + instance_port     = 8000
  + instance_protocol = "http"
  + lb_port           = 80
  + lb_protocol       = "http"
}
}

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
apply" now.
mahsan@vmmint:~/Project$ 


</pre>


![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230924-102345.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230924-102239.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230923-125528.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230924-102731.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230924-102543.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230924-102359.png "msahsan1@gmail.com")
![Alt text](https://github.com/msahsan1/terraform/blob/main/Data_type_for_variables/ksnip_20230925-105018.png "msahsan1@gmail.com")


