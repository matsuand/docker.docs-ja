%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Test your C++ deployment
keywords: deploy, kubernetes, c++
description: Learn how to develop locally using Kubernetes
@y
title: C++ デプロイのテスト
keywords: deploy, kubernetes, c++
description: Learn how to develop locally using Kubernetes
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- Complete all the previous sections of this guide, starting with [Containerize a C++ application](containerize.md).
- [Turn on Kubernetes](/desktop/kubernetes/#install-and-turn-on-kubernetes) in Docker Desktop.
@y
- [C++ アプリケーションのコンテナー化](containerize.md) から始まる、ここまでのガイドすべてを終えていること。
- Docker Desktop において [Kubernetes を有効](__SUBDIR__/desktop/kubernetes/#install-and-turn-on-kubernetes) にしていること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This allows you to test and debug your workloads on Kubernetes locally before deploying.
@y
本節では Docker Desktop を使って、開発マシン上に実現されている Kubernetes のフル機能環境に向けたアプリケーションのデプロイ方法について学びます。
これによってデプロイ前に Kubernetes 上のワークロードをローカルにおいてテスト、デバッグすることができます。
@z

@x
## Create a Kubernetes YAML file
@y
## Kubernetes YAML ファイルの生成 {#create-a-kubernetes-yaml-file}
@z

@x
In your `c-plus-plus-docker` directory, create a file named
`docker-kubernetes.yml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your C++ application](configure-ci-cd.md).
@y
`c-plus-plus-docker` ディレクトリ内に `docker-kubernetes.yml` という名のファイルを生成します。
このファイルを IDE またはテキストエディターで開きます。
そして以下に示す内容を記述します。
`DOCKER_USERNAME/REPO_NAME` の部分は、自分の Docker ユーザー名、および [C++ アプリケーション向け CI/CD の設定](configure-ci-cd.md) において生成したリポジトリ名に置き換えてください。
@z

% snip code...

@x
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@y
この Kubernetes YAML ファイルには `---` によって区切られた 2 つのオブジェクトがあります。
@z

@x
 - A Deployment, describing a scalable group of identical pods. In this case,
   you'll get just one replica, or copy of your pod. That pod, which is
   described under `template`, has just one container in it. The
    container is created from the image built by GitHub Actions in [Configure CI/CD for
    your C++ application](configure-ci-cd.md).
 - A NodePort service, which will route traffic from port 30001 on your host to
   port 8080 inside the pods it routes to, allowing you to reach your app
   from the network.
@y
 - デプロイメント。
   スケール可能なポッドグループを記述します。
   ここではレプリカを 1 とします。
   つまりポッドを 1 つコピーします。
   そのポッドは以下において `template` と記述されるものであり、その中にただ 1 つのコンテナーを持ちます。
    このコンテナーは [C++ アプリケーション向け CI/CD の設定](configure-ci-cd.md) において GitHub アクションによってビルドしたイメージから生成されるものです。
 - NodePort サービス。
   これはホスト上のポート 30001 をポッド内のポート 8080 にトラフィックをルーティングします。
   これによってネットワークからアプリにアクセスできるようになります。
@z

@x
To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@y
Kubernetes オブジェクトについての詳細は [Kubernetes ドキュメント](https://kubernetes.io/docs/home/) を参照してください。
@z

@x
## Deploy and check your application
@y
## アプリケーションのデプロイとチェック {#deploy-and-check-your-application}
@z

@x
1. In a terminal, navigate to `c-plus-plus-docker` and deploy your application to
   Kubernetes.
@y
1. 端末において `c-plus-plus-docker` に移動し、アプリケーションを Kubernetes にデプロイします。
@z

% snip command...

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@y
   実行結果は以下のようになるはずです。
   つまり Kubernetes オブジェクトは正常に生成されたはずです。
@z

% snip text...

@x
2. Make sure everything worked by listing your deployments.
@y
2. デプロイの一覧を表示して、すべてがうまく動作していることを確認します。
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
   この出力結果から、YAML ファイルに記述したポッドがすべて実行していることが分かります。
   今回のサービスに関しても同じく確認します。
@z

% snip command...

@x
   You should get output like the following.
@y
   以下のような出力結果が得られるはずです。
@z

% snip output...

@x
   In addition to the default `kubernetes` service, you can see your `service-entrypoint` service, accepting traffic on port 30001/TCP.
@y
   デフォルトの `kubernetes` サービスに加えて `service-entrypoint` というサービスが表示されます。
   そのサービスはポート 30001/TCP のトラフィックを受けつけます。
@z

@x
3. In a browser, visit the following address. You should see the message `{"Status" : "OK"}`.
@y
3. ブラウザーを使って以下のアドレスにアクセスします。
   `{"Status" : "OK"}` というメッセージが表示されるはずです。
@z

% snip output...

@x
4. Run the following command to tear down your application.
@y
4. 以下のコマンドを実行してアプリケーションを終了します。
@z

% snip command...

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to use Docker Desktop to deploy your C++ application to a fully-featured Kubernetes environment on your development machine. 
@y
本節では Docker Desktop を使って、開発マシン上に実現されている Kubernetes のフル機能環境に向けたアプリケーションのデプロイ方法について学びました。
@z

@x
Related information:
   - [Kubernetes documentation](https://kubernetes.io/docs/home/)
   - [Deploy on Kubernetes with Docker Desktop](../../desktop/kubernetes.md)
   - [Swarm mode overview](../../engine/swarm/_index.md)
@y
関連情報
   - [Kubernetes ドキュメント](https://kubernetes.io/docs/home/)
   - [Docker Deskitop を使った Kubernetes へのデプロイ](../../desktop/kubernetes.md)
   - [Swarm モード概要](../../engine/swarm/_index.md)
@z
