%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container inspect
short: Display detailed information on one or more containers
long: Display detailed information on one or more containers
usage: docker container inspect [OPTIONS] CONTAINER [CONTAINER...]
@y
command: docker container inspect
short: 1 つまたは複数のコンテナーについて詳細情報を表示します。
long: 1 つまたは複数のコンテナーについて詳細情報を表示します。
usage: docker container inspect [OPTIONS] CONTAINER [CONTAINER...]
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

@x size
      description: Display total file sizes
@y
      description: 合計ファイルサイズを表示します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
