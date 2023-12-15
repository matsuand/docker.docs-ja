%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Get an in-depth overview of the Docker platform including what it can
  be used for, the architecture it employs, and its underlying technology.
keywords: what is a docker, docker daemon, why use docker, docker architecture, what
  to use docker for, docker client, what is docker for, why docker, uses for docker,
  what is docker container used for, what are docker containers used for
title: Docker overview
aliases:
- /introduction/understanding-docker/
- /engine/userguide/basics/
- /engine/introduction/understanding-docker/
- /engine/understanding-docker/
- /engine/docker-overview/
---
@y
---
description: Get an in-depth overview of the Docker platform including what it can
  be used for, the architecture it employs, and its underlying technology.
keywords: what is a docker, docker daemon, why use docker, docker architecture, what
  to use docker for, docker client, what is docker for, why docker, uses for docker,
  what is docker container used for, what are docker containers used for
title: Docker 概要
aliases:
- /introduction/understanding-docker/
- /engine/userguide/basics/
- /engine/introduction/understanding-docker/
- /engine/understanding-docker/
- /engine/docker-overview/
---
@z

@x
Docker is an open platform for developing, shipping, and running applications.
Docker enables you to separate your applications from your infrastructure so
you can deliver software quickly. With Docker, you can manage your infrastructure
in the same ways you manage your applications. By taking advantage of Docker's
methodologies for shipping, testing, and deploying code, you can
significantly reduce the delay between writing code and running it in production.
@y
Docker はアプリケーションの開発、導入、実行を行うためのオープンなプラットフォームです。
Docker を使えば、アプリケーションをインフラストラクチャーから切り離すことができるため、ソフトウエアをすばやく提供することができます。
Docker であれば、アプリケーションを管理する手法をそのまま、インフラストラクチャーの管理にも適用できます。
Docker が採用する方法を最大限利用して、アプリケーションの導入、テスト、コードデプロイを行うことは、つまりコーディングと実稼動の合間を大きく削減できることを意味します。
@z

@x
## The Docker platform
@y
## Docker プラットフォーム {#the-docker-platform}
@z

@x
Docker provides the ability to package and run an application in a loosely isolated
environment called a container. The isolation and security lets you run many
containers simultaneously on a given host. Containers are lightweight and contain
everything needed to run the application, so you don't need to rely on what's
installed on the host. You can share containers while you work,
and be sure that everyone you share with gets the same container that works in the
same way.
@y
Docker はアプリケーションをパッケージ化して実行するために、ほぼ分離された環境となるコンテナーというものを提供します。
隔離してセキュリティを保つことから、実行するホスト上に複数のコンテナーを同時に実行することができます。
コンテナーは非常に軽量なものであり、アプリケーション実行に必要なものをすべて持っています。
したがって、その時点においてホスト上に何がインストールされていても、それに影響を受けません。
作業中のコンテナーは他の人と共有することができ、共有したコンテナーは誰でも同じようにして動作させることができます。
@z

@x
Docker provides tooling and a platform to manage the lifecycle of your containers:
@y
Docker が提供するのは、コンテナーのライフサイクルを管理するツールとプラットフォームです。
@z

@x
* Develop your application and its supporting components using containers.
* The container becomes the unit for distributing and testing your application.
* When you're ready, deploy your application into your production environment,
  as a container or an orchestrated service. This works the same whether your
  production environment is a local data center, a cloud provider, or a hybrid
  of the two.
@y
* コンテナーを利用して、アプリケーションとそれをサポートするコンポーネントを開発します。
* コンテナーは、アプリケーションの配布とテストを行う１つの単位となります。
* 準備ができたら本番環境に向けてアプリケーションをデプロイします。デプロイの単位は、１つのコンテナーか、あるいはオーケストレーションされた（orchestrated）１つのサービスです。その本番環境があたかも手元のデータセンター上であったり、クラウドプロバイダー上であったりするのと同様に動作します。
@z

