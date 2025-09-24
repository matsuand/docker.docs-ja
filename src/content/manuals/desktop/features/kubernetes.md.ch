%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: See how you can deploy to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration, Docker Desktop
title: Deploy on Kubernetes with Docker Desktop
@y
description: See how you can deploy to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration, Docker Desktop
title: Docker Desktop を使った Kubernetes へのデプロイ
@z

@x
Docker Desktop includes a standalone Kubernetes server and client, as well as Docker CLI integration, enabling local Kubernetes development and testing directly on your machine. 
@y
Docker Desktop には手元のマシン上で動作する Docker CLI 統合環境に加えて、Kubernetes のスタンドアロンサーバーとクライアントが含まれます。
これによりローカルでの Kubernetes 開発やテストを直接、手元のマシンで実現できます。
@z

@x
The Kubernetes server runs as a single or multi-node cluster, within Docker container(s). This lightweight setup helps you explore Kubernetes features, test workloads, and work with container orchestration in parallel with other Docker functionalities.
@y
Kubernetes サーバーは Docker インスタンス内において単一あるいは複数ノードクラスターとしてローカルに実行されます。
セットアップが簡単であるため、Kuberntes 機能の確認、ワークロードのテスト、Docker の他機能を同時に利用したコンテナーオーケストレーション作業を容易に進めていくことができます。
@z

@x
Kubernetes on Docker Desktop runs alongside other workloads, including Swarm services and standalone containers.
@y
Kubernetes on Docker Desktop runs alongside other workloads, including Swarm services and standalone containers.
@z

@x
## What happens when I enable Kubernetes in Docker Desktop?
@y
## What happens when I enable Kubernetes in Docker Desktop?
@z

@x
The following actions are triggered in the Docker Desktop backend and VM:
@y
The following actions are triggered in the Docker Desktop backend and VM:
@z

@x
- Generation of certificates and cluster configuration
- Download and installation of Kubernetes internal components
- Cluster bootup
- Installation of additional controllers for networking and storage
@y
- Generation of certificates and cluster configuration
- Download and installation of Kubernetes internal components
- Cluster bootup
- Installation of additional controllers for networking and storage
@z

@x
Turning the Kubernetes server on or off in Docker Desktop does not affect your other workloads.
@y
Turning the Kubernetes server on or off in Docker Desktop does not affect your other workloads.
@z

@x
## Install and turn on Kubernetes
@y
## Install and turn on Kubernetes
@z

