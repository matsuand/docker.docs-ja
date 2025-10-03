%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: What next after the Docker workshop
@y
title: Docker ワークショップの次にすることは
@z

@x
linkTitle: "Part 9: What next"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making sure you have more ideas of what you could do next with your application
@y
linkTitle: "9 部: 次は何"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making sure you have more ideas of what you could do next with your application
@z

@x
Although you're done with the workshop, there's still a lot more to learn about containers.
@y
ワークショップを学び終えましたが、コンテナーについての学習はまだまだ続きます。
@z

@x
Here are a few other areas to look at next.
@y
次に見ていくべき内容をいくつか以下に示します。
@z

@x
## Container orchestration
@y
## コンテナーオーケストレーション {#container-orchestration}
@z

@x
Running containers in production is tough. You don't want to log into a machine and simply run a
`docker run` or `docker compose up`. Why not? Well, what happens if the containers die? How do you
scale across several machines? Container orchestration solves this problem. Tools like Kubernetes,
Swarm, Nomad, and ECS all help solve this problem, all in slightly different ways.
@y
本番環境においてコンテナーを作動させるのは大変なことです。
マシンにログインして `docker run` や `docker compose up` を実行するのは、本当はやりたくないことです。
なぜ？
コンテナーがダウンしていたら、何が起きていますか？
複数マシンのスケール変更はどうやってしますか？
コンテナーオーケストレーションというものがこの問題を解決します。
Kubernetes、Swarm、Nomad、ECS といったツールがこの問題を解決します。
これらの解決方法はさまざまです。
@z

@x
The general idea is that you have managers who receive the expected state. This state might be
"I want to run two instances of my web app and expose port 80." The managers then look at all of the
machines in the cluster and delegate work to worker nodes. The managers watch for changes (such as
a container quitting) and then work to make the actual state reflect the expected state.
@y
要するに管理者というものは、何らかの状況を期待されたものに保つ役割があります。
その状況とはたとえば「ウェブアプリのためのインスタンスを 2 つ立ち上げ、ポート番号は 80 とする」といったものです。
管理者はクラスター内の全マシンを確認して、ワーカーノードに指示を与えます。
管理者は状態の変化 (たとえばコンテナー停止など) を監視して、あるべき状態となるように作業を行います。
@z

@x
## Cloud Native Computing Foundation projects
@y
## Cloud Native Computing Foundation プロジェクト {#cloud-native-computing-foundation-projects}
@z

@x
The CNCF is a vendor-neutral home for various open-source projects, including Kubernetes, Prometheus, 
Envoy, Linkerd, NATS, and more. You can view the [graduated and incubated projects here](https://www.cncf.io/projects/)
and the entire [CNCF Landscape here](https://landscape.cncf.io/). There are a lot of projects to help
solve problems around monitoring, logging, security, image registries, messaging, and more.
@y
CNCF はベンダーに依存しないオープンソースプロジェクト向けの開発ホームです。
Kubernetes、Prometheus、Envoy、Linkerd、NATS などが含まれます。
[graduated and incubated projects](https://www.cncf.io/projects/) や [CNCF Landscape](https://landscape.cncf.io/) から確認することができます。
監視、ログ管理、セキュリティ、イメージレジストリなどの問題に対して、解決に役立つプロジェクトは数多く取り上げられています。
@z

@x
## Getting started video workshop
@y
## ビデオワークショップ {#getting-started-video-workshop}
@z

@x
Docker recommends watching the video workshop from DockerCon 2022. Watch the entire video or use the following links to open the video at a particular section.
@y
Docker では DockerCon 2022 でのビデオワークショップの閲覧を推奨します。
ビデオ全体をご確認いただくか、以下のリンクをクリックして、特定内容のビデオを開いてみてください。
@z

@x
* [Docker overview and installation](https://youtu.be/gAGEar5HQoU)
* [Pull, run, and explore containers](https://youtu.be/gAGEar5HQoU?t=1400)
* [Build a container image](https://youtu.be/gAGEar5HQoU?t=3185)
* [Containerize an app](https://youtu.be/gAGEar5HQoU?t=4683)
* [Connect a DB and set up a bind mount](https://youtu.be/gAGEar5HQoU?t=6305)
* [Deploy a container to the cloud](https://youtu.be/gAGEar5HQoU?t=8280)
@y
* [Docker 概要とインストール](https://youtu.be/gAGEar5HQoU)
* [コンテナーのプル、実行、確認](https://youtu.be/gAGEar5HQoU?t=1400)
* [コンテナーイメージのビルド](https://youtu.be/gAGEar5HQoU?t=3185)
* [アプリケーションのコンテナー化](https://youtu.be/gAGEar5HQoU?t=4683)
* [DB への接続とバインドマウントの設定](https://youtu.be/gAGEar5HQoU?t=6305)
* [コンテナーのクラウドへのデプロイ](https://youtu.be/gAGEar5HQoU?t=8280)
@z

% snip video...

@x
## Creating a container from scratch
@y
## 一からのコンテナー作り  {#creating-a-container-from-scratch}
@z

@x
If you'd like to see how containers are built from scratch, Liz Rice from Aqua Security has a fantastic talk in which she creates a container from scratch in Go. While the talk does not go into networking, using images for the filesystem, and other advanced topics, it gives a deep dive into how things are working.
@y
コンテナーを一からビルドする方法をご覧になりたいなら、Aqua Security 社の Liz Rice が優れた説明を行っています。
そこでは Go 言語を使って一からコンテナーを生成しています。
この説明にネットワークに関する話はありませんが、ファイルシステム向けのイメージを使い、応用的なトピックをいくつも説明しています。
さまざまなことがどのように動作しているのかを細かく説明してくれています。
@z

% snip video...
