%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker config inspect
short: Display detailed information on one or more configs
long: |-
    Inspects the specified config.
@y
command: docker config inspect
short: 1 つまたは複数の config についての詳細情報を表示します。
long: |-
    指定された config の詳細情報を表示します。
@z

@x
    By default, this renders all results in a JSON array. If a format is specified,
    the given template will be executed for each result.
@y
    デフォルトでは結果をすべて JSON 配列として返します。
    フォーマット指定が行われた場合は、指定されたテンプレートが各項目に適用されて出力されます。
@z

@x
    Go's [text/template](https://pkg.go.dev/text/template) package
    describes all the details of the format.
@y
    フォーマットの詳細については、Go 言語の [text/template](https://pkg.go.dev/text/template) パッケージに説明されているので参照してください。
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    config 利用の詳細については [Docker Config を利用した設定データの保存](__SUBDIR__/engine/swarm/configs/) を参照してください。
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
usage: docker config inspect [OPTIONS] CONFIG [CONFIG...]
@y
usage: docker config inspect [OPTIONS] CONFIG [CONFIG...]
@z

% options:

@x format
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        カスタムテンプレートを使って出力をフォーマットします。
        'json':             JSON 書式により出力します。
        'TEMPLATE':         指定された Go テンプレートを使って出力します。
        テンプレートを使ったフォーマット出力の詳細は __HOSTURL____SUBDIR__/engine/cli/formatting/ を参照してください。
@z

@x pretty
      description: Print the information in a human friendly format
@y
      description: 読みやすい書式で内容を出力します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Inspect a config by name or ID
@y
examples: |-
    ### 名前や ID を指定した config の詳細表示 {#inspect-a-config-by-name-or-id}
@z

@x
    You can inspect a config, either by its *name*, or *ID*
@y
    詳細表示する config を指定するには *名前* または *ID* を指定します。
@z

@x
    For example, given the following config:
@y
    以下の config を使った例を示します。
@z

% snip command...

@x
    The output is in JSON format, for example:
@y
    結果は JSON 書式であり、たとえば以下のようになります。
@z

% snip output...

@x
    ### Format the output (--format) {#format}
@y
    ### フォーマット指定 (--format) {#format}
@z

@x
    You can use the --format option to obtain specific information about a
    config. The following example command outputs the creation time of the
    config.
@y
    --format オプションを利用すると、config の特定の情報を取得することができます。
     以下の実行コマンド例では config の生成時刻を出力します。
@z

% snip command...
% snip directives...
