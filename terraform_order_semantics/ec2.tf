resource "aws_instance" "myec2" {
   ami = "ami-07d07d65c47e5aa90"
   instance_type = "t2.micro"
}

resource "aws_instance" "myec3" {
   ami = "ami-07d07d65c47e5aa90"
   instance_type = "t2.micro"
}