@x
1. Open the Docker Desktop Dashboard and navigate to **Settings**.
2. Select the **Kubernetes** tab.
3. Toggle on **Enable Kubernetes**.
4. Choose your [cluster provisioning method](#cluster-provisioning-method).
5. Select **Apply** to save the settings.
@y
1. Open the Docker Desktop Dashboard and navigate to **Settings**.
2. Select the **Kubernetes** tab.
3. Toggle on **Enable Kubernetes**.
4. Choose your [cluster provisioning method](#cluster-provisioning-method).
5. Select **Apply** to save the settings.
@z

@x
   > [!NOTE]
   >
   > Docker Desktop for Linux does not include `kubectl` by default. You can install it separately by following the [Kubernetes installation guide](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/). Ensure the `kubectl` binary is installed at `/usr/local/bin/kubectl`.
@y
   > [!NOTE]
   >
   > Docker Desktop for Linux does not include `kubectl` by default. You can install it separately by following the [Kubernetes installation guide](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/). Ensure the `kubectl` binary is installed at `/usr/local/bin/kubectl`.
@z

@x
When Kubernetes is enabled, its status is displayed in the Docker Desktop Dashboard footer and the Docker menu. 
@y
When Kubernetes is enabled, its status is displayed in the Docker Desktop Dashboard footer and the Docker menu. 
@z

@x
You can check which version of Kubernetes you're on with:
@y
You can check which version of Kubernetes you're on with:
@z

% snip command...

@x
### Cluster provisioning method
@y
### Cluster provisioning method
@z

@x
Docker Desktop Kubernetes can be provisioned with either the `kubeadm` or `kind`
provisioners.
@y
Docker Desktop Kubernetes can be provisioned with either the `kubeadm` or `kind`
provisioners.
@z

@x
`kubeadm` is the older provisioner. It supports a single-node cluster, you can't select the kubernetes
version, it's slower to provision than `kind`, and it's not supported by [Enhanced Container Isolation](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/index.md) (ECI),
meaning that if ECI is enabled the cluster works but it's not protected by ECI.
@y
`kubeadm` is the older provisioner. It supports a single-node cluster, you can't select the kubernetes
version, it's slower to provision than `kind`, and it's not supported by [Enhanced Container Isolation](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/index.md) (ECI),
meaning that if ECI is enabled the cluster works but it's not protected by ECI.
@z

@x
`kind` is the newer provisioner, and it's available if you are signed in and are
using Docker Desktop version 4.38 or later. It supports multi-node clusters (for
a more realistic Kubernetes setup), you can choose the Kubernetes version, it's
faster to provision than `kubeadm`, and it's supported by ECI (i.e., when ECI is
enabled, the Kubernetes cluster runs in unprivileged Docker containers, thus
making it more secure). Note however that `kind` requires that Docker Desktop be
configured to use the [containerd image store](containerd.md) (the default image
store in Docker Desktop 4.34 and later).
@y
`kind` is the newer provisioner, and it's available if you are signed in and are
using Docker Desktop version 4.38 or later. It supports multi-node clusters (for
a more realistic Kubernetes setup), you can choose the Kubernetes version, it's
faster to provision than `kubeadm`, and it's supported by ECI (i.e., when ECI is
enabled, the Kubernetes cluster runs in unprivileged Docker containers, thus
making it more secure). Note however that `kind` requires that Docker Desktop be
configured to use the [containerd image store](containerd.md) (the default image
store in Docker Desktop 4.34 and later).
@z

@x
The following table summarizes this comparison.
@y
The following table summarizes this comparison.
@z

@x
| Feature | `kubeadm` | `kind` |
| :------ | :-----: | :--: |
| Availability | Docker Desktop 4.0+ | Docker Desktop 4.38+ (requires sign in) |
| Multi-node cluster support | No | Yes |
| Kubernetes version selector | No | Yes |
| Speed to provision | ~1 min | ~30 seconds |
| Supported by ECI | No | Yes |
| Works with containerd image store | Yes | Yes |
| Works with Docker image store | Yes | No |
@y
| Feature | `kubeadm` | `kind` |
| :------ | :-----: | :--: |
| Availability | Docker Desktop 4.0+ | Docker Desktop 4.38+ (requires sign in) |
| Multi-node cluster support | No | Yes |
| Kubernetes version selector | No | Yes |
| Speed to provision | ~1 min | ~30 seconds |
| Supported by ECI | No | Yes |
| Works with containerd image store | Yes | Yes |
| Works with Docker image store | Yes | No |
@z

@x
## Using the kubectl command
@y
## Using the kubectl command
@z

@x
Kubernetes integration automatically installs the Kubernetes CLI command
at `/usr/local/bin/kubectl` on Mac and at `C:\Program Files\Docker\Docker\Resources\bin\kubectl.exe` on Windows. This location may not be in your shell's `PATH`
variable, so you may need to type the full path of the command or add it to
the `PATH`.
@y
Kubernetes integration automatically installs the Kubernetes CLI command
at `/usr/local/bin/kubectl` on Mac and at `C:\Program Files\Docker\Docker\Resources\bin\kubectl.exe` on Windows. This location may not be in your shell's `PATH`
variable, so you may need to type the full path of the command or add it to
the `PATH`.
@z

@x
If you have already installed `kubectl` and it is
pointing to some other environment, such as `minikube` or a Google Kubernetes Engine cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@y
If you have already installed `kubectl` and it is
pointing to some other environment, such as `minikube` or a Google Kubernetes Engine cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
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
> [!TIP]
>
> If the `kubectl` config get-contexts command returns an empty result, try:
>
> - Running the command in the Command Prompt or PowerShell.
> - Setting the `KUBECONFIG` environment variable to point to your `.kube/config` file.
@y
> [!TIP]
>
> If the `kubectl` config get-contexts command returns an empty result, try:
>
> - Running the command in the Command Prompt or PowerShell.
> - Setting the `KUBECONFIG` environment variable to point to your `.kube/config` file.
@z

