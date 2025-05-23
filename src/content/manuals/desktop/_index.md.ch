%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Desktop
@y
title: Docker Desktop
@z

@x
description: Explore Docker Desktop, what it has to offer, and its key features. Take the next step by downloading or find additional resources
keywords: how to use docker desktop, what is docker desktop used for, what does docker
  desktop do, using docker desktop
@y
description: Explore Docker Desktop, what it has to offer, and its key features. Take the next step by downloading or find additional resources
keywords: how to use docker desktop, what is docker desktop used for, what does docker
  desktop do, using docker desktop
@z

% grid:

@x
- title: Install Docker Desktop
  description: |
    Install Docker Desktop on
    [Mac](/desktop/setup/install/mac-install/),
    [Windows](/desktop/setup/install/windows-install/), or
    [Linux](/desktop/setup/install/linux/).
  icon: download
@y
- title: Docker Desktop のインストール
  description: |
    [Mac](__SUBDIR__/desktop/setup/install/mac-install/),
    [Windows](__SUBDIR__/desktop/setup/install/windows-install/),
    [Linux](__SUBDIR__/desktop/setup/install/linux/) への Docker Desktop のインストール。
  icon: download
@z

@x
- title: Learn about Docker Desktop
  description: Navigate Docker Desktop.
  icon: feature_search
  link: /desktop/use-desktop/
@y
- title: Docker Desktop について学ぶ
  description: Docker Desktop を学びます。
  icon: feature_search
  link: __SUBDIR__/desktop/use-desktop/
@z

@x
- title: Explore its key features
  description: |
    Find information about [Docker VMM](/desktop/features/vmm/), [WSL](/desktop/features/wsl/), [deploying on Kubernetes](/desktop/features/kubernetes/), and more.
  icon: category
@y
- title: 主要機能を確認
  description: |
    [Docker VMM](__SUBDIR__/desktop/features/vmm/), [WSL](__SUBDIR__/desktop/features/wsl/), [Kubernetes へのデプロイ](__SUBDIR__/desktop/features/kubernetes/) などについての情報を確認します。
  icon: category
@z

@x
- title: View the release notes
  description: Find out about new features, improvements, and bug fixes.
  icon: note_add
  link: /desktop/release-notes/
@y
- title: リリースノートの確認
  description: 新機能、機能改善、バグフィックスを確認します。
  icon: note_add
  link: __SUBDIR__/desktop/release-notes/
@z

@x
- title: Browse common FAQs
  description: Explore general FAQs or FAQs for specific platforms.
  icon: help
  link: /desktop/troubleshoot-and-support/faqs/general/
@y
- title: 一般的な FAQ の確認
  description: 一般的な FAQ や特定プラットフォームの FAQ を確認します。
  icon: help
  link: __SUBDIR__/desktop/troubleshoot-and-support/faqs/general/
@z

@x
- title: Give feedback
  description: Provide feedback on Docker Desktop or Docker Desktop features.
  icon: sms
  link: /desktop/troubleshoot-and-support/feedback/
@y
- title: フィードバック
  description: Docker Desktop やその機能についてのフィードバックを行います。
  icon: sms
  link: __SUBDIR__/desktop/troubleshoot-and-support/feedback/
@z

@x
Docker Desktop is a one-click-install application for your Mac, Linux, or Windows environment
that lets you build, share, and run containerized applications and microservices. 
@y
Docker Desktop は Mac、Linux、Windows にワンクリックでインストールできるアプリケーションです。
これにより、コンテナー化アプリケーションやマイクロサービスを構築し共有することができます。
@z

@x
It provides a straightforward GUI (Graphical User Interface) that lets you manage your containers, applications, and images directly from your machine. 
@y
自マシンから直接、コンテナー、アプリケーション、イメージを管理する簡単な GUI (グラフィカルユーザーインターフェース) を提供しています。
@z

@x
Docker Desktop reduces the time spent on complex setups so you can focus on writing code. It takes care of port mappings, file system concerns, and other default settings, and is regularly updated with bug fixes and security updates.
@y
Docker Desktop を用いることで複雑な環境準備に費やす時間が軽減されるため、コーディングに集中することができます。
Docker Desktop はポートマッピング、ファイルシステム関連、諸々のデフォルト設定などの操作をサポートし、バグ修正やセキュリティアップデートを定期的に提供します。
@z

@x
{{< tabs >}}
{{< tab name="What's included in Docker Desktop?" >}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop に含まれているものは？" >}}
@z

@x
- [Docker Engine](/manuals/engine/_index.md)
- Docker CLI client
- [Docker Scout](../scout/_index.md)
- [Docker Build](/manuals/build/_index.md)
- [Docker Compose](/manuals/compose/_index.md)
- [Ask Gordon](/manuals/desktop/features/gordon/_index.md)
- [Docker Extensions](../extensions/_index.md)
- [Docker Content Trust](/manuals/engine/security/trust/_index.md)
- [Kubernetes](https://github.com/kubernetes/kubernetes/)
- [Credential Helper](https://github.com/docker/docker-credential-helpers/)
@y
- [Docker Engine](manuals/engine/_index.md)
- Docker CLI クライアント
- [Docker Scout](../scout/_index.md)
- [Docker Build](../build/_index.md)
- [Docker Compose](manuals/compose/_index.md)
- [Ask Gordon](manuals/desktop/features/gordon/_index.md)
- [Docker Extensions](../extensions/_index.md)
- [Docker Content Trust](manuals/engine/security/trust/_index.md)
- [Kubernetes](https://github.com/kubernetes/kubernetes/)
- [Credential Helper](https://github.com/docker/docker-credential-helpers/)
@z

@x
{{< /tab >}}
{{< tab name="What are the key features of Docker Desktop?">}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop の主要機能は何か？">}}
@z

@x
* Ability to containerize and share any application on any cloud platform, in multiple languages and frameworks.
* Quick installation and setup of a complete Docker development environment.
* Includes the latest version of Kubernetes.
* On Windows, the ability to toggle between Linux and Windows containers to build applications.
* Fast and reliable performance with native Windows Hyper-V virtualization.
* Ability to work natively on Linux through WSL 2 on Windows machines.
* Volume mounting for code and data, including file change notifications and easy access to running containers on the localhost network.
@y
* どのようなクラウドプラットフォーム上においても、いろいろなアプリケーションをコンテナー化し共有することができます。複数のプログラミング言語やフレームワークにも対応します。
* 完全な Docker 開発環境を、すばやくインストールし設定することができます。
* 最新版の Kubernetes を提供します。
* Windows においは、Linux と Windows のコンテナーを切り替えてアプリケーションを構築できます。
* Windows のネイティブな Hyper-V 仮想技術を利用して、高速かつ信頼できる性能を提供します。
* Windows マシン上の WSL 2 を通じて、Linux ネイティブのように機能します。
* ソースコードやデータに対してボリュームマウントを可能にします。
  ファイル更新の通知機能や、ローカルホストのネットワーク上で稼動するコンテナーへの簡単なアクセス機能を提供します
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
