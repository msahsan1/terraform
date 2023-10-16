provider "aws"  {
  region     = "us-east-2"
}


resource "aws_iam_user" "my_iam_users" {
      count = 3 
    name = "my_iam_user_${count.index}"

}

