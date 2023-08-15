resource "helm_release" "argo_workflows" {
  name       = "argo"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-workflows"
  namespace  = "argo"
  values     = [file("values/argowf-values.yaml")]
}
