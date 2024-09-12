%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Install Docker Scout
linkTitle: Install
@y
title: Docker Scout のインストール
linkTitle: Install
@z

@x
description: Installation instructions for the Docker Scout CLI plugin
keywords: scout, cli, install, download
@y
description: Installation instructions for the Docker Scout CLI plugin
keywords: scout, cli, install, download
@z

@x
The Docker Scout CLI plugin comes pre-installed with Docker Desktop.
@y
Docker Scout の CLI プラグインは Docker Desktop 内にプリインストールされています。.
@z

@x
If you run Docker Engine without Docker Desktop,
Docker Scout doesn't come pre-installed,
but you can install it as a standalone binary.
@y
Docker Desktop を用いずに Docker Engine を実行している場合、Docker Scout はプリインストールされていません。
その場合はスタンドアロンバイナリーとしてインストールします。
@z

@x
To install the latest version of the plugin, run the following commands:
@y
最新バージョンのプラグインをインストールするには、以下のコマンドを実行します。
@z

% snip command...

@x
> [!NOTE]
>
> Always examine scripts downloaded from the internet before running them
> locally. Before installing, make yourself familiar with potential risks and
> limitations of the convenience script.
@y
> [!NOTE]
>
> インターネットからローカルにダウンロードしたスクリプトは、実行前に充分に内容を確認してください。
> インストールするにあたっては、この便利スクリプトが抱える潜在的リスクや制約について充分に理解しておいてください。
@z

@x
## Manual installation
@y
## Manual installation
@z

@x
{{< tabs >}}
{{< tab name="Linux" >}}
@y
{{< tabs >}}
{{< tab name="Linux" >}}
@z

@x
1. Download the latest release from the [releases page](https://github.com/docker/scout-cli/releases).
2. Create a subdirectory under `$HOME/.docker` called `scout`.
@y
1. Download the latest release from the [releases page](https://github.com/docker/scout-cli/releases).
2. Create a subdirectory under `$HOME/.docker` called `scout`.
@z

% snip command...

@x
3. Extract the archive and move the `docker-scout` binary to the `$HOME/.docker/scout` directory.
4. Make the binary executable: `chmod +x $HOME/.docker/scout/docker-scout`.
5. Add the `scout` subdirectory to your `.docker/config.json` as a plugin directory:
@y
3. Extract the archive and move the `docker-scout` binary to the `$HOME/.docker/scout` directory.
4. Make the binary executable: `chmod +x $HOME/.docker/scout/docker-scout`.
5. Add the `scout` subdirectory to your `.docker/config.json` as a plugin directory:
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="macOS" >}}
@y
{{< /tab >}}
{{< tab name="macOS" >}}
@z

@x
1. Download the latest release from the [releases page](https://github.com/docker/scout-cli/releases).
2. Create a subdirectory under `$HOME/.docker` called `scout`.
@y
1. Download the latest release from the [releases page](https://github.com/docker/scout-cli/releases).
2. Create a subdirectory under `$HOME/.docker` called `scout`.
@z

% snip command...

@x
3. Extract the archive and move the `docker-scout` binary to the `$HOME/.docker/scout` directory.
4. Make the binary executable:
@y
3. Extract the archive and move the `docker-scout` binary to the `$HOME/.docker/scout` directory.
4. Make the binary executable:
@z

% snip command...

@x
5. Authorize the binary to be executable on macOS:
@y
5. Authorize the binary to be executable on macOS:
@z

% snip command...

@x
6. Add the `scout` subdirectory to your `.docker/config.json` as a plugin directory:
@y
6. Add the `scout` subdirectory to your `.docker/config.json` as a plugin directory:
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
1. Download the latest release from the [releases page](https://github.com/docker/scout-cli/releases).
2. Create a subdirectory under `%USERPROFILE%/.docker` called `scout`.
@y
1. Download the latest release from the [releases page](https://github.com/docker/scout-cli/releases).
2. Create a subdirectory under `%USERPROFILE%/.docker` called `scout`.
@z

% snip command...

@x
3. Extract the archive and move the `docker-scout.exe` binary to the `%USERPROFILE%\.docker\scout` directory.
4. Add the `scout` subdirectory to your `.docker\config.json` as a plugin directory:
@y
3. Extract the archive and move the `docker-scout.exe` binary to the `%USERPROFILE%\.docker\scout` directory.
4. Add the `scout` subdirectory to your `.docker\config.json` as a plugin directory:
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Container image
@y
## Container image
@z

@x
The Docker Scout CLI plugin is also available as a [container image](https://hub.docker.com/r/docker/scout-cli).
Use the `docker/scout-cli` to run `docker scout` commands without installing the CLI plugin on your host.
@y
The Docker Scout CLI plugin is also available as a [container image](https://hub.docker.com/r/docker/scout-cli).
Use the `docker/scout-cli` to run `docker scout` commands without installing the CLI plugin on your host.
@z

% snip command...

@x
## GitHub Action
@y
## GitHub Action
@z

@x
The Docker Scout CLI plugin is also available as a [GitHub action](https://github.com/docker/scout-action).
You can use it in your GitHub workflows to automatically analyze images and evaluate policy compliance with each push.
@y
The Docker Scout CLI plugin is also available as a [GitHub action](https://github.com/docker/scout-action).
You can use it in your GitHub workflows to automatically analyze images and evaluate policy compliance with each push.
@z

@x
Docker Scout also integrates with many more CI/CD tools, such as Jenkins, GitLab, and Azure DevOps.
Learn more about the [integrations](./integrations/_index.md) available for Docker Scout.
@y
Docker Scout also integrates with many more CI/CD tools, such as Jenkins, GitLab, and Azure DevOps.
Learn more about the [integrations](./integrations/_index.md) available for Docker Scout.
@z
