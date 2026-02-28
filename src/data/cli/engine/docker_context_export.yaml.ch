%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context export
short: Export a context to a tar archive FILE or a tar stream on STDOUT.
long: |-
    Exports a context to a file that can then be used with `docker context import`.
@y
command: docker context export
short: コンテキストを tar アーカイブの FILE または STDOUT 上の tar ストリームとしてエクスポートします。
long: |-
    コンテキストをファイルにエクスポートします。
    このファイルは `docker context import` で利用することができます。
@z

@x
    The default output filename is `<CONTEXT>.dockercontext`. To export to `STDOUT`,
    use `-` as filename, for example:
@y
    デフォルトの出力ファイル名は `<CONTEXT>.dockercontext` です。
    `STDOUT` へエクスポートする場合はファイル名に `-` を指定します。
    たとえば以下のとおりです。
@z

% snip command...

@x
usage: docker context export [OPTIONS] CONTEXT [FILE|-]
@y
usage: docker context export [OPTIONS] CONTEXT [FILE|-]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
