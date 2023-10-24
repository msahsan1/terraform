<pre>
<h2> Terraform Module Output </h2>
mahsan@vmmint:~/NewGit/terraform$ tree terraform-msa-module-output/
terraform-msa-module-output/
├── module
│   └── sg
│       └── sg.tf
└── projects
    └── C
        ├── my-sg.tf
        └── providers.tf

4 directories, 3 files
mahsan@vmmint:~/NewGit/terraform$

mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/module/sg$ pwd
/home/mahsan/NewGit/terraform/terraform-msa-module-output/module/sg
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/module/sg$ cat sg.tf 
resource "aws_security_group" "ec2-sg" {
  name        = "myec2-sg"

  ingress {
    description      = "Allow Inbound from Secret Application"
    from_port        = 8433
    to_port          = 8433
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

output "sg_id" {
  value = aws_security_group.ec2-sg.id
}
mahsan@vmmint:~/NewGit/terraform/terraform-msa-module-output/module/sg$ 





</pre>
