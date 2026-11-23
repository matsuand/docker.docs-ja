%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Quick install Docker Sandboxes
linkTitle: Docker Sandboxes
description: Install the sbx CLI, sign in, and prepare to run an AI coding agent in a Docker Sandbox.
keywords: Docker Sandboxes, sbx, quick install, AI agents
@y
title: Docker Sandbox のクィックインストール
linkTitle: Docker Sandbox
description: sbx CLI のインストール、サインインを行い、Docker Sandbox 内での AI コーディングエージェント実行に向けて準備します。
keywords: Docker Sandbox, sbx, quick install, AI agents
@z

@x
Install the `sbx` CLI to run coding agents in local or cloud sandboxes.
Docker Desktop and Docker Engine are not required.
@y
`sbx` CLI をインストールして、ローカルまたはクラウドサンドボックス上においてコーディングエージェントを実行します。
@z

@x
## Install the CLI
@y
## CLI のインストール {#install-the-cli}
@z

@x
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
{{< tab name="macOS" >}}
@z

@x
Requires macOS Sonoma 14 or later on Apple silicon, with Homebrew installed.
@y
Apple silicon での macOS Sonoma 14 またはそれ以降、そして Homebrew がインストールされていることが必要です。
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
Requires Windows 11 on a 64-bit Intel or AMD processor. Install for your user
account with Windows Package Manager:
@y
64ビットの Intel または AMD プロセッサー上での Windows 11 が必要です。
Windows パッケージマネージャーを使って、ユーザーアカウントに対してインストールを行います。
@z

% snip command...

@x
Open a terminal after installation so it picks up the updated `PATH`.
@y
インストール後にターミナル画面を開いて、更新された `PATH` を反映させます。
@z

@x
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@y
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@z

@x
Requires Ubuntu 24.04 or later on a 64-bit Intel, AMD, or Arm processor.
Add Docker's package repository, then install `sbx`:
@y
64ビットの Intel、AMD、Arm プロセッサー上での Ubuntu 24.04 またはそれ以降が必要です。
Docker のパッケージリポジトリを追加して `sbx` をインストールします。
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
Local sandboxes also require hardware virtualization. Before starting a local
sandbox, follow the [platform prerequisites](/manuals/ai/sandboxes/install.md#prerequisites)
to set up Windows Hypervisor Platform or KVM where needed. Cloud sandboxes do
not require local virtualization.
@y
ローカルのサンドボックスにおいてはハードウェア仮想化機能が必要です。
ローカルのサンドボックスの利用にあたっては [プラットフォームの必須条件](manuals/ai/sandboxes/install.md#prerequisites) に従って、必要となる Windows ハイパーバイザーや KVM を設定してください。
クラウドのサンドボックスでは、ローカルの仮想化機能は必要ありません。
@z

@x
For manual downloads, machine-wide deployment, and troubleshooting, see the
[full Sandboxes installation instructions](/manuals/ai/sandboxes/install.md).
@y
手動でのダウンロード、マシンごとのデプロイメント、トラブルシューティングについては [サンドボックスのインストール完全手順](manuals/ai/sandboxes/install.md) を参照してください。
@z

@x
## Check the installation and sign in
@y
## インストール確認とサインイン {#check-the-installation-and-sign-in}
@z

% snip command...

@x
The login command opens your browser to sign in to Docker.
@y
ログインコマンドを実行するとブラウザーが開くので Docker にサインインします。
@z
