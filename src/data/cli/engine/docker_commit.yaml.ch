%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker commit
aliases: docker container commit, docker commit
short: Create a new image from a container's changes
long: Create a new image from a container's changes
usage: docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
@y
command: docker commit
aliases: docker container commit, docker commit
short: コンテナーの変更内容からイメージを新たに生成します。
long: コンテナーの変更内容からイメージを新たに生成します。
usage: docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
@z

% pname: docker
% plink: docker.yaml
% options:

@x author
      description: Author (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
@y
      description: 作者。(たとえば `John Hannibal Smith <hannibal@a-team.com>`)
@z

@x change
      description: Apply Dockerfile instruction to the created image
@y
      description: Dockerfile 命令を生成イメージに適用します。
@z

@x message
      description: Commit message
@y
      description: コミットメッセージ。
@z

@x no-pause
      description: Disable pausing container during commit
@y
      description: コミット時のコンテナー一時停止を無効にします。
@z

@x pause
      description: 'Pause container during commit (deprecated: use --no-pause instead)'
@y
      description: 'コミット中はコンテナーを一時停止します (廃止予定: 代わりに --no-pause を使ってください)。'
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
