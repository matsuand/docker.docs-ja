%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container diff
aliases: docker container diff, docker diff
short: Inspect changes to files or directories on a container's filesystem
long: |-
    List the changed files and directories in a container᾿s filesystem since the
    container was created. Three different types of change are tracked:
@y
command: docker container diff
aliases: docker container diff, docker diff
short: コンテナーのファイルシステム上におけるファイルまたはディレクトリの変更点を確認します。
long: |-
    コンテナーが生成されて以降、コンテナーのファイルシステム上において変更されたファイルまたはディレクトリの一覧を表示します。変更点は以下の三種類が用いられます。
@z

@x
    | Symbol | Description                     |
    |--------|---------------------------------|
    | `A`    | A file or directory was added   |
    | `D`    | A file or directory was deleted |
    | `C`    | A file or directory was changed |
@y
    | シンボル | 内容説明                             |
    |----------|--------------------------------------|
    | `A`      | 追加されたファイルまたはディレクトリ |
    | `D`      | 削除されたファイルまたはディレクトリ |
    | `C`      | 変更されたファイルまたはディレクトリ |
@z

@x
    You can use the full or shortened container ID or the container name set using
    `docker run --name` option.
@y
    `docker run --name` オプションを利用すれば、コンテナーのフル ID、短縮 ID、コンテナー名セットを用いることができます。
@z

@x
usage: docker container diff CONTAINER
@y
usage: docker container diff CONTAINER
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    Inspect the changes to an `nginx` container:
@y
examples: |-
    `nginx` コンテナーに対する変更点を確認します。
@z

% snip command...
% snip directives...
