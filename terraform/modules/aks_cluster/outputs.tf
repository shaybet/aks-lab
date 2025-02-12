output "cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "resource_group_name" {
  description = "The name of the Azure Resource Group"
  value       = azurerm_resource_group.aks_rg.name
}

output "aks_fqdn" {
  description = "The fully qualified domain name (FQDN) of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.fqdn
}

output "aks_cluster_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_api_server_url" {
  description = "The API server URL for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].host
}

output "aks_principal_id" {
  description = "The system-assigned managed identity principal ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
}