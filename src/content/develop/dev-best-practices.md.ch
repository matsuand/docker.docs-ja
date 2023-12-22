%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker development best practices
description: Rules of thumb for making your life easier as a Docker application developer
keywords: application, development
---
@y
---
title: Docker 開発のベストプラクティス
description: Rules of thumb for making your life easier as a Docker application developer
keywords: application, development
---
@z

@x
The following development patterns have proven to be helpful for people
building applications with Docker. 
@y
Docker を使ってアプリケーション開発を行う方々にとって、以下に示す開発パターンが有効であることが明らかになっています。
@z

@x
<!-- markdownlint-disable-next-line -->
If you have discovered something we should add, [let us know]({{% param "repo" %}}/issues/new?template=doc_issue.yml&labels=status%2Ftriage).
@y
<!-- markdownlint-disable-next-line -->
何かを見つけている場合は [お知らせください]({{% param "repo" %}}/issues/new?template=doc_issue.yml&labels=status%2Ftriage)。
@z

@x
## How to keep your images small
@y
## どうやってイメージを小さく保つか {#how-to-keep-your-images-small}
@z

@x
Small images are faster to pull over the network and faster to load into
memory when starting containers or services. There are a few rules of thumb to
keep image size small:
@y
イメージが小さければネットワークからの取得が速くなります。
またコンテナーやサービスの起動時に、メモリへのロードも速くなります。
イメージを小さく保つ経験則をいくつか示します。
@z

@x
- Start with an appropriate base image. For instance, if you need a JDK,
  consider basing your image on a Docker Official Image which includes OpenJDK,
  such as `eclipse-temurin`, rather than building your own image from scratch.
@y
- 適切なイメージをベースとして始めます。
  たとえば JDK を必要とするのであれば、Docker 公式イメージの中から OpenJDK を含むイメージ、たとえば `eclipse-temurin` を用いるようにします。
  逆に独自のイメージを一から作らないようにします。
@z

@x
- [Use multistage builds](../build/building/multi-stage.md). For
  instance, you can use the `maven` image to build your Java application, then
  reset to the `tomcat` image and copy the Java artifacts into the correct
  location to deploy your app, all in the same Dockerfile. This means that your
  final image doesn't include all of the libraries and dependencies pulled in by
  the build, but only the artifacts and the environment needed to run them.
@y
- [マルチステージビルド](__SUBDIR__/build/building/multi-stage/) を利用します。
  たとえば `maven` イメージを使うと Java アプリケーションを構築することができます。
  これを `tomcat` イメージとして作り直して、Java アプリのコード類を適切な場所に配置してデプロイできるようにします。
  これをすべて同一の Dockerfile 内で行います。
  これはつまり最終的なイメージがビルドされたら、そのイメージ内には、元々のイメージ取得時に存在していたライブラリや依存パッケージがすべて含まれるわけではなく、実行時に必要なモジュールや環境のみが含まれるということを意味します。
@z

@x
  - If you need to use a version of Docker that does not include multistage
    builds, try to reduce the number of layers in your image by minimizing the
    number of separate `RUN` commands in your Dockerfile. You can do this by
    consolidating multiple commands into a single `RUN` line and using your
    shell's mechanisms to combine them together. Consider the following two
    fragments. The first creates two layers in the image, while the second
    only creates one.
@y
  - マルチステージビルドの機能を持たない Docker バージョンを使う必要があるときには、イメージ内に作られるレイヤー数を減らすようにしてください。
    これは Dockerfile 内での `RUN` コマンドの実行が、できるだけ分断されないように、その実行数を最小化します。
    これを実現するには、複数の `RUN` コマンドはできるだけ 1 つの `RUN` コマンドとなるように、シェルの機能を使って互いに連結させます。
    たとえば以下のような 2 つのコマンド実行例があったとします。
    1 つめのコマンドは、イメージ内に 2 つのレイヤーを生成しますが、2 つめのコマンドはレイヤーが 1 つで済みます。
@z

@x
    ```dockerfile
    RUN apt-get -y update
    RUN apt-get install -y python
    ```
@y
    ```dockerfile
    RUN apt-get -y update
    RUN apt-get install -y python
    ```
@z

@x
    ```dockerfile
    RUN apt-get -y update && apt-get install -y python
    ```
@y
    ```dockerfile
    RUN apt-get -y update && apt-get install -y python
    ```
@z

@x
- If you have multiple images with a lot in common, consider creating your own
  [base image](../build/building/base-images.md) with the shared
  components, and basing your unique images on that. Docker only needs to load
  the common layers once, and they are cached. This means that your
  derivative images use memory on the Docker host more efficiently and load more
  quickly.
@y
- 共有するイメージがたくさんある場合は、[ベースイメージ](__SUBDIR__/build/building/base-images/) を作ることを考えてみてください。
  これを用いてコンポーネントを共有し、これをベースとした独自のイメージを作っていくことができます。
  Docker は共通するレイヤーであれば 1 度しかロードする必要がなく、ロードした内容はキャッシュされます。
  つまりベースイメージから派生させたイメージは、Docker ホスト上でのメモリ利用が効率よく行われ、ロードもすばやく行われることになります。
@z

@x
- To keep your production image lean but allow for debugging, consider using the
  production image as the base image for the debug image. Additional testing or
  debugging tooling can be added on top of the production image.
@y
- 本番環境向けのイメージはスリムにしたいものの、デバッグは可能にしたいといった場合は、デバッグ環境向けとして、本番環境イメージをベースイメージとすることを考えてみてください。
  さらにテストやデバッグツールを加えたい場合でも、本番環境イメージの上に追加ができます。
