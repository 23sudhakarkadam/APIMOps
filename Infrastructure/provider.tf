terraform {
    required_providers {
        azurerm = {
        source  = "azurerm"
        version = "4.58.0"
        }
  }

}
provider "azurerm" {
    subscription_id                 = "28742713-55c3-4ad5-be9f-26540262491d"
    
    features {}
}