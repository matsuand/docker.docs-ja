%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Learn how to install Docker Engine on a 32-bit Raspberry Pi OS system. These instructions cover
  the different installation methods, how to uninstall, and next steps. Note that 32-bit support will be deprecated in Docker Engine v29 and later.
keywords: requirements, apt, installation, install docker engine, Raspberry Pi OS, install, uninstall, upgrade,
  update, deprecated
title: Install Docker Engine on Raspberry Pi OS (32-bit / armhf)
linkTitle: Raspberry Pi OS (32-bit / armhf) 
@y
description: Learn how to install Docker Engine on a 32-bit Raspberry Pi OS system. These instructions cover
  the different installation methods, how to uninstall, and next steps. Note that 32-bit support will be deprecated in Docker Engine v29 and later.
keywords: requirements, apt, installation, install docker engine, Raspberry Pi OS, install, uninstall, upgrade,
  update, deprecated
title: Raspberry Pi OS (32ビット/armhf) への Docker Engine インストール
linkTitle: Raspberry Pi OS (32ビット/armhf)
@z

@x
> [!WARNING]
>
> **Raspberry Pi OS 32-bit (armhf) Deprecation**
>
> Docker Engine v28 will be the last major version to support Raspberry Pi OS 32-bit (armhf).
> Starting with Docker Engine v29, new major versions will no longer provide packages for Raspberry Pi OS 32-bit (armhf).
@y
> [!WARNING]
>
> **Raspberry Pi OS 32 ビット (armhf) 版の廃止予定**
>
> Raspberry Pi OS 32 ビット (armhf)に対応する Docker Engine はバージョン 28 をもって終了します。
> Docker Engine バージョン 29 以降の新バージョンでは、Raspberry Pi OS 32 ビット (armhf) 向けのパッケージは提供されません。
@z

@x
> **Migration options**
> - **64-bit ARM:** Install the Debian `arm64` packages (fully supported). See the
>   [Debian installation instructions](debian.md).
> - **32-bit ARM (v7):** Install the Debian `armhf` packages (targets ARMv7 CPUs).
@y
> **移行の選択肢**
> - **64 ビット ARM** Debian `arm64` パッケージ (完全サポート) をインストールします。
   [Debian でのインストール手順](debian.md) を参照してください。
> - **32 ビット ARM (v7)** Debian `armhf` パッケージ (ARMv7 CPU 対応) をインストールします。
@z

@x
> **Note:** Older devices based on the ARMv6 architecture are no longer supported by official packages, including:
> - Raspberry Pi 1 (Model A/B/A+/B+)
> - Raspberry Pi Zero and Zero W
@y
> **メモ** ARMv6 アーキテクチャーに基づく古いデバイスは、公式パッケージではサポートされません。
> - Raspberry Pi 1 (モデル A/B/A+/B+)
> - Raspberry Pi Zero と Zero W
@z