@z

@x
- When building images, always tag them with useful tags which codify version
  information, intended destination (`prod` or `test`, for instance), stability,
  or other information that's useful when deploying the application in
  different environments. Don't rely on the automatically-created `latest` tag.
@y
- イメージをビルドする場合には、常にわかりやすいタグをつけるようにします。
  このタグを用いて、バージョン情報をコード化したり、目的とする用途（たとえば `prod` や `test` など）や安定性など、いろいろな情報を付与したりします。
  こうしておけば、アプリケーションをさまざまな環境にデプロイする際にわかりやすくなります。
  自動的に生成される `latest` タグには頼らないようにします。
@z

@x
## Where and how to persist application data
@y
## アプリケーションデータはどこにどう保存するか {#where-and-how-to-persist-application-data}
@z

@x
- Avoid storing application data in your container's writable layer using
  [storage drivers](../storage/storagedriver/select-storage-driver.md). This increases the
  size of your container and is less efficient from an I/O perspective than
  using volumes or bind mounts.
- Instead, store data using [volumes](../storage/volumes.md).
- One case where it's appropriate to use
  [bind mounts](../storage/bind-mounts.md) is during development,
  when you may want to mount your source directory or a binary you just built
  into your container. For production, use a volume instead, mounting it into
  the same location as you mounted a bind mount during development.
- For production, use [secrets](../engine/swarm/secrets.md) to store sensitive
  application data used by services, and use [configs](../engine/swarm/configs.md)
  for non-sensitive data such as configuration files. If you currently use
  standalone containers, consider migrating to use single-replica services, so
  that you can take advantage of these service-only features.
@y
- [ストレージドライバー](__SUBDIR__/storage/storagedriver/select-storage-driver/) によって、コンテナーの書き込み可能レイヤーへデータ保存を行うことができますが、アプリケーションデータの保存を行うことは**避けます**。
  これを行ってしまうと、コンテナーのサイズが増えることになり、I/O 観点で言えば、ボリュームやバインドマウントを用いることに比べて非効率なものになります。
- そのかわりに、データ保存は [ボリューム](__SUBDIR__/storage/volumes/) を利用します。
- [バインドマウント](__SUBDIR__/storage/bind-mounts/) を用いるのが適当な例として、開発時での利用が考えられます。
  開発時には、ソースディレクトリや生成したばかりのバイナリを、コンテナー内にマウントしたくなります。
  本番環境ではボリュームを利用しますが、本番環境がマウントする同じ場所を、開発環境時はバインドマウントによりマウントします。
- 本番環境において、サービスが機密情報を利用している場合、その保存には [secrets](__SUBDIR__/engine/swarm/secrets/) を利用します。
  そして機密情報ではない設定ファイルなどの情報は [configs](__SUBDIR__/engine/swarm/configs/) を利用します。
  今利用しているコンテナーがスタンドアロンである場合は、1 つのレプリカからなるサービスコンテナーに移行することを考えてみてください。
  これを行うと、サービスコンテナーのみに提供される機能を活用することができます。
@z

@x
## Use CI/CD for testing and deployment
@y
## テストやデプロイ時の CI/CD 利用 {#use-cicd-for-testing-and-deployment}
@z

@x
- When you check in a change to source control or create a pull request, use
  [Docker Hub](../docker-hub/builds/index.md) or
  another CI/CD pipeline to automatically build and tag a Docker image and test
  it.
@y
- ソース管理上の変更を確認したりプルリクエストを生成したりする場合には、[Docker Hub](__SUBDIR__/docker-hub/builds/) やこれに似た別の CI/CD を利用し、自動的なイメージビルド、タグづけ、テストを行うようにしてください。
@z

@x
- Take this even further by requiring your development, testing, and
  security teams to [sign images](../engine/reference/commandline/trust.md)
  before the teams deploy the images into production. This way, before an image is
  deployed into production, it has been tested and signed off by, for instance,
  development, quality, and security teams.
@y
- 開発、テスト、セキュリティチームによる [イメージ認証](__SUBDIR__/engine/reference/commandline/trust/) といった必要に応じて、上のことをより一層進め、 本番環境へのデプロイを行ってください。
  こうする場合に、イメージを本番環境にデプロイするのであれば、たとえば開発、品質管理、セキュリティの各チームにおいて十分にテストされ承認されていなければなりません。
@z

@x
## Differences in development and production environments
@y
## 開発環境と本番環境の違い {#differences-in-development-and-production-environments}
@z

@x
| Development                                                         | Production                                                                                                                                                                                                                                       |
|:--------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Use bind mounts to give your container access to your source code.  | Use volumes to store container data.                                                                                                                                                                                                             |
| Use Docker Desktop for Mac, Linux, or Windows.           | Use Docker Engine, if possible with [userns mapping](../engine/security/userns-remap.md) for greater isolation of Docker processes from host processes.                                                                                          |
@y
| 開発環境                                                                          | 本番環境                                                                                                                                                                                           |
|:----------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| バインドマウントを用いて、コンテナーからソースコードへアクセスできるようにします。| ボリュームを利用してコンテナーデータを保存します。                                                                                                                                                 |
| Docker Desktop for Mac, Linux, or Windows を利用します。                          | 可能であれば Docker Engine を利用してください。[userns mapping](__SUBDIR__/engine/security/userns-remap/) を利用すると、ホストプロセスからの Docker プロセスの独立性をさらに高めることになります。 |
@z
