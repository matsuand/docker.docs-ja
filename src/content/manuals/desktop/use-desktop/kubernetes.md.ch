%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: See how you can deploy to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration, Docker Desktop
title: Explore the Kubernetes view
linkTitle: Kubernetes
@y
description: See how you can deploy to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration, Docker Desktop
title: Kubernetes 画面の確認
linkTitle: Kubernetes
@z

@x
Docker Desktop includes a standalone Kubernetes server and client, as well as Docker CLI integration, enabling local Kubernetes development and testing directly on your machine.
@y
Docker Desktop には手元のマシン上で動作する Docker CLI 統合環境に加えて、Kubernetes のスタンドアロンサーバーとクライアントが含まれます。
これによりローカルでの Kubernetes 開発やテストを直接、手元のマシンで実現できます。
@z

@x
The Kubernetes server runs as a single or multi-node cluster, within Docker containers. This lightweight setup helps you explore Kubernetes features, test workloads, and work with container orchestration in parallel with other Docker features.
@y
Kubernetes サーバーは Docker インスタンス内において単一あるいは複数ノードクラスターとしてローカルに実行されます。
セットアップが簡単であるため、Kuberntes 機能の確認、ワークロードのテスト、Docker の他機能を同時に利用したコンテナーオーケストレーション作業を容易に進めていくことができます。
@z

@x
## Enable Kubernetes
@y
## Enable Kubernetes
@z

@x
With Docker Desktop version 4.51 and later, you can manage Kubernetes directly from the **Kubernetes** view in the Docker Desktop Dashboard.
@y
With Docker Desktop version 4.51 and later, you can manage Kubernetes directly from the **Kubernetes** view in the Docker Desktop Dashboard.
@z

