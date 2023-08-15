from kubernetes import client, config


def get_pod_ips_with_keyword(keyword):
    config.load_kube_config()  # Load kubeconfig from default location

    v1 = client.CoreV1Api()

    namespaces = v1.list_namespace().items

    pod_ips = []

    for ns in namespaces:
        if keyword in ns.metadata.name.lower():
            pods = v1.list_namespaced_pod(namespace=ns.metadata.name).items
            for pod in pods:
                pod_ip = pod.status.pod_ip
                if pod_ip:
                    pod_ips.append(pod_ip)

    return pod_ips


if __name__ == "__main__":
    keyword = "jupyter"
    pod_ips = get_pod_ips_with_keyword(keyword)
    # print("List of IP addresses of pods:")
    for ip in pod_ips:
        print(ip)