@x
### Verify installation
@y
### Verify installation
@z

@x
To confirm that Kubernetes is running, list the available nodes:
@y
To confirm that Kubernetes is running, list the available nodes:
@z

@x
```console
$ kubectl get nodes
NAME                 STATUS    ROLES            AGE       VERSION
docker-desktop       Ready     control-plane    3h        v1.29.1
```
@y
```console
$ kubectl get nodes
NAME                 STATUS    ROLES            AGE       VERSION
docker-desktop       Ready     control-plane    3h        v1.29.1
```
@z

@x
If you installed `kubectl` using Homebrew, or by some other method, and
experience conflicts, remove `/usr/local/bin/kubectl`.
@y
If you installed `kubectl` using Homebrew, or by some other method, and
experience conflicts, remove `/usr/local/bin/kubectl`.
@z

@x
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@y
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@z

@x
## Upgrade your cluster
@y
## Upgrade your cluster
@z

@x
Kubernetes clusters are not automatically upgraded with Docker Desktop updates. To upgrade the cluster, you must manually select **Reset Kubernetes Cluster** in settings.
@y
Kubernetes clusters are not automatically upgraded with Docker Desktop updates. To upgrade the cluster, you must manually select **Reset Kubernetes Cluster** in settings.
@z

@x
## Additional settings
@y
## Additional settings
@z

@x
### Viewing system containers
@y
### Viewing system containers
@z

@x
By default, Kubernetes system containers are hidden. To inspect these containers, enable **Show system containers (advanced)**.
@y
By default, Kubernetes system containers are hidden. To inspect these containers, enable **Show system containers (advanced)**.
@z

@x
You can now view the running Kubernetes containers with `docker ps` or in the Docker Desktop Dashboard.
@y
You can now view the running Kubernetes containers with `docker ps` or in the Docker Desktop Dashboard.
@z

@x
### Configuring a custom image registry for Kubernetes control plane images
@y
### Configuring a custom image registry for Kubernetes control plane images
@z

