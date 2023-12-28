%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Explore more of Docker Desktop, what it has to offer, and its key features.
  Take the next step by downloading or find additional resources.
keywords: how to use docker desktop, what is docker desktop used for, what does docker
  desktop do, using docker desktop
title: Overview of Docker Desktop
grid:
- title: Install Docker Desktop
  description: 'Install Docker Desktop on
@y
---
description: Explore more of Docker Desktop, what it has to offer, and its key features.
  Take the next step by downloading or find additional resources.
keywords: how to use docker desktop, what is docker desktop used for, what does docker
  desktop do, using docker desktop
title: Docker Desktop の概要
grid:
- title: Docker Desktop のインストール
  description: 'Install Docker Desktop on
@z

@x
    [Mac](/desktop/install/mac-install/),
@y
    [Mac](__SUBDIR__/desktop/install/mac-install/),
@z

@x
    [Windows](/desktop/install/windows-install/), or
@y
    [Windows](__SUBDIR__/desktop/install/windows-install/), or
@z

@x
    [Linux](/desktop/install/linux-install/).
@y
    [Linux](__SUBDIR__/desktop/install/linux-install/).
@z

@x
    '
  icon: download
- title: Explore Docker Desktop
  description: Navigate Docker Desktop and learn about its key features.
  icon: feature_search
  link: /desktop/use-desktop
- title: View the release notes
  description: Find out about new features, improvements, and bug fixes.
  icon: note_add
  link: /desktop/release-notes
- title: Browse common FAQs
  description: Explore general FAQs or FAQs for specific platforms.
  icon: help
  link: /desktop/faqs/
- title: Find additional resources
  description: Find information on networking features, deploying on Kubernetes, and
    more.
  icon: category
  link: /desktop/kubernetes
- title: Give feedback
  description: Provide feedback on Docker Desktop or Docker Desktop features.
  icon: sms
  link: /desktop/feedback
aliases:
- /desktop/opensource/
- /docker-for-mac/dashboard/
- /docker-for-mac/opensource/
- /docker-for-windows/dashboard/
- /docker-for-windows/opensource/
---
@y
    '
  icon: download
- title: Docker Desktop の確認
  description: Navigate Docker Desktop and learn about its key features.
  icon: feature_search
  link: __SUBDIR__/desktop/use-desktop
- title: View the release notes
  description: Find out about new features, improvements, and bug fixes.
  icon: note_add
  link: __SUBDIR__/desktop/release-notes
- title: Browse common FAQs
  description: Explore general FAQs or FAQs for specific platforms.
  icon: help
  link: __SUBDIR__/desktop/faqs/
- title: Find additional resources
  description: Find information on networking features, deploying on Kubernetes, and
    more.
  icon: category
  link: __SUBDIR__/desktop/kubernetes
- title: Give feedback
  description: Provide feedback on Docker Desktop or Docker Desktop features.
  icon: sms
  link: __SUBDIR__/desktop/feedback
aliases:
- /desktop/opensource/
- /docker-for-mac/dashboard/
- /docker-for-mac/opensource/
- /docker-for-windows/dashboard/
- /docker-for-windows/opensource/
---
@z

@x
Docker Desktop is a one-click-install application for your Mac, Linux, or Windows environment
that lets you to build, share, and run containerized applications and microservices. 
@y
Docker Desktop は Mac、Linux、Windows にワンクリックでインストールできるアプリケーションです。
これにより、コンテナー化アプリケーションやマイクロサービスを構築し共有することができます。
@z

@x
It provides a straightforward GUI (Graphical User Interface) that lets you manage your containers, applications, and images directly from your machine. You can use Docker Desktop either on its own or as a complementary tool to the CLI. 
@y
It provides a straightforward GUI (Graphical User Interface) that lets you manage your containers, applications, and images directly from your machine. You can use Docker Desktop either on its own or as a complementary tool to the CLI. 
@z

@x
Docker Desktop reduces the time spent on complex setups so you can focus on writing code. It takes care of port mappings, file system concerns, and other default settings, and is regularly updated with bug fixes and security updates.
@y
Docker Desktop reduces the time spent on complex setups so you can focus on writing code. It takes care of port mappings, file system concerns, and other default settings, and is regularly updated with bug fixes and security updates.
@z

@x
{{< tabs >}}
{{< tab name="What's included in Docker Desktop?" >}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop に含まれているものは？" >}}
@z

@x
- [Docker Engine](../engine/index.md)
- Docker CLI client
- [Docker Scout](../scout/_index.md) (additional subscription may apply)
- [Docker Buildx](../build/index.md)
- [Docker Extensions](extensions/index.md)
- [Docker Compose](../compose/index.md)
- [Docker Content Trust](../engine/security/trust/index.md)
- [Kubernetes](https://github.com/kubernetes/kubernetes/)
- [Credential Helper](https://github.com/docker/docker-credential-helpers/)
@y
- [Docker Engine](../engine/index.md)
- Docker CLI クライアント
- [Docker Scout](../scout/_index.md) (additional subscription may apply)
- [Docker Buildx](../build/index.md)
- [Docker Extensions](extensions/index.md)
- [Docker Compose](../compose/index.md)
- [Docker Content Trust](../engine/security/trust/index.md)
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
* On Windows, the ability to toggle between Linux and Windows Server environments to build applications.
* Fast and reliable performance with native Windows Hyper-V virtualization.
* Ability to work natively on Linux through WSL 2 on Windows machines.
* Volume mounting for code and data, including file change notifications and easy access to running containers on the localhost network.
@y
* どのようなクラウドプラットフォーム上においても、いろいろなアプリケーションをコンテナー化し共有することができます。複数のプログラミング言語やフレームワークにも対応します。
* 完全な Docker 開発環境を、すばやくインストールし設定することができます。
* 最新版の Kubernetes を提供します。
* Windows においは、Linux と Windows Server を切り替えてアプリケーションを構築できます。
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
Docker Desktop works with your choice of development tools and languages and
gives you access to a vast library of certified images and templates in
[Docker Hub](https://hub.docker.com/). This allows development teams to extend
their environment to rapidly auto-build, continuously integrate, and collaborate
using a secure repository.
@y
Docker Desktop works with your choice of development tools and languages and
gives you access to a vast library of certified images and templates in
[Docker Hub](https://hub.docker.com/). This allows development teams to extend
their environment to rapidly auto-build, continuously integrate, and collaborate
using a secure repository.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
