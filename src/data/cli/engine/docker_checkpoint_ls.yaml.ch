%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint ls
aliases: docker checkpoint ls, docker checkpoint list
short: List checkpoints for a container
long: List checkpoints for a container
usage: docker checkpoint ls [OPTIONS] CONTAINER
@y
command: docker checkpoint ls
aliases: docker checkpoint ls, docker checkpoint list
short: コンテナーのチェックポイントを一覧表示します。
long: コンテナーのチェックポイントを一覧表示します。
usage: docker checkpoint ls [OPTIONS] CONTAINER
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
