# Project Documentation

## Client
The frontend static page is hosted within an Azure Storage Account as a static website, selected for its robust high availability, rapid response times, and scalable infrastructure provided by Azure Storage. These static files are distributed via an Azure CDN profile, accessible at https://matthewcatania.azureedge.net. Since the application only has static files served through CDN, no server is required. To ensure the latest changes are promptly reflected, the CDN content is purged upon every update to the clientside application. This process is automated through the application's CI/CD pipeline, which triggers whenever a new branch prefixed with "release/" is created and pushed.

## Server
The backend nodejs application will be deployed inside a Kubernetes cluster, this application will connect to an external MongoDB database for persistent NoSQL data storage. An enternal database was used as it removes the management overhead and is more scalable than deploying it in side the cluster. As a best practice, stateful or persistent data should be kept outside of Kubernetes, managing this in Kubernetes can become very complicated. The Kubernetes deployment creates a namespace called "server-namespace" and deploys the server application using a Deployment and a Service within that namespace. The Deployment ensures three replicas of the web application are running, using a container image that is pulled from an Azure Container Registry. The application runs on port 3000 but the service exposes it internally within the cluster on port 80. An Ingress resource is also configured to route external traffic to the web application through an Azure Application Gateway, specifying the backend service as "serverapp" on port 80. The AGW uses the "/livez" path as the load balancing health probe, the response of this API was altered to output the hostname to validate the load balancing. The "livez" API can be visited [here](https://api.matthewcatania.com/livez). A custom domain for the backend server has been estabilished with SSL encryption using Cloudflare, the custom domain is **api.matthewcatania.com**. The requests are proxied through Cloudflare for SSL termination, additional security features, such as DDoS protection, can be enabled using this platform. The application CI/CD pipeline is triggered whenever a new branch with the "release/" prefix is created and pushed.

## Infrastructure
The Terraform state file will be saved in a dedicated blob storage account. To avoid a potential situation where the state file is accidentally deleted, the storage account should have a delete lock configured on it outside of Terraform. With a proper source control process for managing the code and an IaC deployment pipeline that uses approval stages for deploying code, this issue with the state file should never happen, however, it is always better to be safe. An alternative would be to exclude the storage account IaC code from the Terraform configuration and state.

The resources deployed shall follow this naming convention: **{resource type}-{service name}-{environment}-{location}-\[number\]**. The resource type should be an abbreviation for the resoruce type as described in the official microsoft documentation [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations).

Below is a list of all infrastructure resources created:
* Resource group
* AKS Cluster with 1 node pool
* Azure Container Registry
* IAM Role Assignment
* MongoDb Cloud

## Tools
Since any cloud provider can be used, the Microsoft Azure cloud service and stack was used as I already have a test environment available.

Below is a list of all tools used:
* Azure Cloud
* Azure DevOps
* Cloudflare
* Terraform
* Kubernetes
* Docker
* Github
* MongoDb Cloud

## Future improvements
* Separate infrastructure and application code into separate repositories. This will allow proper segregation of permissions between the different development and operations teams.
* Create an IaC deployment pipeline for a safe and consistent infrastructure deployment process. This pipeline should have three stages, the plan, approval, and then the apply stage.
* Use self-hosted CI/CD Linux agents instead of provider hosted to improve security and have faster image builds due to Docker cache.
* Automated tests should be integrated in the application build and release process.
* A rollback mechanism should be added to the pipelines.
* The IaC code implemented has been modularised a bit, however, further modularisation is required to eventually have the resources declared as a JSON object. This would reduce code repetition and improve code organisaiton.
* Create a proper network structure, with a robust edge security configuration, and close public access on all resources. 
* Implement pod and node autoscalign for the backend AKS cluster, this would help scale the system according the the demand.
* The MongoDB connection string is currently hardcoded in the pipeline, this is not safe as the secret will be present in the git repository. This connection string should be stored in a key vault and pulled dynamically when the pipeline runs. The secret can also be pulled from a key vault dynamically inside the cluster instead of it being added by the pipeline.