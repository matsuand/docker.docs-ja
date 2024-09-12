%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リン クへの (no slash) 対応

@x
title: Test your Java deployment
linkTitle: Test your deployment
@y
title: Test your Java deployment
linkTitle: Test your deployment
@z

@x
keywords: deploy, kubernetes, java
description: Learn how to develop locally using Kubernetes
@y
keywords: deploy, kubernetes, java
description: Learn how to develop locally using Kubernetes
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Complete all the previous sections of this guide, starting with [Containerize your app](containerize.md).
- [Turn on Kubernetes](/desktop/kubernetes/#install-and-turn-on-kubernetes) in Docker Desktop.
@y
- Complete all the previous sections of this guide, starting with [Containerize your app](containerize.md).
- [Turn on Kubernetes](__SUBDIR__/desktop/kubernetes/#install-and-turn-on-kubernetes) in Docker Desktop.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your
application to a fully-featured Kubernetes environment on your development
machine. This lets you test and debug your workloads on Kubernetes locally
before deploying.
@y
In this section, you'll learn how to use Docker Desktop to deploy your
application to a fully-featured Kubernetes environment on your development
machine. This lets you test and debug your workloads on Kubernetes locally
before deploying.
@z

@x
## Create a Kubernetes YAML file
@y
## Create a Kubernetes YAML file
@z

@x
In your `spring-petclinic` directory, create a file named
`docker-java-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Java application](configure-ci-cd.md).
@y
In your `spring-petclinic` directory, create a file named
`docker-java-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Java application](configure-ci-cd.md).
@z

@x
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: docker-java-demo
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      service: server
  template:
    metadata:
      labels:
        service: server
    spec:
      containers:
       - name: server-service
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
    service: server
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
  name: docker-java-demo
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      service: server
  template:
    metadata:
      labels:
        service: server
    spec:
      containers:
       - name: server-service
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
    service: server
  ports:
  - port: 8080
    targetPort: 8080
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
    your Java application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 8080 inside the pods it routes to, allowing you to reach your app
   from the network.
@y
 - A Deployment, describing a scalable group of identical pods. In this case,
   you'll get just one replica, or copy of your pod. That pod, which is
   described under `template`, has just one container in it. The
    container is created from the image built by GitHub Actions in [Configure CI/CD for
    your Java application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 8080 inside the pods it routes to, allowing you to reach your app
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
1. In a terminal, navigate to `spring-petclinic` and deploy your application to
   Kubernetes.
@y
1. In a terminal, navigate to `spring-petclinic` and deploy your application to
   Kubernetes.
@z

@x
   ```console
   $ kubectl apply -f docker-java-kubernetes.yaml
   ```
@y
   ```console
   $ kubectl apply -f docker-java-kubernetes.yaml
   ```
@z

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@y
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@z

@x
   ```shell
   deployment.apps/docker-java-demo created
   service/service-entrypoint created
   ```
@y
   ```shell
   deployment.apps/docker-java-demo created
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
   NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
   docker-java-demo     1/1     1            1           15s
   ```
@y
   ```shell
   NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
   docker-java-demo     1/1     1            1           15s
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
   NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   kubernetes           ClusterIP   10.96.0.1       <none>        443/TCP          23h
   service-entrypoint   NodePort    10.99.128.230   <none>        8080:30001/TCP   75s
   ```
@y
   ```shell
   NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   kubernetes           ClusterIP   10.96.0.1       <none>        443/TCP          23h
   service-entrypoint   NodePort    10.99.128.230   <none>        8080:30001/TCP   75s
   ```
@z

@x
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@y
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@z

@x
3. In a terminal, curl the service. Note that a database wasn't deployed in
   this example.
@y
3. In a terminal, curl the service. Note that a database wasn't deployed in
   this example.
@z

@x
   ```console
   $ curl --request GET \
     --url http://localhost:30001/actuator/health \
     --header 'content-type: application/json'
   ```
@y
   ```console
   $ curl --request GET \
     --url http://localhost:30001/actuator/health \
     --header 'content-type: application/json'
   ```
@z

@x
   You should get output like the following.
   ```console
   {"status":"UP","groups":["liveness","readiness"]}
   ```
@y
   You should get output like the following.
   ```console
   {"status":"UP","groups":["liveness","readiness"]}
   ```
@z

@x
4. Run the following command to tear down your application.
@y
4. Run the following command to tear down your application.
@z

@x
   ```console
   $ kubectl delete -f docker-java-kubernetes.yaml
   ```
@y
   ```console
   $ kubectl delete -f docker-java-kubernetes.yaml
   ```
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine.
@y
In this section, you learned how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine.
@z

@x
Related information:
   - [Kubernetes documentation](https://kubernetes.io/docs/home/)
   - [Deploy on Kubernetes with Docker Desktop](/manuals/desktop/kubernetes.md)
   - [Swarm mode overview](/manuals/engine/swarm/_index.md)
@y
Related information:
   - [Kubernetes documentation](https://kubernetes.io/docs/home/)
   - [Deploy on Kubernetes with Docker Desktop](manuals/desktop/kubernetes.md)
   - [Swarm mode overview](manuals/engine/swarm/_index.md)
@z
