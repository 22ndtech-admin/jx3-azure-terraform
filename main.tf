module "jx" {
  source                            = "github.com/jenkins-x/terraform-azurerm-jx"
  version_stream_url                = "https://github.com/jenkins-x/jxr-versions.git"
  is_jx2                            = false
  jx_git_url                        = local.jx_git_url
  jx_bot_username                   = local.jx_bot_username
  jx_bot_token                      = var.jx_bot_token
  cluster_name                      = var.cluster_name
  cluster_version                   = var.cluster_version
  location                          = var.location
  network_resource_group_name       = var.network_resource_group_name
  cluster_resource_group_name       = var.cluster_resource_group_name
  cluster_node_resource_group_name  = var.cluster_node_resource_group_name
  dns_resource_group_name           = var.dns_resource_group_name
}

output "connect" {
  description = "Connect to cluster"
  value       = module.jx.connect
}

output "jx_requirements" {
  description = "jx-requirements file"
  value       = module.jx.jx_requirements
}

output "next_install" {
  description = "Follow instructions to enable Jenkins X install via GitOps"
  value       = "https://jenkins-x.io/docs/v3/guides/operator"
}

# store tfstate in an azure blob
terraform {
  backend "azurerm" {
    resource_group_name  = "ndtech-terraform-resource-group"
    storage_account_name = "ndtechtfstorageact"
    container_name       = "ndtechtfstorcont"
    key                  = "ndtech-k8s-azure.terraform.tfstate"
  }
}
