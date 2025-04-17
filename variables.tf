variable "subscription_id" {
  description = "The subscription ID to use for the Azure provider."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 3
}

variable "node_vm_size" {
  description = "The size of the VM for the AKS nodes."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  type        = string
  default     = "1.31"
}

variable "create_resource_group" {
  description = "Whether to create a new resource group."
  type        = bool
  default     = true
}