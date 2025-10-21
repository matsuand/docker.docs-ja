%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how Compose Bridge transforms Docker Compose files into Kubernetes manifests for seamless platform transitions
keywords: docker compose bridge, compose to kubernetes, docker compose kubernetes integration, docker compose kustomize, compose bridge docker desktop
title: Overview of Compose Bridge
linkTitle: Compose Bridge
@y
description: Learn how Compose Bridge transforms Docker Compose files into Kubernetes manifests for seamless platform transitions
keywords: docker compose bridge, compose to kubernetes, docker compose kubernetes integration, docker compose kustomize, compose bridge docker desktop
title: Compose Bridge 概要
linkTitle: Compose Bridge
@z

@x
{{< summary-bar feature_name="Compose bridge" >}}
@y
{{< summary-bar feature_name="Compose bridge" >}}
@z

@x
Compose Bridge converts your Docker Compose configuration into platform-specific deployment formats such as Kubernetes manifests. By default, it geneterates:
@y
Compose Bridge は Docker Compose 設定を、Kubernetes マニフェストのようなプラットフォーム固有のデプロイフォーマットへと変換するものです。
デフォルトでは以下を生成します。
@z

@x
- Kubernetes manifests 
- A Kustomize overlay
@y
- Kubernetes マニフェスト
- Kustomize オーバーレイ
@z

@x
These outputs are ready for deployment on Docker Desktop with [Kubernetes enabled](/manuals/desktop/settings-and-maintenance/settings.md#kubernetes).  
@y
この出力は [Kubernetes 機能を有効](manuals/desktop/settings-and-maintenance/settings.md#kubernetes) にした Docker Desktop 上において、すぐにデプロイできるものとなっています。
@z

@x
Compose Bridge helps you bridge the gap between Compose and Kubernetes, making it easier to adopt Kubernetes while keeping the simplicity and efficiency of Compose.
@y
Compose Bridge は Compose と Kubernetes の違いを埋め合わせるものです。
Compose の簡易さと効率性を保ちつつ、Kubernetes への適用を容易にします。
@z

@x
It's a flexible tool that lets you either take advantage of the [default transformation](usage.md) or [create a custom transformation](customize.md) to suit specific project needs and requirements. 
@y
[デフォルトの変換](usage.md) が利用でき、プロジェクトの要請や要件に従った [カスタム変換の生成](customize.md) が利用できる、柔軟性を備えたツールです。
@z

@x
## How it works
@y
## どのように動くか {#how-it-works}
@z

@x
Compose Bridge uses transformations to convert a Compose model into another form. 
@y
Compose Bridge は Compose モデルを別形式に変換する機能を利用しています。
@z

@x
A transformation is packaged as a Docker image that receives the fully resolved Compose model as `/in/compose.yaml` and can produce any target format file under `/out`.
@y
変換処理は Docker イメージとしてパッケージされるものであり、`/in/compose.yaml` として完全に集約された Compose モデルを入力とします。
そして `/out` のもとに対象フォーマットファイルを生成します。
@z

@x
Compose Bridge provides its own transformation for Kubernetes using Go templates, so that it is easy to extend for customization by replacing or appending your own templates.
@y
Compose Bridge では Kubernetes への変換処理を Go テンプレートを用いて独自に提供しています。
このため独自のテンプレートに置き換えたり追加したりすることによって、カスタマイズし拡張することが容易となっています。
@z

@x
For more detailed information on how these transformations work and how you can customize them for your projects, see [Customize](customize.md).
@y
変換処理がどのように動作するのか、あるいはプロジェクト向けにどのようにカスタマイズするのかについては [カスタマイズ](customize.md) を参照してください。
@z

@x
Compose Bridge also supports applications that use LLMs via Docker Model Runner.
@y
Compose Bridge は、Docker Model Runner を通じて LLM を利用するアプリケーションもサポートします。
@z

@x
For more details, see [Use Model Runner](use-model-runner.md).
@y
詳しくは [Model Runner の利用](use-model-runner.md) を参照してください。
@z

@x
## What's next?
@y
## 次は何？ {#whats-next}
@z

@x
- [Use Compose Bridge](usage.md)
- [Explore how you can customize Compose Bridge](customize.md)
@y
- [Compose Bridge の利用](usage.md)
- [Compose Bridge のカスタマイズ方法](customize.md)
@z
