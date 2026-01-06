%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: How Compose works
@y
title: Compose はどのように動作するか
@z

@x
description: Learn how Docker Compose works, from the application model to Compose files and CLI, whilst following a detailed example.
keywords: docker compose, compose.yaml, docker compose model, compose cli, multi-container application, compose example 
@y
description: Learn how Docker Compose works, from the application model to Compose files and CLI, whilst following a detailed example.
keywords: docker compose, compose.yaml, docker compose model, compose cli, multi-container application, compose example 
@z

@x
With Docker Compose you use a YAML configuration file, known as the [Compose file](#the-compose-file), to configure your application’s services, and then you create and start all the services from your configuration with the [Compose CLI](#cli). 
@y
Docker Compose では YAML 形式の設定ファイルを用います。
これを [Compose ファイル](#the-compose-file) と呼びます。
この設定ファイルではアプリケーションサービスを設定します。
この設定ファイルから [Compose CLI](#cli) を使って、サービスすべてを生成して起動します。
@z

@x
The Compose file, or `compose.yaml` file, follows the rules provided by the [Compose Specification](/reference/compose-file/_index.md) in how to define multi-container applications. This is the Docker Compose implementation of the formal [Compose Specification](https://github.com/compose-spec/compose-spec). 
@y
Compose ファイルは `compose.yaml` というものであり [Compose 仕様](reference/compose-file/_index.md) というものに基づいた規則に従って記述します。
マルチコンテナーアプリケーションの定義方法もそこで定義します。
Docker Compose は [Compose 仕様](https://github.com/compose-spec/compose-spec) に従った公式の実装です。
@z

@x
{{< accordion title="The Compose application model" >}}
@y
{{< accordion title="Compose アプリケーションモデル" >}}
@z

@x
Computing components of an application are defined as [services](/reference/compose-file/services.md). A service is an abstract concept implemented on platforms by running the same container image, and configuration, one or more times.
@y
アプリケーションの処理コンポーネントは [services](reference/compose-file/services.md) として定義されます。
サービスというものは抽象的な概念であって、一まとまりのコンテナー、イメージ、設定が複数起動されることで、プラットフォーム上に実装されます。
@z

@x
Services communicate with each other through [networks](/reference/compose-file/networks.md). In the Compose Specification, a network is a platform capability abstraction to establish an IP route between containers within services connected together.
@y
サービスは [ネットワーク](reference/compose-file/networks.md) を通して互いに通信を行います。
Compose 仕様においてネットワークとはプラットフォーム機能の抽象化であり、サービス内において接続されたコンテナー間での IP ルートを確立します。
@z

@x
Services store and share persistent data into [volumes](/reference/compose-file/volumes.md). The Specification describes such a persistent data as a high-level filesystem mount with global options. 
@y
サービスは永続的なデータを保存したり共有したりするために [ボリューム](reference/compose-file/volumes.md) を利用します。
Compose 仕様ではそのような永続的データを、高度なファイルシステムマウントとして説明しています。
@z

@x
Some services require configuration data that is dependent on the runtime or platform. For this, the Specification defines a dedicated [configs](/reference/compose-file/configs.md) concept. From inside the container, configs behave like volumes—they’re mounted as files. However, configs are defined differently at the platform level.
@y
サービスの中には、プラットフォーム依存あるいは実行時に用いられる設定データを必要とするものがあります。
これに対して Compose 仕様では、それを扱う専用の  [configs](reference/compose-file/configs.md) という考え方を提供しています。
コンテナー内部からしてみたら、configs はさもボリュームであるかのように、つまりファイルとしてマウントされているかのように取り扱われます。
ただし configs はそうではない、プラットフォームレベルのものとして定義されます。
@z

@x
A [secret](/reference/compose-file/secrets.md) is a specific flavor of configuration data for sensitive data that should not be exposed without security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose Specification.
@y
[secret](reference/compose-file/secrets.md) とは、機密情報を取り扱う特殊な設定データのことです。
セキュリティを考慮していない場面では、表に出してはいけない情報です。
secret はコンテナーにマウントされたファイルとして、サービスが利用可能となります。
プラットフォームのリソースとして機密情報を提供するものですが、Compose 仕様に基づいた特有の概念と定義に基づく固有情報として位置づけられます。
@z

@x
> [!NOTE]
>
> With volumes, configs and secrets you can have a simple declaration at the top-level and then add more platform-specific information at the service level.
@y
> [!NOTE]
>
> ボリューム、configs、secrets を使えば、トップレベルにおいて簡単に定義することができ、さらにサービスレベルにおいてプラットフォーム固有の情報を追加することもできます。
@z

@x
A project is an individual deployment of an application specification on a platform. A project's name, set with the top-level [`name`](/reference/compose-file/version-and-name.md) attribute, is used to group
resources together and isolate them from other applications or other installation of the same Compose-specified application with distinct parameters. If you are creating resources on a platform, you must prefix resource names by project and
set the label `com.docker.compose.project`.
@y
プロジェクトというものは、1 つのプラットフォーム上に実現されたアプリケーション仕様を、1 つの個別のデプロイメントとして作り出したものと言えます。
プロジェクト名は、トップレベルにおいて [`name`](reference/compose-file/version-and-name.md) 属性によって指定します。
プロジェクト名はリソースを 1 つに取りまとめるものとなります。
また同時に、他のアプリケーション、あるいは同じ Compose 仕様のアプリケーションであっても異なるパラメーターでインストールされたものとは完全に分離させるためにもあります。
特定のプラットフォーム上にリソースを生成したら、プロジェクトごとにリソース名をつけて `com.docker.compose.project` といったラベルを設定する必要があります。
@z

@x
Compose offers a way for you to set a custom project name and override this name, so that the same `compose.yaml` file can be deployed twice on the same infrastructure, without changes, by just passing a distinct name.
@y
Compose ではカスタムプロジェクト名の指定が可能であり、これを上書き設定することができます。
したがって一つの `compose.yaml` ファイルから、同一のインフラストラクチャー上に二つのデプロイを行うことが可能となり、その際には内容を変えることなく、単に別の名前を受け渡すだけで実現できます。
@z

@x
{{< /accordion >}} 
@y
{{< /accordion >}} 
@z

@x
## The Compose file
@y
## Compose ファイル {#the-compose-file}
@z

@x
The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory.
Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions.
If both files exist, Compose prefers the canonical `compose.yaml`.
@y
Compose ファイルのデフォルト名は `compose.yaml` (推奨) または `compose.yml` であり、ワーキングディレクトリに置きます。
Compose では旧版との後方互換のため `docker-compose.yaml` や `docker-compose.yml` もサポートしています。
そういったファイルが複数存在する場合 Compose は、推奨する `compose.yaml` を採用します。
@z

@x
You can use [fragments](/reference/compose-file/fragments.md) and [extensions](/reference/compose-file/extension.md) to keep your Compose file efficient and easy to maintain.
@y
Compose ファイルにおいて [fragments](reference/compose-file/fragments.md) や [extensions](reference/compose-file/extension.md) を利用すれば、Compose ファイルを効率よく保守しやすく管理することができます。
@z

@x
Multiple Compose files can be [merged](/reference/compose-file/merge.md) together to define the application model. The combination of YAML files is implemented by appending or overriding YAML elements based on the Compose file order you set. 
Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative
paths are resolved based on the first Compose file's parent folder, whenever complementary files being
merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to
the expanded form. For more information, see [Working with multiple Compose files](/manuals/compose/how-tos/multiple-compose-files/_index.md).
@y
Compose ファイルを複数 [マージ](reference/compose-file/merge.md) して、アプリケーションモデルを定義することができます。
複数の YAML 設定ファイルの組み合わせ方は、Compose ファイルの指定順に従って YAML 設定項目が追加されたり上書きされたりします。
単純な属性やマップであれば、最終の Compose ファイルによって上書きされます。
リストであれば追加されマージされます。
相対パスは、一番初めの Compose ファイルの親フォルダーに基づいて決定されます。
マージされるファイルが補助的なものであって、それが別フォルダーに置かれていればなおさらです。
Compose ファイル内の記述要素は単純な文字列の場合もあれば、複雑なオブジェクトにより表現される場合もあります。
その場合のマージは展開された後の形で適用されます。
詳しくは [複数 Compose ファイルでの作業](manuals/compose/how-tos/multiple-compose-files/_index.md) を参照してください。
@z

@x
If you want to reuse other Compose files, or factor out parts of your application model into separate Compose files, you can also use [`include`](/reference/compose-file/include.md). This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.
@y
別の Compose ファイルを再利用したり、あるいはアプリケーションモデルの一部を個別の Compose ファイルに分割したい場合は [`include`](reference/compose-file/include.md) を利用します。
Compose アプリケーションが他チームの管理するアプリケーションに依存していたり、他チームとの共有が必要なものであったりする場合には、この手法が活用できます。
@z

@x
## CLI
@y
## CLI
@z

@x
The Docker CLI lets you interact with your Docker Compose applications through the `docker compose` command and its subcommands. If you're using Docker Desktop, the Docker Compose CLI is included by default.
@y
Docker CLI は `docker compose` およびそのサブコマンドを通じて、Docker Compose アプリケーションとの対話を行うために用います。
Docker Desktop を利用している場合、Docker Compose CLI はデフォルトで含まれています。
@z

@x
Using the CLI, you can manage the lifecycle of your multi-container applications defined in the `compose.yaml` file. The CLI commands enable you to start, stop, and configure your applications effortlessly.
@y
CLI を使えば `compose.yaml` ファイルにマルチコンテナーアプリケーションが定義されていても、そのライフサイクルを管理できます。
CLI からはアプリケーションの起動、停止、設定を簡単に行うことができます。
@z

@x
### Key commands 
@y
### 主要なコマンド {#key-commands}
@z

@x
To start all the services defined in your `compose.yaml` file:
@y
`compose.yaml` ファイル内に定義されたサービスをすべて起動します。
@z

% snip command...

@x
To stop and remove the running services:
@y
実行中のサービスを停止して削除します。
@z

% snip command...

@x
If you want to monitor the output of your running containers and debug issues, you can view the logs with: 
@y
実行中のコンテナーの出力を確認したりデバッグをしたりする場合は、以下のコマンドを実行してログを参照します。
@z

% snip command...

@x
To list all the services along with their current status:
@y
全サービスとそのステータスを一覧表示します。
@z

% snip command...

@x
For a full list of all the Compose CLI commands, see the [reference documentation](/reference/cli/docker/compose/_index.md).
@y
Compose CLI コマンドの全一覧は [リファレンスドキュメント](reference/cli/docker/compose/_index.md) を参照してください。
@z

@x
## Illustrative example
@y
## イラストで示す例 {#illustrative-example}
@z

@x
The following example illustrates the Compose concepts outlined above. The example is non-normative.
@y
以下の例は、上述した Compose の概要をイラストを使って説明するものです。
なお本例は模範的なものではありません。
@z

@x
Consider an application split into a frontend web application and a backend service.
@y
アプリケーションが、フロントエンドのウェブアプリケーションとバックエンドのサービスに分かれているとします。
@z

@x
The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.
@y
フロントエンドは実行時に HTTP の設定ファイルによって定まります。
これはインフラストラクチャーが管理するものです。
HTTP 設定ファイルでは外部ドメイン名を設定し、プラットフォームにおけるセキュアな機密情報ストアから定まる HTTPS サーバー証明書を使用しています。
@z

@x
The backend stores data in a persistent volume.
@y
バックエンドにおけるデータは、永続的なボリュームに保存されます。
@z

@x
Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.
@y
2 つのサービスは独立した back-tier ネットワーク上において互いに通信を行います。
またフロントエンドは front-tier ネットワークにも接続して、外部からの接続向けにポート 443 番を利用します。
@z

@x
![Compose application example](../images/compose-application.webp)
@y
![Compose アプリケーションの例](../images/compose-application.webp)
@z

@x
The example application is composed of the following parts:
@y
このアプリケーション例では、以下の部分から構成されます。
@z

@x
- Two services, backed by Docker images: `webapp` and `database`
- One secret (HTTPS certificate), injected into the frontend
- One configuration (HTTP), injected into the frontend
- One persistent volume, attached to the backend
- Two networks
@y
- Docker イメージに定義された 2 つのサービス、`webapp` と `database`
- フロントエンドにて用いられる 1 つの機密情報 (HTTPS 証明書)
- フロントエンドにて用いられる 1 つの設定 (HTTP)
- バックエンドに結びつけられる 1 つの永続的ボリューム
- 2 つのネットワーク
@z

@x within code
  # The presence of these objects is sufficient to define them
@y
  # The presence of these objects is sufficient to define them
@z

@x
The `docker compose up` command starts the `frontend` and `backend` services, creates the necessary networks and volumes, and injects the configuration and secret into the frontend service.
@y
`docker compose up` コマンドを実行すると `frontend` と `backend` というサービスが起動します。
また必要となるネットワークとボリュームを生成し、設定ファイルと機密情報をフロントエンドサービスに提供します。
@z

@x
`docker compose ps` provides a snapshot of the current state of your services, making it easy to see which containers are running, their status, and the ports they are using:
@y
`docker compose ps` はサービスの状態を確認します。
実行中のサービスは何か、どのような状態にあるか、利用ポートは何かがわかります。
@z

% snip text...

@x
## What's next 
@y
## 次は何？ {#whats-next}
@z

@x
- [Try the Quickstart guide](/manuals/compose/gettingstarted.md)
- [Explore some sample applications](https://github.com/docker/awesome-compose)
- [Familiarize yourself with the Compose Specification](/reference/compose-file/_index.md)
@y
- [クィックスタートガイドを始める](manuals/compose/gettingstarted.md)
- [サンプルアプリケーションの確認](https://github.com/docker/awesome-compose)
- [Compose 仕様について学ぶ](reference/compose-file/_index.md)
@z
