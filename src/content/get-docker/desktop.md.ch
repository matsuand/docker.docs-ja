%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Quick install Docker Desktop
linkTitle: Docker Desktop
description: Install Docker Desktop on your computer, start it, and run a test container.
keywords: Docker Desktop, quick install, macOS, Windows, Linux
@y
title: Docker Desktop のクィックインストール
linkTitle: Docker Desktop
description: コンピューターに Docker Desktop をインストールし実行します。そしてテストコンテナーを動作させます。
keywords: Docker Desktop, quick install, macOS, Windows, Linux, クィックインストール
@z

@x
Docker Desktop includes Docker Engine, the Docker CLI, Buildx, and Compose.
For a Linux server without a desktop environment, use
[Docker Engine](/get-docker/engine.md) instead.
@y
Docker Desktop には Docker Engine、Docker CLI、Buildx、Compose が含まれています。
Linux サーバーにおいてデスクトップ環境を必要としない場合は、Docker Desktop ではなく [Docker Engine](get-docker/engine.md) を利用してください。
@z

@x
## Download and install
@y
## ダウンロードとインストール {#download-and-install}
@z

@x
{{< tabs >}}
{{< tab name="Mac" >}}
@y
{{< tabs >}}
{{< tab name="Mac" >}}
@z

@x
1. Download Docker Desktop for [Apple silicon](https://desktop.docker.com/mac/main/arm64/Docker.dmg)
   or [Intel](https://desktop.docker.com/mac/main/amd64/Docker.dmg).
2. Open `Docker.dmg` and drag Docker to **Applications**.
3. Open **Docker** from **Applications** and accept the subscription agreement
   to start Docker Desktop.
@y
1. [Apple silicon](https://desktop.docker.com/mac/main/arm64/Docker.dmg) 向け、あるいは [Intel](https://desktop.docker.com/mac/main/amd64/Docker.dmg) 向けの Docker Desktop をダウンロードします。
2. `Docker.dmg` を開き、Docker を **Applications** へドラッグします。
3. **Applications** から **Docker** を開いて、subscription agreement (サブスクリプションへの同意文書) に合意して Docker Desktop を開始します。
@z

@x
See [Mac installation instructions](/manuals/desktop/setup/install/mac-install.md)
for system requirements, permissions, and installation options.
@y
システム要件、パーミッション、インストールオプションについては [Mac 向けインストール手順](manuals/desktop/setup/install/mac-install.md) を参照してください。
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
1. Check the [Windows system requirements](/manuals/desktop/setup/install/windows-install.md#system-requirements).
2. Download the [installer for x86_64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe).
   For Arm devices, use the download in the
   [Windows installation instructions](/manuals/desktop/setup/install/windows-install.md).
3. Open the installer and follow the prompts. Restart Windows if prompted.
4. Open **Docker Desktop** from the **Start** menu and accept the subscription
   agreement.
@y
1. [Windows システム要件](manuals/desktop/setup/install/windows-install.md#system-requirements) を確認します。
2. [x86_64 向けインストーラー](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe) をダウンロードします。
   Arm デバイスの場合は [Windows インストール手順](manuals/desktop/setup/install/windows-install.md) に示されているダウンロードを行います。
3. インストーラーを開いてプロンプトに従います。
   再起動の指示があれば再起動します。
4. **Start**  メニューから **Docker Desktop** を開いて subscription agreement (サブスクリプションへの同意文書) に合意します。
@z

@x
The full instructions cover WSL 2 setup, supported Windows versions, and
installation options.
@y
インストール手順説明においては、WSL 2 のセットアップ、サポート対象の Windows バージョン、インストールオプションについて示しています。
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
Docker Desktop on Linux requires a desktop environment and KVM virtualization.
Choose your distribution for requirements and package installation steps:
@y
Linux 上の Docker Desktop ではデスクトップ環境と KVM 仮想機能を必要とします。
ディストリビューションごとにシステム要件やパッケージインストール手順を参照してください。
@z

@x
- [Ubuntu](/manuals/desktop/setup/install/linux/ubuntu.md)
- [Debian](/manuals/desktop/setup/install/linux/debian.md)
- [Fedora](/manuals/desktop/setup/install/linux/fedora.md)
@y
- [Ubuntu](manuals/desktop/setup/install/linux/ubuntu.md)
- [Debian](manuals/desktop/setup/install/linux/debian.md)
- [Fedora](manuals/desktop/setup/install/linux/fedora.md)
@z

@x
After installation, open **Docker Desktop** from your application menu.
See [Docker Desktop on Linux](/manuals/desktop/setup/install/linux/_index.md) for
supported platforms and virtualization setup.
@y
インストール後はアプリケーションメニューから **Docker Desktop** を開きます。
サポート対象のプラットフォームや仮想環境の設定方法については [Linux 向け Docker Desktop](manuals/desktop/setup/install/linux/_index.md) を参照してください。
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
> [!NOTE]
>
> Commercial use of Docker Desktop in larger enterprises (more than 250 employees
> or more than $10 million USD in annual revenue) requires a paid subscription.
> See [Docker Desktop licensing](/manuals/subscription-billing/desktop-license.md).
@y
> [!NOTE]
>
> より大きなエンタープライズ向け (従業員 250 名以上、あるいは年間収益 1 千万 US ドル以上) 
> の商業利用に関しては、有償サブスクリプションが必要となります。
> 詳しくは [Docker Desktop ライセンス](manuals/subscription-billing/desktop-license.md) を参照してください。
@z

@x
## Check the installation
@y
## インストール後の確認 {#check-the-installation}
@z

@x
With Docker Desktop running, open a terminal and run:
@y
Docker Desktop を実行状態とした上でターミナル画面を開き、以下を実行します。
@z

% snip command...

@x
The first command shows client and server versions. The second downloads a test
image and runs a container that prints a confirmation message.
@y
1 つめのコマンドはクライアントとサーバーのバージョンを表示します。
2 つめのコマンドはテストイメージをダウンロードしコンテナーを起動します。
このコンテナーは確認メッセージを表示します。
@z
