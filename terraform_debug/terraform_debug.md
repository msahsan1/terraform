mahsan@vmmint:~/Project$ cat terraform_debug.tf 
provider "aws" {
  region     = "us-west-2"
}


resource "aws_instance" "myec2" {
    ami = "ami-01103fb68b3569475"
    instance_type = "t2.micro"

}

mahsan@vmmint:~/Project$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.myec2 will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-01103fb68b3569475"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
mahsan@vmmint:~/Project$ export TF_LOG=TRACE
mahsan@vmmint:~/Project$ terraform plan
2023-10-09T12:03:40.390-0700 [INFO]  Terraform version: 1.5.7
2023-10-09T12:03:40.390-0700 [DEBUG] using github.com/hashicorp/go-tfe v1.26.0
2023-10-09T12:03:40.390-0700 [DEBUG] using github.com/hashicorp/hcl/v2 v2.16.2
2023-10-09T12:03:40.390-0700 [DEBUG] using github.com/hashicorp/terraform-svchost v0.1.0
2023-10-09T12:03:40.390-0700 [DEBUG] using github.com/zclconf/go-cty v1.12.2
2023-10-09T12:03:40.390-0700 [INFO]  Go runtime version: go1.20.7
2023-10-09T12:03:40.390-0700 [INFO]  CLI args: []string{"terraform", "plan"}
2023-10-09T12:03:40.390-0700 [TRACE] Stdout is a terminal of width 151
2023-10-09T12:03:40.390-0700 [TRACE] Stderr is a terminal of width 151
2023-10-09T12:03:40.390-0700 [TRACE] Stdin is a terminal
2023-10-09T12:03:40.390-0700 [DEBUG] Attempting to open CLI config file: /home/mahsan/.terraformrc
2023-10-09T12:03:40.390-0700 [DEBUG] File doesn't exist, but doesn't need to. Ignoring.
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory terraform.d/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /home/mahsan/.terraform.d/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /home/mahsan/.local/share/terraform/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /usr/share/cinnamon/terraform/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /usr/share/gnome/terraform/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /home/mahsan/.local/share/flatpak/exports/share/terraform/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /var/lib/flatpak/exports/share/terraform/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /usr/local/share/terraform/plugins
2023-10-09T12:03:40.390-0700 [DEBUG] ignoring non-existing provider search directory /usr/share/terraform/plugins
2023-10-09T12:03:40.390-0700 [INFO]  CLI command args: []string{"plan"}
2023-10-09T12:03:40.391-0700 [TRACE] Meta.Backend: no config given or present on disk, so returning nil config
2023-10-09T12:03:40.391-0700 [TRACE] Meta.Backend: backend has not previously been initialized in this working directory
2023-10-09T12:03:40.391-0700 [DEBUG] New state was assigned lineage "10a28006-7750-ffc5-08ce-5888734eb196"
2023-10-09T12:03:40.391-0700 [TRACE] Meta.Backend: using default local state only (no backend configuration, and no existing initialized backend)
2023-10-09T12:03:40.391-0700 [TRACE] Meta.Backend: instantiated backend of type <nil>
2023-10-09T12:03:40.392-0700 [TRACE] providercache.fillMetaCache: scanning directory .terraform/providers
2023-10-09T12:03:40.392-0700 [TRACE] getproviders.SearchLocalDirectory: found registry.terraform.io/hashicorp/aws v5.17.0 for linux_amd64 at .terraform/providers/registry.terraform.io/hashicorp/aws/5.17.0/linux_amd64
2023-10-09T12:03:40.392-0700 [TRACE] getproviders.SearchLocalDirectory: found registry.terraform.io/hashicorp/azurerm v3.73.0 for linux_amd64 at .terraform/providers/registry.terraform.io/hashicorp/azurerm/3.73.0/linux_amd64
2023-10-09T12:03:40.392-0700 [TRACE] getproviders.SearchLocalDirectory: found registry.terraform.io/integrations/github v5.37.0 for linux_amd64 at .terraform/providers/registry.terraform.io/integrations/github/5.37.0/linux_amd64
2023-10-09T12:03:40.392-0700 [TRACE] providercache.fillMetaCache: including .terraform/providers/registry.terraform.io/integrations/github/5.37.0/linux_amd64 as a candidate package for registry.terraform.io/integrations/github 5.37.0
2023-10-09T12:03:40.392-0700 [TRACE] providercache.fillMetaCache: including .terraform/providers/registry.terraform.io/hashicorp/aws/5.17.0/linux_amd64 as a candidate package for registry.terraform.io/hashicorp/aws 5.17.0
2023-10-09T12:03:40.392-0700 [TRACE] providercache.fillMetaCache: including .terraform/providers/registry.terraform.io/hashicorp/azurerm/3.73.0/linux_amd64 as a candidate package for registry.terraform.io/hashicorp/azurerm 3.73.0
2023-10-09T12:03:41.407-0700 [TRACE] providercache.fillMetaCache: using cached result from previous scan of .terraform/providers
2023-10-09T12:03:41.496-0700 [DEBUG] checking for provisioner in "."
2023-10-09T12:03:41.499-0700 [DEBUG] checking for provisioner in "/usr/bin"
2023-10-09T12:03:41.499-0700 [TRACE] Meta.Backend: backend <nil> does not support operations, so wrapping it in a local backend
2023-10-09T12:03:41.500-0700 [INFO]  backend/local: starting Plan operation
2023-10-09T12:03:41.500-0700 [TRACE] backend/local: requesting state manager for workspace "default"
2023-10-09T12:03:41.500-0700 [TRACE] backend/local: state manager for workspace "default" will:
 - read initial snapshot from terraform.tfstate
 - write new snapshots to terraform.tfstate
 - create any backup at terraform.tfstate.backup
