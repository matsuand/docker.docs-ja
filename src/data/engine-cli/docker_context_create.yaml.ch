%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker context create
short: Create a context
long: |-
    Creates a new `context`. This lets you switch the daemon your `docker` CLI
    connects to.
usage: docker context create [OPTIONS] CONTEXT
@y
command: docker context create
short: コンテキストを生成します。
long: |-
    新たな `context` (コンテキスト) を生成します。
    これによって、それまで `docker` CLI が接続していたデーモンを切り替えることができます。
usage: docker context create [OPTIONS] CONTEXT
@z

% options:

@x description
      description: Description of the context
@y
      description: コンテキストの内容説明を設定します。
@z

@x docker
      description: set the docker endpoint
@y
      description: Docker のエンドポイントを設定します。
@z

@x from
      description: create context from a named context
@y
      description: 名前づけされたコンテキストから新たなコンテキストを生成します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Create a context with a Docker endpoint (--docker) {#docker}
@y
examples: |-
    ### Docker エンドポイントを使ったコンテキスト生成 (--docker) {#docker}
@z

@x
    Use the `--docker` flag to create a context with a custom endpoint. The
    following example creates a context named `my-context` with a docker endpoint
    of `/var/run/docker.sock`:
@y
    `--docker` フラグを利用して、独自のエンドポイントを持つコンテキストを生成します。
    以下の例では Docker エンドポイントとして `/var/run/docker.sock` を使った `my-context` という名前のコンテキストを生成します。
@z

% snip command...

@x
    ### Create a context based on an existing context (--from) {#from}
@y
    ### 既存コンテキストに基づいたコンテキストの新規生成 (--from) {#from}
@z

@x
    Use the `--from=<context-name>` option to create a new context from
    an existing context. The example below creates a new context named `my-context`
    from the existing context `existing-context`:
@y
    Use the `--from=<context-name>` option to create a new context from
    an existing context. The example below creates a new context named `my-context`
    from the existing context `existing-context`:
@z

% snip command...

@x
    If the `--from` option isn't set, the `context` is created from the current context:
@y
    If the `--from` option isn't set, the `context` is created from the current context:
@z

% snip command...

@x
    This can be used to create a context out of an existing `DOCKER_HOST` based script:
@y
    This can be used to create a context out of an existing `DOCKER_HOST` based script:
@z

% snip command...

@x
    To source the `docker` endpoint configuration from an existing context
    use the `--docker from=<context-name>` option. The example below creates a
    new context named `my-context` using the docker endpoint configuration from
    the existing context `existing-context`:
@y
    To source the `docker` endpoint configuration from an existing context
    use the `--docker from=<context-name>` option. The example below creates a
    new context named `my-context` using the docker endpoint configuration from
    the existing context `existing-context`:
@z

% snip command...

@x
    Docker endpoints configurations, as well as the description can be modified with
    `docker context update`.
@y
    Docker endpoints configurations, as well as the description can be modified with
    `docker context update`.
@z

@x __SUBDIR__ 対応
    Refer to the [`docker context update` reference](/reference/cli/docker/context/update/) for details.
@y
    詳細は [`docker context update` リファレンス](__SUBDIR__/reference/cli/docker/context/update/) を参照してください。
@z

% snip directives...
