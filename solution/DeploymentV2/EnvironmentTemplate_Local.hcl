inputs = {
  prefix                               = "{prefix}"              # All azure resources will be prefixed with this
  domain                                = "{domain}"              # Used when configuring AAD config for Azure functions 
  tenant_id                             = "{tenant_id}"           # This is the Azure AD tenant ID
  subscription_id                       = "{subscription_id}"     # The azure subscription id to deploy to
  resource_location                     = "Australia East"        # The location of the resources
  resource_group_name                   = "{resource_group_name}"          # The resource group all resources will be deployed to
  owner_tag                             = "Contoso"               # Owner tag value for Azure resources
  environment_tag                       = "dev"                   # This is used on Azure tags as well as all resource names
  ip_address                            = "{ip_address}"          # This is the ip address of the agent/current IP. Used to create firewall exemptions.
  deploy_sentinel                       = {deploy_sentinel}
  deploy_purview                        = {deploy_purview}      
  deploy_synapse                        = {deploy_synapse}
  is_vnet_isolated                      = {is_vnet_isolated}
  publish_web_app                       = {publish_web_app}
  publish_function_app                  = {publish_function_app}
  publish_sample_files                  = {publish_sample_files}
  publish_database                      = {publish_database}
  configure_networking                  = {configure_networking}
  publish_datafactory_pipelines         = {publish_datafactory_pipelines}
  publish_web_app_addcurrentuserasadmin = {publish_web_app_addcurrentuserasadmin}
  deploy_selfhostedsql                  = {deploy_selfhostedsql}
  is_onprem_datafactory_ir_registered   = {is_onprem_datafactory_ir_registered}
}