@x
## What can I use Docker for?
@y
## Docker は何に利用できるか？ {#what-can-i-use-docker-for}
@z

@x
### Fast, consistent delivery of your applications
@y
### アプリケーションの配信をすばやく一貫性を保って {#fast-consistent-delivery-of-your-applications}
@z

@x
Docker streamlines the development lifecycle by allowing developers to work in
standardized environments using local containers which provide your applications
and services. Containers are great for continuous integration and continuous
delivery (CI/CD) workflows.
@y
Docker は開発のライフサイクルを効率化します。
開発するアプリケーションやサービスがローカルなコンテナー内に実現でき、開発者は標準化された環境により作業が進められるからです。
コンテナーを使った開発は、継続的インテグレーション (continuous integration; CI) や継続的開発 (continuous development; CD) のワークフローに適しています。
@z

@x
Consider the following example scenario:
@y
以下のようなシナリオ例を考えてみてください。
@z

@x
- Your developers write code locally and share their work with their colleagues
  using Docker containers.
- They use Docker to push their applications into a test environment and run
  automated and manual tests.
- When developers find bugs, they can fix them in the development environment
  and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as
  pushing the updated image to the production environment.
@y
- 開発者がローカルでコードを書き、仲間とその作業を共有するために Docker コンテナーを使います。
- Docker によりアプリケーションをテスト環境に投入し、自動および手動のテストを実行します。
- 開発者がバグを発見したら、開発環境においてこれを修正して、アプリケーションをテスト環境に再デプロイし、テスト確認を行ないます。
- テストが完了します。この後にユーザーが修正版を利用できるようにすることは、更新済イメージを本番環境へ投入することと同じく容易なことです。
@z

@x
### Responsive deployment and scaling
@y
### 迅速なデプロイとスケーリング {#responsive-deployment-and-scaling}
@z

@x
Docker's container-based platform allows for highly portable workloads. Docker
containers can run on a developer's local laptop, on physical or virtual
machines in a data center, on cloud providers, or in a mixture of environments.
@y
Docker によるコンテナーベースのプラットフォームは、処理負荷の高度な分散を考慮しています。
Docker コンテナーは、開発者のノートパソコン上で実行できるだけでなく、データセンターの物理マシンや仮想マシン、クラウドプロバイダー、そしてさまざまな環境の組み合わせにおいて実行可能です。
@z

@x
Docker's portability and lightweight nature also make it easy to dynamically
manage workloads, scaling up or tearing down applications and services as
business needs dictate, in near real time.
@y
Docker の可搬性と軽量な特性は、以下のようなことを容易に実現します。
それは処理負荷を動的に管理できること、ビジネスシーンでの要求に応じてアプリケーションのスケールアップや提供終了を簡単に、しかもほぼリアルタイムで行うことができます。
@z

@x
### Running more workloads on the same hardware
@y
### 同一ハードウェア上にて負荷の高い処理を実行 {#running-more-workloads-on-the-same-hardware}
@z

@x
Docker is lightweight and fast. It provides a viable, cost-effective alternative
to hypervisor-based virtual machines, so you can use more of your server
capacity to achieve your business goals. Docker is perfect for high density
environments and for small and medium deployments where you need to do more with
fewer resources.
@y
Docker は軽量かつ高速です。
ハイパーバイザーベースの仮想マシンに取って変わる、実用的で費用対効果の高いものです。
したがってコンピューター性能をフルに活用してビジネス目標を達成できます。
Docker は高度に処理集中する環境に適しており、さらには中小規模の、より少ないリソースの中でのシステム構築にも適しています。
@z

@x
## Docker architecture
@y
## Docker アーキテクチャー {#docker-architecture}
@z

