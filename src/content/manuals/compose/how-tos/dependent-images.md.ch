%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Build images for services with shared definition
keywords: compose, build
title: Build dependent images
@y
description: サービスにおいて共通の定義を用いたイメージをビルドします。
keywords: compose, build
title: 依存イメージのビルド
@z

@x
{{< summary-bar feature_name="Compose dependent images" >}}
@y
{{< summary-bar feature_name="Compose dependent images" >}}
@z

@x
To reduce push/pull time and image weight, a common practice for Compose applications is to have services
share base layers as much as possible. You typically select the same operating system base image for
all services. But you can also get one step further by sharing image layers when your images share the same
system packages. The challenge to address is then to avoid repeating the exact same Dockerfile instruction 
in all services.
@y
プッシュ/プルの処理時間やイメージ容量を軽減するために、Compopse アプリケーションの一般的なプラクティスとして、出来る限りベースとなるレイヤーを共有させる方法が取られます。
普通は全サービスに対するベースイメージには、同一のオペレーティングシステムを指定します。
ただしイメージ間において共通のシステムパッケージを共有しているなら、イメージレイヤーを共有することによって、もう一歩踏み込んだ最適化を行うことができます。
ここに説明する方法では、全サービスに対する Dockerfile に同一の記述を行わなく済むものになります。
@z

@x
For illustration, this page assumes you want all your services to be built with an `alpine` base
image and install the system package `openssl`.
@y
例として本ページでは、全サービスは alpine ベースイメージを使ってビルドするものとし、システムパッケージとして `openssl` をインストールするものとします。
@z

@x
## Multi-stage Dockerfile
@y
## マルチステージ Dockerfile {#multi-stage-dockerfile}
@z

@x
The recommended approach is to group the shared declaration in a single Dockerfile, and use multi-stage features
so that service images are built from this shared declaration.
@y
お勧めのアプローチ方法は、まず共通の宣言内容を 1 つの Dockerfile にまとめ、マルチステージ機能を利用してその共通の宣言から各サービス用のイメージを構築します。
@z

@x
Dockerfile:
@y
Dockerfile:
@z

@x within code
# build service a
@y
# サービス a のビルド
@z

@x
# build service b
@y
# サービス b のビルド
@z

@x
Compose file:
@y
Compose ファイル:
@z

% snip code...

@x
## Use another service's image as the base image
@y
## ベースイメージに他サービスイメージを利用 {#use-another-services-image-as-the-base-image}
@z

@x
A popular pattern is to reuse a service image as a base image in another service.
As Compose does not parse the Dockerfile, it can't automatically detect this dependency 
between services to correctly order the build execution.
@y
一般的なパターンとして、1 つのサービスにおいて用いられているベースイメージを、別サービスのベースイメージとして再利用します。
Compose は Dockerfile を解析するわけではないので、サービス間のこうした依存関係を自動的に解釈できるわけではなく、ビルド順を適切に処理することはできません。
@z

@x
a.Dockerfile:
@y
a.Dockerfile:
@z

% snip code...

@x
b.Dockerfile:
@y
b.Dockerfile:
@z

@x
# build service b
@y
# サービス b のビルド
@z

@x
Compose file:
@y
Compose ファイル:
@z

% snip code...

@x
Legacy Docker Compose v1 used to build images sequentially, which made this pattern usable
out of the box. Compose v2 uses BuildKit to optimise builds and build images in parallel 
and requires an explicit declaration.
@y
従来の Docker Compose v1 ではイメージビルドが順番どおりに行われていたので、上のパターンでもそのまま利用することができました。
Compose v2 では BuildKit によってビルドが最適化されており、イメージビルドは並行に処理されます。
したがってビルド順を明示的に宣言する必要があります。
@z

@x
The recommended approach is to declare the dependent base image as an additional build context:
@y
そこで推奨されるのは、依存関係にあるベースイメージを、追加のビルドコンテキストとして宣言する方法です。
@z

@x
Compose file:
@y
Compose ファイル:
@z

@x within code
         # `FROM service_a` will be resolved as a dependency on service "a" which has to be built first
@y
         # `FROM service_a` はサービス "a" に依存すると解釈され、先にビルドされます
@z

@x
With the `additional_contexts` attribute, you can refer to an image built by another service without needing to explicitly name it:
@y
`additional_contexts` 属性を利用すると、別のサービスでビルドしたイメージを、特に名前づけすることなく参照できるようになります。
@z

@x within code
# `base_image` doesn't resolve to an actual image. This is used to point to a named additional context

# build service b
@y
# `base_image` はイメージとして解釈されず、追加コンテキストでの指定に利用されます

# サービス b のビルド
@z

@x
Compose file:
@y
Compose ファイル:
@z

@x within code
       # built image will be tagged <project_name>_a
@y
       # ビルドされるイメージは <プロジェクト名>_a としてタグづけされます
@z
@x
         # `FROM base_image` will be resolved as a dependency on service "a" which has to be built first
@y
         # `FROM base_image` はサービス "a" に依存すると解釈され、先にビルドされます
@z


@x
## Build with Bake
@y
## bake を使ったビルド {#build-with-bake}
@z

@x
Using [Bake](/manuals/build/bake/_index.md) let you pass the complete build definition for all services
and to orchestrate build execution in the most efficient way. 
@y
[Bake](manuals/build/bake/_index.md) を利用すると、全サービスに対する完全なビルド定義を受け渡せるようになり、ビルド実行を最も効率的にオーケストレーションできるようになります。
@z

@x
To enable this feature, run Compose with the `COMPOSE_BAKE=true` variable set in your environment.
@y
その機能を有効にするには、`COMPOSE_BAKE=true` という環境変数を設定した上で Compose を実行します。
@z

% snip output...

@x
Bake can also be selected as the default builder by editing your `$HOME/.docker/config.json` config file:
@y
`$HOME/.docker/config.json` という設定ファイルを利用すれば、デフォルトビルダーとして bake を選択しておくこともできます。
@z

% snip output...

@x
## Additional resources
@y
## 追加情報 {#additional-resources}
@z

@x
- [Docker Compose build reference](/reference/cli/docker/compose/build/)
- [Learn about multi-stage Dockerfiles](/manuals/build/building/multi-stage.md)
@y
- [Docker Compose ビルドリファレンス](__SUBDIR__/reference/cli/docker/compose/build/)
- [マルチステージ Dockerfile について学ぼう](manuals/build/building/multi-stage.md)
@z
