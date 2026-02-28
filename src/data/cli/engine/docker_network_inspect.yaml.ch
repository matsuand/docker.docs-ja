%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network inspect
short: Display detailed information on one or more networks
long: |-
    Returns information about one or more networks. By default, this command renders
    all results in a JSON object.
usage: docker network inspect [OPTIONS] NETWORK [NETWORK...]
@y
command: docker network inspect
short: 1 つまたは複数ネットワークの詳細情報を表示します。
long: |-
    1 つまたは複数ネットワークの詳細情報を表示します。
    このコマンドの出力結果は、デフォルトで JSON オブジェクト形式です。
usage: docker network inspect [OPTIONS] NETWORK [NETWORK...]
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
        テンプレートを使ったフォーマット出力の詳細は https://docs.docker.com/go/formatting/ を参照してください。
@z

@x verbose
      description: Verbose output for diagnostics
@y
      description: 診断された情報を詳細に表示します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
