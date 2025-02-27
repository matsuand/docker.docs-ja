%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
When you enable Kubernetes in Docker Desktop, the following actions are triggered in the Docker Desktop backend and VM:
@y
When you enable Kubernetes in Docker Desktop, the following actions are triggered in the Docker Desktop backend and VM:
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
5. Select **Apply & Restart** to save the settings.
@y
1. Open the Docker Desktop Dashboard and navigate to **Settings**.
2. Select the **Kubernetes** tab.
3. Toggle on **Enable Kubernetes**.
4. Choose your [cluster provisioning method](#cluster-provisioning-method).
5. Select **Apply & Restart** to save the settings.
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
version, it's slower to provision than `kind`, and it's not supported by [Enhanced Container Isolation](/manuals/security/for-admins/hardened-desktop/enhanced-container-isolation/index.md) (ECI),
meaning that if ECI is enabled the cluster works but it's not protected by ECI.
@y
`kubeadm` is the older provisioner. It supports a single-node cluster, you can't select the kubernetes
version, it's slower to provision than `kind`, and it's not supported by [Enhanced Container Isolation](manuals/security/for-admins/hardened-desktop/enhanced-container-isolation/index.md) (ECI),
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
### Additional settings
@y
### Additional settings
@z

@x
#### Kubernetes dashboard
@y
#### Kubernetes dashboard
@z

@x
Once Kubernetes is installed and set up, you can select the **Deploy the Kubernetes Dashboard into cluster** setting so you can manage and monitor your Kubernetes clusters and applications more easily. 
@y
Once Kubernetes is installed and set up, you can select the **Deploy the Kubernetes Dashboard into cluster** setting so you can manage and monitor your Kubernetes clusters and applications more easily. 
@z

@x
#### Viewing system containers
@y
#### Viewing system containers
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
4. Select **Apply & Restart** to save the settings. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@y
1. From the Docker Desktop Dashboard, select the **Settings** icon.
2. Select the **Kubernetes** tab. 
3. Deselect the **Enable Kubernetes** checkbox.
4. Select **Apply & Restart** to save the settings. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@z
