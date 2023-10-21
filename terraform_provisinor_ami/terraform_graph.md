<pre>
<h2> Terraform Graph </h2>
 mahsan@vmmint:~/NewGit/terraform/terraform_provisinor_ami$ terraform graph
digraph {
	compound = "true"
	newrank = "true"
	subgraph "root" {
		"[root] aws_default_vpc.default (expand)" [label = "aws_default_vpc.default", shape = "box"]
		"[root] aws_instance.http_servers (expand)" [label = "aws_instance.http_servers", shape = "box"]
		"[root] aws_security_group.http_server_sg (expand)" [label = "aws_security_group.http_server_sg", shape = "box"]
		"[root] data.aws_ami.aws_linux_2_latest (expand)" [label = "data.aws_ami.aws_linux_2_latest", shape = "box"]
		"[root] data.aws_ami_ids.aws_linux_2_latest_ids (expand)" [label = "data.aws_ami_ids.aws_linux_2_latest_ids", shape = "box"]
		"[root] data.aws_subnets.default_subnets (expand)" [label = "data.aws_subnets.default_subnets", shape = "box"]
		"[root] provider[\"registry.terraform.io/hashicorp/aws\"]" [label = "provider[\"registry.terraform.io/hashicorp/aws\"]", shape = "diamond"]
		"[root] aws_default_vpc.default (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
		"[root] aws_instance.http_servers (expand)" -> "[root] aws_security_group.http_server_sg (expand)"
		"[root] aws_instance.http_servers (expand)" -> "[root] data.aws_ami.aws_linux_2_latest (expand)"
		"[root] aws_instance.http_servers (expand)" -> "[root] data.aws_subnets.default_subnets (expand)"
		"[root] aws_security_group.http_server_sg (expand)" -> "[root] aws_default_vpc.default (expand)"
		"[root] data.aws_ami.aws_linux_2_latest (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
		"[root] data.aws_ami_ids.aws_linux_2_latest_ids (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
		"[root] data.aws_subnets.default_subnets (expand)" -> "[root] aws_default_vpc.default (expand)"
		"[root] output.aws_security_group_http_server_details (expand)" -> "[root] aws_security_group.http_server_sg (expand)"
		"[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_instance.http_servers (expand)"
		"[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] data.aws_ami_ids.aws_linux_2_latest_ids (expand)"
		"[root] root" -> "[root] output.aws_security_group_http_server_details (expand)"
		"[root] root" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)"
	}
}

mahsan@vmmint:~/NewGit/terraform/terraform_provisinor_ami$ 

</pre>
![Alt text](https://github.com/msahsan1/terraform/blob/main/terraform_provisinor_ami/ksnip_20231021-110717.png "msahsan1@gmail.com")
