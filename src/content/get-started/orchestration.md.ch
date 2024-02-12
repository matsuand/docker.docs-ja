%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 (最下段)

@x
---
title: Deployment and orchestration
keywords: orchestration, deploy, kubernetes, swarm,
description: Get oriented on some basics of Docker and install Docker Desktop.
---
@y
---
title: デプロイとオーケストレーション
keywords: orchestration, deploy, kubernetes, swarm,
description: Get oriented on some basics of Docker and install Docker Desktop.
---
@z

@x
Containerization provides an opportunity to move and scale applications to
clouds and data centers. Containers effectively guarantee that those applications run the
same way anywhere, allowing you to quickly and easily take advantage of all
these environments. Additionally, as you scale your applications up, you need some
tooling to help automate the maintenance of those applications, enable the
replacement of failed containers automatically, and manage the roll-out of
updates and reconfigurations of those containers during their lifecycle.
@y
コンテナー化を行うと、クラウドやデータセンターに対してのアプリケーションの移行やスケーリングを容易にしてくれます。
コンテナーというものは、アプリケーションをどこで動作させても同じように動くことが保証されるものであり、すべての環境下においてその性能をすばやく簡単に利用できます。
アプリケーションをスケールアップするときには、アプリケーションのメンテナンスを自動化するツールが必要になってきます。
また動作不良を起こしたコンテナーを自動的に置き換えたり、コンテナー稼働中でのアップデート適用や再設定管理ができることが求められます。
@z

@x
Tools to manage, scale, and maintain containerized applications are called
orchestrators. Two of the most popular orchestration tools are Kubernetes and
Docker Swarm. Docker Desktop provides development environments for both of these
orchestrators.
@y
コンテナー化アプリケーションを管理しスケール変更や保守を行うツールのことをオーケストレーター (orchestrator) と呼びます。
もっとも人気のあるオーケストレーションツールが Kubernetes と Docker Swarm の二つです。
Docker Desktop ではこの二つのオーケストレーター双方に対する開発環境を提供しています。
@z

@x
The advanced modules teach you how to:
@y
この高度なモジュールを利用して以下のことを学んでいきます。
@z

@x
1. [Set up and use a Kubernetes environment on your development machine](kube-deploy.md)
2. [Set up and use a Swarm environment on your development machine](swarm-deploy.md)
@y
1. [開発環境上にて Kubernetes 環境を構築して利用する](kube-deploy.md)
2. [開発環境上にて Swarm 環境を構築して利用する](swarm-deploy.md)
@z

@x
## Turn on Kubernetes
@y
## Kubernetes の有効化 {#turn-on-kubernetes}
@z

@x
Docker Desktop sets up Kubernetes for you quickly and easily. Follow the setup and validation instructions appropriate for your operating system:
@y
Docker Desktop では Kubernetes をすばやく簡単に設定することができます。
利用しているオペレーティングシステムに合わせて、以下の設定および確認手順を進めてください。
@z