@x
Docker Desktop uses containers to run the Kubernetes control plane. By default, Docker Desktop pulls
the associated container images from Docker Hub. The images pulled depend on the [cluster provisioning mode](#cluster-provisioning-method).
@y
Docker Desktop uses containers to run the Kubernetes control plane. By default, Docker Desktop pulls
the associated container images from Docker Hub. The images pulled depend on the [cluster provisioning mode](#cluster-provisioning-method).
@z

@x
For example, in `kind` mode it requires the following images:
@y
For example, in `kind` mode it requires the following images:
@z

@x
```console
docker.io/kindest/node:<tag>
docker.io/envoyproxy/envoy:<tag>
docker.io/docker/desktop-cloud-provider-kind:<tag>
docker.io/docker/desktop-containerd-registry-mirror:<tag>
```
@y
```console
docker.io/kindest/node:<tag>
docker.io/envoyproxy/envoy:<tag>
docker.io/docker/desktop-cloud-provider-kind:<tag>
docker.io/docker/desktop-containerd-registry-mirror:<tag>
```
@z

@x
In `kubeadm` mode it requires the following images:
@y
In `kubeadm` mode it requires the following images:
@z

@x
```console
docker.io/registry.k8s.io/kube-controller-manager:<tag>
docker.io/registry.k8s.io/kube-apiserver:<tag>
docker.io/registry.k8s.io/kube-scheduler:<tag>
docker.io/registry.k8s.io/kube-proxy
docker.io/registry.k8s.io/etcd:<tag>
docker.io/registry.k8s.io/pause:<tag>
docker.io/registry.k8s.io/coredns/coredns:<tag>
docker.io/docker/desktop-storage-provisioner:<tag>
docker.io/docker/desktop-vpnkit-controller:<tag>
docker.io/docker/desktop-kubernetes:<tag>
```
@y
```console
docker.io/registry.k8s.io/kube-controller-manager:<tag>
docker.io/registry.k8s.io/kube-apiserver:<tag>
docker.io/registry.k8s.io/kube-scheduler:<tag>
docker.io/registry.k8s.io/kube-proxy
docker.io/registry.k8s.io/etcd:<tag>
docker.io/registry.k8s.io/pause:<tag>
docker.io/registry.k8s.io/coredns/coredns:<tag>
docker.io/docker/desktop-storage-provisioner:<tag>
docker.io/docker/desktop-vpnkit-controller:<tag>
docker.io/docker/desktop-kubernetes:<tag>
```
@z

@x
The image tags are automatically selected by Docker Desktop based on several
factors, including the version of Kubernetes being used. The tags vary for each image.
@y
The image tags are automatically selected by Docker Desktop based on several
factors, including the version of Kubernetes being used. The tags vary for each image.
@z

@x
To accommodate scenarios where access to Docker Hub is not allowed, admins can
configure Docker Desktop to pull the above listed images from a different registry (e.g., a mirror)
using the [KubernetesImagesRepository](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#kubernetes) setting as follows.
@y
To accommodate scenarios where access to Docker Hub is not allowed, admins can
configure Docker Desktop to pull the above listed images from a different registry (e.g., a mirror)
using the [KubernetesImagesRepository](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#kubernetes) setting as follows.
@z

@x
An image name can be broken into `[registry[:port]/][namespace/]repository[:tag]` components.
The `KubernetesImagesRepository` setting allows users to override the `[registry[:port]/][namespace]`
portion of the image's name.
@y
An image name can be broken into `[registry[:port]/][namespace/]repository[:tag]` components.
The `KubernetesImagesRepository` setting allows users to override the `[registry[:port]/][namespace]`
portion of the image's name.
@z

@x
For example, if Docker Desktop Kubernetes is configured in `kind` mode and
`KubernetesImagesRepository` is set to `my-registry:5000/kind-images`, then
Docker Desktop will pull the images from:
@y
For example, if Docker Desktop Kubernetes is configured in `kind` mode and
`KubernetesImagesRepository` is set to `my-registry:5000/kind-images`, then
Docker Desktop will pull the images from:
@z

@x
```console
my-registry:5000/kind-images/node:<tag>
my-registry:5000/kind-images/envoy:<tag>
my-registry:5000/kind-images/desktop-cloud-provider-kind:<tag>
my-registry:5000/kind-images/desktop-containerd-registry-mirror:<tag>
```
@y
```console
my-registry:5000/kind-images/node:<tag>
my-registry:5000/kind-images/envoy:<tag>
my-registry:5000/kind-images/desktop-cloud-provider-kind:<tag>
my-registry:5000/kind-images/desktop-containerd-registry-mirror:<tag>
```
@z

@x
These images should be cloned/mirrored from their respective images in Docker Hub. The tags must
also match what Docker Desktop expects.
@y
These images should be cloned/mirrored from their respective images in Docker Hub. The tags must
also match what Docker Desktop expects.
@z

@x
The recommended approach to set this up is the following:
@y
The recommended approach to set this up is the following:
@z

@x
1) Start Docker Desktop.
@y
1) Start Docker Desktop.
@z

@x
2) In Settings > Kubernetes, enable the *Show system containers* setting.
@y
2) In Settings > Kubernetes, enable the *Show system containers* setting.
@z

@x
3) In Settings > Kubernetes, start Kubernetes using the desired cluster provisioning method: `kubeadm` or `kind`.
@y
3) In Settings > Kubernetes, start Kubernetes using the desired cluster provisioning method: `kubeadm` or `kind`.
@z

@x
4) Wait for Kubernetes to start.
@y
4) Wait for Kubernetes to start.
@z

@x
5) Use `docker ps` to view the container images used by Docker Desktop for the Kubernetes control plane.
@y
5) Use `docker ps` to view the container images used by Docker Desktop for the Kubernetes control plane.
@z

@x
6) Clone or mirror those images (with matching tags) to your custom registry.
@y
6) Clone or mirror those images (with matching tags) to your custom registry.
@z

@x
7) Stop the Kubernetes cluster.
@y
7) Stop the Kubernetes cluster.
@z

