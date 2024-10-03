%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node ps
short: List tasks running on one or more nodes, defaults to current node
long: |-
    Lists all the tasks on a Node that Docker knows about. You can filter using the
    `-f` or `--filter` flag. Refer to the [filtering](#filter) section for more
    information about available filter options.
@y
command: docker node ps
short: List tasks running on one or more nodes, defaults to current node
long: |-
    Lists all the tasks on a Node that Docker knows about. You can filter using the
    `-f` or `--filter` flag. Refer to the [filtering](#filter) section for more
    information about available filter options.
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
usage: docker node ps [OPTIONS] [NODE...]
@y
usage: docker node ps [OPTIONS] [NODE...]
@z

% options:

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: Pretty-print tasks using a Go template
@y
      description: Pretty-print tasks using a Go template
@z

@x no-resolve
      description: Do not map IDs to Names
@y
      description: Do not map IDs to Names
@z

@x no-trunc
      description: Do not truncate output
@y
      description: Do not truncate output
@z

@x quiet
      description: Only display task IDs
@y
      description: Only display task IDs
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% examples:
% snip command...

@x
    ### Filtering (--filter) {#filter}
@y
    ### フィルター検索 (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is
    more than one filter, then pass multiple flags (e.g., `--filter "foo=bar"
    --filter "bif=baz"`).
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is
    more than one filter, then pass multiple flags (e.g., `--filter "foo=bar"
    --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    現在サポートされているフィルターは以下のとおりです。
@z

@x
    * [name](#name)
    * [id](#id)
    * [label](#label)
    * [desired-state](#desired-state)
@y
    * [name](#name)
    * [id](#id)
    * [label](#label)
    * [desired-state](#desired-state)
@z

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a task's name.
@y
    The `name` filter matches on all or part of a task's name.
@z

@x
    The following filter matches all tasks with a name containing the `redis` string.
@y
    The following filter matches all tasks with a name containing the `redis` string.
@z

% snip command...

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches a task's id.
@y
    The `id` filter matches a task's id.
@z

% snip command...

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches tasks based on the presence of a `label` alone or a `label` and a
    value.
@y
    The `label` filter matches tasks based on the presence of a `label` alone or a `label` and a
    value.
@z

@x
    The following filter matches tasks with the `usage` label regardless of its value.
@y
    The following filter matches tasks with the `usage` label regardless of its value.
@z

% snip command...

@x
    #### desired-state
@y
    #### desired-state
@z

@x
    The `desired-state` filter can take the values `running`, `shutdown`, or `accepted`.
@y
    The `desired-state` filter can take the values `running`, `shutdown`, or `accepted`.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### フォーマット指定 (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints tasks output
    using a Go template.
@y
    フォーマットオプション (`--format`) の指定により、Go 言語テンプレートを使ったわかりやすい検索結果を得ることができます。
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Go 言語テンプレートによるプレースホルダー（placeholder）は以下のとおりです。
@z

@x
    | Placeholder     | Description                                                      |
    |-----------------|------------------------------------------------------------------|
    | `.ID`           | Task ID                                                          |
    | `.Name`         | Task name                                                        |
    | `.Image`        | Task image                                                       |
    | `.Node`         | Node ID                                                          |
    | `.DesiredState` | Desired state of the task (`running`, `shutdown`, or `accepted`) |
    | `.CurrentState` | Current state of the task                                        |
    | `.Error`        | Error                                                            |
    | `.Ports`        | Task published ports                                             |
@y
    | プレースホルダー  | 内容説明                                                       |
    |-----------------|------------------------------------------------------------------|
    | `.ID`           | タスク ID                                                        |
    | `.Name`         | タスク名                                                         |
    | `.Image`        | タスクイメージ                                                   |
    | `.Node`         | ノード ID                                                        |
    | `.DesiredState` | 期待するタスクの状態 (`running`, `shutdown`, `accepted`)         |
    | `.CurrentState` | タスクの現在の状態                                               |
    | `.Error`        | エラー                                                           |
    | `.Ports`        | タスクの公開ポート                                               |
@z

@x
    When using the `--format` option, the `node ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    `--format` オプションを利用すると `node ps` コマンドは、テンプレートが定めるデータを直接出力します。
    あるいは `table` ディレクティブを指定していれば、カラムヘッダーも同時に出力されます。
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `Image` entries separated by a colon (`:`) for all tasks:
@y
    以下はヘッダーを含めずにテンプレートを利用する例です。
    すべてのタスクにおける `Name`、`Image` の各項目がコロン (`:`) で区切られて表示されます。
@z

% snip command...
% snip directives...