@x
Docker uses a client-server architecture. The Docker client talks to the
Docker daemon, which does the heavy lifting of building, running, and
distributing your Docker containers. The Docker client and daemon can
run on the same system, or you can connect a Docker client to a remote Docker
daemon. The Docker client and daemon communicate using a REST API, over UNIX
sockets or a network interface. Another Docker client is Docker Compose,
that lets you work with applications consisting of a set of containers.
@y
Docker はクライアントサーバー型のアーキテクチャーを採用しています。
Docker クライアントは Docker デーモンに処理を依頼します。
このデーモンは、Docker コンテナーの構築、実行、配布という複雑な仕事をこなします。
Docker クライアントとデーモンは同一システム上で動かすことも可能ですが、別のシステム上であっても、Docker クライアントからリモートにある Docker デーモンへのアクセスが可能です。
Docker クライアントとデーモンの間の通信には REST API が利用され、UNIX ソケットまたはネットワークインターフェイスを介して行われます。
もう 1 つの Docker クライアントとなるのが Docker Compose です。
これを使えば複数コンテナーからなるアプリケーションを動作させることができます。
@z

@x
![Docker Architecture diagram](images/docker-architecture.webp)
@y
![Docker アーキテクチャー構成図](images/docker-architecture.webp)
@z

@x
### The Docker daemon
@y
### Docker デーモン {#the-docker-daemon}
@z

@x
The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker
objects such as images, containers, networks, and volumes. A daemon can also
communicate with other daemons to manage Docker services.
@y
Docker デーモン（`dockerd`）は Docker API リクエストを受け付け、イメージ、コンテナー、ネットワーク、ボリュームといった Docker オブジェクトを管理します。
また Docker サービスを管理するため、他のデーモンとも通信を行います。
@z

@x
### The Docker client
@y
### Docker クライアント {#the-docker-client}
@z

@x
The Docker client (`docker`) is the primary way that many Docker users interact
with Docker. When you use commands such as `docker run`, the client sends these
commands to `dockerd`, which carries them out. The `docker` command uses the
Docker API. The Docker client can communicate with more than one daemon.
@y
Docker クライアント（`docker`）は Docker とのやりとりを行うために、たいていのユーザーが利用するものです。
`docker run`のようなコマンドが実行されると、Docker クライアントは`dockerd`にそのコマンドを伝えます。
そして`dockerd`はその内容を実現します。
`docker`コマンドは Docker API を利用しています。
Docker クライアントは複数のデーモンと通信することができます。
@z

@x
### Docker Desktop
@y
### Docker Desktop {#docker-desktop}
@z

@x
Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (`dockerd`), the Docker client (`docker`), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see [Docker Desktop](../desktop/index.md).
@y
Docker Desktop は Mac、Windows、Linux の各環境に簡単にインストールできるアプリケーションです。
これを使って、コンテナー化アプリケーションやマイクロサービスをビルドし共有することができます。
Docker Desktop には Docker daemon (`dockerd`)、Docker クライアント (`docker`)、Docker Compose、Docker Content Trust、Kubernetes、Credential Helper が含まれます。
より詳しくは [Docker Desktop](../desktop/index.md) を参照してください。
@z

@x
### Docker registries
@y
### Docker レジストリ {#docker-registries}
@z

@x
A Docker registry stores Docker images. Docker Hub is a public
registry that anyone can use, and Docker looks for images on
Docker Hub by default. You can even run your own private registry.
@y
Docker レジストリは Docker イメージを保管します。
Docker Hub と Docker Cloud は公開レジストリであり、誰でも利用可能です。
また  Docker はデフォルトで Docker Hub のイメージを探します。
独自にプライベートレジストリを運用することもできます。
@z

@x
When you use the `docker pull` or `docker run` commands, Docker pulls the required images from your configured registry. When you use the `docker push` command, Docker pushes
your image to your configured registry.
@y
`docker pull`や`docker run`コマンドを使うと、設定されたレジストリから必要なイメージを取得します。
`docker push`コマンドを使えば、イメージを指定したレジストリに送信します。
@z

@x
### Docker objects
@y
### Docker オブジェクト {#docker-objects}
@z

