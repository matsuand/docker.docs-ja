%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node inspect
short: Display detailed information on one or more nodes
long: |-
    Returns information about a node. By default, this command renders all results
    in a JSON array. You can specify an alternate format to execute a
    given template for each result. Go's
    [text/template](https://pkg.go.dev/text/template) package describes all the
    details of the format.
@y
command: docker node inspect
short: 1 つまたは複数ノードに関する詳細情報を表示します。
long: |-
    ノードに関する詳細情報を返します。
    このコマンドが返す結果は、デフォルトでは JSON 配列です。
    指定されたテンプレートを用いて、返される出力結果の書式を変更することができます。
    フォーマットに関する詳細は Go 言語の [text/template](https://pkg.go.dev/text/template) パッケージに説明されています。
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
usage: docker node inspect [OPTIONS] self|NODE [NODE...]
@y
usage: docker node inspect [OPTIONS] self|NODE [NODE...]
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
    ### Inspect a node
@y
examples: |-
    ### ノードの詳細表示 {#inspect-a-node}
@z

% snip command...
% snip output...

@x
    ### Format the output (--format) {#format}
@y
    ### フォーマット指定 (--format) {#format}
@z

% snip command...

@x
    Use `--format=pretty` or the `--pretty` shorthand to pretty-print the output:
@y
    `--format=pretty` またはその短縮形である `--pretty` を用いればフォーマット出力を行うことができます。
@z

% snip command...
% snip directives...
