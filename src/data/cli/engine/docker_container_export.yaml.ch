%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container export
aliases: docker container export, docker export
short: Export a container's filesystem as a tar archive
@y
command: docker container export
aliases: docker container export, docker export
short: コンテナーのファイルシステムを tar アーカイブとしてエクスポートします。
@z

@x
long: |-
    The `docker export` command doesn't export the contents of volumes associated
    with the container. If a volume is mounted on top of an existing directory in
    the container, `docker export` exports the contents of the underlying
    directory, not the contents of the volume.
@y
long: |-
    `docker export` コマンドは、コンテナーに関連づけられたボリューム内のデータはエクスポートしません。
    あるボリュームがコンテナーの既存ディレクトリの最上位にマウントされている場合、`docker export` はそのディレクトリ配下の内容をエクスポートしますが、ボリューム内のデータはエクスポートの対象とはなりません。
@z

@x
    Refer to [Backup, restore, or migrate data volumes](/engine/storage/volumes/#back-up-restore-or-migrate-data-volumes)
    in the user guide for examples on exporting data in a volume.
@y
    ボリューム内のデータをエクスポートするには、ユーザーガイドの [データボリュームのバックアップ、リストア、移行](__SUBDIR__/engine/storage/volumes/#back-up-restore-or-migrate-data-volumes) の例を参照してください。
@z

@x
usage: docker container export [OPTIONS] CONTAINER
@y
usage: docker container export [OPTIONS] CONTAINER
@z

% options:

@x output
      description: Write to a file, instead of STDOUT
@y
      description: 出力先を STDOUT でなくファイルとします。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    The following commands produce the same result.
@y
examples: |-
    以下の 2 つのコマンドの生成結果は同じです。
@z

% snip commands...
