%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node ls
aliases: docker node ls, docker node list
short: List nodes in the swarm
long: |-
    Lists all the nodes that the Docker Swarm manager knows about. You can filter
    using the `-f` or `--filter` flag. Refer to the [filtering](#filter) section
    for more information about available filter options.
@y
command: docker node ls
aliases: docker node ls, docker node list
short: Swarm 内ノードを一覧表示します。
long: |-
    Docker Swarm マネージャーが管理するノードを一覧表示します。
    `-f` または `--filter` フラグを使えばフィルター検索を行うことができます。
    フィルター検索時のオプションの詳細は [フィルター検索](#filter) の節を参照してください。
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
usage: docker node ls [OPTIONS]
@y
usage: docker node ls [OPTIONS]
@z

% options:

@x filter
      description: Filter output based on conditions provided
@y
      description: 指定された条件に基づいてフィルター検索を行います。
@z

@x format
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        カスタムテンプレートを使って出力をフォーマットします。
        'table':            カラムヘッダー付きの表形式により出力します。(デフォルト)
        'table TEMPLATE':   指定された Go テンプレートを使って表形式により出力します。
        'json':             JSON 書式により出力します。
        'TEMPLATE':         指定された Go テンプレートを使って出力します。
        テンプレートを使ったフォーマット出力の詳細は __HOSTURL____SUBDIR__/engine/cli/formatting/ を参照してください。
@z

@x quiet
      description: Only display IDs
@y
      description: ID のみを表示します。
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

@x
    > [!NOTE]
    > In the above example output, there is a hidden column of `.Self` that indicates
    > if the node is the same node as the current docker daemon. A `*` (e.g.,
    > `e216jshn25ckzbvmwlnh5jr3g *`) means this node is the current docker daemon.
@y
    > [!NOTE]
    > 上の例における出力では、隠れ項目として.Selfがあります。
    > そのノードが、カレントな Docker デーモンとしてのノードであることを表わします。
    > アスタリスク `*` (例では `e216jshn25ckzbvmwlnh5jr3g *`) は、それがカレントな Docker デーモンのノードであることを意味しています。
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### フィルター検索 (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    フィルターフラグ (`-f` または `--filter`) の書式は "key=value" ペアとして指定します。
    フィルターが複数必要な場合は、フラグを複数回指定します (たとえば `--filter "foo=bar" --filter "bif=baz"` とします)。
@z

@x
    The currently supported filters are:
@y
    現在サポートされているフィルターは以下のとおりです。
@z

@x
    * [id](#id)
    * [label](#label)
    * [node.label](#nodelabel)
    * [membership](#membership)
    * [name](#name)
    * [role](#role)
@y
    * [id](#id)
    * [label](#label)
    * [node.label](#nodelabel)
    * [membership](#membership)
    * [name](#name)
    * [role](#role)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or part of a node's id.
@y
    `id` フィルターは、ノード ID の全部または一部を検索します。
@z

% snip command...

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches nodes based on engine labels and on the presence of a
    `label` alone or a `label` and a value. Engine labels are configured in
    the [daemon configuration](/reference/cli/dockerd/#daemon-configuration-file). To filter on
    Swarm `node` labels, use [`node.label` instead](#nodelabel).
@y
    `label` フィルターは engine ラベルに対応するノードを検索するものであり、`label` のみが存在するノードか、あるいは `label` と値が存在するノードに対しての検索を行います。
    Engine ラベルは [デーモン設定](__SUBDIR__/reference/cli/dockerd/#daemon-configuration-file) において設定されます。
    Swarm の `node` ラベルを検索する場合は、これではなく [`node.label`](#nodelabel) を用いてください。
@z

@x
    The following filter matches nodes with the `foo` label regardless of its value.
@y
    以下の例では `foo` ラベルを持ったノードを検索します。
    この場合、その値の内容は問いません。
@z

% snip command...

@x
    #### node.label
@y
    #### node.label
@z

@x
    The `node.label` filter matches nodes based on node labels and on the presence
    of a `node.label` alone or a `node.label` and a value.
@y
    `node.label` フィルターはノードラベルを検索するものであり、`node.label` のみが存在するノードか、あるいは `node.label` と値が存在するノードに対しての検索を行います。
@z

@x
    The following filter updates nodes to have a `region` node label:
@y
    以下のフィルターでは、各ノードに対して `region` というノードラベルを更新します。
@z

% snip command...

@x
    Show all nodes that have a `region` node label set:
@y
    以下は `region` というノードラベルを持つノードをすべて検索します。
@z

% snip command...

@x
    Show all nodes that have a `region` node label, with value `region-a`:
@y
    以下は `region` というノードラベルを持ち、かつ値として `region-a` を持つものを検索します。
@z

% snip command...

@x
    #### membership
@y
    #### membership
@z

@x
    The `membership` filter matches nodes based on the presence of a `membership` and a value
    `accepted` or `pending`.
@y
    `membership` フィルターは `membership` というラベルが存在するノードであって、その値が `accepted` か `pending` であるものを検索します。
@z

@x
    The following filter matches nodes with the `membership` of `accepted`.
@y
    以下の例では `membership` ラベルに対して `accepted` が設定されているノードを検索します。
@z

% snip command...

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a node hostname.
@y
    `name` フィルターはノード名の全部または一部を検索します。
@z

@x
    The following filter matches the nodes with a name equal to `swarm-master` string.
@y
    以下のフィルター指定では `swarm-master` という名前に一致するノードすべてを検索します。
@z

% snip command...

@x
    #### role
@y
    #### role
@z

@x
    The `role` filter matches nodes based on the presence of a `role` and a value `worker` or `manager`.
@y
    `role` フィルターは `role` というラベルが存在するノードであって、その値が `worker` か `manager` であるものを検索します。
@z

@x
    The following filter matches nodes with the `manager` role.
@y
    以下の例では `manager` ロールが設定されているノードを検索します。
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### フォーマット指定 (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints nodes output
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
    | Placeholder      | Description                                                                                           |
    |------------------|-------------------------------------------------------------------------------------------------------|
    | `.ID`            | Node ID                                                                                               |
    | `.Self`          | Node of the daemon (`true/false`, `true`indicates that the node is the same as current docker daemon) |
    | `.Hostname`      | Node hostname                                                                                         |
    | `.Status`        | Node status                                                                                           |
    | `.Availability`  | Node availability ("active", "pause", or "drain")                                                     |
    | `.ManagerStatus` | Manager status of the node                                                                            |
    | `.TLSStatus`     | TLS status of the node ("Ready", or "Needs Rotation" has TLS certificate signed by an old CA)         |
    | `.EngineVersion` | Engine version                                                                                        |
@y
    | プレースホルダー  | 内容説明                                                                                             |
    |------------------|-------------------------------------------------------------------------------------------------------|
    | `.ID`            | ノード ID                                                                                             |
    | `.Self`          | デーモンノード (`true/false`, `true`  は現在の Docker デーモンとノードが同一であることを表わす)       |
    | `.Hostname`      | ノードホスト名                                                                                        |
    | `.Status`        | ノードのステータス                                                                                    |
    | `.Availability`  | ノードの利用状況 ("active", "pause", "drain")                                                         |
    | `.ManagerStatus` | ノードのマネージャーステータス                                                                        |
    | `.TLSStatus`     | ノードの TLS ステータス ("Ready", または "Needs Rotation" は TLS 証明書が古い CA により署名されている)|
    | `.EngineVersion` | Engine バージョン                                                                                     |
@z

@x
    When using the `--format` option, the `node ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    `--format` オプションを利用すると `node ls` コマンドは、テンプレートが定めるデータを直接出力します。
    あるいは `table` ディレクティブを指定していれば、カラムヘッダーも同時に出力されます。
@z

@x
    The following example uses a template without headers and outputs the
    `ID`, `Hostname`, and `TLS Status` entries separated by a colon (`:`) for all
    nodes:
@y
    以下はヘッダーを含めずにテンプレートを利用する例です。
    すべてのノードにおける `ID`、`Hostname`、`TLS Status` の各項目がコロン (`:`) で区切られて表示されます。
@z

% snip command...

@x
    To list all nodes in JSON format, use the `json` directive:
@y
    ノードすべてを JSON 書式により一覧表示するには `json` ディレクティブを用います。
@z

% snip command...
% snip directives...
