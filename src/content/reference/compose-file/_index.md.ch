%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Find the latest recommended version of the Docker Compose file format
  for defining multi-container applications.
keywords: docker compose file, docker compose yml, docker compose reference, docker
  compose cmd, docker compose user, docker compose image, yaml spec, docker compose
  syntax, yaml specification, docker compose specification
title: Compose file reference
@y
description: Find the latest recommended version of the Docker Compose file format
  for defining multi-container applications.
keywords: docker compose file, docker compose yml, docker compose reference, docker
  compose cmd, docker compose user, docker compose image, yaml spec, docker compose
  syntax, yaml specification, docker compose specification
title: Compose ファイルリファレンス
@z

% grid:

@x
- title: Version and name top-level element
  description: Understand version and name attributes for Compose.
  icon: text_snippet
  link: /reference/compose-file/version-and-name/
@y
- title: トップレベル要素 version と name
  description: Compose の version および name 属性を理解します。
  icon: text_snippet
  link: __SUBDIR__/reference/compose-file/version-and-name/
@z

@x
- title: Services top-level element
  description: Explore all services attributes for Compose.
  icon: construction
  link: /reference/compose-file/services/
@y
- title: トップレベル要素 services
  description: Compose の services 属性を確認します。
  icon: construction
  link: __SUBDIR__/reference/compose-file/services/
@z

@x
- title: Networks top-level element
  description: Find all networks attributes for Compose.
  icon: lan
  link: /reference/compose-file/networks/
@y
- title: トップレベル要素 networks
  description: Compose の networks 属性すべてを調べます。
  icon: lan
  link: __SUBDIR__/reference/compose-file/networks/
@z

@x
- title: Volumes top-level element
  description: Explore all volumes attributes for Compose.
  icon: database
  link: /reference/compose-file/volumes/
@y
- title: トップレベル要素 volumes
  description: Compose の volumes 属性すべてを確認します。
  icon: database
  link: __SUBDIR__/reference/compose-file/volumes/
@z

@x
- title: Configs top-level element
  description: Find out about configs in Compose.
  icon: settings
  link: /reference/compose-file/configs/
@y
- title: トップレベル要素 configs
  description: Compose の configs について調べます。
  icon: settings
  link: __SUBDIR__/reference/compose-file/configs/
@z

@x
- title: Secrets top-level element
  description: Learn about secrets in Compose.
  icon: lock
  link: /reference/compose-file/secrets/
@y
- title: トップレベル要素 secrets
  description: Compose の secrets について学びます。
  icon: lock
  link: __SUBDIR__/reference/compose-file/secrets/
@z

% snip aliases...

@x
>**New to Docker Compose?**
>
> Find more information about the [key features and use cases of Docker Compose](/manuals/compose/intro/features-uses.md) or [try the quickstart guide](/manuals/compose/gettingstarted.md).
@y
>**Docker Compose の初心者ですか？**
>
> より詳しい情報は [Docker Compose の主要機能とユースケース](manuals/compose/intro/features-uses.md) や [クィックスタートガイド](manuals/compose/gettingstarted.md) を参照してください。
@z

@x
The Compose Specification is the latest and recommended version of the Compose file format. It helps you define a [Compose file](/manuals/compose/intro/compose-application-model.md) which is used to configure your Docker application’s services, networks, volumes, and more.
@y
Compose 仕様は Compose ファイルフォーマットの最新および推奨バージョンを定めています。
これに従った [Compose ファイル](manuals/compose/intro/compose-application-model.md) を定義することによって、Docker アプリケーションのサービス、ネットワーク、ボリュームなどを設定していきます。
@z

@x
Legacy versions 2.x and 3.x of the Compose file format were merged into the Compose Specification. It is implemented in versions 1.27.0 and above (also known as Compose v2) of the Docker Compose CLI.
@y
Compose ファイルのかつてのバージョン 2.x および 3.x はマージされて Compose 仕様となりました。
これは Docker Compose CLI のバージョン 1.27.0 およびそれ以前 (Compose v2 と呼ばれるもの) を実装しています。
@z

@x
The Compose Specification on Docker Docs is the Docker Compose implementation. If you wish to implement your own version of the Compose Specification, see the [Compose Specification repository](https://github.com/compose-spec/compose-spec).
@y
Docker Docs 上の Compose 仕様が Docker Compose の実装です。
Compose 仕様に対して独自バージョンを実装したいと思う方は [Compose 仕様のリポジトリ](https://github.com/compose-spec/compose-spec) を参照してください。
@z

@x
Use the following links to navigate key sections of the Compose Specification. 
@y
以下に示すリンクから Compose 仕様の主要項目を確認してください。
@z

@x
> [!TIP]
>
> Want a better editing experience for Compose files in VS Code?
> Check out the [Docker VS Code Extension (Beta)](https://marketplace.visualstudio.com/items?itemName=docker.docker) for linting, code navigation, and vulnerability scanning.
@y
> [!TIP]
>
> Compose ファイルの編集を VS Code 内で賢く実現したいですか？
> [Docker VS Code Extension (Beta)](https://marketplace.visualstudio.com/items?itemName=docker.docker) では、静的コード解析、コードナビゲーション、ぜい弱性スキャンなどを行うことができます。
@z

% snip grid...
