%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Overview of a Dockerfile and introduction to best practices
keywords: parent image, images, dockerfile, best practices, hub, official image
title: Overview of best practices for writing Dockerfiles
aliases:
- /articles/dockerfile_best-practices/
- /engine/articles/dockerfile_best-practices/
- /docker-cloud/getting-started/intermediate/optimize-dockerfiles/
- /docker-cloud/tutorials/optimize-dockerfiles/
- /engine/userguide/eng-image/dockerfile_best-practices/
---
@y
---
description: Dockerfile の概要とベストプラクティスの導入です。
keywords: parent image, images, dockerfile, best practices, hub, official image
title: Dockerfile 記述のベストプラクティス概要
aliases:
- /articles/dockerfile_best-practices/
- /engine/articles/dockerfile_best-practices/
- /docker-cloud/getting-started/intermediate/optimize-dockerfiles/
- /docker-cloud/tutorials/optimize-dockerfiles/
- /engine/userguide/eng-image/dockerfile_best-practices/
---
@z

@x
This topic covers recommended best practices and methods for building
efficient images. It provides [general guidelines for your Dockerfiles](guidelines.md) and more [specific best practices for each Dockerfile instruction](instructions.md). 
@y
このトピックでは、効果的なイメージを構築するために推奨される方法やベストプラクティスを提供するものです。
具体的には [Dockerfile の一般的ガイドライン](guidelines.md) や、[各 Dockerfile 命令に対する特定のベストプラクティス](instructions.md) について説明します。
@z

@x
## What is a Dockerfile?
@y
## Dockerfile とは何か？ {#what-is-a-dockerfile}
@z

@x
Docker builds images automatically by reading the instructions from a
Dockerfile which is a text file that contains all commands, in order, needed to
build a given image. A Dockerfile adheres to a specific format and set of
instructions which you can find at [Dockerfile reference](../../engine/reference/builder.md).
@y
Docker は Dockerfile に書かれた指示を読み込んで、自動的にイメージを構築します。
このファイルはあらゆる命令を含んだテキストファイルであり、順に処理することで指定されたイメージを構築するために必要となるものです。
Dockerfile は所定のフォーマットや各種の命令に従います。
その内容は [Dockerfile リファレンス](../../engine/reference/builder.md) に示しています。
@z

@x
A Docker image consists of read-only layers each of which represents a
Dockerfile instruction. The layers are stacked and each one is a delta of the
changes from the previous layer. 
@y
Docker イメージは読み取り専用のレイヤーにより構成されます。
個々のレイヤーは Dockerfile の各命令を表現しています。
レイヤーは順に積み上げられ、それぞれは直前のレイヤーからの差分を表わします。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM ubuntu:22.04
COPY . /app
RUN make /app
CMD python /app/app.py
```
@y
FROM ubuntu:22.04
COPY . /app
RUN make /app
CMD python /app/app.py
```
@z

@x
In the example above, each instruction creates one layer:
@y
上の例において各コマンドからは 1 つずつレイヤーが生成されます。
@z

@x
- `FROM` creates a layer from the `ubuntu:22.04` Docker image.
- `COPY` adds files from your Docker client's current directory.
- `RUN` builds your application with `make`.
- `CMD` specifies what command to run within the container.
@y
- `FROM`は Docker イメージ`ubuntu:22.04`からレイヤーを 1 つ生成します。
- `COPY`は Docker クライアントのカレントディレクトリからファイルをコピーします。
- `RUN`は`make`を使ってアプリケーションをビルドします。
- `CMD`はコンテナー内にて実行するコマンドを指定します。
@z

@x
When you run an image and generate a container, you add a new writable layer, also called the container layer, on top of the underlying layers. All changes made to
the running container, such as writing new files, modifying existing files, and
deleting files, are written to this writable container layer.
@y
イメージを実行してコンテナーが生成されると、それまであったレイヤーの上に書き込み可能なレイヤー、いわゆるコンテナーレイヤーが加えられます。
実行されているコンテナーへの変更、つまり新規ファイル生成や既存ファイル編集、ファイル削除などはすべて、この書き込みレイヤーに書き込まれます。
@z

@x
## Additional resources:
@y
## さらなる情報 {#additional-resources}
@z

@x
* [Dockerfile reference](../../engine/reference/builder.md)
* [More about Automated builds](../../docker-hub/builds/index.md)
* [Guidelines for creating Docker Official Images](../../trusted-content/official-images.md)
* [Best practices to containerize Node.js web applications with Docker](https://snyk.io/blog/10-best-practices-to-containerize-nodejs-web-applications-with-docker)
* [More about base images](../../build/building/base-images.md)
* [More on image layers and how Docker builds and stores images](../../storage/storagedriver/index.md).
@y
* [Dockerfile リファレンス](../../engine/reference/builder.md)
* [自動ビルドの詳細](../../docker-hub/builds/index.md)
* [Docker 公式イメージ生成のガイドライン](../../trusted-content/official-images.md)
* [Docker を使った Node.js ウェブアプリケーションコンテナー化のベストプラテクティス](https://snyk.io/blog/10-best-practices-to-containerize-nodejs-web-applications-with-docker)
* [ベースイメージの詳細](../../build/building/base-images.md)
* [イメージレイヤーの詳細、および Docker によるイメージのビルドと保存](../../storage/storagedriver/index.md).
@z

@x
## Examples of Docker Official Images
@y
## Docker 公式イメージの例 {#examples-of-docker-official-images}
@z

@x
These Official Images have exemplary Dockerfiles:
@y
これらの公式イメージには標準的な Dockerfile が記述されています。
@z

@x
* [Go](https://hub.docker.com/_/golang/)
* [Perl](https://hub.docker.com/_/perl/)
* [Hy](https://hub.docker.com/_/hylang/)
* [Ruby](https://hub.docker.com/_/ruby/)
@y
* [Go](https://hub.docker.com/_/golang/)
* [Perl](https://hub.docker.com/_/perl/)
* [Hy](https://hub.docker.com/_/hylang/)
* [Ruby](https://hub.docker.com/_/ruby/)
@z
