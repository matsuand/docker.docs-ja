%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container wait
aliases: docker container wait, docker wait
short: Block until one or more containers stop, then print their exit codes
long: Block until one or more containers stop, then print their exit codes
usage: docker container wait CONTAINER [CONTAINER...]
@y
command: docker container wait
aliases: docker container wait, docker wait
short: 1 つまたは複数コンテナーが停止するまで待ち、各終了コードを表示します。
long: 1 つまたは複数コンテナーが停止するまで待ち、各終了コードを表示します。
usage: docker container wait CONTAINER [CONTAINER...]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    Start a container in the background.
@y
examples: |-
    コンテナーをバックグラウンドで実行します。
@z

% snip command...

@x
    Run `docker wait`, which should block until the container exits.
@y
    `docker wait` を実行します。
    コンテナーが終了するまでコマンドはブロックされます。
@z

% snip command...

@x
    In another terminal, stop the first container. The `docker wait` command above
    returns the exit code.
@y
    別端末から最初のコンテナーを停止させます。
    上の `docker wait` コマンドが終了コードを返します。
@z

% snip command...

@x
    This is the same `docker wait` command from above, but it now exits, returning
    `0`.
@y
    以下ははじめの `docker wait` コマンドと同じです。
    ただしこの場合は終了して `0` を返します。
@z

% snip command...
% snip directives...