2023-10-09T12:03:41.500-0700 [TRACE] backend/local: requesting state lock for workspace "default"
2023-10-09T12:03:41.500-0700 [TRACE] statemgr.Filesystem: preparing to manage state snapshots at terraform.tfstate
2023-10-09T12:03:41.500-0700 [TRACE] statemgr.Filesystem: existing snapshot has lineage "381a2117-b786-6653-87cf-3dcf23eff3fd" serial 19
2023-10-09T12:03:41.500-0700 [TRACE] statemgr.Filesystem: locking terraform.tfstate using fcntl flock
2023-10-09T12:03:41.500-0700 [TRACE] statemgr.Filesystem: writing lock metadata to .terraform.tfstate.lock.info
2023-10-09T12:03:41.500-0700 [TRACE] backend/local: reading remote state for workspace "default"
2023-10-09T12:03:41.500-0700 [TRACE] statemgr.Filesystem: reading latest snapshot from terraform.tfstate
2023-10-09T12:03:41.500-0700 [TRACE] statemgr.Filesystem: read snapshot with lineage "381a2117-b786-6653-87cf-3dcf23eff3fd" serial 19
2023-10-09T12:03:41.500-0700 [TRACE] backend/local: populating backend.LocalRun for current working directory
2023-10-09T12:03:41.501-0700 [TRACE] Config.VerifyDependencySelections: provider registry.terraform.io/hashicorp/aws has 5.17.0 to satisfy ""
2023-10-09T12:03:41.501-0700 [TRACE] terraform.NewContext: starting
2023-10-09T12:03:41.501-0700 [TRACE] terraform.NewContext: complete
2023-10-09T12:03:41.501-0700 [TRACE] backend/local: requesting interactive input, if necessary
2023-10-09T12:03:41.501-0700 [TRACE] LoadSchemas: retrieving schema for provider type "registry.terraform.io/hashicorp/aws"
2023-10-09T12:03:41.501-0700 [TRACE] terraform.contextPlugins: Initializing provider "registry.terraform.io/hashicorp/aws" to read its schema
2023-10-09T12:03:41.501-0700 [DEBUG] created provider logger: level=trace
2023-10-09T12:03:41.501-0700 [INFO]  provider: configuring client automatic mTLS
2023-10-09T12:03:41.513-0700 [DEBUG] provider: starting plugin: path=.terraform/providers/registry.terraform.io/hashicorp/aws/5.17.0/linux_amd64/terraform-provider-aws_v5.17.0_x5 args=[.terraform/providers/registry.terraform.io/hashicorp/aws/5.17.0/linux_amd64/terraform-provider-aws_v5.17.0_x5]
2023-10-09T12:03:41.514-0700 [DEBUG] provider: plugin started: path=.terraform/providers/registry.terraform.io/hashicorp/aws/5.17.0/linux_amd64/terraform-provider-aws_v5.17.0_x5 pid=69650
2023-10-09T12:03:41.514-0700 [DEBUG] provider: waiting for RPC address: path=.terraform/providers/registry.terraform.io/hashicorp/aws/5.17.0/linux_amd64/terraform-provider-aws_v5.17.0_x5
2023-10-09T12:03:41.610-0700 [INFO]  provider.terraform-provider-aws_v5.17.0_x5: configuring server automatic mTLS: timestamp=2023-10-09T12:03:41.610-0700
2023-10-09T12:03:41.621-0700 [DEBUG] provider: using plugin: version=5
2023-10-09T12:03:41.622-0700 [DEBUG] provider.terraform-provider-aws_v5.17.0_x5: plugin address: address=/tmp/plugin2501950775 network=unix timestamp=2023-10-09T12:03:41.621-0700
2023-10-09T12:03:41.630-0700 [TRACE] GRPCProvider: GetProviderSchema
2023-10-09T12:03:41.630-0700 [TRACE] provider.stdio: waiting for stdio data
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Received request: @caller=github.com/hashicorp/terraform-plugin-go@v0.19.0/tfprotov5/tf5server/server.go:531 tf_provider_addr=registry.terraform.io/hashicorp/aws @module=sdk.proto tf_proto_version=5.4 tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_rpc=GetProviderSchema timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Sending request downstream: tf_rpc=GetProviderSchema @module=sdk.proto tf_proto_version=5.4 tf_provider_addr=registry.terraform.io/hashicorp/aws @caller=github.com/hashicorp/terraform-plugin-go@v0.19.0/tfprotov5/internal/tf5serverlogging/downstream_request.go:20 tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: calling downstream server: tf_mux_provider=*schema.GRPCProviderServer tf_rpc=GetProviderSchema @caller=github.com/hashicorp/terraform-plugin-mux@v0.12.0/internal/logging/mux.go:19 @module=sdk.mux timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Getting provider schema: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:105 @module=sdk.helper_schema tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_rpc=GetProviderSchema tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @module=sdk.helper_schema tf_mux_provider=*schema.GRPCProviderServer tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 tf_provider_addr=registry.terraform.io/hashicorp/aws tf_resource_type=aws_appmesh_virtual_router tf_rpc=GetProviderSchema timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: tf_resource_type=aws_lambda_invocation @module=sdk.helper_schema tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws tf_rpc=GetProviderSchema @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @module=sdk.helper_schema tf_rpc=GetProviderSchema @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_resource_type=aws_dynamodb_global_table timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 @module=sdk.helper_schema tf_resource_type=aws_emr_studio tf_rpc=GetProviderSchema tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb timestamp=2023-10-09T12:03:41.631-0700
2023-10-09T12:03:41.631-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 @module=sdk.helper_schema tf_mux_provider=*schema.GRPCProviderServer tf_resource_type=aws_imagebuilder_image_recipe tf_provider_addr=registry.terraform.io/hashicorp/aws t  tf_mux_provider=*schema.GRPCProviderServer tf_rpc=GetProviderSchema timestamp=2023-10-09T12:03:41.638-0700
2023-10-09T12:03:41.638-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @module=sdk.helper_schema tf_provider_addr=registry.terraform.io/hashicorp/aws tf_resource_type=aws_ses_identity_notification_topic tf_rpc=GetProviderSchema @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 tf_mux_provider=*schema.GRPCProviderServer tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb timestamp=2023-10-09T12:03:41.638-0700
2023-10-09T12:03:41.638-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_resource_type=aws_datasync_location_s3 tf_rpc=GetProviderSchema @module=sdk.helper_schema @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 timestamp=2023-10-09T12:03:41.638-0700
2023-10-09T12:03:41.638-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: tf_provider_addr=registry.terraform.io/hashicorp/aws tf_rpc=GetProviderSchema tf_resource_type=aws_ec2_traffic_mirror_filter @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 @module=sdk.helper_schema tf_mux_provider=*schema.GRPCProviderServer tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb timestamp=2023-10-09T12:03:41.638-0700
2023-10-09T12:03:41.638-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 @module=sdk.helper_schema tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_resource_type=aws_ec2_transit_gateway_peering_attachment_accepter tf_rpc=GetProviderSchema timestamp=2023-10-09T12:03:41.638-0700
2023-10-09T12:03:41.638-0700 [TRACE] provider.terraform-provider-aws_v5.17.0_x5: Found resource type: @module=sdk.helper_schema tf_req_id=6e512c93-d529-e951-99cf-2c1033e53dbb tf_resource_type=aws_opsworks_instance @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.29.0/helper/schema/grpc_provider.go:122 tf_mux_provider=*schema.GRPCProviderServer tf_provider_addr=registry.terraform.io/hashicorp/aws  
023-10-09T12:03:44.060-0700 [TRACE] (graphTransformerMulti) Completed graph transform *terraform.ProviderTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  ------
2023-10-09T12:03:44.060-0700 [TRACE] (graphTransformerMulti) Executing graph transform *terraform.PruneProviderTransformer
2023-10-09T12:03:44.060-0700 [TRACE] (graphTransformerMulti) Completed graph transform *terraform.PruneProviderTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.graphTransformerMulti with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  ------
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.RemovedModuleTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.RemovedModuleTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.AttachSchemaTransformer
2023-10-09T12:03:44.060-0700 [TRACE] AttachSchemaTransformer: attaching resource schema to aws_instance.myec2
2023-10-09T12:03:44.060-0700 [TRACE] AttachSchemaTransformer: attaching provider config schema to provider["registry.terraform.io/hashicorp/aws"]
2023-10-09T12:03:44.060-0700 [TRACE] AttachSchemaTransformer: attaching resource schema to aws_instance.myec2 (expand)
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.AttachSchemaTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.ModuleExpansionTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.ModuleExpansionTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.ReferenceTransformer
2023-10-09T12:03:44.060-0700 [DEBUG] ReferenceTransformer: "aws_instance.myec2 (expand)" references: []
2023-10-09T12:03:44.060-0700 [DEBUG] ReferenceTransformer: "aws_instance.myec2" references: []
2023-10-09T12:03:44.060-0700 [DEBUG] ReferenceTransformer: "provider[\"registry.terraform.io/hashicorp/aws\"]" references: []
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.ReferenceTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.AttachDependenciesTransformer
2023-10-09T12:03:44.060-0700 [TRACE] AttachDependenciesTransformer: aws_instance.myec2 depends on []
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.AttachDependenciesTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.checkStartTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.checkStartTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.ForcedCBDTransformer
2023-10-09T12:03:44.060-0700 [TRACE] ForcedCBDTransformer: "aws_instance.myec2" (*terraform.NodeApplyableResourceInstance) has no CBD descendent, so skipping
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.ForcedCBDTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.DestroyEdgeTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.DestroyEdgeTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.CBDEdgeTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.CBDEdgeTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.pruneUnusedNodesTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.pruneUnusedNodesTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.TargetsTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.TargetsTransformer (no changes)
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.CloseProviderTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.CloseProviderTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
    aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  ------
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.CloseRootModuleTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.CloseRootModuleTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
    aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  root - *terraform.nodeCloseModule
    provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
  ------