@x
8) Configure the `KubernetesImagesRepository` setting to point to your custom registry.
@y
8) Configure the `KubernetesImagesRepository` setting to point to your custom registry.
@z

@x
9) Restart Docker Desktop.
@y
9) Restart Docker Desktop.
@z

@x
10) Verify that the Kubernetes cluster is using the custom registry images using the `docker ps` command.
@y
10) Verify that the Kubernetes cluster is using the custom registry images using the `docker ps` command.
@z

@x
> [!NOTE]
>
> The `KubernetesImagesRepository` setting only applies to control plane images used by Docker Desktop
> to set up the Kubernetes cluster. It has no effect on other Kubernetes pods.
@y
> [!NOTE]
>
> The `KubernetesImagesRepository` setting only applies to control plane images used by Docker Desktop
> to set up the Kubernetes cluster. It has no effect on other Kubernetes pods.
@z

@x
> [!NOTE]
>
> In Docker Desktop versions 4.43 or earlier, when using `KubernetesImagesRepository` and [Enhanced Container Isolation (ECI)](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md)
> is enabled, add the following images to the [ECI Docker socket mount image list](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#enhanced-container-isolation):
>
> `[imagesRepository]/desktop-cloud-provider-kind:`
> `[imagesRepository]/desktop-containerd-registry-mirror:`
>
> These containers mount the Docker socket, so you must add the images to the ECI images list. If not,
> ECI will block the mount and Kubernetes won't start.
@y
> [!NOTE]
>
> In Docker Desktop versions 4.43 or earlier, when using `KubernetesImagesRepository` and [Enhanced Container Isolation (ECI)](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md)
> is enabled, add the following images to the [ECI Docker socket mount image list](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#enhanced-container-isolation):
>
> `[imagesRepository]/desktop-cloud-provider-kind:`
> `[imagesRepository]/desktop-containerd-registry-mirror:`
>
> These containers mount the Docker socket, so you must add the images to the ECI images list. If not,
> ECI will block the mount and Kubernetes won't start.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
- If Kubernetes fails to start, make sure Docker Desktop is running with enough allocated resources. Check **Settings** > **Resources**.
- If the `kubectl` commands return errors, confirm the context is set to `docker-desktop`
   ```console
   $ kubectl config use-context docker-desktop
   ```
   You can then try checking the logs of the [Kubernetes system containers](#viewing-system-containers) if you have enabled that setting.
- If you're experiencing cluster issues after updating, reset your Kubernetes cluster. Resetting a Kubernetes cluster can help resolve issues by essentially reverting the cluster to a clean state, and clearing out misconfigurations, corrupted data, or stuck resources that may be causing problems. If the issue still persists, you may need to clean and purge data, and then restart Docker Desktop.
@y
- If Kubernetes fails to start, make sure Docker Desktop is running with enough allocated resources. Check **Settings** > **Resources**.
- If the `kubectl` commands return errors, confirm the context is set to `docker-desktop`
   ```console
   $ kubectl config use-context docker-desktop
   ```
   You can then try checking the logs of the [Kubernetes system containers](#viewing-system-containers) if you have enabled that setting.
- If you're experiencing cluster issues after updating, reset your Kubernetes cluster. Resetting a Kubernetes cluster can help resolve issues by essentially reverting the cluster to a clean state, and clearing out misconfigurations, corrupted data, or stuck resources that may be causing problems. If the issue still persists, you may need to clean and purge data, and then restart Docker Desktop.
@z

@x
## Turn off and uninstall Kubernetes
@y
## Turn off and uninstall Kubernetes
@z

@x
To turn off Kubernetes in Docker Desktop:
@y
To turn off Kubernetes in Docker Desktop:
@z

@x
1. From the Docker Desktop Dashboard, select the **Settings** icon.
2. Select the **Kubernetes** tab.
3. Deselect the **Enable Kubernetes** checkbox.
4. Select **Apply** to save the settings. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@y
1. From the Docker Desktop Dashboard, select the **Settings** icon.
2. Select the **Kubernetes** tab.
3. Deselect the **Enable Kubernetes** checkbox.
4. Select **Apply** to save the settings. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@z
