provider "aws"  {
  region     = "us-east-2"
}


variable "names" {
  default = ["Muhammad", "Shahid", "Ahsan"]


}

resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names)
  name = each.value
}


