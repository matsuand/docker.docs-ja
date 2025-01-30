%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Learn how to install Docker Engine on Fedora. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, dnf, installation, fedora, install fedora, install docker engine, rpm, install, uninstall, upgrade,
  update
title: Install Docker Engine on Fedora
linkTitle: Fedora
@y
description: Learn how to install Docker Engine on Fedora. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, dnf, installation, fedora, install fedora, install docker engine, rpm, install, uninstall, upgrade,
  update
title: Fedora への Docker Engine インストール
linkTitle: Fedora
@z

@x
To get started with Docker Engine on Fedora, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@y
Fedora 上での Docker Engine を使い始めるにあたっては、[前提条件](#prerequisites) を満たしていることを確認した上で、以下の [インストール手順](#installation-methods) に従ってください。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
### OS requirements
@y
### OS 要件 {#os-requirements}
@z

@x
To install Docker Engine, you need a maintained version of one of the following
Fedora versions:
@y
Docker Engine をインストールするには、以下に示す Fedora バージョンのいずれかであることが必要です。
@z

@x
- Fedora 40
- Fedora 41
@y
- Fedora 40
- Fedora 41
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

% snip command...

@x
`dnf` might report that you have none of these packages installed.
@y
`dnf` はインストールされていないパッケージがあれば、その旨を表示するかもしれません。
@z

@x
Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't
automatically removed when you uninstall Docker.
@y
イメージ、コンテナー、ボリューム、ネットワークの各情報は `/var/lib/docker/` に保存されますが、これらは Docker をアンインストールしても自動的には削除されません。
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
- You can
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
@y
- [Docker リポジトリの設定](#install-using-the-repository) を行ってインストールを行います。
  インストールやアップグレードの作業は簡単に行うことができます。
  これが推奨される方法です。
@z

@x
- You can download the RPM package,
  [install it manually](#install-from-a-package), and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
@y
- RPM パッケージとしてダウンロードすることができるので、[手動でのインストール](#install-from-a-package) が可能です。
  手動によりアップグレード管理も十分に行うことができます。
  この方法はインターネットにアクセスできないオフライン環境において Docker をインストールする場合などに利用できます。
@z

@x
- In testing and development environments, you can use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@y
- テスト環境や開発環境向けであれば、Docker インストールを自動化している [便利スクリプト](#install-using-the-convenience-script) を利用することができます。
@z

@x
### Install using the rpm repository {#install-using-the-repository}
@y
### rpm リポジトリを利用したインストール {#install-using-the-repository}
@z

@x
Before you install Docker Engine for the first time on a new host machine, you
need to set up the Docker repository. Afterward, you can install and update
Docker from the repository.
@y
Docker Engine を初めてマシン上にインストールするには、Docker リポジトリの設定があらかじめ必要です。
これを行った後に、そのリポジトリから Docker のインストールやアップグレードを行います。
@z

@x
#### Set up the repository
@y
#### リポジトリの設定 {#set-up-the-repository}
@z

@x
Install the `dnf-plugins-core` package (which provides the commands to manage
your DNF repositories) and set up the repository.
@y
`dnf-plugins-core` パッケージ (DNF リポジトリ管理を行うコマンドを提供) をインストールし、リポジトリ設定を行います。
@z

% snip command...

@x
#### Install Docker Engine
@y
#### Docker Engine のインストール {#install-docker-engine}
@z

@x
1. Install the Docker packages.
@y
1. Docker パッケージをインストールします。
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
   If prompted to accept the GPG key, verify that the fingerprint matches
   `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@y
   GPG 鍵の受け入れを問うプロンプトが表示されたら、そのフィンガープリントが `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35` であるかどうか確認し、正しければ受け入れます。
@z

@x
   This command installs Docker, but it doesn't start Docker. It also creates a
   `docker` group, however, it doesn't add any users to the group by default.
@y
   これによって Docker がインストールされますが、まだ Docker は起動していません。
   この際には `docker` グループが生成されます。
   デフォルトではこのグループにユーザーは一人も属していません。
@z

@x
   {{< /tab >}}
   {{< tab name="Specific version" >}}
@y
   {{< /tab >}}
   {{< tab name="特定バージョン" >}}
@z

@x
   To install a specific version, start by listing the available versions in
   the repository:
@y
   特定バージョンをインストールするには、まずリポジトリ内の利用可能なバージョンを一覧表示します。
@z

% snip command...

@x
   The list returned depends on which repositories are enabled, and is specific
   to your version of Fedora (indicated by the `.fc40` suffix in this example).
@y
   表示される一覧は、どのリポジトリを有効にしているかによって変わります。
   そして Fedora の対象バージョンを示しています (この例では `.fc40` というサフィックスにより示されます)。
@z

@x
   Install a specific version by its fully qualified package name, which is
   the package name (`docker-ce`) plus the version string (2nd column),
   separated by a hyphen (`-`). For example, `docker-ce-3:{{% param "docker_ce_version" %}}-1.fc41`.
@y
   目的のバージョンを完全なパッケージ文字列を指定してインストールします。
   完全な文字列とは、まずパッケージ名 (`docker-ce`) があり、次にハイフン (`-`) で区切って (2 カラムめに) バージョン文字列が続きます。
   この例では `docker-ce-3:{{% param "docker_ce_version" %}}-1.fc41` といったものです。
@z

@x
   Replace `<VERSION_STRING>` with the desired version and then run the following
   command to install:
@y
   `<VERSION_STRING>` の部分は目的とするバージョン文字列に置き換えた上で、以下のコマンドを実行してインストールします。
@z

% snip command...

@x
   This command installs Docker, but it doesn't start Docker. It also creates a
   `docker` group, however, it doesn't add any users to the group by default.
@y
   これによって Docker がインストールされますが、まだ Docker は起動していません。
   この際には `docker` グループが生成されます。
   デフォルトではこのグループにユーザーは一人も属していません。
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. Start Docker Engine.
@y
2. Docker Engine を起動します。
@z

% snip command...

@x
   This configures the Docker systemd service to start automatically when you
   boot your system. If you don't want Docker to start automatically, use `sudo
   systemctl start docker` instead.
@y
   これによって Docker の systemd サービスがシステム起動時に自動的に実行されるようになります。
   Docker を自動起動させたくない場合は、ここではその代わりに `sudo systemctl start docker` を実行してください。
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
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
Docker Engine をアップグレードする場合は [インストール作業](#install-using-the-repository) に従います。
そこではインストールしたい新バージョンを選びます。
@z

@x
### Install from a package
@y
### パッケージからのインストール {#install-from-a-package}
@z

@x
If you can't use Docker's `rpm` repository to install Docker Engine, you can
download the `.rpm` file for your release and install it manually. You need to
download a new file each time you want to upgrade Docker Engine.
@y
Docker Engine のインストールにあたって Docker の `rpm` リポジトリを利用したくない場合は、対象となるリリースの `.rpm` ファイルをダウンロードして手動でインストールします。
Docker Engine のアップグレード時には、その都度、新しいファイルをダウンロードしてくることになります。
@z

@x
1. Go to [{{% param "download-url-base" %}}/]({{% param "download-url-base" %}}/)
   and choose your version of Fedora. Then browse to `x86_64/stable/Packages/`
   and download the `.rpm` file for the Docker version you want to install.
@y
1. [{{% param "download-url-base" %}}/]({{% param "download-url-base" %}}/) にアクセスして、利用している Fedora のバージョンを選びます。
   そして `x86_64/stable/Packages/` を開いて、インストールしたい Docker バージョンの `.rpm` ファイルをダウンロードします。
@z

@x
2. Install Docker Engine, changing the following path to the path where you downloaded
   the Docker package.
@y
2. Docker Engine をインストールします。
   以下におけるパス部分は、Docker パッケージをダウンロードしたパスに置き換えてください。
@z

% snip command...

@x
   Docker is installed but not started. The `docker` group is created, but no
   users are added to the group.
@y
   Docker がインストールされますが、まだ起動はしていません。
   この際には `docker` グループが生成されます。
   デフォルトではこのグループにユーザーは一人も属していません。
@z

@x
3. Start Docker Engine.
@y
3. Docker Engine を起動します。
@z

% snip command...

@x
   This configures the Docker systemd service to start automatically when you
   boot your system. If you don't want Docker to start automatically, use `sudo
   systemctl start docker` instead.
@y
   これによって Docker の systemd サービスがシステム起動時に自動的に実行されるようになります。
   Docker を自動起動させたくない場合は、ここではその代わりに `sudo systemctl start docker` を実行してください。
@z

@x
4. Verify that the installation is successful by running the `hello-world` image:
@y
4. インストールが成功したことを確認するために `hello-world` イメージを実行します。
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
[installation procedure](#install-from-a-package), using `dnf upgrade`
instead of `dnf install`, and point to the new files.
@y
Docker Engine をアップグレードするには、より最新のパッケージファイルをダウンロードして [インストール手順](#install-from-a-package) を再度行います。
その際には `dnf install` ではなく `dnf upgrade` を用いて新たなファイルを指定します。
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
