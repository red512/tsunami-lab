# provider "helm" {
#   kubernetes {
#     config_context_auth_info = "your-context"
#     config_context_cluster   = "your-cluster"
#     config_path              = "~/.kube/config"
#   }
# }

# resource "helm_release" "argo_artifacts" {
#   name       = "argo-artifacts"
#   repository = "https://helm.min.io/"
#   chart      = "minio"
#   version    = "7.1.0" # Specify the desired Minio chart version

#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "fullnameOverride"
#     value = "argo-artifacts"
#   }
# }
