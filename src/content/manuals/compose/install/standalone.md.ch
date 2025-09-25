%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Install the Docker Compose standalone
linkTitle: Standalone
description: Instructions for installing the legacy Docker Compose standalone tool on Linux and Windows Server
keywords: install docker-compose, standalone docker compose, docker-compose windows server, install docker compose linux, legacy compose install
@y
title: Install the Docker Compose standalone
linkTitle: Standalone
description: Instructions for installing the legacy Docker Compose standalone tool on Linux and Windows Server
keywords: install docker-compose, standalone docker compose, docker-compose windows server, install docker compose linux, legacy compose install
@z

@x
This page contains instructions on how to install Docker Compose standalone on Linux or Windows Server, from the command line.
@y
このページでは Linux または Windows Server 上において、コマンドラインを使ってスタンドアローンの Docker Compose をインストールする手順を示します。
@z

@x
> [!WARNING]
>
> The Docker Compose standalone uses the `-compose` syntax instead of the current standard syntax `compose`.  
> For example, you must type `docker-compose up` when using Docker Compose standalone, instead of `docker compose up`.
@y
> [!WARNING]
>
> スタンドアローンの Compose では、現時点の標準文法となっている `compose` ではなく `-compose` を利用します。
> たとえばスタンドアローンの Compose では `docker compose up` ではなく `docker-compose up` と入力してください。
@z

@x
## On Linux
@y
## Linux {#on-linux}
@z

@x
1. To download and install the Docker Compose standalone, run:
@y
1. 以下を実行して、スタンドアローンの Docker Compose をダウンロードしインストールします。
@z

% snip command...

@x
2. Apply executable permissions to the standalone binary in the target path for the installation.
@y
2. インストール先となっているパス内のスタンドアローンバイナリーに対して実行パーミッションを与えます。
@z

% snip command...

@x
3. Test and execute Docker Compose commands using `docker-compose`.
@y
3. `docker-compose` を実行して Docker Compose コマンドの実行を確認します。
@z

@x
> [!TIP]
>
> If the command `docker-compose` fails after installation, check your path.
> You can also create a symbolic link to `/usr/bin` or any other directory in your path.
> For example:
@y
> [!TIP]
>
> インストール後に `docker-compose` コマンドが失敗した場合は、インストールパスを確認してください。
> また `/usr/bin` あるいはパスとしている別のディレクトリへのリンクを生成して対処することもできます。
> たとえば以下のとおりです。
@z

% snip command...

@x
## On Windows Server
@y
## Windows Server {#on-windows-server}
@z

@x
Follow these instructions if you are [running the Docker daemon directly
on Microsoft Windows Server](/manuals/engine/install/binaries.md#install-server-and-client-binaries-on-windows) and want to install Docker Compose.
@y
[Microsoft Windows Server において Docker デーモンを直接利用](manuals/engine/install/binaries.md#install-server-and-client-binaries-on-windows) していて Docker Compose をインストールする場合は、以下の手順に従います。
@z

@x
1.  Run PowerShell as an administrator.
    In order to proceed with the installation, select **Yes** when asked if you want this app to make changes to your device.
@y
1.  PowerShell を管理者権限で起動します。
    アプリからデバイスに対しての変更を許可するように問われたら、**はい** を選んでインストール作業を進めます。
@z

@x
2.  Optional. Ensure TLS1.2 is enabled. 
    GitHub requires TLS1.2 for secure connections. If you’re using an older version of Windows Server, for example 2016, or suspect that TLS1.2 is not enabled, run the following command in PowerShell:
@y
2.  任意の作業。
    TLS1.2 の有効化操作です。
    GitHub では TLS1.2 によるセキュア接続が必要です。
    利用している Windows Server が 2016 などのように古いバージョンである場合、あるいは TLS1.2 が無効化されているような場合は、PowerShell において以下のコマンドを実行します。
@z

% snip code...

@x
3. Download the latest release of Docker Compose ({{% param "compose_version" %}}). Run the following command:
@y
3. 以下のコマンドを実行して Docker Compose の最新リリース ({{% param "compose_version" %}}) をダウンロードします。
@z

% snip code...

@x
    > [!NOTE]
    >
    > On Windows Server 2019 you can add the Compose executable to `$Env:ProgramFiles\Docker`.
     Because this directory is registered in the system `PATH`, you can run the `docker-compose --version` 
     command on the subsequent step with no additional configuration.
@y
    > [!NOTE]
    >
    > Windows Server 2019 においては、Compose 実行ファイルを `$Env:ProgramFiles\Docker` にインストールすることもできます。
    > このディレクトリはシステムの `PATH` に登録されているため、この後の手順においては、特になにも設定せずに `docker-compose --version` コマンドを実行することができます。
@z

@x
4.  Test the installation.
@y
4.  インストール結果を確認します。
@z

% snip command...

@x
## What's next?
@y
## What's next?
@z

@x
- [Understand how Compose works](/manuals/compose/intro/compose-application-model.md)
- [Try the Quickstart guide](/manuals/compose/gettingstarted.md)
@y
- [Understand how Compose works](manuals/compose/intro/compose-application-model.md)
- [Try the Quickstart guide](manuals/compose/gettingstarted.md)
@z
