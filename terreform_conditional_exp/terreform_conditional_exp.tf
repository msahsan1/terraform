provider "aws"  {
  region     = "us-east-2"
  }

variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-01103fb68b3569475"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-01103fb68b3569475"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}
