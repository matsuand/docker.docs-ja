%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker config ls
aliases: docker config ls, docker config list
short: List configs
long: |-
    Run this command on a manager node to list the configs in the Swarm.
@y
command: docker config ls
aliases: docker config ls, docker config list
short: config を一覧表示します。
long: |-
    このコマンドをマネージャーノード上から実行して Swarm 内の config を一覧表示します。
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    config 利用の詳細については [Docker configs を利用した設定データの保存](__SUBDIR__/engine/swarm/configs/) を参照してください。
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker config ls [OPTIONS]
@y
usage: docker config ls [OPTIONS]
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

% examples:

% snip command...

@x
    ### Filtering (-f, --filter) {#filter}
@y
    ### フィルター検索 (-f, --filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    フィルターフラグ (`-f` or `--filter`) の書式は `key=value` ペアとして指定します。
    フィルターが複数必要な場合は、フラグを複数回指定します (たとえば `--filter "foo=bar" --filter "bif=baz"` とします)。
@z

@x
    The currently supported filters are:
@y
    現在サポートされているフィルターは以下のとおりです。
@z

@x
    - [id](#id) (config's ID)
    - [label](#label) (`label=<key>` or `label=<key>=<value>`)
    - [name](#name) (config's name)
@y
    - [id](#id) (config の ID)
    - [label](#label) (`label=<key>` または `label=<key>=<value>`)
    - [name](#name) (config 名)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or prefix of a config's id.
@y
    `id` フィルターは config の ID すべてまたはそのプリフィックス部分を検索します。
@z

% snip command...

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches configs based on the presence of a `label` alone or
    a `label` and a value.
@y
    `label` フィルターは、`label` のみが存在する config か、あるいは `label` と値が存在する config に対しての検索を行います。
@z

@x
    The following filter matches all configs with a `project` label regardless of
    its value:
@y
    以下の例では `project` ラベルを持った config が検索されます。
    この場合、その値の内容は問いません。
@z

% snip command...

@x
    The following filter matches only services with the `project` label with the
    `project-a` value.
@y
    以下の例では `project` ラベルに `project-a` という値を持つ config が抽出されます。
@z

% snip command...

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or prefix of a config's name.
@y
    `name` フィルターは config 名の全部または一部を検索します
@z

@x
    The following filter matches config with a name containing a prefix of `test`.
@y
    以下のフィルター指定では `test` という文字列で始まる config すべてが検索されます。
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### フォーマット指定 (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty prints configs output
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
    | Placeholder  | Description                                                                          |
    |--------------|--------------------------------------------------------------------------------------|
    | `.ID`        | Config ID                                                                            |
    | `.Name`      | Config name                                                                          |
    | `.CreatedAt` | Time when the config was created                                                     |
    | `.UpdatedAt` | Time when the config was updated                                                     |
    | `.Labels`    | All labels assigned to the config                                                    |
    | `.Label`     | Value of a specific label for this config. For example `{{.Label "my-label"}}`       |
@y
    | プレースホルダー  | 内容説明                                                                        |
    |--------------|--------------------------------------------------------------------------------------|
    | `.ID`        | Config の ID                                                                         |
    | `.Name`      | Config 名                                                                            |
    | `.CreatedAt` | Config 生成時刻                                                                      |
    | `.UpdatedAt` | Config 更新時刻                                                                      |
    | `.Labels`    | Config に割り当てられているラベルすべて                                              |
    | `.Label`     | Config の指定ラベルに対する値、たとえば `{{.Label "my-label"}}`                      |
@z

@x
    When using the `--format` option, the `config ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, will include column headers as well.
@y
    `--format` オプションを利用すると `config ls` コマンドは、テンプレートが定めるデータを直接出力します。
    あるいは `table` ディレクティブを指定していれば、カラムヘッダーも同時に出力されます。
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `Name` entries separated by a colon (`:`) for all images:
@y
    以下はヘッダーを含めずにテンプレートを利用する例です。
    すべての config における `ID`、`Name` の各項目がコロン (`:`) で区切られて表示されます。
@z

% snip command...

@x
    To list all configs with their name and created date in a table format you
    can use:
@y
    config の一覧を名前とともに表形式で出力するには、以下のようにします。
@z

% snip command...
% snip directives...
