resource "helm_release" "argo_artifacts" {
  name       = "argo-artifacts"
  repository = "https://helm.min.io/"
  chart      = "minio"
  version    = "7.1.0"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "fullnameOverride"
    value = "argo-artifacts"
  }
}
