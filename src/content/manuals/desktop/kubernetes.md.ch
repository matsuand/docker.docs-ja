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
Docker Desktop includes a standalone Kubernetes server and client,
as well as Docker CLI integration that runs on your machine. 
@y
Docker Desktop には手元のマシン上で動作する Docker CLI 統合環境に加えて、Kubernetes のスタンドアロンサーバーとクライアントが含まれます。
@z

@x
The Kubernetes server runs locally within your Docker instance, is not configurable, and is a single-node cluster. It runs within a Docker container on your local system, and
is only for local testing. 
@y
Kubernetes サーバーは Docker インスタンス内にローカルに実行されます。
設定変更することはできず、単一ノードクラスターとして動作します。
Kubernetes サーバーは、ローカルシステム内の Docker コンテナー内部で稼動します。
ローカル環境でのテスト用として利用するものです。
@z

@x
Turning on Kubernetes allows you to deploy
your workloads in parallel, on Kubernetes, Swarm, and as standalone containers. Turning on or off the Kubernetes server does not affect your other
workloads.
@y
Kubernetes サポートが有効である場合、Kubernetes と Swarm へ同時並行により開発内容をデプロイし、スタンドアロンコンテナーとすることができます。
Kubernetes サーバーの有効、無効は、他の開発内容へは影響しません。
@z

@x
## Install and turn on Kubernetes
@y
## Install and turn on Kubernetes
@z

@x
1. From the Docker Desktop Dashboard, select the **Settings**.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, select the checkbox.
4. Select **Apply & Restart** to save the settings and then select **Install** to confirm. This instantiates images required to run the Kubernetes server as containers, and installs the `/usr/local/bin/kubectl` command on your machine.
@y
1. From the Docker Desktop Dashboard, select the **Settings**.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, select the checkbox.
4. Select **Apply & Restart** to save the settings and then select **Install** to confirm. This instantiates images required to run the Kubernetes server as containers, and installs the `/usr/local/bin/kubectl` command on your machine.
@z

@x
   > [!IMPORTANT]
   >
   > The `kubectl` binary is not automatically packaged with Docker Desktop for Linux. To install the kubectl command for Linux, see [Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/). It should be installed at `/usr/local/bin/kubectl`.
@y
   > [!IMPORTANT]
   >
   > The `kubectl` binary is not automatically packaged with Docker Desktop for Linux. To install the kubectl command for Linux, see [Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/). It should be installed at `/usr/local/bin/kubectl`.
@z

@x
By default, Kubernetes containers are hidden from commands like `docker ps`, because managing them manually is not supported. Most users do not need this option. To see these internal containers, select **Show system containers (advanced)**. 
@y
By default, Kubernetes containers are hidden from commands like `docker ps`, because managing them manually is not supported. Most users do not need this option. To see these internal containers, select **Show system containers (advanced)**. 
@z

@x
When Kubernetes is turned on and running, an additional status bar in the Docker Desktop Dashboard footer and Docker menu displays. 
@y
When Kubernetes is turned on and running, an additional status bar in the Docker Desktop Dashboard footer and Docker menu displays. 
@z

@x
> [!NOTE]
>
> Docker Desktop does not upgrade your Kubernetes cluster automatically after a new update. To upgrade your Kubernetes cluster to the latest version, select **Reset Kubernetes Cluster**.
@y
> [!NOTE]
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
If you have already installed `kubectl` and it is
pointing to some other environment, such as `minikube` or a GKE cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@y
If you have already installed `kubectl` and it is
pointing to some other environment, such as `minikube` or a GKE cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@z

% snip command...

@x
> [!TIP]
>
> Run the `kubectl` command in a CMD or PowerShell terminal, otherwise `kubectl config get-contexts` may return an empty result. 
>
> If you are using a different terminal and this happens, you can try setting the `kubeconfig` environment variable to the location of the `.kube/config` file. 
@y
> [!TIP]
>
> Run the `kubectl` command in a CMD or PowerShell terminal, otherwise `kubectl config get-contexts` may return an empty result. 
>
> If you are using a different terminal and this happens, you can try setting the `kubeconfig` environment variable to the location of the `.kube/config` file. 
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

% snip command...

@x
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@y
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
@z

@x
## Turn off and uninstall Kubernetes
@y
## Turn off and uninstall Kubernetes
@z

@x
To turn off Kubernetes in Docker Desktop:
1. From the Docker Desktop Dashboard, select the **Settings** icon.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, clear the checkbox
4. Select **Apply & Restart** to save the settings.This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@y
To turn off Kubernetes in Docker Desktop:
1. From the Docker Desktop Dashboard, select the **Settings** icon.
2. Select **Kubernetes** from the left sidebar. 
3. Next to **Enable Kubernetes**, clear the checkbox
4. Select **Apply & Restart** to save the settings.This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@z
