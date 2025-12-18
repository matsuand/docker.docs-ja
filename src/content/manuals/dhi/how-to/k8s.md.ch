%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use a Docker Hardened Image in Kubernetes
linktitle: Use an image in Kubernetes
description: Learn how to use Docker Hardened Images in Kubernetes deployments.
keywords: use hardened image, kubernetes, k8s
@y
title: Use a Docker Hardened Image in Kubernetes
linktitle: Use an image in Kubernetes
description: Learn how to use Docker Hardened Images in Kubernetes deployments.
keywords: use hardened image, kubernetes, k8s
@z

@x
## Authentication
@y
## Authentication
@z

@x
To be able to use Docker Hardened Images in Kubernetes, you need to create a
Kubernetes secret for pulling images from your mirror or internal registry.
@y
To be able to use Docker Hardened Images in Kubernetes, you need to create a
Kubernetes secret for pulling images from your mirror or internal registry.
@z

@x
> [!NOTE]
>
> You need to create this secret in each Kubernetes namespace that uses a DHI.
@y
> [!NOTE]
>
> You need to create this secret in each Kubernetes namespace that uses a DHI.
@z

@x
Create a secret using a Personal Access Token (PAT). Ensure the token has at
least read-only access to public repositories. For Docker Hardened Images
replace `<registry server>` with `dhi.io`. If you are using a mirrored
repository, replace it with your mirror's registry server, such as `docker.io`
for Docker Hub.
@y
Create a secret using a Personal Access Token (PAT). Ensure the token has at
least read-only access to public repositories. For Docker Hardened Images
replace `<registry server>` with `dhi.io`. If you are using a mirrored
repository, replace it with your mirror's registry server, such as `docker.io`
for Docker Hub.
@z

@x
```console
$ kubectl create -n <kubernetes namespace> secret docker-registry <secret name> --docker-server=<registry server> \
        --docker-username=<registry user> --docker-password=<access token> \
        --docker-email=<registry email>
```
@y
```console
$ kubectl create -n <kubernetes namespace> secret docker-registry <secret name> --docker-server=<registry server> \
        --docker-username=<registry user> --docker-password=<access token> \
        --docker-email=<registry email>
```
@z

@x
To tests the secrets use the following command:
@y
To tests the secrets use the following command:
@z

@x
```console
kubectl apply --wait -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: dhi-test
  namespace: <kubernetes namespace>
spec:
  containers:
  - name: test
    image: bash:5
    command: [ "sh", "-c", "echo 'Hello from DHI in Kubernetes!'" ]
  imagePullSecrets:
  - name: <secret name>
EOF
```
@y
```console
kubectl apply --wait -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: dhi-test
  namespace: <kubernetes namespace>
spec:
  containers:
  - name: test
    image: bash:5
    command: [ "sh", "-c", "echo 'Hello from DHI in Kubernetes!'" ]
  imagePullSecrets:
  - name: <secret name>
EOF
```
@z

@x
Get the status of the pod by running:
@y
Get the status of the pod by running:
@z

@x
```console
$ kubectl get -n <kubernetes namespace> pods/dhi-test
```
@y
```console
$ kubectl get -n <kubernetes namespace> pods/dhi-test
```
@z

@x
The command should return the following result:
@y
The command should return the following result:
@z

@x
```console
NAME       READY   STATUS      RESTARTS     AGE
dhi-test   0/1     Completed   ...          ...
```
@y
```console
NAME       READY   STATUS      RESTARTS     AGE
dhi-test   0/1     Completed   ...          ...
```
@z

@x
If instead, the result is the following, there might be an issue with your secret.
@y
If instead, the result is the following, there might be an issue with your secret.
@z

@x
```console
NAME       READY   STATUS         RESTARTS   AGE
dhi-test   0/1     ErrImagePull   0          ...
```
@y
```console
NAME       READY   STATUS         RESTARTS   AGE
dhi-test   0/1     ErrImagePull   0          ...
```
@z

@x
Verify the output of the pod by running, which should return `Hello from DHI in Kubernetes!`
@y
Verify the output of the pod by running, which should return `Hello from DHI in Kubernetes!`
@z

@x
```console
kubectl logs -n <kubernetes namespace> pods/dhi-test
```
@y
```console
kubectl logs -n <kubernetes namespace> pods/dhi-test
```
@z

@x
After a successful test, the test pod can be deleted with the following command:
@y
After a successful test, the test pod can be deleted with the following command:
@z

@x
```console
$ kubectl delete -n <kubernetes namespace> pods/dhi-test
```
@y
```console
$ kubectl delete -n <kubernetes namespace> pods/dhi-test
```
@z
