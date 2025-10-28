%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint create
short: Create a checkpoint from a running container
long: Create a checkpoint from a running container
usage: docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT
@y
command: docker checkpoint create
short: 実行中コンテナーにチェックポイントを生成します。
long: 実行中コンテナーにチェックポイントを生成します。
usage: docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT
@z

% options:

@x checkpoint-dir
      description: Use a custom checkpoint storage directory
@y
      description: チェックポイントの情報を保存するカスタムディレクトリを用います。
@z

@x leave-running
      description: Leave the container running after checkpoint
@y
      description: チェックポイント以降もコンテナーを実行し続けます。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