@x
To get started with Docker Engine on Raspberry Pi OS, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@y
Raspberry Pi OS において Docker Engine をはじめるには [前提条件](#prerequisites) を満たした上で [インストール手順](#installation-methods) に従ってください。
@z

@x
> [!IMPORTANT]
>
> This installation instruction refers to the 32-bit (armhf) version of
> Raspberry Pi OS. If you're using the 64-bit (arm64) version, follow the
> instructions for [Debian](debian.md).
@y
> [!IMPORTANT]
>
> このインストール手順は Raspberry Pi OS 32 ビット (armhf) バージョンを用いています。
> 64 ビット (arm64) バージョンを利用する場合は [Debian](debian.md) における手順に従ってください。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
### Firewall limitations
@y
### ファイアウォールの制限 {#firewall-limitations}
@z

@x
> [!WARNING]
>
> Before you install Docker, make sure you consider the following
> security implications and firewall incompatibilities.
@y
> [!WARNING]
>
> Docker をインストールするにあたっては、以下に示すセキュリティに関する影響やファイアウォールの互換性について確認してください。
@z

@x
- If you use ufw or firewalld to manage firewall settings, be aware that
  when you expose container ports using Docker, these ports bypass your
  firewall rules. For more information, refer to
  [Docker and ufw](/manuals/engine/network/packet-filtering-firewalls.md#docker-and-ufw).
@y
- ファイアウォール設定の管理に ufw または firewalld を利用している場合、Docker が利用するコンテナーポートが開放されていることを確認してください。
  そのポートはファイアウォールルールをバイパスします。
  詳しくは [Docker と ufw](manuals/engine/network/packet-filtering-firewalls.md#docker-and-ufw) を参照してください。
@z

@x
- Docker is only compatible with `iptables-nft` and `iptables-legacy`.
  Firewall rules created with `nft` are not supported on a system with Docker installed.
  Make sure that any firewall rulesets you use are created with `iptables` or `ip6tables`,
  and that you add them to the `DOCKER-USER` chain,
  see [Packet filtering and firewalls](/manuals/engine/network/packet-filtering-firewalls.md).
@y
- Docker との互換性があるのは `iptables-nft` と `iptables-legacy` のみです。
  `nft` によって生成されたファイアウォールルールは、Docker をインストールしたシステム上ではサポートされません。
  したがって利用できるファイアウォールのルールセットは `iptables` または `ip6tables` によって生成されたものであり、それが `DOCKER-USER` チェーンに追加したものであることを確認してください。
  詳しくは [パケットフィルタリングとファイアウォール](manuals/engine/network/packet-filtering-firewalls.md) を参照してください。
@z

@x
### OS requirements
@y
### OS 要件 {#os-requirements}
@z

@x
To install Docker Engine, you need one of the following OS versions:
@y
Docker Engine をインストールするには、以下に示す OS バージョンのいずれかであることが必要です。
@z

@x
- 32-bit Raspberry Pi OS Bookworm 12 (stable)
- 32-bit Raspberry Pi OS Bullseye 11 (oldstable)
@y
- 32-bit Raspberry Pi OS Bookworm 12 (stable)
- 32-bit Raspberry Pi OS Bullseye 11 (oldstable)
@z

@x
> [!WARNING]
>
> Docker Engine v28 is the last major version to support Raspberry Pi OS 32-bit (armhf). Starting with v29,
> no new packages will be provided for 32-bit Raspberry Pi OS.
>
> Migration options:
> - 64-bit ARM: use Debian `arm64` packages; see the [Debian installation instructions](debian.md).
> - 32-bit ARM (v7): use Debian `armhf` packages (targets ARMv7 CPUs).
>
> Note: ARMv6-based devices (Raspberry Pi 1 models and Raspberry Pi Zero/Zero W) are not supported by
> official packages.
@y
> [!WARNING]
>
> Raspberry Pi OS 32 ビット (armhf)に対応する Docker Engine はバージョン 28 をもって終了します。
> Docker Engine バージョン 29 以降の新バージョンでは、Raspberry Pi OS 32 ビット (armhf) 向けのパッケージは提供されません。
>
> 移行の選択肢
> - 64 ビット ARM: Debian `arm64` パッケージを使います。
    [Debian でのインストール手順](debian.md) を参照してください。
> - 32 ビット ARM (v7): Debian `armhf` パッケージ (ARMv7 CPU 対応) を使います。
>
> メモ: ARMv6 ベースのデバイス (Raspberry Pi 1 モデルと Raspberry Pi Zero/Zero W) は、公式パッケージではサポートされません。
@z

@x
### Uninstall old versions
@y
### 旧バージョンのアンインストール {#uninstall-old-versions}
@z

@x
Before you can install Docker Engine, you need to uninstall any conflicting packages.
@y
Docker Engine をインストールするにあたっては、衝突しそうなパッケージをすべてアンインストールする必要があります。
@z

@x
Your Linux distribution may provide unofficial Docker packages, which may conflict
with the official packages provided by Docker. You must uninstall these packages
before you install the official version of Docker Engine.
@y
この Linux ディストリビューションでは Docker の非公式パッケージが提供されているかもしれません。
これは Docker が提供する公式パッケージとの間で衝突を引き起こします。
したがって Docker Engine の公式バージョンをインストールするには、そういったパッケージはあらかじめアンインストールしておく必要があります。
@z

@x
The unofficial packages to uninstall are:
@y
アンインストールするべき非公式パッケージとは以下のものです。
@z

@x
- `docker.io`
- `docker-compose`
- `docker-doc`
- `podman-docker`
@y
- `docker.io`
- `docker-compose`
- `docker-doc`
- `podman-docker`
@z

@x
Moreover, Docker Engine depends on `containerd` and `runc`. Docker Engine
bundles these dependencies as one bundle: `containerd.io`. If you have
installed the `containerd` or `runc` previously, uninstall them to avoid
conflicts with the versions bundled with Docker Engine.
@y
さらに Docker Engine は `containerd` と `runc` に依存しています。
Docker Engine にはバンドル製品として `containerd.io` が含まれています。
以前より `containerd` または `runc` をインストールしていた場合は、Docker Engine にバンドルされたバージョンとの衝突を回避するためにそれらをアンインストールします。
@z

@x
Run the following command to uninstall all conflicting packages:
@y
以下のコマンドを実行して、衝突が発生するパッケージすべてをアンインストールします。
@z

% snip command...

@x
`apt-get` might report that you have none of these packages installed.
@y
インストールされていないパッケージがあれば `apt-get` がその旨を表示します。
@z

@x
Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't
automatically removed when you uninstall Docker. If you want to start with a
clean installation, and prefer to clean up any existing data, read the
[uninstall Docker Engine](#uninstall-docker-engine) section.
@y
イメージ、コンテナー、ボリューム、ネットワークの各情報は `/var/lib/docker/` に保存されますが、これらは Docker をアンインストールしても自動的には削除されません。
既存のデータもすべて削除した状態でクリーンインストールを始めようとする場合は、[Docker Engine のアンインストール](#uninstall-docker-engine) の節を参照してください。
@z

@x
## Installation methods
@y
## インストール方法 {#installation-methods}
@z

@x
You can install Docker Engine in different ways, depending on your needs:
@y
Docker Engine のインストール方法はいくつかあるので、必要に応じて選んでください。
@z

@x
- Docker Engine comes bundled with
  [Docker Desktop for Linux](/manuals/desktop/setup/install/linux/_index.md). This is
  the easiest and quickest way to get started.
@y
- Docker Engine には [Linux 向け Docker Desktop](manuals/desktop/setup/install/linux/_index.md) にバンドルされて提供されています。
  Docker Engine を始めるにはこれを利用するのが最も簡単な方法です。
@z

@x
- Set up and install Docker Engine from
  [Docker's `apt` repository](#install-using-the-repository).
@y
- [Docker の `apt` リポジトリ](#install-using-the-repository) から Docker Engine を入手してインストールすることができます。
@z

@x
- [Install it manually](#install-from-a-package) and manage upgrades manually.
@y
- [手動でのインストール](#install-from-a-package) を行い、アップグレードも手動で行うことができます。
@z

@x
- Use a [convenience script](#install-using-the-convenience-script). Only
  recommended for testing and development environments.
@y
- [便利スクリプト](#install-using-the-convenience-script) を利用することができます。
  これはテスト環境や開発環境向けに利用することが推奨されます。
@z

@x
### Install using the `apt` repository {#install-using-the-repository}
@y
### `apt` リポジトリを利用したインストール {#install-using-the-repository}
@z

@x
Before you install Docker Engine for the first time on a new host machine, you
need to set up the Docker `apt` repository. Afterward, you can install and update
Docker from the repository.
@y
Docker Engine を初めてマシン上にインストールするには、Docker リポジトリの設定があらかじめ必要です。
これを行った後に、そのリポジトリから Docker のインストールやアップグレードを行います。
@z

@x
1. Set up Docker's `apt` repository.
@y
1. Docker の `apt` リポジトリを設定します。
@z

@x within command
   # Add Docker's official GPG key:
@y
   # Docker の公式 GPG 鍵の追加
@z
@x
   # Add the repository to Apt sources:
@y
   # Apt ソースへのリポジトリ追加
@z

@x
2. Install the Docker packages.
@y
2. Docker パッケージをインストールします。
@z

@x
   {{< tabs >}}
   {{< tab name="Latest" >}}
@y
   {{< tabs >}}
   {{< tab name="最新バージョン" >}}
@z

@x
   To install the latest version, run:
@y
   最新バージョンをインストールするには以下を実行します。
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Specific version" >}}
@y
   {{< /tab >}}
   {{< tab name="特定バージョン" >}}
@z

@x
   To install a specific version of Docker Engine, start by listing the
   available versions in the repository:
@y
   Docker Engine の特定バージョンをインストールするには、まずリポジトリ内の利用可能なバージョンを一覧表示します。
@z

@x within code
   # List the available versions:
@y
   # 利用可能バージョンの一覧表示
@z

@x
   Select the desired version and install:
@y
   必要なバージョンを選んでインストールします。
@z

% snip command...

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
    > The Docker service starts automatically after installation. To verify that
    > Docker is running, use:
@y
    > [!NOTE]
    >
    > インストール後は Docker サービスが自動起動します。
    > Docker が動作しているかどうかは、以下により確認します。
@z

% snip code...

@x
    > Some systems may have this behavior disabled and will require a manual start:
@y
    > システムの中にはこの自動起動という動作を無効にするものがあります。
    > その場合は手動により以下を実行します。
@z

% snip code...

@x
3. Verify that the installation is successful by running the `hello-world` image:
@y
3. インストールが成功したことを確認するために `hello-world` イメージを実行します。
@z

% snip command...

@x
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a confirmation message and exits.
@y
   このコマンドを実行すると、テストイメージがダウンロードされてコンテナーとして実行します。
   コンテナーが実行されると、確認メッセージが表示されて終了します。
@z

@x
You have now successfully installed and started Docker Engine.
@y
Docker Engine のインストールと起動が正常に行われました。
@z

@x
{{% include "root-errors.md" %}}
@y
{{% include "root-errors.md" %}}
@z

@x
#### Upgrade Docker Engine
@y
#### Docker Engine のアップグレード {#upgrade-docker-engine}
@z

@x
To upgrade Docker Engine, follow step 2 of the
[installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
Docker Engine をアップグレードする場合は [インストール作業](#install-using-the-repository) の手順 2 に従います。
そこではインストールしたい新バージョンを選びます。
@z

@x
### Install from a package
@y
### パッケージからのインストール {#install-from-a-package}
@z

@x
If you can't use Docker's `apt` repository to install Docker Engine, you can
download the `deb` file for your release and install it manually. You need to
download a new file each time you want to upgrade Docker Engine.
@y
Docker Engine のインストールにあたって Docker の `apt` リポジトリを利用したくない場合は、対象となるリリースの `deb` ファイルをダウンロードして手動でインストールします。
Docker Engine のアップグレード時には、その都度、新しいファイルをダウンロードしてくることになります。
@z

@x
1. Go to [`{{% param "download-url-base" %}}/dists/`]({{% param "download-url-base" %}}/dists/).
@y
1. [`{{% param "download-url-base" %}}/dists/`]({{% param "download-url-base" %}}/dists/) にアクセスします。
@z

@x
2. Select your Raspberry Pi OS version in the list.
@y
2. 一覧の中から Raspberry Pi OS バージョンを選びます。
@z

@x
3. Go to `pool/stable/` and select the applicable architecture (`amd64`,
   `armhf`, `arm64`, or `s390x`).
@y
3. `pool/stable/` を開いて、適用可能なアーキテクチャー (`amd64`, `armhf`, `arm64`, `s390x`) を選びます。
@z

@x
4. Download the following `deb` files for the Docker Engine, CLI, containerd,
   and Docker Compose packages:
@y
4. Docker Engine、CLI、containerd、Docker Compose パッケージを表す以下の `deb` ファイルをダウンロードします。
@z

@x
   - `containerd.io_<version>_<arch>.deb`
   - `docker-ce_<version>_<arch>.deb`
   - `docker-ce-cli_<version>_<arch>.deb`
   - `docker-buildx-plugin_<version>_<arch>.deb`
   - `docker-compose-plugin_<version>_<arch>.deb`
@y
   - `containerd.io_<version>_<arch>.deb`
   - `docker-ce_<version>_<arch>.deb`
   - `docker-ce-cli_<version>_<arch>.deb`
   - `docker-buildx-plugin_<version>_<arch>.deb`
   - `docker-compose-plugin_<version>_<arch>.deb`
@z

@x
5. Install the `.deb` packages. Update the paths in the following example to
   where you downloaded the Docker packages.
@y
5. `.deb` パッケージをインストールします。
   以下に例におけるパス指定では、Docker パッケージ類をダウンロードしたパスに置き換えてください。
@z

% snip command...

@x
    > [!NOTE]
    >
    > The Docker service starts automatically after installation. To verify that
    > Docker is running, use:
@y
    > [!NOTE]
    >
    > インストール後は Docker サービスが自動起動します。
    > Docker が動作しているかどうかは、以下により確認します。
@z

% snip command...

@x
    > Some systems may have this behavior disabled and will require a manual start:
@y
    > システムの中にはこの自動起動という動作を無効にするものがあります。
    > その場合は手動により以下を実行します。
@z

% snip command...

@x
6. Verify that the installation is successful by running the `hello-world` image:
@y
6. インストールが成功したことを確認するために `hello-world` イメージを実行します。
@z

% snip command...

@x
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a confirmation message and exits.
@y
   このコマンドを実行すると、テストイメージがダウンロードされてコンテナーとして実行します。
   コンテナーが実行されると、確認メッセージが表示されて終了します。
@z

@x
You have now successfully installed and started Docker Engine.
@y
Docker Engine のインストールと起動が正常に行われました。
@z

@x
{{% include "root-errors.md" %}}
@y
{{% include "root-errors.md" %}}
@z

@x
#### Upgrade Docker Engine
@y
#### Docker Engine のアップグレード {#upgrade-docker-engine}
@z

@x
To upgrade Docker Engine, download the newer package files and repeat the
[installation procedure](#install-from-a-package), pointing to the new files.
@y
Docker Engine をアップグレードするには、新たなパッケージファイルをダウンロードして [インストール手順](#install-from-a-package) に従います。
対象ファイルは新しいものに置き換えてください。
@z

@x
{{% include "install-script.md" %}}
@y
{{% include "install-script.md" %}}
@z

@x
## Uninstall Docker Engine
@y
## Docker Engine のアンインストール {#uninstall-docker-engine}
@z

@x
1. Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
@y
1. Docker Engine, CLI、containerd、Docker Compose パッケージをアンインストールするには以下を行います。
@z

% snip command...

@x
2. Images, containers, volumes, or custom configuration files on your host
   aren't automatically removed. To delete all images, containers, and volumes:
@y
2. イメージ、コンテナー、ボリューム、独自の設定ファイルは自動的には削除されません。
   イメージ、コンテナー、ボリュームを削除するには以下を行います。
@z

% snip command...

@x
3. Remove source list and keyrings
@y
3. ソースリストとキーリングを削除します。
@z

% snip command...

@x
You have to delete any edited configuration files manually.
@y
独自に編集した設定ファイルは手動で削除する必要があります。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@y
- [Linux インストール後の作業](linux-postinstall.md) に進んでください。
@z
