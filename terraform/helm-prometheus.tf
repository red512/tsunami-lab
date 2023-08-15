resource "helm_release" "loki" {
  name       = "loki-stack"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  # version          = "2.5.0"      # Replace with the desired version
  namespace        = "monitoring" # Change to your desired namespace
  create_namespace = true
  values = [
    file("values/loki-values.yaml")
  ]

  set {
    name  = "promtail.enabled"
    value = "true"
  }
}

resource "helm_release" "prometheus" {
  name             = "prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "48.1.1"
  namespace        = "monitoring"
  create_namespace = true

  values = [
    file("values/prometheus-values.yaml")
  ]
}