@x
{{< tabs group="os" >}}
{{< tab name="Mac and Linux" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Mac と Linux" >}}
@z

@x
### Mac
@y
### Mac
@z

@x
1.  From the Docker Dashboard, navigate to **Settings**, and select the **Kubernetes** tab.
@y
1.  Docker Dashboard から **Settings** (設定) 画面を開き **Kubernetes** タブをクリックします。
@z

@x
2.  Select the checkbox labeled **Enable Kubernetes**, and select **Apply & Restart**. Docker Desktop automatically sets up Kubernetes for you. You'll know that Kubernetes has been successfully enabled when you see a green light beside 'Kubernetes _running_' in **Settings**.
@y
2.  **Enable Kubernetes** (Kubernetes の有効化) と書かれたチェックボックスにチェックを入れ、**Apply & Restart** (適用＆再起動) をクリックします。
    Docker Desktop は Kubernetes 設定を自動的に行います。
    Kubernetes が有効になったかどうかは、**Settings** (設定) メニューの 'Kubernetes _running_' と書かれたラベルの横に緑色のライトがつくことで分かります。
@z

@x
3. To confirm that Kubernetes is up and running, create a text file called `pod.yaml` with the following content:
@y
3. Kubernetes が起動中であることを確認するため、`pod.yaml` という名前のテキストファイルを生成して、以下の記述を書き加えます。
@z

% snip code...

@x
    This describes a pod with a single container, isolating a simple ping to 8.8.8.8.
@y
    この記述は、一つのコンテナーからなる pod (ポッド) を定義しています。
    そして 8.8.8.8 への ping を行います。
@z

@x
4. In a terminal, navigate to where you created `pod.yaml` and create your pod:
@y
4. 端末において `pod.yaml` を生成したディレクトリに移動して、以下のようにして pod を生成します。
@z

% snip code...

@x
5. Check that your pod is up and running:
@y
5. pod が起動しているかどうかを、以下のようにして確認します。
@z

% snip code...

@x
    You should see something like:
@y
    次のような出力が得られるはずです。
@z

% snip output...

@x
6. Check that you get the logs you'd expect for a ping process:
@y
6. ping 処理によって得られるであろうログを確認します。
@z

% snip code...

@x
    You should see the output of a healthy ping process:
@y
    ping が正常処理されたことを示す出力が得られるはずです。
@z

% snip output...

@x
7. Finally, tear down your test pod:
@y
7. 最後はこのテスト用の pod を終了させます。
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
### Windows
@y
### Windows
@z

@x
1. From the Docker Dashboard, navigate to **Settings**, and select the **Kubernetes** tab.
@y
1. Docker Dashboard から **Settings** (設定) 画面を開き **Kubernetes** タブをクリックします。
@z

@x
2. Select the checkbox labeled **Enable Kubernetes**, and select **Apply & Restart**. Docker Desktop automatically sets up Kubernetes for you. You'll know that Kubernetes has been successfully enabled when you see a green light beside 'Kubernetes _running_' in the **Settings** menu.
@y
2.  **Enable Kubernetes** (Kubernetes の有効化) と書かれたチェックボックスにチェックを入れ、**Apply & Restart** (適用＆再起動) をクリックします。
    Docker Desktop は Kubernetes 設定を自動的に行います。
    Kubernetes が有効になったかどうかは、**Settings** (設定) メニューの 'Kubernetes _running_' と書かれたラベルの横に緑色のライトがつくことで分かります。
@z

@x
3. To confirm that Kubernetes is up and running, create a text file called `pod.yaml` with the following content:
@y
3. Kubernetes が起動中であることを確認するため、`pod.yaml` という名前のテキストファイルを生成して、以下の記述を書き加えます。
@z

% snip code...

@x
    This describes a pod with a single container, isolating a simple ping to 8.8.8.8.
@y
    この記述は、一つのコンテナーからなる pod (ポッド) を定義しています。
    そして 8.8.8.8 への ping を行います。
@z

@x
4. In PowerShell, navigate to where you created `pod.yaml` and create your pod:
@y
4. PowerShell において `pod.yaml` を生成したディレクトリに移動して、以下のようにして pod を生成します。
@z

% snip code...

@x
5. Check that your pod is up and running:
@y
5. pod が起動しているかどうかを、以下のようにして確認します。
@z

% snip code...

@x
    You should see something like:
@y
    次のような出力が得られるはずです。
@z

% snip output...

@x
6. Check that you get the logs you'd expect for a ping process:
@y
6. ping 処理によって得られるであろうログを確認します。
@z

% snip code...

@x
    You should see the output of a healthy ping process:
@y
    ping が正常処理されたことを示す出力が得られるはずです。
@z

% snip output...

@x
7. Finally, tear down your test pod:
@y
7. 最後はこのテスト用の pod を終了させます。
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Enable Docker Swarm
@y
## Docker Swarm の有効化 {#enable-docker-swarm}
@z

@x
Docker Desktop runs primarily on Docker Engine, which has everything you need to run a Swarm built in. Follow the setup and validation instructions appropriate for your operating system:
@y
Docker Desktop は主に Docker Engine 上で動作します。
その Engine には埋め込みの Swarm を実行するために必要なものがすべて含まれています。
お使いのオペレーティングシステムに応じて、以下のセットアップおよび検証の手順を進めてください。
@z

@x
{{< tabs group="os" >}}
{{< tab name="Mac" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Mac" >}}
@z

@x
### Mac
@y
### Mac
@z

@x
1. Open a terminal, and initialize Docker Swarm mode:
@y
1. 端末を開いて Docker Swarm モードの初期化を行います。
@z

% snip code...

@x
    If all goes well, you should see a message similar to the following:
@y
    すべてが正常処理されると、以下に示すようなメッセージが表示されるはずです。
@z

% snip output...

@x
2. Run a simple Docker service that uses an alpine-based filesystem, and isolates a ping to 8.8.8.8:
@y
2. alpine ベースのファイルシステムを利用する単純な Docker サービスを実行します。
   そして 8.8.8.8 への ping を行います。
@z

% snip code...

@x
3. Check that your service created one running container:
@y
3. 起動した一つのコンテナーにより生成されたサービスを確認します。
@z

% snip code...

@x
    You should see something like:
@y
    以下のように出力されるはずです。
@z

% snip output...

@x
4. Check that you get the logs you'd expect for a ping process:
@y
4. ping 処理によって得られるであろうログを確認します。
@z

% snip code...

@x
    You should see the output of a healthy ping process:
@y
    ping が正常処理されたことを示す出力が得られるはずです。
@z

% snip output...

@x
5. Finally, tear down your test service:
@y
5. 最後はこのテスト用のサービスを終了させます。
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
### Windows
@y
### Windows
@z

@x
1. Open a PowerShell, and initialize Docker Swarm mode:
@y
1. PowerShell を開いて Docker Swarm モードの初期化を行います。
@z

% snip code...

@x
    If all goes well, you should see a message similar to the following:
@y
    すべてが正常処理されると、以下に示すようなメッセージが表示されるはずです。
@z

% snip output...

@x
2. Run a simple Docker service that uses an alpine-based filesystem, and isolates a ping to 8.8.8.8:
@y
2. alpine ベースのファイルシステムを利用する単純な Docker サービスを実行します。
   そして 8.8.8.8 への ping を行います。
@z

% snip code...

@x
3. Check that your service created one running container:
@y
3. 起動した一つのコンテナーにより生成されたサービスを確認します。
@z

% snip code...

@x
    You should see something like:
@y
    以下のように出力されるはずです。
@z

% snip output...

@x
4. Check that you get the logs you'd expect for a ping process:
@y
4. ping 処理によって得られるであろうログを確認します。
@z

% snip code...

@x
    You should see the output of a healthy ping process:
@y
    ping が正常処理されたことを示す出力が得られるはずです。
@z

% snip output...

@x
5. Finally, tear down your test service:
@y
5. 最後はこのテスト用のサービスを終了させます。
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Conclusion
@y
## まとめ {#conclusion}
@z

@x
At this point, you've confirmed that you can run simple containerized workloads in Kubernetes and Swarm. The next step is to write a YAML file that describes how to run and manage these containers.
@y
ここまで、Kubernetes や Swarm を使って単純なコンテナー化アプリが起動できることを確認しました。
次のステップでは、そのコンテナーを実行し管理することを定義する YAML ファイルの書き方について説明します。
@z

@x
- [Deploy to Kubernetes](kube-deploy.md)
- [Deploy to Swarm](swarm-deploy.md)
@y
- [Kubernetes へのデプロイ](kube-deploy.md)
- [Swarm へのデプロイ](swarm-deploy.md)
@z

@x
## CLI references
@y
## CLI リファレンス {#cli-references}
@z

@x
Further documentation for all CLI commands used in this article are available here:
@y
本文において用いた CLI コマンドの詳細については、以下を参照してください。
@z

@x __SUBDIR__ 対応
- [`kubectl apply`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply)
- [`kubectl get`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)
- [`kubectl logs`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
- [`kubectl delete`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#delete)
- [`docker swarm init`](/engine/reference/commandline/swarm_init/)
- [`docker service *`](/engine/reference/commandline/service/)
@y
- [`kubectl apply`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply)
- [`kubectl get`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)
- [`kubectl logs`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
- [`kubectl delete`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#delete)
- [`docker swarm init`](__SUBDIR__/engine/reference/commandline/swarm_init/)
- [`docker service *`](__SUBDIR__/engine/reference/commandline/service/)
@z
