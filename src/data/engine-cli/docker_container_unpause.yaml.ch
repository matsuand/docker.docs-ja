%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container unpause
aliases: docker container unpause, docker unpause
short: Unpause all processes within one or more containers
long: |-
    The `docker unpause` command un-suspends all processes in the specified containers.
    On Linux, it does this using the freezer cgroup.
@y
command: docker container unpause
aliases: docker container unpause, docker unpause
short: 1 つまたは複数コンテナー内における停止中プロセスを再開します。
long: |-
    `docker unpause` コマンドは指定されたコンテナー内のプロセスすべてについて、停止状態を解除します。
    Linux においては freezer cgroup を使ってこれが実現されます。
@z

@x
    See the
    [freezer cgroup documentation](https://www.kernel.org/doc/Documentation/cgroup-v1/freezer-subsystem.txt)
    for further details.
@y
    詳しくは [freezer cgroup のドキュメント](https://www.kernel.org/doc/Documentation/cgroup-v1/freezer-subsystem.txt) を参照してください。
@z

@x
usage: docker container unpause CONTAINER [CONTAINER...]
@y
usage: docker container unpause CONTAINER [CONTAINER...]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...
% snip directives...