2023-10-09T12:03:44.060-0700 [TRACE] Executing graph transform *terraform.TransitiveReductionTransformer
2023-10-09T12:03:44.060-0700 [TRACE] Completed graph transform *terraform.TransitiveReductionTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
    aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
  root - *terraform.nodeCloseModule
    provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
  ------
2023-10-09T12:03:44.060-0700 [INFO]  backend/local: plan operation completed
2023-10-09T12:03:44.060-0700 [TRACE] LoadSchemas: retrieving schema for provider type "registry.terraform.io/hashicorp/aws"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.myec2 will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-01103fb68b3569475"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
2023-10-09T12:03:44.091-0700 [TRACE] statemgr.Filesystem: removing lock metadata file .terraform.tfstate.lock.info
2023-10-09T12:03:44.091-0700 [TRACE] statemgr.Filesystem: unlocking terraform.tfstate using fcntl flock
mahsan@vmmint:~/Project$ 

****

mahsan@vmmint:~/Project$ export TF_LOG_PATH=/tmp/crash.log

ahsan@vmmint:~/Project$ export TF_LOG_PATH=/tmp/crash.log
mahsan@vmmint:~/Project$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.myec2 will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-01103fb68b3569475"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
mahsan@vmmint:~/Project$ 


rwxrwxrwx 1 mahsan mahsan       0 Sep 28 08:49 org.ksnip.ksnip.singleInstanceServer
srwxrwxr-x 1 mahsan mahsan       0 Oct  1 10:32 atom-45867ec8897e.sock
-rw-rw-r-- 1 mahsan mahsan 2868519 Oct  9 12:08 crash.log
mahsan@vmmint:/tmp$ tail -50 crash.log 
2023-10-09T12:08:24.196-0700 [TRACE] Executing graph transform *terraform.CBDEdgeTransformer
2023-10-09T12:08:24.196-0700 [TRACE] Completed graph transform *terraform.CBDEdgeTransformer (no changes)
2023-10-09T12:08:24.196-0700 [TRACE] Executing graph transform *terraform.pruneUnusedNodesTransformer
2023-10-09T12:08:24.196-0700 [TRACE] Completed graph transform *terraform.pruneUnusedNodesTransformer (no changes)
2023-10-09T12:08:24.196-0700 [TRACE] Executing graph transform *terraform.TargetsTransformer
2023-10-09T12:08:24.196-0700 [TRACE] Completed graph transform *terraform.TargetsTransformer (no changes)
2023-10-09T12:08:24.196-0700 [TRACE] Executing graph transform *terraform.CloseProviderTransformer
2023-10-09T12:08:24.196-0700 [TRACE] Completed graph transform *terraform.CloseProviderTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
    aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  ------
