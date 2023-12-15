%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Test your Rust deployment
keywords: deploy, kubernetes, rust
description: Learn how to test your Rust deployment locally using Kubernetes
---
@y
---
title: Test your Rust deployment
keywords: deploy, kubernetes, rust
description: Learn how to test your Rust deployment locally using Kubernetes
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Complete the previous sections of this guide, starting with [Develop your Rust application](develop.md).
- [Turn on Kubernetes](/desktop/kubernetes/#turn-on-kubernetes) in Docker Desktop.
@y
- Complete the previous sections of this guide, starting with [Develop your Rust application](develop.md).
- [Turn on Kubernetes](/desktop/kubernetes/#turn-on-kubernetes) in Docker Desktop.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This lets you to test and debug your workloads on Kubernetes locally before deploying.
@y
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This lets you to test and debug your workloads on Kubernetes locally before deploying.
@z

@x
## Create a Kubernetes YAML file
@y
## Create a Kubernetes YAML file
@z

@x
In your `docker-rust-postgres` directory, create a file named
`docker-rust-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Rust application](configure-ci-cd.md).
@y
In your `docker-rust-postgres` directory, create a file named
`docker-rust-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Rust application](configure-ci-cd.md).
@z

@x
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    service: server
  name: server
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      service: server
  strategy: {}
  template:
    metadata:
      labels:
        service: server
    spec:
      initContainers:
        - name: wait-for-db
          image: busybox:1.28
          command: ['sh', '-c', 'until nc -zv db 5432; do echo "waiting for db"; sleep 2; done;']
      containers:
        - image: DOCKER_USERNAME/REPO_NAME
          name: server
          imagePullPolicy: Always
          ports:
            - containerPort: 8000
              hostPort: 5000
              protocol: TCP
          env:
            - name: ADDRESS
              value: 0.0.0.0:8000
            - name: PG_DBNAME
              value: example
            - name: PG_HOST
              value: db
            - name: PG_PASSWORD
              value: mysecretpassword
            - name: PG_USER
              value: postgres
            - name: RUST_LOG
              value: debug
          resources: {}
      restartPolicy: Always
status: {}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    service: db
  name: db
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      service: db
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        service: db
    spec:
      containers:
        - env:
            - name: POSTGRES_DB
              value: example
            - name: POSTGRES_PASSWORD
              value: mysecretpassword
            - name: POSTGRES_USER
              value: postgres
          image: postgres
          name: db
          ports:
            - containerPort: 5432
              protocol: TCP
          resources: {}
      restartPolicy: Always
status: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    service: server
  name: server
  namespace: default
spec:
  type: NodePort
  ports:
    - name: "5000"
      port: 5000
      targetPort: 8000
      nodePort: 30001
  selector:
    service: server
status:
  loadBalancer: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    service: db
  name: db
  namespace: default
spec:
  ports:
    - name: "5432"
      port: 5432
      targetPort: 5432
  selector:
    service: db
status:
  loadBalancer: {}
```
@y
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    service: server
  name: server
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      service: server
  strategy: {}
  template:
    metadata:
      labels:
        service: server
    spec:
      initContainers:
        - name: wait-for-db
          image: busybox:1.28
          command: ['sh', '-c', 'until nc -zv db 5432; do echo "waiting for db"; sleep 2; done;']
      containers:
        - image: DOCKER_USERNAME/REPO_NAME
          name: server
          imagePullPolicy: Always
          ports:
            - containerPort: 8000
              hostPort: 5000
              protocol: TCP
          env:
            - name: ADDRESS
              value: 0.0.0.0:8000
            - name: PG_DBNAME
              value: example
            - name: PG_HOST
              value: db
            - name: PG_PASSWORD
              value: mysecretpassword
            - name: PG_USER
              value: postgres
            - name: RUST_LOG
              value: debug
          resources: {}
      restartPolicy: Always
status: {}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    service: db
  name: db
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      service: db
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        service: db
    spec:
      containers:
        - env:
            - name: POSTGRES_DB
              value: example
            - name: POSTGRES_PASSWORD
              value: mysecretpassword
            - name: POSTGRES_USER
              value: postgres
          image: postgres
          name: db
          ports:
            - containerPort: 5432
              protocol: TCP
          resources: {}
      restartPolicy: Always
status: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    service: server
  name: server
  namespace: default
spec:
  type: NodePort
  ports:
    - name: "5000"
      port: 5000
      targetPort: 8000
      nodePort: 30001
  selector:
    service: server
status:
  loadBalancer: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    service: db
  name: db
  namespace: default
spec:
  ports:
    - name: "5432"
      port: 5432
      targetPort: 5432
  selector:
    service: db
status:
  loadBalancer: {}
```
@z

@x
In this Kubernetes YAML file, there are four objects, separated by the `---`. In addition to a Service and Deployment for the database, the other two objects are:
@y
In this Kubernetes YAML file, there are four objects, separated by the `---`. In addition to a Service and Deployment for the database, the other two objects are:
@z

@x
 - A Deployment, describing a scalable group of identical pods. In this case,
   you'll get just one replica, or copy of your pod. That pod, which is
   described under `template`, has just one container in it. The container is
    created from the image built by GitHub Actions in [Configure CI/CD for your
    Rust application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 5000 inside the pods it routes to, allowing you to reach your app
   from the network.
@y
 - A Deployment, describing a scalable group of identical pods. In this case,
   you'll get just one replica, or copy of your pod. That pod, which is
   described under `template`, has just one container in it. The container is
    created from the image built by GitHub Actions in [Configure CI/CD for your
    Rust application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 5000 inside the pods it routes to, allowing you to reach your app
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
1. In a terminal, navigate to `docker-rust-postgres` and deploy your application
   to Kubernetes.
@y
1. In a terminal, navigate to `docker-rust-postgres` and deploy your application
   to Kubernetes.
@z

@x
   ```console
   $ kubectl apply -f docker-rust-kubernetes.yaml
   ```
@y
   ```console
   $ kubectl apply -f docker-rust-kubernetes.yaml
   ```
@z

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@y
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@z

@x
   ```shell
   deployment.apps/server created
   deployment.apps/db created
   service/server created
   service/db created
   ```
@y
   ```shell
   deployment.apps/server created
   deployment.apps/db created
   service/server created
   service/db created
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
   db       1/1     1            1           2m21s
   server   1/1     1            1           2m21s
   ```
@y
   ```shell
   NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
   db       1/1     1            1           2m21s
   server   1/1     1            1           2m21s
   ```
@z

@x
   This indicates all of the pods you asked for in your YAML are up and running. Do the same check for your services.
@y
   This indicates all of the pods you asked for in your YAML are up and running. Do the same check for your services.
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
   NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
   db           ClusterIP   10.105.167.81    <none>        5432/TCP         109s
   kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          9d
   server       NodePort    10.101.235.213   <none>        5000:30001/TCP   109s
   ```
@y
   ```shell
   NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
   db           ClusterIP   10.105.167.81    <none>        5432/TCP         109s
   kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          9d
   server       NodePort    10.101.235.213   <none>        5000:30001/TCP   109s
   ```
@z

@x
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@y
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@z

@x
3. In a terminal, curl the service.
@y
3. In a terminal, curl the service.
@z

@x
   ```console
   $ curl http://localhost:30001/users
   [{"id":1,"login":"root"}]
   ```
@y
   ```console
   $ curl http://localhost:30001/users
   [{"id":1,"login":"root"}]
   ```
@z

@x
4. Run the following command to tear down your application.
@y
4. Run the following command to tear down your application.
@z

@x
   ```console
   $ kubectl delete -f docker-rust-kubernetes.yaml
   ```
@y
   ```console
   $ kubectl delete -f docker-rust-kubernetes.yaml
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
   - [Deploy on Kubernetes with Docker Desktop](../../desktop/kubernetes.md)
   - [Swarm mode overview](../../engine/swarm/_index.md)
@y
Related information:
   - [Kubernetes documentation](https://kubernetes.io/docs/home/)
   - [Deploy on Kubernetes with Docker Desktop](../../desktop/kubernetes.md)
   - [Swarm mode overview](../../engine/swarm/_index.md)
@z
