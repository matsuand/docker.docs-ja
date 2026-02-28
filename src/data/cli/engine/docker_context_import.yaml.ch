%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context import
short: Import a context from a tar or zip file
long: |-
    Imports a context previously exported with `docker context export`. To import
    from stdin, use a hyphen (`-`) as filename.
@y
command: docker context import
short: tar ファイルまたは zip ファイルからコンテキストへインポートします。
long: |-
    `docker context export` によってエクスポートされたコンテキストをインポートします。
    標準入力からインポートする場合はファイル名にハイフン (`-`) を指定します。
@z

@x
usage: docker context import CONTEXT FILE|-
@y
usage: docker context import CONTEXT FILE|-
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
