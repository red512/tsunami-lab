from kubernetes import client, config


def get_pod_ips_with_keyword(keyword):
    config.load_kube_config()  # Load kubeconfig from default location

    v1 = client.CoreV1Api()

    namespaces = v1.list_namespace().items

    for ns in namespaces:
        if keyword in ns.metadata.name.lower():
            print(f"Pod IPs in namespace {ns.metadata.name}:")
            pods = v1.list_namespaced_pod(namespace=ns.metadata.name).items
            for pod in pods:
                pod_name = pod.metadata.name
                pod_ip = pod.status.pod_ip
                print(f"  {pod_name}: {pod_ip}")


if __name__ == "__main__":
    keyword = "j"
    get_pod_ips_with_keyword(keyword)
