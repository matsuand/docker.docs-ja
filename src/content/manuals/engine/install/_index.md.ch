%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Install Docker Engine
linkTitle: Install
@y
title: Docker Engine のインストール
linkTitle: インストール
@z

@x
description: Learn how to choose the best method for you to install Docker Engine. This client-server
  application is available on Linux, Mac, Windows, and as a static binary.
keywords: install engine, docker engine install, install docker engine, docker engine
  installation, engine install, docker ce installation, docker ce install, engine
  installer, installing docker engine, docker server install, docker desktop vs docker engine
@y
description: Learn how to choose the best method for you to install Docker Engine. This client-server
  application is available on Linux, Mac, Windows, and as a static binary.
keywords: install engine, docker engine install, install docker engine, docker engine
  installation, engine install, docker ce installation, docker ce install, engine
  installer, installing docker engine, docker server install, docker desktop vs docker engine
@z

@x
This section describes how to install Docker Engine on Linux, also known as
Docker CE. Docker Engine is also available for Windows, macOS, and Linux,
through Docker Desktop. For instructions on how to install Docker Desktop,
see: [Overview of Docker Desktop](/manuals/desktop/_index.md).
@y
本節では Docker CE としても知られる Docker Engine on Linux のインストール方法について説明しあｍす。
Docker Engine は Windows、macOS、Linux に対して Docker Desktop を通じてもインストールすることができます。
Docker Desktop のインストール手順については [Docker Desktop 概要](manuals/desktop/_index.md) を参照してください。
@z

@x
## Installation procedures for supported platforms
@y
## サポートするプラットフォームのインストール手順 {#installation-procedures-for-supported-platforms}
@z

@x
Click on a platform's link to view the relevant installation procedure.
@y
各プラットフォームのリンクをクリックして、対応するインストール手順を確認してください。
@z

@x
| Platform                                       | x86_64 / amd64 | arm64 / aarch64 | arm (32-bit) | ppc64le | s390x |
| :--------------------------------------------- | :------------: | :-------------: | :----------: | :-----: | :---: |
@y
| プラットフォーム                               | x86_64 / amd64 | arm64 / aarch64 | arm (32-bit) | ppc64le | s390x |
| :--------------------------------------------- | :------------: | :-------------: | :----------: | :-----: | :---: |
@z

@x
| [CentOS](centos.md)                            |       ✅       |       ✅        |              |   ✅    |       |
| [Debian](debian.md)                            |       ✅       |       ✅        |      ✅      |   ✅    |       |
| [Fedora](fedora.md)                            |       ✅       |       ✅        |              |   ✅    |       |
| [Raspberry Pi OS (32-bit)](raspberry-pi-os.md) |                |                 |      ⚠️      |         |       |
| [RHEL](rhel.md)                                |       ✅       |       ✅        |              |         |  ✅   |
| [SLES](sles.md)                                |                |                 |              |         |  ❌   |
| [Ubuntu](ubuntu.md)                            |       ✅       |       ✅        |      ✅      |   ✅    |  ✅   |
| [Binaries](binaries.md)                        |       ✅       |       ✅        |      ✅      |         |       |
@y
| [CentOS](centos.md)                            |       ✅       |       ✅        |              |   ✅    |       |
| [Debian](debian.md)                            |       ✅       |       ✅        |      ✅      |   ✅    |       |
| [Fedora](fedora.md)                            |       ✅       |       ✅        |              |   ✅    |       |
| [Raspberry Pi OS (32ビット)](raspberry-pi-os.md)|               |                 |      ⚠️    |         |       |
| [RHEL](rhel.md)                                |       ✅       |       ✅        |              |         |  ✅   |
| [SLES](sles.md)                                |                |                 |              |         |  ❌   |
| [Ubuntu](ubuntu.md)                            |       ✅       |       ✅        |      ✅      |   ✅    |  ✅   |
| [バイナリー](binaries.md)                      |       ✅       |       ✅        |      ✅      |         |       |
@z

@x
### Other Linux distributions
@y
### その他の Linux ディストリビューション {#other-linux-distributions}
@z

@x
> [!NOTE]
>
> While the following instructions may work, Docker doesn't test or verify
> installation on distribution derivatives.
@y
> [!NOTE]
>
> 以降に示す手順は他の派生ディストリビューションで動作するかもしれませんが、Docker ではそういったディストリビューションへのインストールの確認検証は行っていません。
@z

@x
- If you use Debian derivatives such as "BunsenLabs Linux", "Kali Linux" or 
  "LMDE" (Debian-based Mint) should follow the installation instructions for
  [Debian](debian.md), substitute the version of your distribution for the
  corresponding Debian release. Refer to the documentation of your distribution to find
  which Debian release corresponds with your derivative version.
@y
- Debian 派生ディストリビューション、たとえば "BunsenLabs Linux"、"Kali Linux"、"LMDE" (Debian ベースの Mint) などを利用するユーザーは、[Debian](debian.md) に示すインストール手順に従ってください。
  その際には、Debian のリリースに対応づいた、各ディストリビューションのバージョンを利用してください。
  利用しているディストリビューションがどの Debian リリースに対応しているかは、ディストリビューションのドキュメントを参照してください。
@z

@x
- Likewise, if you use Ubuntu derivatives such as "Kubuntu", "Lubuntu" or "Xubuntu"
  you should follow the installation instructions for [Ubuntu](ubuntu.md),
  substituting the version of your distribution for the corresponding Ubuntu release.
  Refer to the documentation of your distribution to find which Ubuntu release
  corresponds with your derivative version.
