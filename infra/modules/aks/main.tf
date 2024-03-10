resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  node_resource_group       = "${var.resource_group_name}-managed"
  location                  = var.location
  dns_prefix                = var.dns_prefix
  sku_tier                  = var.aks_sku_tier
  automatic_channel_upgrade = "patch"

  default_node_pool {
    name                        = "default"
    node_count                  = var.default_node_pool_node_count
    vm_size                     = var.default_node_pool_vm_size
    os_sku                      = "Ubuntu"
    max_pods                    = var.default_node_pool_max_pods
    temporary_name_for_rotation = "defaultemp"
  }

  network_profile {
    network_plugin = var.network_plugin
    dns_service_ip = var.dns_service_ip
    service_cidr   = var.service_cidr
    outbound_type  = var.outbound_type
  }

  ingress_application_gateway {
    gateway_name = "${var.name}-agw"
    subnet_cidr  = var.ingress_agw_subnet_cidr
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "registry_permissions" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}