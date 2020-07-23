terraform {
  backend "remote" {
    organization = "Cloud-Org"

    workspaces {
      name = "Dev-QA"
    }
  }
}

provider "azurerm"{
    version ="~>1.32.0"
    #use_msi =true
    #tenant_id ="79543c3e-560a-4b69-ad1b-7fd4516168e8"
    #subscription_id ="3e6c4ee8-00ee-4546-b190-772547d3a510"
}

resource "azurerm_resource_group" "rg"{
    name = "EntepAch"
    location = "west europe"

    tags = {
        Environment ="Terraform new Environment"
        Team ="DevOps"
    }
}

resource "azurerm_virtual_network" "vnet" {
    name ="testmachine"
    address_space = ["10.0.0.0/16"]
    location ="west europe"
    resource_group_name = azurerm_resource_group.rg.name
}

