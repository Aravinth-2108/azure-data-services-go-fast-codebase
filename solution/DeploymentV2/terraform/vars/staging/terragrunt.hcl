remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    # You need to update the resource group and storage account here. 
    # You should have created these with the Prepare.ps1 script.
    resource_group_name  = "dlzdev05"
    storage_account_name = "dlzdev05state"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}

# These inputs are provided to the terraform variables when deploying the environment
# If you are deploying using pipelines, these can be overridden from environment variables
# using TF_VAR_variablename
inputs = {
  prefix                                = "ark"              # All azure resources will be prefixed with this
  domain                                = "arkahna.io"              # Used when configuring AAD config for Azure functions 
  tenant_id                             = "0fee3d31-b963-4a1c-8f4a-ca367205aa65"           # This is the Azure AD tenant ID
  subscription_id                       = "8cc117a4-d03d-4a14-a905-3b6dd744829c"     # The azure subscription id to deploy to
  resource_location                     = "Australia East"        # The location of the resources
  resource_group_name                   = "dlzdev05"          # The resource group all resources will be deployed to
  owner_tag                             = "Arkahna"               # Owner tag value for Azure resources
  environment_tag                       = "stg"                   # This is used on Azure tags as well as all resource names
  ip_address                            = "60.227.47.61"          # This is the ip address of the agent/current IP. Used to create firewall exemptions.
  deploy_sentinel                       = false
  deploy_purview                        = false  
  deploy_synapse                        = true
  is_vnet_isolated                      = false
  publish_web_app                       = true
  publish_function_app                  = true
  publish_sample_files                  = true
  publish_database                      = true
  configure_networking                  = false
  publish_datafactory_pipelines         = true
  publish_web_app_addcurrentuserasadmin = true
  deploy_synapse_sqlpool                = false
  deploy_selfhostedsql                  = false
  is_onprem_datafactory_ir_registered   = false
} 
