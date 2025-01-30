%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Jumpstart your client-side server applications with Docker Engine on
  Ubuntu. This guide details prerequisites and multiple methods to install Docker Engine on Ubuntu.
keywords: docker install script, ubuntu docker server, ubuntu server docker, install
  docker engine ubuntu, install docker on ubuntu server, ubuntu 22.04 docker-ce, install
  docker engine on ubuntu, ubuntu install docker ce, ubuntu install docker engine
title: Install Docker Engine on Ubuntu
@y
description: Jumpstart your client-side server applications with Docker Engine on
  Ubuntu. This guide details prerequisites and multiple methods to install Docker Engine on Ubuntu.
keywords: docker install script, ubuntu docker server, ubuntu server docker, install
  docker engine ubuntu, install docker on ubuntu server, ubuntu 22.04 docker-ce, install
  docker engine on ubuntu, ubuntu install docker ce, ubuntu install docker engine
title: Ubuntu への Docker Engine インストール
@z

@x
To get started with Docker Engine on Ubuntu, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@y
Ubuntu 上での Docker Engine を使い始めるにあたっては、[前提条件](#prerequisites) を満たしていることを確認した上で、以下の [インストール手順](#installation-methods) に従ってください。
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
- Docker is only compatible with `iptables-nft` and `iptables-legacy`.
  Firewall rules created with `nft` are not supported on a system with Docker installed.
  Make sure that any firewall rulesets you use are created with `iptables` or `ip6tables`,
  and that you add them to the `DOCKER-USER` chain,
  see [Packet filtering and firewalls](/manuals/engine/network/packet-filtering-firewalls.md).
@y
- ファイアウォール設定の管理に ufw または firewalld を利用している場合、Docker が利用するコンテナーポートが開放されていることを確認してください。
  そのポートはファイアウォールルールをバイパスします。
  詳しくは [Docker と ufw](manuals/engine/network/packet-filtering-firewalls.md#docker-and-ufw) を参照してください。
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
To install Docker Engine, you need the 64-bit version of one of these Ubuntu
versions:
@y
Docker Engine をインストールするには、以下に示す 64 ビット Ubuntu バージョンのいずれかであることが必要です。
@z

@x
- Ubuntu Noble 24.04 (LTS)
- Ubuntu Jammy 22.04 (LTS)
- Ubuntu Focal 20.04 (LTS)
@y
- Ubuntu Noble 24.04 (LTS)
- Ubuntu Jammy 22.04 (LTS)
- Ubuntu Focal 20.04 (LTS)
@z

@x
Docker Engine for Ubuntu is compatible with x86_64 (or amd64), armhf, arm64,
s390x, and ppc64le (ppc64el) architectures.
@y
Ubuntu における Docker Engine は x86_64 (または amd64), armhf, arm64, s390x, ppc64le (ppc64el) の各アーキテクチャーに対応しています。
@z

@x
### Uninstall old versions
@y
### 古いバージョンのアンインストール {#uninstall-old-versions}
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
- `docker-compose-v2`
- `docker-doc`
- `podman-docker`
@y
- `docker.io`
- `docker-compose`
- `docker-compose-v2`
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
Docker Engine を初めてマシン上にインストールするには、Docker の `apt` リポジトリの設定があらかじめ必要です。
これを行った後に、そのリポジトリから Docker のインストールやアップグレードを行います。
@z

@x
1. Set up Docker's `apt` repository.
@y
1. Docker の `apt` リポジトリを設定します。
@z

@x
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
   > [!NOTE]
   >
   > If you use an Ubuntu derivative distribution, such as Linux Mint,
   > you may need to use `UBUNTU_CODENAME` instead of `VERSION_CODENAME`.
@y
   > [!NOTE]
   >
   > Linux Mint のような Ubuntu 派生ディストリビューションを利用している場合は、`VERSION_CODENAME` ではなく `UBUNTU_CODENAME` を用いなければならない場合があります。
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

@x
   # List the available versions:
@y
   # 利用可能なバージョンを一覧表示
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
2. Select your Ubuntu version in the list.
@y
2. 一覧の中から Ubuntu バージョンを選びます。
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
   The Docker daemon starts automatically.
@y
   Docker デーモンは自動的に起動します。
@z

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
