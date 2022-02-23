resource "azurerm_container_registry" "acr" {
  name                = "tiagomatanaunyleya"
  resource_group_name = "DevOps"
  location            = "brazilsouth"
  sku                 = "Basic"
  admin_enabled       = false
 
}