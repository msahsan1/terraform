<pre>
ahsan@vmmint:~/Project$ terraform validate
Success! The configuration is valid.

mahsan@vmmint:~/Project$ vim terraform_debug.tf 
mahsan@vmmint:~/Project$ cat terraform_debug.tf 
provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "myec2" {
  ami           = "ami-01103fb68b3569475"
  instance_type = "t2.micro"

  name = asd

}

mahsan@vmmint:~/Project$ terraform validate
╷
│ Error: Unsupported argument
│ 
│   on terraform_debug.tf line 10, in resource "aws_instance" "myec2":
│   10:   name = asd
│ 
│ An argument named "name" is not expected here.
╵
mahsan@vmmint:~/Project$ 

ahsan@vmmint:~/Project$ cat terraform_debug.tf 
provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "myec2" {
  ami           = "ami-01103fb68b3569475"
  instance_type = var.instancetype


}

mahsan@vmmint:~/Project$ terraform validate
╷
│ Error: Reference to undeclared input variable
│ 
│   on terraform_debug.tf line 8, in resource "aws_instance" "myec2":
│    8:   instance_type = var.instancetype
│ 
│ An input variable with the name "instancetype" has not been declared. This variable can be
│ declared with a variable "instancetype" {} block.
╵
mahsan@vmmint:~/Project$ terraform plan
╷
│ Error: Reference to undeclared input variable
│ 
│   on terraform_debug.tf line 8, in resource "aws_instance" "myec2":
│    8:   instance_type = var.instancetype
│ 
│ An input variable with the name "instancetype" has not been declared. This variable can be
│ declared with a variable "instancetype" {} block.
╵
mahsan@vmmint:~/Project$ 







</pre>


