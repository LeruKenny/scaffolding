#-------------------------------------------------
# Cluster Proportional Autoscaler Helm Add-on
#-------------------------------------------------
module "helm_addon" {
  source = "../helm-addon"

  manage_via_gitops = var.manage_via_gitops
  helm_config       = local.helm_config
  set_values        = local.set_values
  addon_context     = var.addon_context
}
