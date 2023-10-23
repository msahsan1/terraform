resource "aws_instance" "myec2" {
  ami           = "ami-01103fb68b3569475"
  instance_type = var.instance_type


}
