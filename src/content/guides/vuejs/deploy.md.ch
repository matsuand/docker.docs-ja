%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Test your Vue.js deployment
linkTitle: Test your deployment
@y
title: Test your Vue.js deployment
linkTitle: Test your deployment
@z

@x
keywords: deploy, kubernetes, vue, vue.js
description: Learn how to deploy locally to test and debug your Kubernetes deployment
@y
keywords: deploy, kubernetes, vue, vue.js
description: Learn how to deploy locally to test and debug your Kubernetes deployment
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, make sure you’ve completed the following:
- Complete all the previous sections of this guide, starting with [Containerize Vue.js application](containerize.md).
- [Enable Kubernetes](/manuals/desktop/use-desktop/kubernetes.md#enable-kubernetes) in Docker Desktop.
@y
Before you begin, make sure you’ve completed the following:
- Complete all the previous sections of this guide, starting with [Containerize Vue.js application](containerize.md).
- [Enable Kubernetes](manuals/desktop/use-desktop/kubernetes.md#enable-kubernetes) in Docker Desktop.
@z

@x
> **New to Kubernetes?**  
> Visit the [Kubernetes basics tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/) to get familiar with how clusters, pods, deployments, and services work.
@y
> **New to Kubernetes?**  
> Visit the [Kubernetes basics tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/) to get familiar with how clusters, pods, deployments, and services work.
@z

@x
---
@y
---
@z

@x
## Overview
@y
## Overview
@z

@x
This section guides you through deploying your containerized Vue.js application locally using [Docker Desktop’s built-in Kubernetes](/desktop/kubernetes/). Running your app in a local Kubernetes cluster closely simulates a real production environment, enabling you to test, validate, and debug your workloads with confidence before promoting them to staging or production.
@y
This section guides you through deploying your containerized Vue.js application locally using [Docker Desktop’s built-in Kubernetes](__SUBDIR__/desktop/kubernetes/). Running your app in a local Kubernetes cluster closely simulates a real production environment, enabling you to test, validate, and debug your workloads with confidence before promoting them to staging or production.
@z

@x
---
@y
---
@z

@x
## Create a Kubernetes YAML file
@y
## Create a Kubernetes YAML file
@z

@x
Follow these steps to define your deployment configuration:
@y
Follow these steps to define your deployment configuration:
@z

@x
1. In the root of your project, create a new file named: vuejs-sample-kubernetes.yaml
@y
1. In the root of your project, create a new file named: vuejs-sample-kubernetes.yaml
@z

@x
2. Open the file in your IDE or preferred text editor.
@y
2. Open the file in your IDE or preferred text editor.
@z

@x
3. Add the following configuration, and be sure to replace `{DOCKER_USERNAME}` and `{DOCKERHUB_PROJECT_NAME}` with your actual Docker Hub username and repository name from the previous [Automate your builds with GitHub Actions](configure-github-actions.md).
@y
3. Add the following configuration, and be sure to replace `{DOCKER_USERNAME}` and `{DOCKERHUB_PROJECT_NAME}` with your actual Docker Hub username and repository name from the previous [Automate your builds with GitHub Actions](configure-github-actions.md).
@z

@x
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: vuejs-sample
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: vuejs-sample
  template:
    metadata:
      labels:
        app: vuejs-sample
    spec:
      containers:
        - name: vuejs-container
          image: {DOCKER_USERNAME}/{DOCKERHUB_PROJECT_NAME}:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          resources:
            limits:
              cpu: "500m"
              memory: "256Mi"
            requests:
              cpu: "250m"
              memory: "128Mi"
---
apiVersion: v1
kind: Service
metadata:
  name: vuejs-sample-service
  namespace: default
spec:
  type: NodePort
  selector:
    app: vuejs-sample
  ports:
    - port: 8080
      targetPort: 8080
      nodePort: 30001
```
@y
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: vuejs-sample
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: vuejs-sample
  template:
    metadata:
      labels:
        app: vuejs-sample
    spec:
      containers:
        - name: vuejs-container
          image: {DOCKER_USERNAME}/{DOCKERHUB_PROJECT_NAME}:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          resources:
            limits:
              cpu: "500m"
              memory: "256Mi"
            requests:
              cpu: "250m"
              memory: "128Mi"
---
apiVersion: v1
kind: Service
metadata:
  name: vuejs-sample-service
  namespace: default
spec:
  type: NodePort
  selector:
    app: vuejs-sample
  ports:
    - port: 8080
      targetPort: 8080
      nodePort: 30001
```
@z

@x
This manifest defines two key Kubernetes resources, separated by `---`:
@y
This manifest defines two key Kubernetes resources, separated by `---`:
@z

@x
- Deployment
  Deploys a single replica of your Vue.js application inside a pod. The pod uses the Docker image built and pushed by your GitHub Actions CI/CD workflow  
  (refer to [Automate your builds with GitHub Actions](configure-github-actions.md)).  
  The container listens on port `8080`, which is typically used by [Nginx](https://nginx.org/en/docs/) to serve your production Vue.js app.
@y
- Deployment
  Deploys a single replica of your Vue.js application inside a pod. The pod uses the Docker image built and pushed by your GitHub Actions CI/CD workflow  
  (refer to [Automate your builds with GitHub Actions](configure-github-actions.md)).  
  The container listens on port `8080`, which is typically used by [Nginx](https://nginx.org/en/docs/) to serve your production Vue.js app.
@z

@x
- Service (NodePort) 
  Exposes the deployed pod to your local machine.  
  It forwards traffic from port `30001` on your host to port `8080` inside the container.  
  This lets you access the application in your browser at [http://localhost:30001](http://localhost:30001).
@y
- Service (NodePort) 
  Exposes the deployed pod to your local machine.  
  It forwards traffic from port `30001` on your host to port `8080` inside the container.  
  This lets you access the application in your browser at [http://localhost:30001](http://localhost:30001).
@z

@x
> [!NOTE]
> To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@y
> [!NOTE]
> To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@z

@x
---
@y
---
@z

@x
## Deploy and check your application
@y
## Deploy and check your application
@z

@x
Follow these steps to deploy your containerized Vue.js app into a local Kubernetes cluster and verify that it’s running correctly.
@y
Follow these steps to deploy your containerized Vue.js app into a local Kubernetes cluster and verify that it’s running correctly.
@z

@x
### Step 1. Apply the Kubernetes configuration
@y
### Step 1. Apply the Kubernetes configuration
@z

@x
In your terminal, navigate to the directory where your `vuejs-sample-kubernetes.yaml` file is located, then deploy the resources using:
@y
In your terminal, navigate to the directory where your `vuejs-sample-kubernetes.yaml` file is located, then deploy the resources using:
@z

@x
```console
  $ kubectl apply -f vuejs-sample-kubernetes.yaml
```
@y
```console
  $ kubectl apply -f vuejs-sample-kubernetes.yaml
```
@z

@x
If everything is configured properly, you’ll see confirmation that both the Deployment and the Service were created:
@y
If everything is configured properly, you’ll see confirmation that both the Deployment and the Service were created:
@z

@x
```shell
  deployment.apps/vuejs-sample created
  service/vuejs-sample-service created
```
@y
```shell
  deployment.apps/vuejs-sample created
  service/vuejs-sample-service created
```
@z

@x
This confirms that both the Deployment and the Service were successfully created and are now running inside your local cluster.
@y
This confirms that both the Deployment and the Service were successfully created and are now running inside your local cluster.
@z

@x
### Step 2. Check the Deployment status
@y
### Step 2. Check the Deployment status
@z

@x
Run the following command to check the status of your deployment:
@y
Run the following command to check the status of your deployment:
@z

@x
```console
  $ kubectl get deployments
```
@y
```console
  $ kubectl get deployments
```
@z

@x
You should see output similar to the following:
@y
You should see output similar to the following:
@z

@x
```shell
  NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
  vuejs-sample         1/1     1            1           1m14s
```
@y
```shell
  NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
  vuejs-sample         1/1     1            1           1m14s
```
@z

@x
This confirms that your pod is up and running with one replica available.
@y
This confirms that your pod is up and running with one replica available.
@z

@x
### Step 3. Verify the Service exposure
@y
### Step 3. Verify the Service exposure
@z

@x
Check if the NodePort service is exposing your app to your local machine:
@y
Check if the NodePort service is exposing your app to your local machine:
@z

@x
```console
$ kubectl get services
```
@y
```console
$ kubectl get services
```
@z

@x
You should see something like:
@y
You should see something like:
@z

@x
```shell
NAME                     TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
vuejs-sample-service     NodePort    10.98.233.59    <none>        8080:30001/TCP   1m
```
@y
```shell
NAME                     TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
vuejs-sample-service     NodePort    10.98.233.59    <none>        8080:30001/TCP   1m
```
@z

@x
This output confirms that your app is available via NodePort on port 30001.
@y
This output confirms that your app is available via NodePort on port 30001.
@z

@x
### Step 4. Access your app in the browser
@y
### Step 4. Access your app in the browser
@z

@x
Open your browser and navigate to [http://localhost:30001](http://localhost:30001).
@y
Open your browser and navigate to [http://localhost:30001](http://localhost:30001).
@z

@x
You should see your production-ready Vue.js Sample application running — served by your local Kubernetes cluster.
@y
You should see your production-ready Vue.js Sample application running — served by your local Kubernetes cluster.
@z

@x
### Step 5. Clean up Kubernetes resources
@y
### Step 5. Clean up Kubernetes resources
@z

@x
Once you're done testing, you can delete the deployment and service using:
@y
Once you're done testing, you can delete the deployment and service using:
@z

@x
```console
  $ kubectl delete -f vuejs-sample-kubernetes.yaml
```
@y
```console
  $ kubectl delete -f vuejs-sample-kubernetes.yaml
```
@z

@x
Expected output:
@y
Expected output:
@z

@x
```shell
  deployment.apps "vuejs-sample" deleted
  service "vuejs-sample-service" deleted
```
@y
```shell
  deployment.apps "vuejs-sample" deleted
  service "vuejs-sample-service" deleted
```
@z

@x
This ensures your cluster stays clean and ready for the next deployment.
@y
This ensures your cluster stays clean and ready for the next deployment.
@z

@x
---
@y
---
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to deploy your Vue.js application to a local Kubernetes cluster using Docker Desktop. This setup allows you to test and debug your containerized app in a production-like environment before deploying it to the cloud.
@y
In this section, you learned how to deploy your Vue.js application to a local Kubernetes cluster using Docker Desktop. This setup allows you to test and debug your containerized app in a production-like environment before deploying it to the cloud.
@z

@x
What you accomplished:
@y
What you accomplished:
@z

@x
- Created a Kubernetes Deployment and NodePort Service for your Vue.js app  
- Used `kubectl apply` to deploy the application locally  
- Verified the app was running and accessible at `http://localhost:30001`  
- Cleaned up your Kubernetes resources after testing
@y
- Created a Kubernetes Deployment and NodePort Service for your Vue.js app  
- Used `kubectl apply` to deploy the application locally  
- Verified the app was running and accessible at `http://localhost:30001`  
- Cleaned up your Kubernetes resources after testing
@z

@x
---
@y
---
@z

@x
## Related resources
@y
## Related resources
@z

@x
Explore official references and best practices to sharpen your Kubernetes deployment workflow:
@y
Explore official references and best practices to sharpen your Kubernetes deployment workflow:
@z

@x
- [Kubernetes documentation](https://kubernetes.io/docs/home/) – Learn about core concepts, workloads, services, and more.  
- [Deploy on Kubernetes with Docker Desktop](/manuals) – Use Docker Desktop’s built-in Kubernetes support for local testing and development.
- [`kubectl` CLI reference](https://kubernetes.io/docs/reference/kubectl/) – Manage Kubernetes clusters from the command line.  
- [Kubernetes Deployment resource](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) – Understand how to manage and scale applications using Deployments.  
- [Kubernetes Service resource](https://kubernetes.io/docs/concepts/services-networking/service/) – Learn how to expose your application to internal and external traffic.
@y
- [Kubernetes documentation](https://kubernetes.io/docs/home/) – Learn about core concepts, workloads, services, and more.  
- [Deploy on Kubernetes with Docker Desktop](__SUBDIR__/manuals) – Use Docker Desktop’s built-in Kubernetes support for local testing and development.
- [`kubectl` CLI reference](https://kubernetes.io/docs/reference/kubectl/) – Manage Kubernetes clusters from the command line.  
- [Kubernetes Deployment resource](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) – Understand how to manage and scale applications using Deployments.  
- [Kubernetes Service resource](https://kubernetes.io/docs/concepts/services-networking/service/) – Learn how to expose your application to internal and external traffic.
@z
