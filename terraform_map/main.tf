provider "aws"  {
  region     = "us-east-2"
}


variable "users" {
  default = {
    muhammad : { country : "Canada", department : "Unix Team" },
    shahid : { country : "USA", department : "Storage Team" },
    ahsan : { country : "Korea", department : "Network Team" }
  }
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    department : each.value.department
  }
}
