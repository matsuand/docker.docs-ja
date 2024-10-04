%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node rm
aliases: docker node rm, docker node remove
short: Remove one or more nodes from the swarm
long: |-
    Removes the specified nodes from a swarm.
@y
command: docker node rm
aliases: docker node rm, docker node remove
short: 1 つまたは複数ノードを Swarm から削除します。
long: |-
    指定したノードを Swarm から削除します。
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker node rm [OPTIONS] NODE [NODE...]
@y
usage: docker node rm [OPTIONS] NODE [NODE...]
@z

% options:

@x force
      description: Force remove a node from the swarm
@y
      description: Swarm からノードを強制的に削除します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Remove a stopped node from the swarm
@y
examples: |-
    ### 停止中ノードの Swarm からの削除 {#remove-a-stopped-node-from-the-swarm}
@z

% snip command...

@x
    ### Attempt to remove a running node from a swarm
@y
    ### 実行中ノードの Swarm からの削除 {#attempt-to-remove-a-running-node-from-a-swarm}
@z

@x
    Removes the specified nodes from the swarm, but only if the nodes are in the
    down state. If you attempt to remove an active node you will receive an error:
@y
    指定されたノードを Swarm から削除するのは、ノードが停止している場合に限ります。
    アクティブなノードを削除しようとした場合はエラーになります。
@z

% snip command...

@x
    ### Forcibly remove an inaccessible node from a swarm (--force) {#force}
@y
    ### アクセス不能ノードの Swarm からの強制削除 (--force) {#force}
@z

@x
    If you lose access to a worker node or need to shut it down because it has been
    compromised or is not behaving as expected, you can use the `--force` option.
    This may cause transient errors or interruptions, depending on the type of task
    being run on the node.
@y
    ワーカーノードへのアクセスができない、セキュリティ侵害されているとか思ったように動作しないので停止したいといった場合には `--force` オプションを利用します。
    このときにはノード上に実行されていたタスクの種類に応じて、一時的なエラーや中断が発生することがあります。
@z

% snip command...

@x
    A manager node must be demoted to a worker node (using `docker node demote`)
    before you can remove it from the swarm.
@y
    マネージャーノードは（`docker node demote` を使って）ワーカーノードに降格しておかないと、Swarm から削除することはできません。
@z

% snip directives...
