%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker attach
aliases: docker container attach, docker attach
short: |
    Attach local standard input, output, and error streams to a running container
long: |
    Attach local standard input, output, and error streams to a running container
usage: docker attach [OPTIONS] CONTAINER
@y
command: docker attach
aliases: docker container attach, docker attach
short: |
    ローカルの標準入出力やエラー出力を実行中コンテナーにアタッチします。
long: |
    ローカルの標準入出力やエラー出力を実行中コンテナーにアタッチします。
usage: docker attach [OPTIONS] CONTAINER
@z

% options:

@x detach-keys
      description: Override the key sequence for detaching a container
@y
      description: コンテナーデタッチのためのキーシーケンスをオーバーライドします。
@z

@x no-stdin
      description: Do not attach STDIN
@y
      description: STDIN をアタッチしません。
@z

@x sig-proxy
      description: Proxy all received signals to the process
@y
      description: 受信シグナルをすべてプロセスにプロキシーします。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
