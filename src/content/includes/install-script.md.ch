%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
### Install using the convenience script
@y
### 便利スクリプトを使ったインストール {#install-using-the-convenience-script}
@z

@x
Docker provides a convenience script at
[https://get.docker.com/](https://get.docker.com/) to install Docker into
development environments non-interactively. The convenience script isn't
recommended for production environments, but it's useful for creating a
provisioning script tailored to your needs. Also refer to the
[install using the repository](#install-using-the-repository) steps to learn
about installation steps to install using the package repository. The source code
for the script is open source, and you can find it in the
[`docker-install` repository on GitHub](https://github.com/docker/docker-install).
@y
Docker では [https://get.docker.com/](https://get.docker.com/) において便利なスクリプトを提供しています。
これは Docker を開発マシンに対話形式をとらずにすばやくインストールするものです。
このスクリプトを本番環境において利用することはお勧めしませんが、環境に適したプロビジョニングを行うサンプルとして活用することはできます。
また [リポジトリを利用したインストール](#install-using-the-repository) における作業手順に従うことで、パッケージリポジトリを利用したインストール手順を身につけることができます。
このスクリプトのソースコードはオープンソースであり、[GitHub 条の `docker-install` リポジトリ](https://github.com/docker/docker-install) から入手可能です。
@z

@x
Always examine scripts downloaded from the internet before running them locally.
Before installing, make yourself familiar with potential risks and limitations
of the convenience script:
@y
インターネットからスクリプトをダウンロードしたら、まず内容を十分確認してからローカル実行してください。
インストールにあたっては、この便利スクリプトの潜在的リスクや制限について、よく理解してください。
@z

@x
- The script requires `root` or `sudo` privileges to run.
- The script attempts to detect your Linux distribution and version and
  configure your package management system for you.
- The script doesn't allow you to customize most installation parameters.
- The script installs dependencies and recommendations without asking for
  confirmation. This may install a large number of packages, depending on the
  current configuration of your host machine.
- By default, the script installs the latest stable release of Docker,
  containerd, and runc. When using this script to provision a machine, this may
  result in unexpected major version upgrades of Docker. Always test upgrades in
  a test environment before deploying to your production systems.
- The script isn't designed to upgrade an existing Docker installation. When
  using the script to update an existing installation, dependencies may not be
  updated to the expected version, resulting in outdated versions.
@y
- スクリプトを実行するには `root` 権限か `sudo` が必要です。
- スクリプトは自動的に情報取得を行い、利用している Linux ディストリビューション、そのバージョン、そしてパッケージ管理システムの設定を行います。
- このスクリプトは、インストール時にパラメーターを受け渡すような設定はできないものになっています。
- スクリプトは依存パッケージや推奨パッケージをすべてインストールします。
  その際にはインストールして良いかどうかを問いません。
  したがって相当数のパッケージがインストールされることもあります。
  これはホストマシンのその時点での設定によります。
- このスクリプトはデフォルトでは、最新版の Docker、containerd、runc をインストールします。
  このスクリプトを使ってマシンをプロビジョニングした場合、Docker のメジャーバージョンへのアップグレードにより、予期しない結果を引き起こすことがあります。
  本番環境へのデプロイを行う際には、必ず (メジャーバージョンへの) アップグレードをテスト環境においてテストしておいてください。
- このスクリプトは、既にインストールされている Docker をアップグレードするように設計されていません。
  このスクリプトを利用して既存インストールをアップデートする際には、依存パッケージが思いどおりにアップデートされない場合があります。
  それによって古いバージョンのまま利用する状況となる場合があります。
@z

@x
> **Tip: preview script steps before running**
>
> You can run the script with the `--dry-run` option to learn what steps the
> script will run when invoked:
@y
> **ヒント**：  スクリプト実行前のインストールステップ確認
>
> 本スクリプトの実行にあたって `--dry-run` オプションを指定すると、このスクリプトのインストールステップを確認することができます。
@z

% snip command...

@x
This example downloads the script from
[https://get.docker.com/](https://get.docker.com/) and runs it to install the
latest stable release of Docker on Linux:
@y
以下は、このスクリプトを [https://get.docker.com/](https://get.docker.com/) からダウンロードして実行することで、Linux 上に最新安定版をインストールする例です。
@z

% snip command...

@x
You have now successfully installed and started Docker Engine. The `docker`
service starts automatically on Debian based distributions. On `RPM` based
distributions, such as CentOS, Fedora, RHEL or SLES, you need to start it
manually using the appropriate `systemctl` or `service` command. As the message
indicates, non-root users can't run Docker commands by default.
@y
Docker が正常にインストールされます。
Debian ベースのディストリビューションでは `docker` サービスが自動的に開始されます。
CentOS、Fedora、RHEL、SLES といった `RPM` ベースの場合は手動での実行が必要となるため、`systemctl` か `service` のいずれか適当なものを実行します。
上の出力メッセージに示されているように、デフォルトでは非 root ユーザーによる Docker コマンド実行はできません。
@z

@x
> **Use Docker as a non-privileged user, or install in rootless mode?**
>
> The installation script requires `root` or `sudo` privileges to install and
> use Docker. If you want to grant non-root users access to Docker, refer to the
> [post-installation steps for Linux](/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).
> You can also install Docker without `root` privileges, or configured to run in
> rootless mode. For instructions on running Docker in rootless mode, refer to
> [run the Docker daemon as a non-root user (rootless mode)](/engine/security/rootless/).
@y
> **非特権ユーザーでの Docker 利用、rootless モードでのインストール？**
>
> このインストールスクリプトでは、Docker をインストールして利用するために `root` あるいは `sudo` を用いた権限が必要です。
> 非 root ユーザーに Docker の利用を許可する場合は、[Linux インストール後の作業](__SUBDIR__/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) を参照してください。
> Docker は `root` 権限がなくてもインストールできます。
> つまり rootless モードにより実行することができます。
> rootless モードにより Docker を実行する手順については [root ユーザー以外による Docker デーモン起動（rootless モード）](__SUBDIR__/engine/security/rootless/) を参照してください。
@z

@x
#### Install pre-releases
@y
#### プレリリース版のインストール {#install-pre-releases}
@z

@x
Docker also provides a convenience script at
[https://test.docker.com/](https://test.docker.com/) to install pre-releases of
Docker on Linux. This script is equal to the script at `get.docker.com`, but
configures your package manager to use the test channel of the Docker package
repository. The test channel includes both stable and pre-releases (beta
versions, release-candidates) of Docker. Use this script to get early access to
new releases, and to evaluate them in a testing environment before they're
released as stable.
@y
Docker ではこの便利スクリプトを [https://test.docker.com/](https://test.docker.com/) からも提供しています。
これを使って Linux 上にプレリリース版の Docker をインストールできます。
このスクリプトは `get.docker.com` から入手するものと同等であり、パッケージマネージャーを使って Docker パッケージリポジトリのテストチャネルが利用できるように設定されています。
テストチャネルには Docker の安定版とプレリリース版 (ベータ版、リリース候補版) の双方が含まれています。
このスクリプトを利用すれば、新規リリース向けの早期アクセスが利用できます。
これにより安定版として提供されるよりも前に、テスト環境においてそれらを評価することができます。
@z

@x
To install the latest version of Docker on Linux from the test channel, run:
@y
Linux への Docker 最新版のインストールをテストチャネルから行うには、以下を実行します。
@z

% snip command...

@x
#### Upgrade Docker after using the convenience script
@y
#### 便利スクリプトを使った後の Docker のアップグレード {#upgrade-docker-after-using-the-convenience-script}
@z

@x
If you installed Docker using the convenience script, you should upgrade Docker
using your package manager directly. There's no advantage to re-running the
convenience script. Re-running it can cause issues if it attempts to re-install
repositories which already exist on the host machine.
@y
便利スクリプトを使って Docker をインストールした場合、Docker のアップグレードはパッケージマネージャーを直接使って行ってください。
便利スクリプトは再実行する意味はありません。
ホストマシンにリポジトリが追加されているところに、このスクリプトを再実行したとすると、そのリポジトリを再度追加してしまうため、問題になることがあります。
@z