@y
- 同様に Ubuntu 派生ディストリビューション、たとえば "Kubuntu"、"Lubuntu"、"Xubuntu" などを利用するユーザーは、[Ubuntu](ubuntu.md) に示すインストール手順に従ってください。
  その際には、Ubuntu のリリースに対応づいた、各ディストリビューションのバージョンを利用してください。
  利用しているディストリビューションがどの Ubuntu リリースに対応しているかは、ディストリビューションのドキュメントを参照してください。
@z

@x
- Some Linux distributions provide a package of Docker Engine through their
  package repositories. These packages are built and maintained by the Linux
  distribution's package maintainers and may have differences in configuration
  or are built from modified source code. Docker isn't involved in releasing these
  packages and you should report any bugs or issues involving these packages to
  your Linux distribution's issue tracker.
@y
- Linux ディストリビューションの中には、パッケージリポジトリから Docker Engine パッケージを提供しているものがあります。
  このようなパッケージは、そのパッケージ配布の担当者がビルドし保守を行っています。
  そこでは異なる設定を行ったり、ソースコードを修正してビルドしたりしているかもしれません。
  Docker はそういったパッケージのリリースには関わっていません。
  そのパッケージに対するバグや問題報告は、各 Linux ディストリビューションの issue トラッカーなどに報告してください。
@z

@x
Docker provides [binaries](binaries.md) for manual installation of Docker Engine.
These binaries are statically linked and you can use them on any Linux distribution.
@y
Docker Engine を手動でインストールするための [実行バイナリ](binaries.md) も提供されています。
このバイナリはスタティックライブラリをリンクしているため、どのような Linux ディストリビューションでも利用可能です。
@z

@x
## Release channels
@y
## リリースチャンネル {#release-channels}
@z

@x
Docker Engine has two types of update channels, **stable** and **test**:
@y
Docker Engine には **安定**（stable）、**テスト**（test）という 2 つの更新チャンネルがあります。
@z

@x
* The **stable** channel gives you the latest versions released for general availability.
* The **test** channel gives you pre-release versions that are ready for testing before
  general availability.
@y
* **安定**（stable）チャンネルは、正規安定版（general availability; GA）の最新リリースです。
* **テスト**（test）チャンネルは、正規安定版に向けてテスト準備に入っているプレリリース版です。
@z

@x
Use the test channel with caution. Pre-release versions include experimental and
early-access features that are subject to breaking changes.
@y
テストチャンネルを利用する場合には注意が必要です。
プレリリース版であるため、試験的機能や早期アクセス機能が含まれており、変更される可能性があるからです。
@z

@x
## Support
@y
## サポート {#support}
@z

@x
Docker Engine is an open source project, supported by the Moby project maintainers
and community members. Docker doesn't provide support for Docker Engine.
Docker provides support for Docker products, including Docker Desktop, which uses
Docker Engine as one of its components.
@y
Docker Engine はオープンソースプロジェクトです。
これをサポートしているのは Moby プロジェクトのメンテナーやコミュニティーメンバーです。
Docker では Docker Engine のサポートは行っていません。
Docker がサポートするのは Docker 製品であり、その一つが Docker Desktop であって、Docker Engine はその中の一つのコンポーネントとして利用しているにすぎないものです。
@z

@x
For information about the open source project, refer to the
[Moby project website](https://mobyproject.org/).
@y
オープンソースプロジェクトに関する詳細は [Moby プロジェクトのウェブサイト](https://mobyproject.org/) を参照してください。
@z

@x
### Upgrade path
@y
### アップグレードの方法 {#upgrade-path}
@z

@x
Patch releases are always backward compatible with its major and minor version.
@y
パッチリリースは、メジャーバージョン、マイナーバージョンと常に下位互換性があります。
@z

@x
### Licensing
@y
## ライセンス {#licensing}
@z

@x
Commercial use of Docker Engine obtained via Docker Desktop
within larger enterprises (exceeding 250 employees OR with annual revenue surpassing
$10 million USD), requires a [paid subscription](https://www.docker.com/pricing/).
Apache License, Version 2.0. See [LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full license.
@y
Commercial use of Docker Engine obtained via Docker Desktop
within larger enterprises (exceeding 250 employees OR with annual revenue surpassing
$10 million USD), requires a [paid subscription](https://www.docker.com/pricing/).
Apache License, Version 2.0 のライセンス全文は [LICENSE](https://github.com/moby/moby/blob/master/LICENSE) を参照してください。
@z

@x
## Reporting security issues
@y
## セキュリティに関する問題報告 {#reporting-security-issues}
@z

@x
If you discover a security issue, we request that you bring it to our attention immediately.
@y
セキュリティに関する問題を発見した方は、すぐにお知らせください。
@z

@x
DO NOT file a public issue. Instead, submit your report privately to security@docker.com.
@y
その際には公開の issue とはしないでください。
security@docker.com 宛てに、プライベートな報告として連絡してください。
@z

@x
Security reports are greatly appreciated, and Docker will publicly thank you for it.
@y
セキュリティに関する報告を大いに歓迎します。
Docker では公開で感謝の意を表わすものとします。
@z

@x
## Get started
@y
## はじめよう {#get-started}
@z

@x
After setting up Docker, you can learn the basics with
[Getting started with Docker](/get-started/introduction/_index.md).
@y
Docker の設定を終えたら [Docker を使ってはじめよう](get-started/introduction/_index.md) を通じてその基本を学んでいきます。
@z