2023-10-09T12:08:24.196-0700 [TRACE] Executing graph transform *terraform.CloseRootModuleTransformer
2023-10-09T12:08:24.196-0700 [TRACE] Completed graph transform *terraform.CloseRootModuleTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
    aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  root - *terraform.nodeCloseModule
    provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
  ------
2023-10-09T12:08:24.196-0700 [TRACE] Executing graph transform *terraform.TransitiveReductionTransformer
2023-10-09T12:08:24.196-0700 [TRACE] Completed graph transform *terraform.TransitiveReductionTransformer with new graph:
  aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
    aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
  aws_instance.myec2 (expand) - *terraform.nodeExpandApplyableResource
    provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] - *terraform.NodeApplyableProvider
  provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
    aws_instance.myec2 - *terraform.NodeApplyableResourceInstance
  root - *terraform.nodeCloseModule
    provider["registry.terraform.io/hashicorp/aws"] (close) - *terraform.graphNodeCloseProvider
  ------
2023-10-09T12:08:24.196-0700 [INFO]  backend/local: plan operation completed
2023-10-09T12:08:24.196-0700 [TRACE] LoadSchemas: retrieving schema for provider type "registry.terraform.io/hashicorp/aws"
2023-10-09T12:08:24.222-0700 [TRACE] statemgr.Filesystem: removing lock metadata file .terraform.tfstate.lock.info
2023-10-09T12:08:24.222-0700 [TRACE] statemgr.Filesystem: unlocking terraform.tfstate using fcntl flock
mahsan@vmmint:/tmp$ 





