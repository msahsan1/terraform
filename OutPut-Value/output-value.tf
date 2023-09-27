provider "aws" {
  region = "us-east-2"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}


output "public-ip" {
  value = "https://${aws_eip.lb.public_ip}:8080"
}

