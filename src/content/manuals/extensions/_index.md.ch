%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Extensions
@y
title: Docker Extensions
@z

@x
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows
@y
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows
@z

@x
Docker Extensions let you use third-party tools within Docker Desktop to extend its functionality.
@y
Docker Extensions は Docker Desktop 内において、サードパーティ製ツールを利用することで、機能拡張を行うものです。
@z

@x
You can seamlessly connect your favorite development tools to your application development and deployment workflows. Augment Docker Desktop with debugging, testing, security, and networking functionalities, and create custom add-ons using the Extensions [SDK](extensions-sdk/_index.md).
@y
お気に入りの開発ツールをアプリケーション開発やデプロイワークフローにシームレスに接続することが可能となります。
Extensions の [SDK](extensions-sdk/_index.md) を利用すれば、Docker Desktop のデバッグ、テスト、セキュリティ、ネットワーク機能を拡張し、独自のアドオンを生成することができます。
@z

@x
Anyone can use Docker Extensions and there is no limit to the number of extensions you can install.
@y
Docker Extensions は誰でも利用できるものであり、ツールの追加数に制限もありません。
@z

@x
![Extensions Marketplace](/assets/images/extensions.webp)
@y
![Extensions マーケットプレース](__SUBDIR__/assets/images/extensions.webp)
@z

@x
## What extensions are available?
@y
## Extensions は何が利用可能か
@z

@x
There is a mix of partner and community-built extensions and Docker-built extensions.
You can explore the list of available extensions in [Docker Hub](https://hub.docker.com/search?q=&type=extension) or in the Extensions Marketplace within Docker Desktop.
@y
パートナーやコミュニティがビルドした Extensions と Docker が提供する Extensions は組み合わさっています。
利用可能な Extensions の一覧は [Docker Hub](https://hub.docker.com/search?q=&type=extension) から確認することができます。
また Docker Desktop 内にある Extensions マーケットプレースからも確認できます。
@z

@x
## Security and trust
@y
## Security and trust
@z

@x
Docker Extensions run with elevated privileges on your host machine. They have direct access to the Docker Engine, can read and write files on your filesystem, and can install and run native binaries.
@y
Docker Extensions run with elevated privileges on your host machine. They have direct access to the Docker Engine, can read and write files on your filesystem, and can install and run native binaries.
@z

@x
Docker reviews extensions submitted to the Marketplace, but does not guarantee the security of any extension. Extensions installed outside the Marketplace have not been reviewed at all. Only install extensions from publishers you trust.
@y
Docker reviews extensions submitted to the Marketplace, but does not guarantee the security of any extension. Extensions installed outside the Marketplace have not been reviewed at all. Only install extensions from publishers you trust.
@z

@x
If you're an organization admin, see [Configure a private marketplace](private-marketplace.md) to control which extensions your team can install.
@y
If you're an organization admin, see [Configure a private marketplace](private-marketplace.md) to control which extensions your team can install.
@z
