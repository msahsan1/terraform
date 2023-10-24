module "sgmodule" {
  source = "../../module/sg"
}

resource "aws_instance" "web" {
  ami           = "ami-01103fb68b3569475"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}

output "sg_id_output" {
  value = module.sgmodule.sg_id
}
