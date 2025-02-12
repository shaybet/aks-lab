locals {
  prefix_name = "commit-lab"
}

module "aks" {
  source              = "./modules/aks_cluster"
  resource_group_name = "${local.prefix_name}-aks-rg"
  cluster_name        = "${local.prefix_name}-aks-app"
  node_count          = 2
  node_vm_size        = "Standard_B2s"
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = "${local.prefix_name}-acr-rg"
  acr_name            = replace(local.prefix_name, "-", "acrapp")
  location            = "East US"
  depends_on          = [ module.aks ]
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id          = module.aks.aks_principal_id
  role_definition_name  = "AcrPull"
  scope                 = module.acr.acr_id
  depends_on            = [ module.acr ]
}