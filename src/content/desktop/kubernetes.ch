%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: See how you can deploy to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration, Docker Desktop
title: Deploy on Kubernetes with Docker Desktop
aliases:
- /docker-for-windows/kubernetes/
- /docker-for-mac/kubernetes/
---
@y
---
description: See how you can deploy to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration, Docker Desktop
title: Deploy on Kubernetes with Docker Desktop
aliases:
- /docker-for-windows/kubernetes/
- /docker-for-mac/kubernetes/
---
@z

@x
Docker Desktop includes a standalone Kubernetes server and client,
as well as Docker CLI integration that runs on your machine. 
@y
Docker Desktop includes a standalone Kubernetes server and client,
as well as Docker CLI integration that runs on your machine. 
@z

@x
The Kubernetes server runs locally within your Docker instance, is not configurable, and is a single-node cluster. It runs within a Docker container on your local system, and
is only for local testing. 
@y
The Kubernetes server runs locally within your Docker instance, is not configurable, and is a single-node cluster. It runs within a Docker container on your local system, and
is only for local testing. 
@z

@x
Turning on Kubernetes allows you to deploy
your workloads in parallel, on Kubernetes, Swarm, and as standalone containers. Turning on or off the Kubernetes server does not affect your other
workloads.
@y
Turning on Kubernetes allows you to deploy
your workloads in parallel, on Kubernetes, Swarm, and as standalone containers. Turning on or off the Kubernetes server does not affect your other
workloads.
@z

@x
## Turn on Kubernetes
@y
## Turn on Kubernetes
@z

@x
To turn on Kubernetes in Docker Desktop:
1. From the Docker Dashboard, select the **Settings**.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, select the checkbox.
4. Select **Apply & Restart** to save the settings and then select **Install** to confirm. This instantiates images required to run the Kubernetes server as containers, and installs the `/usr/local/bin/kubectl` command on your machine.
@y
To turn on Kubernetes in Docker Desktop:
1. From the Docker Dashboard, select the **Settings**.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, select the checkbox.
4. Select **Apply & Restart** to save the settings and then select **Install** to confirm. This instantiates images required to run the Kubernetes server as containers, and installs the `/usr/local/bin/kubectl` command on your machine.
@z

@x
By default, Kubernetes containers are hidden from commands like `docker ps`, because managing them manually is not supported. Most users do not need this option. To see these internal containers, select **Show system containers (advanced)**. 
@y
By default, Kubernetes containers are hidden from commands like `docker ps`, because managing them manually is not supported. Most users do not need this option. To see these internal containers, select **Show system containers (advanced)**. 
@z

@x
When Kubernetes is turned on and running, an additional status bar in the Docker Dashboard footer and Docker menu displays. 
@y
When Kubernetes is turned on and running, an additional status bar in the Docker Dashboard footer and Docker menu displays. 
@z

@x
> Note
>
> Docker Desktop does not upgrade your Kubernetes cluster automatically after a new update. To upgrade your Kubernetes cluster to the latest version, select **Reset Kubernetes Cluster**.
@y
> Note
>
> Docker Desktop does not upgrade your Kubernetes cluster automatically after a new update. To upgrade your Kubernetes cluster to the latest version, select **Reset Kubernetes Cluster**.
@z

@x
## Use the kubectl command
@y
## Use the kubectl command
@z

@x
Kubernetes integration provides the Kubernetes CLI command
at `/usr/local/bin/kubectl` on Mac and at `C:\Program Files\Docker\Docker\Resources\bin\kubectl.exe` on Windows. This location may not be in your shell's `PATH`
variable, so you may need to type the full path of the command or add it to
the `PATH`.
@y
Kubernetes integration provides the Kubernetes CLI command
at `/usr/local/bin/kubectl` on Mac and at `C:\Program Files\Docker\Docker\Resources\bin\kubectl.exe` on Windows. This location may not be in your shell's `PATH`
variable, so you may need to type the full path of the command or add it to
the `PATH`.
@z

@x
The kubectl binary is not automatically packaged with Docker Desktop for Linux. To install the kubectl command for Linux, see [Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/). It should be installed at `/usr/local/bin/kubectl`.
@y
The kubectl binary is not automatically packaged with Docker Desktop for Linux. To install the kubectl command for Linux, see [Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/). It should be installed at `/usr/local/bin/kubectl`.
@z

@x
If you have already installed `kubectl` and it is
pointing to some other environment, such as `minikube` or a GKE cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@y
If you have already installed `kubectl` and it is
pointing to some other environment, such as `minikube` or a GKE cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@z

@x
```console
$ kubectl config get-contexts
$ kubectl config use-context docker-desktop
```
@y
```console
$ kubectl config get-contexts
$ kubectl config use-context docker-desktop
```
@z

@x
> **Tip**
>
> Run the `kubectl` command in a CMD or PowerShell terminal, otherwise `kubectl config get-contexts` may return an empty result. 
>
> If you are using a different terminal and this happens, you can try setting the `kubeconfig` environment variable to the location of the `.kube/config` file. 
{ .tip }
@y
> **Tip**
>
> Run the `kubectl` command in a CMD or PowerShell terminal, otherwise `kubectl config get-contexts` may return an empty result. 
>
> If you are using a different terminal and this happens, you can try setting the `kubeconfig` environment variable to the location of the `.kube/config` file. 
{ .tip }
@z

@x
If you installed `kubectl` using Homebrew, or by some other method, and
experience conflicts, remove `/usr/local/bin/kubectl`.
@y
If you installed `kubectl` using Homebrew, or by some other method, and
experience conflicts, remove `/usr/local/bin/kubectl`.
@z

@x
You can test the command by listing the available nodes:
@y
You can test the command by listing the available nodes:
@z

@x
```console
$ kubectl get nodes
@y
```console
$ kubectl get nodes
@z

@x
NAME                 STATUS    ROLES     AGE       VERSION
docker-desktop       Ready     master    3h        v1.19.7
```
@y
NAME                 STATUS    ROLES     AGE       VERSION
docker-desktop       Ready     master    3h        v1.19.7
```
@z

@x
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@y
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@z

@x
## Turn off Kubernetes
@y
## Turn off Kubernetes
@z

@x
To turn off Kubernetes in Docker Desktop:
1. From the Docker Dashboard, select the **Settings** icon.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, clear the checkbox
4. Select **Apply & Restart** to save the settings.This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@y
To turn off Kubernetes in Docker Desktop:
1. From the Docker Dashboard, select the **Settings** icon.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, clear the checkbox
4. Select **Apply & Restart** to save the settings.This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@z
