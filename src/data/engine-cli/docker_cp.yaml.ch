%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
@y
command: docker cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
@z

@x
long: |-
    Copy files/folders between a container and the local filesystem

    Use '-' as the source to read a tar archive from stdin
    and extract it to a directory destination in a container.
    Use '-' as the destination to stream a tar archive of a
    container source to stdout.
@y
long: |-
    Copy files/folders between a container and the local filesystem

    Use '-' as the source to read a tar archive from stdin
    and extract it to a directory destination in a container.
    Use '-' as the destination to stream a tar archive of a
    container source to stdout.
@z

@x
usage: |-
    docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
@y
    docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
@z

% options:

@x archive
      description: Archive mode (copy all uid/gid information)
@y
      description: アーカイブモード。（uid/gid 情報をすべてコピーします。）
@z

@x follow-link
      description: Always follow symbol link in SRC_PATH
@y
      description: SRC_PATH 内のシンボリックリンクは常にたどります。
@z

@x quiet
      description: |
        Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached
@y
      description: |
        コピー時の進捗メッセージを省略します。端末がアタッチされていない場合、進捗メッセージの出力は常に省略されます。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
