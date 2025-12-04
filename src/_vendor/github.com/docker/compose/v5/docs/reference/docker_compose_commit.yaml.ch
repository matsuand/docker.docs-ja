%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose commit
short: Create a new image from a service container's changes
long: Create a new image from a service container's changes
usage: docker compose commit [OPTIONS] SERVICE [REPOSITORY[:TAG]]
@y
command: docker compose commit
short: Create a new image from a service container's changes
long: Create a new image from a service container's changes
usage: docker compose commit [OPTIONS] SERVICE [REPOSITORY[:TAG]]
@z

% options:

@x author
      description: Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")
@y
      description: 作者 (たとえば "John Hannibal Smith <hannibal@a-team.com>")
@z

@x change
      description: Apply Dockerfile instruction to the created image
@y
      description: 生成済みイメージに対して Dockerfile 命令を適用します。
@z

@x index
      description: index of the container if service has multiple replicas.
@y
      description: サービスが複数のレプリカを有する場合のコンテナーのインデックス。
@z

@x message
      description: Commit message
@y
      description: コミットメッセージ。
@z

@x pause
      description: Pause container during commit
@y
      description: コミット中にコンテナーを一時的に停止します。
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
