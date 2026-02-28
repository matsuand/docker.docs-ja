%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network disconnect
short: Disconnect a container from a network
long: |-
    Disconnects a container from a network. The container must be running to
    disconnect it from the network.
usage: docker network disconnect [OPTIONS] NETWORK CONTAINER
@y
command: docker network disconnect
short: ネットワークからコンテナーを切断します。
long: |-
    ネットワークからコンテナーを切断します。
    コンテナーをネットワークから切断するには、そのコンテナーが実行中でなければなりません。
usage: docker network disconnect [OPTIONS] NETWORK CONTAINER
@z

% options:

@x force
      description: Force the container to disconnect from a network
@y
      description: コンテナーからネットワークを強制的に切断します。
@z

% inherited_options:
@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...
% snip directives...
