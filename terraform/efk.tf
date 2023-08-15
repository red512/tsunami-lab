

# resource "helm_release" "elasticsearch" {
#   name       = "elasticsearch"
#   repository = "https://charts.helm.sh/stable"
#   chart      = "elasticsearch"
#   #   version          = "7.14.0"  # Example version that was available as of my knowledge cutoff
#   namespace        = "elastic" # Specify the desired namespace
#   create_namespace = true


#   set {
#     name  = "replicas"
#     value = "1"
#   }
# }



# # resource "helm_release" "elasticsearch" {
# #   name             = "elasticsearch"
# #   repository       = "https://helm.elastic.co"
# #   chart            = "elasticsearch"
# #   create_namespace = true

# #   namespace = "efk-stack"
# # }

# # resource "helm_release" "fluentd" {
# #   name       = "fluentd"
# #   repository = "https://charts.helm.sh/stable"
# #   chart      = "fluentd-kubernetes"
# #   namespace  = "efk-stack"
# #   values = [
# #     file("values/efk-values.yaml"),
# #   ]

# #   depends_on = [helm_release.elasticsearch]
# # }

# # resource "helm_release" "kibana" {
# #   name       = "kibana"
# #   repository = "https://helm.elastic.co"
# #   chart      = "kibana"
# #   namespace  = "efk-stack"

# #   depends_on = [helm_release.elasticsearch]
# # }


# # resource "helm_release" "efk" {
# #   name       = "efk"
# #   repository = "https://helm.elastic.co"
# #   chart      = "elasticsearch"
# #   namespace  = "logging"
# #   version    = "7.14.0"

# #   values = [
# #     file("values/efk-values.yaml"),
# #   ]
# # }

