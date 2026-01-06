%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Specify a project name
@y
title: プロジェクト名の指定
@z

@x
description: Learn how to set a custom project name in Compose and understand the precedence of each method.
keywords: name, compose, project, -p flag, name top-level element
@y
description: Learn how to set a custom project name in Compose and understand the precedence of each method.
keywords: name, compose, project, -p flag, name top-level element
@z

@x
By default, Compose assigns the project name based on the name of the directory that contains the Compose file. You can override this with several methods.
@y
By default, Compose assigns the project name based on the name of the directory that contains the Compose file. You can override this with several methods.
@z

@x
This page offers examples of scenarios where custom project names can be helpful, outlines the various methods to set a project name, and provides the order of precedence for each approach.
@y
This page offers examples of scenarios where custom project names can be helpful, outlines the various methods to set a project name, and provides the order of precedence for each approach.
@z

@x
> [!NOTE]
>
> The default project directory is the base directory of the Compose file. A custom value can also be set
> for it using the [`--project-directory` command line option](/reference/cli/docker/compose.md#options).
@y
> [!NOTE]
>
> デフォルトのプロジェクトディレクトリは、Compose ファイルがあるベースディレクトリです。
> これについても [コマンドラインオプション `--project-directory`](reference/cli/docker/compose.md#options) を使って、独自のものに設定することができます。
@z

@x
## Example use cases
@y
## ユースケース例 {#example-use-cases}
@z

@x
Compose uses a project name to isolate environments from each other. There are multiple contexts where a project name is useful:
@y
Compose ではプロジェクト名を定めることで、それぞれの環境を独立させています。
There are multiple contexts where a project name is useful:
@z

@x
- On a development host: Create multiple copies of a single environment, useful for running stable copies for each feature branch of a project.
- On a CI server: Prevent interference between builds by setting the project name to a unique build number.
- On a shared or development host: Avoid interference between different projects that might share the same service names.
@y
- On a development host: Create multiple copies of a single environment, useful for running stable copies for each feature branch of a project.
- On a CI server: Prevent interference between builds by setting the project name to a unique build number.
- On a shared or development host: Avoid interference between different projects that might share the same service names.
@z

@x
## Set a project name
@y
## プロジェクト名の設定 {#set-a-project-name}
@z

@x
Project names must contain only lowercase letters, decimal digits, dashes, and
underscores, and must begin with a lowercase letter or decimal digit. If the
base name of the project directory or current directory violates this
constraint, alternative mechanisms are available.
@y
Project names must contain only lowercase letters, decimal digits, dashes, and
underscores, and must begin with a lowercase letter or decimal digit. If the
base name of the project directory or current directory violates this
constraint, alternative mechanisms are available.
@z

@x
The precedence order for each method, from highest to lowest, is as follows:
@y
The precedence order for each method, from highest to lowest, is as follows:
@z

@x
1. The `-p` command line flag. 
2. The [COMPOSE_PROJECT_NAME environment variable](environment-variables/envvars.md).
3. The [top-level `name:` attribute](/reference/compose-file/version-and-name.md) in your Compose file. Or the last `name:` if you [specify multiple Compose files](multiple-compose-files/merge.md) in the command line with the `-f` flag.
4. The base name of the project directory containing your Compose file. Or the base name of the first Compose file if you [specify multiple Compose files](multiple-compose-files/merge.md) in the command line with the `-f` flag. 
5. The base name of the current directory if no Compose file is specified.
@y
1. The `-p` command line flag. 
2. The [COMPOSE_PROJECT_NAME environment variable](environment-variables/envvars.md).
3. The [top-level `name:` attribute](reference/compose-file/version-and-name.md) in your Compose file. Or the last `name:` if you [specify multiple Compose files](multiple-compose-files/merge.md) in the command line with the `-f` flag.
4. The base name of the project directory containing your Compose file. Or the base name of the first Compose file if you [specify multiple Compose files](multiple-compose-files/merge.md) in the command line with the `-f` flag. 
5. The base name of the current directory if no Compose file is specified.
@z

@x
## What's next?
@y
## 次は何？ {#whats-next}
@z

@x
- Read up on [working with multiple Compose files](multiple-compose-files/_index.md).
- Explore some [sample apps](https://github.com/docker/awesome-compose).
@y
- Read up on [working with multiple Compose files](multiple-compose-files/_index.md).
- Explore some [sample apps](https://github.com/docker/awesome-compose).
@z