@x
1. Open the Docker Desktop Dashboard and select the **Kubernetes** view. 
2. Select **Create cluster**.
3. Choose your cluster type:
   - **Kubeadm** creates a single-node cluster and the version is set by Docker Desktop.
   - **kind** creates a multi-node cluster and you can set the version and number of nodes.
   For more detailed information on each cluster type, see [Cluster provisioining method](#cluster-provisioning-method).
4. Optional: Select **Show system containers (advanced)** to view internal containers when using Docker commands.
5. Select **Create**. 
@y
1. Open the Docker Desktop Dashboard and select the **Kubernetes** view. 
2. Select **Create cluster**.
3. Choose your cluster type:
   - **Kubeadm** creates a single-node cluster and the version is set by Docker Desktop.
   - **kind** creates a multi-node cluster and you can set the version and number of nodes.
   For more detailed information on each cluster type, see [Cluster provisioining method](#cluster-provisioning-method).
4. Optional: Select **Show system containers (advanced)** to view internal containers when using Docker commands.
5. Select **Create**. 
@z

@x
This sets up the images required to run the Kubernetes server as containers, and installs the `kubectl` command-line tool on your system at `/usr/local/bin/kubectl` (Mac) or `C:\Program Files\Docker\Docker\resources\bin\kubectl.exe` (Windows). If you installed `kubectl` using Homebrew, or by some other method, and experience conflicts, remove `/usr/local/bin/kubectl`.
@y
This sets up the images required to run the Kubernetes server as containers, and installs the `kubectl` command-line tool on your system at `/usr/local/bin/kubectl` (Mac) or `C:\Program Files\Docker\Docker\resources\bin\kubectl.exe` (Windows). If you installed `kubectl` using Homebrew, or by some other method, and experience conflicts, remove `/usr/local/bin/kubectl`.
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
The following actions are also triggered in the Docker Desktop backend and VM:
@y
The following actions are also triggered in the Docker Desktop backend and VM:
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
`kind` is the newer provisioner. It supports multi-node clusters (for
a more realistic Kubernetes setup), you can choose the Kubernetes version, it's
faster to provision than `kubeadm`, and it's supported by ECI - when ECI is
enabled, the Kubernetes cluster runs in unprivileged Docker containers, thus
making it more secure. 
@y
`kind` is the newer provisioner. It supports multi-node clusters (for
a more realistic Kubernetes setup), you can choose the Kubernetes version, it's
faster to provision than `kubeadm`, and it's supported by ECI - when ECI is
enabled, the Kubernetes cluster runs in unprivileged Docker containers, thus
making it more secure. 
@z

@x
| Feature | `kubeadm` | `kind` |
| :------ | :-----: | :--: |
| Multi-node cluster support | No | Yes |
| Kubernetes version selector | No | Yes |
| Speed to provision | ~1 min | ~30 seconds |
| Supported by ECI | No | Yes |
| Works with containerd image store | Yes | Yes |
| Works with Docker image store | Yes | No |
@y
| Feature | `kubeadm` | `kind` |
| :------ | :-----: | :--: |
| Multi-node cluster support | No | Yes |
| Kubernetes version selector | No | Yes |
| Speed to provision | ~1 min | ~30 seconds |
| Supported by ECI | No | Yes |
| Works with containerd image store | Yes | Yes |
| Works with Docker image store | Yes | No |
@z

@x
## Dashboard view
@y
## Dashboard view
@z

@x
When a Kubernetes cluster is enabled, the **Kubernetes** view displays a live dashboard view showing:
@y
When a Kubernetes cluster is enabled, the **Kubernetes** view displays a live dashboard view showing:
@z

@x
- A namespace selector at the top
- A real-time list of resources - pods, services, deployments - in the selected namespace
- Automatic updates when resources are created, deleted, or modified
@y
- A namespace selector at the top
- A real-time list of resources - pods, services, deployments - in the selected namespace
- Automatic updates when resources are created, deleted, or modified
@z

@x
## Verify installation
@y
## Verify installation
@z

@x
Confirm that your cluster is running:
@y
Confirm that your cluster is running:
@z

% snip command...

@x
If kubectl is pointing to another environment, switch to the Docker Desktop context:
@y
If kubectl is pointing to another environment, switch to the Docker Desktop context:
@z

% snip command...

@x
>[!TIP]
>
> If no contexts appear, try:
>
> - Running the command in the Command Prompt or PowerShell.
> - Setting the `KUBECONFIG` environment variable to point to your `.kube/config` file.
@y
>[!TIP]
>
> If no contexts appear, try:
>
> - Running the command in the Command Prompt or PowerShell.
> - Setting the `KUBECONFIG` environment variable to point to your `.kube/config` file.
@z

@x
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@y
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@z

@x
## Edit or stop your cluster
@y
## Edit or stop your cluster
@z

@x
When Kubernetes is enabled:
@y
When Kubernetes is enabled:
@z

@x
- Select **Edit cluster** to modify configuration. For example, switch between **kubeadm** and **kind**, or change the number of nodes.
- Select **Stop** to disable the cluster. Progress is displayed, and the **Kubernetes** view returns to the **Create cluster** screen. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@y
- Select **Edit cluster** to modify configuration. For example, switch between **kubeadm** and **kind**, or change the number of nodes.
- Select **Stop** to disable the cluster. Progress is displayed, and the **Kubernetes** view returns to the **Create cluster** screen. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@z

@x
## Upgrade your cluster
@y
## Upgrade your cluster
@z

@x
Kubernetes clusters are not automatically upgraded with Docker Desktop updates. To upgrade the cluster, you must manually select **Reset cluster** in the **Kubernetes** settings.
@y
Kubernetes clusters are not automatically upgraded with Docker Desktop updates. To upgrade the cluster, you must manually select **Reset cluster** in the **Kubernetes** settings.
@z

@x
## Configuring a custom image registry for Kubernetes control plane images
@y
## Configuring a custom image registry for Kubernetes control plane images
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

% snip command...

@x
In `kubeadm` mode it requires the following images:
@y
In `kubeadm` mode it requires the following images:
@z

% snip command...

@x
The image tags are automatically selected by Docker Desktop based on several
factors, including the version of Kubernetes being used. The tags vary for each image and may change between Docker Desktop releases. To stay informed, monitor the Docker Desktop release notes.
@y
The image tags are automatically selected by Docker Desktop based on several
factors, including the version of Kubernetes being used. The tags vary for each image and may change between Docker Desktop releases. To stay informed, monitor the Docker Desktop release notes.
@z

@x
> [!NOTE]
>
> In Docker Desktop versions 4.44 or later you can run `docker desktop kubernetes images list` to list Kubernetes images used by the currently installed version of Docker Desktop.
> For more information, see the [Docker Desktop CLI](/reference/cli/docker/desktop/kubernetes/images).
@y
> [!NOTE]
>
> In Docker Desktop versions 4.44 or later you can run `docker desktop kubernetes images list` to list Kubernetes images used by the currently installed version of Docker Desktop.
> For more information, see the [Docker Desktop CLI](/reference/cli/docker/desktop/kubernetes/images).
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

% snip command...

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
1. Start Kubernetes using the desired cluster provisioning method: `kubeadm` or `kind`.
2. After Kubernetes has started, use either:
   - (Docker Desktop version 4.44 or later) `docker desktop kubernetes images list` to list the image tags that will be pulled by the current Docker Desktop installation
   - `docker ps` to view the container images used by Docker Desktop for the Kubernetes control plane
3. Clone or mirror those images (with matching tags) to your custom registry.
4. Stop the Kubernetes cluster.
5. Configure the `KubernetesImagesRepository` setting to point to your custom registry.
6. Restart Docker Desktop.
7. Verify that the Kubernetes cluster is using the custom registry images using the `docker ps` command.
@y
1. Start Kubernetes using the desired cluster provisioning method: `kubeadm` or `kind`.
2. After Kubernetes has started, use either:
   - (Docker Desktop version 4.44 or later) `docker desktop kubernetes images list` to list the image tags that will be pulled by the current Docker Desktop installation
   - `docker ps` to view the container images used by Docker Desktop for the Kubernetes control plane
3. Clone or mirror those images (with matching tags) to your custom registry.
4. Stop the Kubernetes cluster.
5. Configure the `KubernetesImagesRepository` setting to point to your custom registry.
6. Restart Docker Desktop.
7. Verify that the Kubernetes cluster is using the custom registry images using the `docker ps` command.
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
@y
- If Kubernetes fails to start, make sure Docker Desktop is running with enough allocated resources. Check **Settings** > **Resources**.
- If the `kubectl` commands return errors, confirm the context is set to `docker-desktop`
@z

% snip command...

@x
   You can then try checking the logs of the Kubernetes system containers if you have enabled that setting.
- If you're experiencing cluster issues after updating, reset your Kubernetes cluster. Resetting a Kubernetes cluster can help resolve issues by essentially reverting the cluster to a clean state, and clearing out misconfigurations, corrupted data, or stuck resources that may be causing problems. If the issue still persists, you may need to clean and purge data, and then restart Docker Desktop.
@y
   You can then try checking the logs of the Kubernetes system containers if you have enabled that setting.
- If you're experiencing cluster issues after updating, reset your Kubernetes cluster. Resetting a Kubernetes cluster can help resolve issues by essentially reverting the cluster to a clean state, and clearing out misconfigurations, corrupted data, or stuck resources that may be causing problems. If the issue still persists, you may need to clean and purge data, and then restart Docker Desktop.
@z
