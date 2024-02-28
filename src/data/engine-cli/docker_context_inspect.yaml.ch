%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context inspect
short: Display detailed information on one or more contexts
long: Inspects one or more contexts.
usage: docker context inspect [OPTIONS] [CONTEXT] [CONTEXT...]
@y
command: docker context inspect
short: 1 つまたは複数のコンテキストに関する詳細情報を表示します。
long: 1 つまたは複数のコンテキストに関する詳細情報を表示します。
usage: docker context inspect [OPTIONS] [CONTEXT] [CONTEXT...]
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

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Inspect a context by name
@y
examples: |-
    ### コンテキスト名の指定による詳細出力 {#inspect-a-context-by-name}
@z

% snip command...

% snip directives...
