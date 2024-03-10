variable "location" {
  type        = string
  description = "The Azure region used for resource deployment"
}

variable "name" {
  type        = string
  description = "The AKS cluster resource name"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the reosurce group in which the K8s cluster will be deployed"
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix to be used for the AKS cluster."
}

variable "aks_sku_tier" {
  type        = string
  description = "The SKU tier that should be used for this Kubernetes Cluster."
  default     = "Free"
}

variable "default_node_pool_vm_size" {
  type        = string
  description = "VM size for the default node pool"
  default     = "Standard_B2ms"
}

variable "default_node_pool_node_count" {
  type        = number
  default     = 1
  description = "The set number of nodes created for the default node pool"
}

variable "default_node_pool_max_pods" {
  type        = number
  default     = 30
  description = "Max pods for the default node pool"
}

variable "acr_id" {
  type        = string
  description = "The ID of the Azure container registry"
}

variable "network_plugin" {
  type    = string
  default = "azure"
}

variable "dns_service_ip" {
  type    = string
  default = "10.0.0.10"
}

variable "service_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "outbound_type" {
  type    = string
  default = "managedNATGateway"
}

variable "ingress_agw_subnet_cidr" {
  type    = string
  default = "10.225.0.0/16"
}