### TSUNAMI LAB


### Prerequisites

Before getting started, make sure you have the following prerequisites set up:

1. **kubectl**: Install `kubectl`, the command-line tool for interacting with Kubernetes cluster. 

2. **Helm**: Install Helm, a package manager for Kubernetes, to manage the deployment of Loki, Grafana, ArgoCD, and other components.

3. **Terraform**: Install Terraform, an infrastructure as code tool, for provisioning and managing infrastructure. 

### Repository Structure


TSUNAMI LAB  
https://github.com/red512/tsunami-lab

```
.
├── argocd
├── argowf
├── ipgrabber
├── terraform
└── tsunami-security-scanner-master
```


TSUNAMI LABS GITOPS (the infra repo). 
https://github.com/red512/tsunami-lab-gitops/tree/main/gitops/environments/staging
```
.
└── gitops
    └── environments
        └── staging
            ├── apps
            ├── jupyter-1
            ├── jupyter-2
            └── nginx
```

![Blank diagram](https://github.com/red512/tsunami-lab/assets/59205478/3a8d4a78-c8e4-48ed-97d0-0f221b134643)


### Running Scans with Argo Workflows

For running the scans, Argo Workflows are utilized. There are two options for running the Tsunami scanner workflows: on-demand and scheduled using a cron job. The workflow files are stored in the `argowf` folder.

### Running Workflows

You can choose to run the workflows using `kubectl` or the `argo` CLI. Here are some examples:
Argo CLI installation instructions: https://github.com/argoproj/argo-workflows/releases/tag/v3.3.9

```
# Create a cron workflow
argo cron create wf-tsunami.yaml

# Submit a workflow using argo
argo -n argo submit wf-tsunami.yaml

# Submit a workflow with parameters
argo -n argo submit wf-tsunami-single-2.yaml --parameter-file parameters.yaml

# Create a workflow using kubectl
kubectl -n argo create wf-hello-world.yaml
```
### Workflows and CronWorkflow can be found find in the "argowf" directory

CronWorkflow

![image](https://github.com/red512/tsunami-lab/assets/59205478/295658b1-c3a7-4fec-93b0-d8e38738d62c)

Workflow

![image](https://github.com/red512/tsunami-lab/assets/59205478/b00db2fe-5b86-4ff4-8b5e-13d7445c3d4f)


### k8s cluster 
Here I used EKS cluster that was created in Terraform but you can use any cloud provider or work with Minikube.

###  Deployments
The deployments for tests were done with ArgoCD.
You can use any application you want to scan and choose any other to deploy. 
In our case to see the vulnerabilities we use Jupyter Notebook.
### Github actions 
Github action was used to build and push the Tsunami Security scanner to the dockerhub. In the future release, It's planned to add the ability to trigger argo workflows from the GitHub action.
### Monitoring 
The logs from the scans are shipped by Promtail to Loki in order to have a suitable view and the ability to create notifications about important scan results. 
### Notes about installation:
The installation of Loki, grafana, argocd and argo workflows are made from tf using helm provider.
### Optional:
Also, you can install Minio for the artifacts storage or instead, you can add s3 or any other storage. You can find the details here https://argoproj.github.io/argo-workflows/configure-artifact-repository/


