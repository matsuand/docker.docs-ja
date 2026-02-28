%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container port
aliases: docker container port, docker port
short: List port mappings or a specific mapping for the container
long: List port mappings or a specific mapping for the container
usage: docker container port CONTAINER [PRIVATE_PORT[/PROTO]]
@y
command: docker container port
aliases: docker container port, docker port
short: コンテナーにおけるポート割り当て一覧、あるいは特定のポート割り当てを表示します。
long: コンテナーにおけるポート割り当て一覧、あるいは特定のポート割り当てを表示します。
usage: docker container port CONTAINER [PRIVATE_PORT[/PROTO]]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Show all mapped ports
@y
examples: |-
    ### 割り当てポートの一覧表示 {#show-all-mapped-ports}
@z

@x
    You can find out all the ports mapped by not specifying a `PRIVATE_PORT`, or
    just a specific mapping:
@y
    `PRIVATE_PORT` を指定しなければ割り当てポートの全一覧を確認します。
    指定した場合は、その割り当てを確認します。
@z

% snip command...
