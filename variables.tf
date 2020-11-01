variable "jx_bot_token" {
  description = "Bot token used to interact with the Jenkins X cluster git repository"
  type        = string
}

variable "cluster_name" {
  default = "ndtech-k8s-cluster"
}

variable "cluster_version"{
  default = "1.19.3"
}

variable "location"{
  default = "westcentralus"
}

variable "network_resource_group_name"{
  default = "ndtech-k8s-network-resource-group"
}

variable "cluster_resource_group_name"{
  default = "ndtech-k8s-cluster-resource-group"
}

variable "cluster_node_resource_group_name"{
  default = "ndtech-k8s-cluster-nrg"
}

variable "dns_resource_group_name"{
  default = "ndtech-k8s-dns-resource-group"
}

variable "node_count"{
  default = "2"
}

