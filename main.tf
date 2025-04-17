resource "azurerm_resource_group" "example" {
  count = var.create_resource_group ? 1 : 0
  # The resource group name is set to the value of the variable
  name     = var.resource_group_name
  location = var.location
}

# Create the AKS cluster
resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks_cluster_name
  location            = var.create_resource_group ? azurerm_resource_group.example[0].location : data.azurerm_resource_group.example[0].location
  resource_group_name = var.create_resource_group ? azurerm_resource_group.example[0].name : data.azurerm_resource_group.example[0].name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size   = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = var.kubernetes_version

  tags = {
    environment = "Terraform"
  }
}