@x
When you use Docker, you are creating and using images, containers, networks,
volumes, plugins, and other objects. This section is a brief overview of some
of those objects.
@y
Docker の利用時は、イメージ、コンテナー、ネットワーク、ボリューム、プラグイン、その他のオブジェクトを作成、利用します。
このセクションは各オブジェクトの概要を説明します。
@z

@x
#### Images
@y
#### イメージ {#images}
@z

@x
An image is a read-only template with instructions for creating a Docker
container. Often, an image is based on another image, with some additional
customization. For example, you may build an image which is based on the `ubuntu`
image, but installs the Apache web server and your application, as well as the
configuration details needed to make your application run.
@y
イメージとは、Docker コンテナーを作成する命令が入った読み込み専用のテンプレートです。
通常イメージは、他のイメージをベースにしてそれをカスタマイズして利用します。
たとえば`ubuntu`イメージをベースとするイメージを作ったとします。
そこには Apache ウェブサーバーや自開発したアプリケーションといったものをインストールするかもしれません。
さらにアプリケーション実行に必要となる詳細な設定も加えることにもなるでしょう。
@z

@x
You might create your own images or you might only use those created by others
and published in a registry. To build your own image, you create a Dockerfile
with a simple syntax for defining the steps needed to create the image and run
it. Each instruction in a Dockerfile creates a layer in the image. When you
change the Dockerfile and rebuild the image, only those layers which have
changed are rebuilt. This is part of what makes images so lightweight, small,
and fast, when compared to other virtualization technologies.
@y
イメージは作ろうと思えば作ることができ、他の方が作ってレジストリに公開されているイメージを使うということもできます。
イメージを自分で作る場合は Dockerfile というファイルを生成します。
このファイルの文法は単純なものであり、そこにはイメージを生成して実行するまでの手順が定義されます。
Dockerfile 内の個々の命令ごとに、イメージ内にはレイヤーというものが生成されます。
Dockerfile の内容を書き換えたことでイメージが再構築されるときには、変更がかかったレイヤーのみが再生成されます。
他の仮想化技術に比べて Dockerイメージというものが軽量、小さい、早いを実現できているのも、そういった部分があるからです。
@z

@x
#### Containers
@y
#### コンテナー {#containers}
@z

@x
A container is a runnable instance of an image. You can create, start, stop,
move, or delete a container using the Docker API or CLI. You can connect a
container to one or more networks, attach storage to it, or even create a new
image based on its current state.
@y
コンテナーとは、イメージが実行状態となったインスタンスのことです。
コンテナーに対する生成、実行、停止、移動、削除は Docker API や CLI を使って行われます。
コンテナーは、複数のネットワークへの接続、ストレージの追加を行うことができ、さらには現時点の状態にもとづいた新たなイメージを生成することもできます。
@z

@x
By default, a container is relatively well isolated from other containers and
its host machine. You can control how isolated a container's network, storage,
or other underlying subsystems are from other containers or from the host
machine.
@y
デフォルトでは、コンテナーは他のコンテナーやホストマシンとは、程よく分離されています。
コンテナーに属するネットワーク、ストレージ、基盤となるサブシステムなどを、いかにして他のコンテナーやホストマシンから切り離すか、その程度は制御することが可能です。
@z

@x
A container is defined by its image as well as any configuration options you
provide to it when you create or start it. When a container is removed, any changes to
its state that aren't stored in persistent storage disappear.
@y
コンテナーはイメージによって定義されるものです。
またこれを生成、実行するために設定したオプションによっても定義されます。
コンテナーを削除すると、その時点での状態に対して変更がかかっていたとしても、永続的なストレージに保存されていないものは消失します。
@z

@x
##### Example `docker run` command
@y
##### `docker run` コマンド例 {#example-docker-run-command}
@z

@x
The following command runs an `ubuntu` container, attaches interactively to your
local command-line session, and runs `/bin/bash`.
@y
次のコマンドは`ubuntu`コンテナーを実行し、ローカルのコマンドライン処理のセッションを結びつけます。
そして`/bin/bash`を実行します。
@z

