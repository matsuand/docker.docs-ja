%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Overview of the Docker workshop
keywords: docker basics, how to start a docker container, container settings, setup
  docker, how to setup docker, setting up docker, docker container guide, how to get
  started with docker
description: Get started with the Docker basics in this workshop, You'll
  learn about containers, images, and how to containerize your first application.
@y
title: Docker ワークショップ概要
keywords: docker basics, how to start a docker container, container settings, setup
  docker, how to setup docker, setting up docker, docker container guide, how to get
  started with docker
description: Get started with the Docker basics in this workshop, You'll
  learn about containers, images, and how to containerize your first application.
@z

@x
This 45-minute workshop contains step-by-step instructions on how to get started with Docker. This workshop shows you how to:
@y
This 45-minute workshop contains step-by-step instructions on how to get started with Docker. This workshop shows you how to:
@z

@x
- Build and run an image as a container.
- Share images using Docker Hub.
- Deploy Docker applications using multiple containers with a database.
- Run applications using Docker Compose.
@y
- イメージをビルドしてコンテナーとして実行します。
- Docker Hub を使ってイメージを共有します。
- 複数コンテナーによりデータベースを利用する Docker アプリケーションをデプロイします。
- Docker Compose を使ってアプリケーションを実行します。
@z

@x
## What is a container?
@y
## コンテナーとは何か {#what-is-a-container}
@z

@x
A container is a sandboxed process running on a host machine that is isolated from all other processes running on that host machine. That isolation leverages [kernel namespaces and cgroups](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504),
features that have been in Linux for a long time. Docker makes these capabilities approachable and easy to use. To summarize, a container:
@y
簡単に言うと、コンテナーとはマシン上の単なる 1 つのプロセスであって、ホスト上の他のプロセスとは分離された、サンドボックス化したプロセスです。
この分離状態は [カーネルの名前空間と cgroups](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504) によって実現されています。
それは Linux において長らく実現されてきている機能です。
Docker はそういった機能を活用し利用しやすくして動作しています。
コンテナーについてまとめると、以下となります。
@z

@x
- Is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI.
- Can be run on local machines, virtual machines, or deployed to the cloud.
- Is portable (and can be run on any OS).
- Is isolated from other containers and runs its own software, binaries, configurations, etc.
@y
- イメージが実行されたインスタンスのことです。
  DockerAPI や CLI を使って、コンテナーの生成、起動、停止、移動、削除を行うことができます。
- ローカルマシン、仮想マシン、デプロイしたクラウドの各環境上において実行することができます。
- 移植性が高いものです（どのような OS 上でも実行できます）。
- コンテナーは別のコンテナーからは独立していて、独自のソフトウェア、実行ファイル、設定により動作します。
@z

@x
If you're familiar with `chroot`, then think of a container as an extended version of `chroot`. The filesystem comes from the image. However, a container adds additional isolation not available when using chroot.
@y
`chroot`コマンドについてよくわかっている方は、コンテナーが`chroot`の拡張版として動作するものであると考えてください。
ファイルシステムは単純にイメージから利用されます。
しかしコンテナーでは chroot を利用するだけでは実現できない、追加の分離処理を行います。
@z

@x
## What is an image?
@y
## イメージとは何か {#what-is-a-container-image}
@z

@x
A running container uses an isolated filesystem. This isolated filesystem is provided by an image, and the image must contain everything needed to run an application - all dependencies, configurations, scripts, binaries, etc. The image also contains other configurations for the container, such as environment variables, a default command to run, and other metadata.
@y
実行中のコンテナーは独立したファイルシステムを用います。
そのファイルシステムは **イメージ** によって提供されます。
イメージにはコンテナーのファイルシステムが含まれるため、アプリケーションの実行に必要となるものをすべて含んでいなければなりません。
それは依存パッケージであり設定であり、スクリプトやバイナリです。
イメージにはそれ以外のコンテナー設定として、環境変数、デフォルト実行のコマンド、メタデータなども含みます。
@z

@x
## Next steps
@y
## 次ステップ {#next-steps}
@z

@x
In this section, you learned about containers and images.
@y
本節ではコンテナーとイメージについて学びました。
@z

@x
Next, you'll containerize a simple application and get hands-on with the concepts.
@y
次は単純なアプリケーションをコンテナー化して、その考え方について学びましょう。
@z

@x
{{< button text="Containerize an application" url="02_our_app.md" >}}
@y
{{< button text="アプリケーションのコンテナー化" url="02_our_app.md" >}}
@z
