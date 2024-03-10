# Project Documentation

## Client

## Server
The backend nodejs application will be deployed inside a Kubernetes cluster, this application will connect to an Azure CosmosDb database for persistent NoSQL data storage. The application inside the cluster will be deployed with 3 replicas behind an orchestrated Azure applicaiton gateway that acts as an ingress controller.

## Infrastructure:
* Resource group
* AKS Cluster with 1 node pool
* Azure Container Registry
* IAM Role Assignment
* Azure CosmosDb database

The Terraform state file will be saved in a dedicated blob storage account. To avoid a potential situation where the state file is accidentally deleted, the storage account should have a delete lock configured on it outside of Terraform. With a proper source control process for managing the code and an IaC deployment pipeline that uses approval stages for deploying code, this issue with the state file should never happen, however, it is always better to be safe.

## Tools used:
* Azure Cloud
* Azure DevOps
* Terraform
* Kubernetes
* Docker
* Github