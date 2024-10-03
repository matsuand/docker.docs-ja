%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker config create
short: Create a config from a file or STDIN
long: |-
    Creates a config using standard input or from a file for the config content.
@y
command: docker config create
short: ファイルまたは標準入力から config を生成します。
long: |-
    config 内容を示すファイルまたは標準入力により config を生成します。
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    config 利用の詳細については [Docker Config を利用した設定データの保存](__SUBDIR__/engine/swarm/configs/) を参照してください。
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker config create [OPTIONS] CONFIG file|-
@y
usage: docker config create [OPTIONS] CONFIG file|-
@z

% options:

@x label
      description: Config labels
@y
      description: Config ラベル。
@z

@x template-driver
      description: Template driver
@y
      description: テンプレートドライバー。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Create a config
@y
examples: |-
    ### config の生成 {#create-a-config}
@z

% snip command...

@x
    ### Create a config with a file
@y
    ### ファイルからの config 生成 {#create-a-config-with-a-file}
@z

% snip command...

@x
    ### Create a config with labels (-l, --label) {#label}
@y
    ### ラベルを利用した config の生成 (-l, --label) {#label}
@z

% snip command...
% snip directives...
