%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node update
short: Update a node
long: |-
    Update metadata about a node, such as its availability, labels, or roles.
@y
command: docker node update
short: ノードを更新します。
long: |-
    ノードに関するメタデータを更新します。
    たとえば利用状態 (availability)、ラベル、ロールなどです。
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
usage: docker node update [OPTIONS] NODE
@y
usage: docker node update [OPTIONS] NODE
@z

% options:

@x availability
      description: Availability of the node (`active`, `pause`, `drain`)
@y
      description: ノードの利用状態。 (`active`, `pause`, `drain`)
@z

@x label-add
      description: Add or update a node label (`key=value`)
@y
      description: ノードラベルを追加または更新します。 (`key=value`)
@z

@x label-rm
      description: Remove a node label if exists
@y
      description: ノードにラベルが存在する場合に削除します。
@z

@x role
      description: Role of the node (`worker`, `manager`)
@y
      description: ノードのロール。 (`worker`, `manager`)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Add label metadata to a node (--label-add) {#label-add}
@y
examples: |-
    ### ラベルのメタデータをノードに追加 (--label-add) {#label-add}
@z

@x
    Add metadata to a swarm node using node labels. You can specify a node label as
    a key with an empty value:
@y
    ノードラベルを用いてメタデータを Swarm ノードに追加します。
    ノードラベルは、キーに対して空の値を設定することができます。
@z

% snip command...

@x
    To add multiple labels to a node, pass the `--label-add` flag for each label:
@y
    複数ラベルをノードに加えるには `--label-add` フラグを各ラベル指定に利用します。
@z

% snip command...

@x
    When you [create a service](/reference/cli/docker/service/create/),
    you can use node labels as a constraint. A constraint limits the nodes where the
    scheduler deploys tasks for a service.
@y
    [サービスの生成](__SUBDIR__/reference/cli/docker/service/create/) を行う際には、ノードラベルを制約として設定することができます。
    この制約は、ノードにおけるスケジューラーが、サービスに対するタスクのデプロイを制限します。
@z

@x
    For example, to add a `type` label to identify nodes where the scheduler should
    deploy message queue service tasks:
@y
    たとえば `type` ラベルを追加し、ノードにおけるスケジューラーが、メッセージキューサービスタスクをデプロイするものとするには、以下のようにします。
@z

% snip command...

@x
    The labels you set for nodes using `docker node update` apply only to the node
    entity within the swarm. Do not confuse them with the docker daemon labels for
    [dockerd](/reference/cli/dockerd/).
@y
    `docker node update` を使ってノードに設定するラベルは、Swarm 内にあるノードエンティティにのみ適用されます。
    これを [dockerd](__SUBDIR__/reference/cli/dockerd/) に対する Docker デーモンラベルと混同しないように注意してください。
@z

@x
    For more information about labels, refer to [apply custom
    metadata](/engine/userguide/labels-custom-metadata/).
@y
    ラベルに関する詳細は [独自メタデータの適用](__SUBDIR__/engine/userguide/labels-custom-metadata/) を参照してください。
@z

% snip directives...
