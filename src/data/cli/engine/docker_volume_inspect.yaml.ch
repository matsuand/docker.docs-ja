%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume inspect
short: Display detailed information on one or more volumes
long: |-
    Returns information about a volume. By default, this command renders all results
    in a JSON array. You can specify an alternate format to execute a
    given template for each result. Go's
    [text/template](https://pkg.go.dev/text/template) package describes all the
    details of the format.
usage: docker volume inspect [OPTIONS] VOLUME [VOLUME...]
@y
command: docker volume inspect
short: 1 つまたは複数のボリュームについての詳細情報を表示します。
long: |-
    ボリュームに関する情報を返します。
    このコマンドが返す結果はデフォルトでは JSON 配列です。
    指定されたテンプレートを用いて、返される結果の出力書式を変更することができます。
    Go 言語の [text/template](https://pkg.go.dev/text/template) パッケージに、フォーマットに関する詳細が説明されています。
usage: docker volume inspect [OPTIONS] VOLUME [VOLUME...]
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
        テンプレートを使ったフォーマット出力の詳細は [コマンドとログのフォーマット出力](__SUBDIR__/config/formatting/) を参照してください。
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
    Use the `docker volume inspect` comment to inspect the configuration of the volume:
@y
    `docker volume inspect` コマンドを使ってボリューム設定の内容を確認します。
@z

% snip command...

@x
    The output is in JSON format, for example:
@y
    出力は JSON 形式であり、たとえば以下のようになります。
@z

% snip output...

@x
    ### Format the output (--format) {#format}
@y
    ### フォーマット出力 (--format) {#format}
@z

@x
    Use the `--format` flag to format the output using a Go template, for example,
    to print the `Mountpoint` property:
@y
    `--format` フラグの指定により Go 言語のテンプレートを使ったフォーマット出力を行います。
    たとえば以下では `Mountpoint` プロパティを出力します。
@z

% snip command...

% snip directives...
