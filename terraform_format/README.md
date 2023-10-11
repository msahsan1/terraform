mahsan@vmmint:~/Project$ cat terraform_debug.tf 
provider "aws" {
  region     = "us-west-2"
}


resource "aws_instance" "myec2" {
    ami = "ami-01103fb68b3569475"
    instance_type = "t2.micro"

}

mahsan@vmmint:~/Project$ terraform fmt
terraform_debug.tf
mahsan@vmmint:~/Project$ cat terraform_debug.tf 
provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "myec2" {
  ami           = "ami-01103fb68b3569475"
  instance_type = "t2.micro"

}

mahsan@vmmint:~/Project$ 

