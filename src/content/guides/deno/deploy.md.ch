%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Test your Deno deployment
linkTitle: Test your deployment
@y
title: Test your Deno deployment
linkTitle: Test your deployment
@z

@x
keywords: deploy, kubernetes, deno
description: Learn how to develop locally using Kubernetes
@y
keywords: deploy, kubernetes, deno
description: Learn how to develop locally using Kubernetes
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Complete all the previous sections of this guide, starting with [Containerize a Deno application](containerize.md).
- [Turn on Kubernetes](/manuals//desktop/features/kubernetes.md#install-and-turn-on-kubernetes) in Docker Desktop.
@y
- Complete all the previous sections of this guide, starting with [Containerize a Deno application](containerize.md).
- [Turn on Kubernetes](manuals/desktop/features/kubernetes.md#install-and-turn-on-kubernetes) in Docker Desktop.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This allows you to test and debug your workloads on Kubernetes locally before deploying.
@y
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This allows you to test and debug your workloads on Kubernetes locally before deploying.
@z

@x
## Create a Kubernetes YAML file
@y
## Create a Kubernetes YAML file
@z

@x
In your `deno-docker` directory, create a file named
`docker-kubernetes.yml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Deno application](configure-ci-cd.md).
@y
In your `deno-docker` directory, create a file named
`docker-kubernetes.yml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Deno application](configure-ci-cd.md).
@z

@x
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: docker-deno-demo
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deno-api
  template:
    metadata:
      labels:
        app: deno-api
    spec:
      containers:
       - name: deno-api
         image: DOCKER_USERNAME/REPO_NAME
         imagePullPolicy: Always
---
apiVersion: v1
kind: Service
metadata:
  name: service-entrypoint
  namespace: default
spec:
  type: NodePort
  selector:
    app: deno-api
  ports:
  - port: 8000
    targetPort: 8000
    nodePort: 30001
```
@y
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: docker-deno-demo
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deno-api
  template:
    metadata:
      labels:
        app: deno-api
    spec:
      containers:
       - name: deno-api
         image: DOCKER_USERNAME/REPO_NAME
         imagePullPolicy: Always
---
apiVersion: v1
kind: Service
metadata:
  name: service-entrypoint
  namespace: default
spec:
  type: NodePort
  selector:
    app: deno-api
  ports:
  - port: 8000
    targetPort: 8000
    nodePort: 30001
```
@z

@x
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@y
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@z

@x
 - A Deployment, describing a scalable group of identical pods. In this case,
   you'll get just one replica, or copy of your pod. That pod, which is
   described under `template`, has just one container in it. The
    container is created from the image built by GitHub Actions in [Configure CI/CD for
    your Deno application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 8000 inside the pods it routes to, allowing you to reach your app
   from the network.
@y
 - A Deployment, describing a scalable group of identical pods. In this case,
   you'll get just one replica, or copy of your pod. That pod, which is
   described under `template`, has just one container in it. The
    container is created from the image built by GitHub Actions in [Configure CI/CD for
    your Deno application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 8000 inside the pods it routes to, allowing you to reach your app
   from the network.
@z

@x
To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@y
To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@z

@x
## Deploy and check your application
@y
## Deploy and check your application
@z

@x
1. In a terminal, navigate to `deno-docker` and deploy your application to
   Kubernetes.
@y
1. In a terminal, navigate to `deno-docker` and deploy your application to
   Kubernetes.
@z

@x
   ```console
   $ kubectl apply -f docker-kubernetes.yml
   ```
@y
   ```console
   $ kubectl apply -f docker-kubernetes.yml
   ```
@z

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@y
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@z

@x
   ```text
   deployment.apps/docker-deno-demo created
   service/service-entrypoint created
   ```
@y
   ```text
   deployment.apps/docker-deno-demo created
   service/service-entrypoint created
   ```
@z

@x
2. Make sure everything worked by listing your deployments.
@y
2. Make sure everything worked by listing your deployments.
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
   Your deployment should be listed as follows:
@y
   Your deployment should be listed as follows:
@z

@x
   ```shell
   NAME                 READY   UP-TO-DATE   AVAILABLE    AGE
   docker-deno-demo       1/1     1            1           10s
   ```
@y
   ```shell
   NAME                 READY   UP-TO-DATE   AVAILABLE    AGE
   docker-deno-demo       1/1     1            1           10s
   ```
@z

@x
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services.
@y
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services.
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
   You should get output like the following.
@y
   You should get output like the following.
@z

@x
   ```shell
   NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
   kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP          88m
   service-entrypoint   NodePort    10.105.145.223   <none>        8000:30001/TCP   83s
   ```
@y
   ```shell
   NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
   kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP          88m
   service-entrypoint   NodePort    10.105.145.223   <none>        8000:30001/TCP   83s
   ```
@z

@x
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@y
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@z

@x
3. In a browser, visit the following address. You should see the message `{"Status" : "OK"}`.
@y
3. In a browser, visit the following address. You should see the message `{"Status" : "OK"}`.
@z

@x
   ```console
   http://localhost:30001/
   ```
@y
   ```console
   http://localhost:30001/
   ```
@z

@x
4. Run the following command to tear down your application.
@y
4. Run the following command to tear down your application.
@z

@x
   ```console
   $ kubectl delete -f docker-kubernetes.yml
   ```
@y
   ```console
   $ kubectl delete -f docker-kubernetes.yml
   ```
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to use Docker Desktop to deploy your Deno application to a fully-featured Kubernetes environment on your development machine. 
@y
In this section, you learned how to use Docker Desktop to deploy your Deno application to a fully-featured Kubernetes environment on your development machine. 
@z

@x
Related information:
   - [Kubernetes documentation](https://kubernetes.io/docs/home/)
   - [Deploy on Kubernetes with Docker Desktop](/manuals/desktop/features/kubernetes.md)
   - [Swarm mode overview](/manuals/engine/swarm/_index.md)
@y
Related information:
   - [Kubernetes documentation](https://kubernetes.io/docs/home/)
   - [Deploy on Kubernetes with Docker Desktop](manuals/desktop/features/kubernetes.md)
   - [Swarm mode overview](manuals/engine/swarm/_index.md)
@z
