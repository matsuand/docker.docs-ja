%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint rm
aliases: docker checkpoint rm, docker checkpoint remove
short: Remove a checkpoint
long: Remove a checkpoint
usage: docker checkpoint rm [OPTIONS] CONTAINER CHECKPOINT
@y
command: docker checkpoint rm
aliases: docker checkpoint rm, docker checkpoint remove
short: チェックポイントを削除します。
long: チェックポイントを削除します。
usage: docker checkpoint rm [OPTIONS] CONTAINER CHECKPOINT
@z

% options:

@x checkpoint-dir
      description: Use a custom checkpoint storage directory
@y
      description: チェックポイントの情報を保存するカスタムディレクトリを用います。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