@x
```console
$ docker run -i -t ubuntu /bin/bash
```
@y
```console
$ docker run -i -t ubuntu /bin/bash
```
@z

@x
When you run this command, the following happens (assuming you are using
the default registry configuration):
@y
このコマンドを実行すると、以下が発生します（レジストリから入手した際のデフォルトの設定を使用しているものとします）。
@z

@x
1.  If you don't have the `ubuntu` image locally, Docker pulls it from your
    configured registry, as though you had run `docker pull ubuntu` manually.
@y
1.  `ubuntu`イメージがローカルになければ、Docker は設定されているレジストリからイメージを取得します。
    この動作は手動で`docker pull ubuntu`を実行するのと同じです。
@z

@x
2.  Docker creates a new container, as though you had run a `docker container create`
    command manually.
@y
2.  Docker は新しいコンテナーを生成します。
    これは手動で`docker create`コマンドを実行することと同じです。
@z

@x
3.  Docker allocates a read-write filesystem to the container, as its final
    layer. This allows a running container to create or modify files and
    directories in its local filesystem.
@y
3.  Docker はコンテナーに対して読み書きが可能なファイルシステムを割り当てます。
    これが最終的にレイヤーとなります。
    このことによりコンテナーの稼動中に、ローカルなファイルシステム内でのファイルやディレクトリの生成や変更などが実現されます。
@z

@x
4.  Docker creates a network interface to connect the container to the default
    network, since you didn't specify any networking options. This includes
    assigning an IP address to the container. By default, containers can
    connect to external networks using the host machine's network connection.
@y
4.  Docker はネットワークインターフェースを生成し、コンテナーをデフォルトネットワークに接続します。
    ここではネットワークオプションを指定していないものとしているためです。
    このときには、コンテナーに対しての IP アドレスの割り当ても行われます。
    デフォルトでコンテナーは、ホストマシンのネットワーク接続を利用して、外部ネットワークに接続します。
@z

@x
5.  Docker starts the container and executes `/bin/bash`. Because the container
    is running interactively and attached to your terminal (due to the `-i` and `-t`
    flags), you can provide input using your keyboard while Docker logs the output to
    your terminal.
@y
5.  Docker はコンテナーを起動し、`/bin/bash`を実行します。
    （`-i`と`-t`のフラグにより）対話的に、かつターミナル画面に接続するようにして実行しているため、手元のキーボードを使って入力することができ、ターミナル画面に出力が行われるようになります。
@z

@x
6.  When you run `exit` to terminate the `/bin/bash` command, the container
    stops but isn't removed. You can start it again or remove it.
@y
6.  `exit`を入力すると`/bin/bash`コマンドは終了します。
    コンテナーは停止状態となりますが、削除はされません。
    コンテナーは再起動したり削除することもできます。
@z

@x
## The underlying technology
@y
## 基盤とする技術 {#the-underlying-technology}
@z

@x
Docker is written in the [Go programming language](https://golang.org/) and takes
advantage of several features of the Linux kernel to deliver its functionality.
Docker uses a technology called `namespaces` to provide the isolated workspace
called the container. When you run a container, Docker creates a set of
namespaces for that container.
@y
Docker は [Go プログラミング言語](https://golang.org/) で書かれており、Linux カーネルの機能をうまく活用して、さまざまな機能性を実現しています。
Docker は名前空間という技術を利用してコンテナーと呼ぶ作業空間を分離して提供します。
コンテナーが実行されたとき、Docker はそのコンテナーに対して複数の名前空間を生成します。
@z

@x
These namespaces provide a layer of isolation. Each aspect of a container runs
in a separate namespace and its access is limited to that namespace.
@y
名前空間はいくつもの分離状態を作り出します。
コンテナー内のさまざまな処理は、分離された名前空間内にて実行され、それぞれへのアクセスはその名前空間内に限定されます。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
- [Install Docker](../get-docker.md)
- [Get started with Docker](index.md)
@y
- [Docker のインストール](../get-docker.md)
- [Docker をはじめよう](index.md)
@z
