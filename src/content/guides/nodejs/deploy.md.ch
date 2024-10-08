%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Test your Node.js deployment
linkTitle: Test your deployment
@y
title: Node.js デプロイのテスト
linkTitle: デプロイのテスト
@z

@x
keywords: deploy, kubernetes, node, node.js
description: Learn how to deploy locally to test and debug your Kubernetes deployment
@y
keywords: deploy, kubernetes, node, node.js
description: Kubernetes デプロイのテストとデバッグを行うために、ローカルにおいてデプロイする方法について学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
- [Turn on Kubernetes](/desktop/kubernetes/#install-and-turn-on-kubernetes) in Docker Desktop.
@y
- [Node.js アプリケーションのコンテナー化](containerize.md) から始まる、ここまでのガイドすべてを終えていること。
- Docker Desktop において [Kubernetes の有効化](__SUBDIR__/desktop/kubernetes/#install-and-turn-on-kubernetes) を行っていること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your
application to a fully-featured Kubernetes environment on your development
machine. This allows you to test and debug your workloads on Kubernetes locally
before deploying.
@y
本節では、開発マシン上に実現したフル機能の Kubernetes 環境に対して、Docker Desktop を用いてアプリケーションのデプロイを行う方法について学びます。
これを行うことで、デプロイの前にローカル環境内の Kubernetes においてテストやデバッグができるようになります。
@z

@x
## Create a Kubernetes YAML file
@y
## Kubernetes YAML ファイルの生成 {#create-a-kubernetes-yaml-file}
@z

@x
In the cloned repository's directory, create a file named
`docker-node-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Node.js application](configure-ci-cd.md).
@y
クローンを行ったディレクトリ内に `docker-node-kubernetes.yaml` というファイルを生成します。
IDE またはテキストエディターを使ってその名前のファイルを開き、以下の内容を記述します。
`DOCKER_USERNAME/REPO_NAME` 部分は、Docker のユーザー名と、[Node.js アプリケーション向けの CI/CD 設定](configure-ci-cd.md) において生成したリポジトリ名に書き換えます。
@z

% snip code...

@x
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@y
この Kubernetes YAML ファイルにおいては `---` によって区切られた 2 つのオブジェクトがあります。
@z

@x
- A Deployment, describing a scalable group of identical pods. In this case,
  you'll get just one replica, or copy of your pod. That pod, which is
  described under `template`, has just one container in it. The container is
  created from the image built by GitHub Actions in [Configure CI/CD for your
  Node.js application](configure-ci-cd.md).
- A NodePort service, which will route traffic from port 30001 on your host to
  port 3000 inside the pods it routes to, allowing you to reach your app
  from the network.
@y
- その 1 つはデプロイメント。
  同一 pod からなるスケール変更可能なグループを表しています。
  この例においては 1 つのレプリカ、つまり pod のコピーを 1 つだけ持ちます。
  この pod は `template` 配下に記述されており、その中に 1 つだけコンテナーを有しています。
  そのコンテナーとは、[Node.js アプリケーション向けの CI/CD 設定](configure-ci-cd.md) における GitHub アクションにより構築したイメージから生成されるものです。
- もう 1 つは NodePort サービス。
  これはホスト上のポート 30001 へのトラフィックを pod 内のポート 3000 に転送するものです。
  これによってネットワークからアプリケーションへのアクセスが可能となります。
@z

@x
To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@y
Kubernetes オブジェクトの詳細は [Kubernetes ドキュメント](https://kubernetes.io/docs/home/) を参照してください。
@z

@x
## Deploy and check your application
@y
## アプリケーションのデプロイとチェック {#deploy-and-check-your-application}
@z

@x
1. In a terminal, navigate to where you created `docker-node-kubernetes.yaml`
   and deploy your application to Kubernetes.
@y
1. 端末画面において、生成した `docker-node-kubernetes.yaml` が存在するディレクトリに移動します。
   そしてアプリケーションを Kubernetes にデプロイします。
@z

% snip command...

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@y
   その出力は以下のようになるはずです。
   これにより Kubernetes オブジェクトが正常に生成されたことがわかります。
@z

% snip command...

@x
2. Make sure everything worked by listing your deployments.
@y
2. デプロイ内容を一覧表示することで、すべてが正常に動作したことを確認します。
@z

% snip command...

@x
   Your deployment should be listed as follows:
@y
   デプロイ結果は以下のように一覧表示されるはずです。
@z

% snip output...

@x
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services.
@y
   上では YAML ファイルにおいて指定した pod がすべて起動していることが示されます。
   サービスに対しても同様に確認します。
@z

% snip command...

@x
   You should get output like the following.
@y
   その出力は以下のようになるはずです。
@z

% snip output...

@x
   In addition to the default `kubernetes` service, you can see your `todo-entrypoint` service, accepting traffic on port 30001/TCP.
@y
   デフォルトの `kubernetes` サービスに加えて `todo-entrypoint` サービスが一覧表示され、ポート 30001/TCP のトラフィックを受け入れるものであることがわかりまｓ。
@z

@x
3. Open a browser and visit your app at `localhost:30001`. You should see your
   application.
@y
3. ブラウザーを開いて `localhost:30001` にアクセスします。
   アプリケーションが表示されるはずです。
@z

@x
4. Run the following command to tear down your application.
@y
4. 以下のコマンドを実行してアプリケーションを終了させます。
@z

% snip command...

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine.
@y
本節では、Docker Desktop を使って、開発マシン上に実現したフル機能の Kubernetes 環境に対してのアプリケーションのデプロイ方法を学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Kubernetes documentation](https://kubernetes.io/docs/home/)
- [Deploy on Kubernetes with Docker Desktop](/manuals/desktop/kubernetes.md)
- [Swarm mode overview](/manuals/engine/swarm/_index.md)
@y
- [Kubernetes ドキュメント](https://kubernetes.io/docs/home/)
- [Docker Desktop を使った Kubernetes へのデプロイ](manuals/desktop/kubernetes.md)
- [Swarm モード概要](manuals/engine/swarm/_index.md)
@z
