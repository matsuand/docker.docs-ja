%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker context ls
aliases: docker context ls, docker context list
short: List contexts
long: List contexts
usage: docker context ls [OPTIONS]
@y
command: docker context ls
aliases: docker context ls, docker context list
short: コンテキストを一覧表示します。
long: コンテキストを一覧表示します。
usage: docker context ls [OPTIONS]
@z

% options:

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
        テンプレートを使ったフォーマット出力の詳細は [コマンドとログのフォーマット出力](__SUBDIR__/config/formatting/) を参照してください。
@z

@x quiet
      description: Only show context names
@y
      description: コンテキスト名のみを表示します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    Use `docker context ls` to print all contexts. The currently active context is
    indicated with an `*`:
@y
examples: |-
    `docker context ls` を使ってコンテキストをすべて出力します。
    その時点でのアクティブなコンテキストは `*` をつけて表示されます。
@z

% snip command...

% snip directives...
