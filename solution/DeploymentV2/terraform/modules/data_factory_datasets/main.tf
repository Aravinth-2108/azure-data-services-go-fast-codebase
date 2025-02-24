resource "azurerm_resource_group_template_deployment" "adls_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_AzureBlobFS*.json"):  
    ir => ir 
    #if var.is_azure == true
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }
    "linkedServiceName" = {
      value = var.data_lake_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}

resource "azurerm_resource_group_template_deployment" "blob_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_AzureBlobStorage*.json"):  
    ir => ir 
    # if var.is_azure == true
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.blob_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}

resource "azurerm_resource_group_template_deployment" "azuresql_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_AzureSqlTable*.json"):  
    ir => ir 
    #if var.is_azure == true
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.azure_sql_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}

resource "azurerm_resource_group_template_deployment" "azuressynapse_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_AzureSqlDWTable*.json"):  
    ir => ir 
    #if var.is_azure == true
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.azure_synapse_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}

resource "azurerm_resource_group_template_deployment" "mssql_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_SqlServerTable_NA.json"):  
    ir => ir 
    #if var.is_azure == false
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.mssql_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}

resource "azurerm_resource_group_template_deployment" "mssql_dataset_sqlauth" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_SqlServerTable_NA_SqlAuth.json"):  
    ir => ir 
    #if var.is_azure == false
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.mssql_sqlauth_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}

resource "azurerm_resource_group_template_deployment" "file_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_File*.json"):  
    ir => ir 
    #if var.is_azure == false
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.fileserver_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}


resource "azurerm_resource_group_template_deployment" "rest_dataset" {
  for_each            = {
    for ir in fileset(path.module, "arm/GDS_Rest*.json"):  
    ir => ir 
    #if var.is_azure == false
  }
  name                = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}_${var.name_suffix}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "name" = {
      value = "${replace(replace(each.value, ".json", ""), "arm/", "")}_${var.integration_runtime_short_name}"
    }    
    "linkedServiceName" = {
      value = var.rest_linkedservice_name
    }
    "dataFactoryName" = {
      value = var.data_factory_name
    }
    "integrationRuntimeName" = {
      value = var.integration_runtime_name
    }
  })
  template_content = file("${path.module}/${each.value}")
}