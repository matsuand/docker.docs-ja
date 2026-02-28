%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker context update
short: Update a context
long: |-
    Updates an existing `context`.
    See [context create](/reference/cli/docker/context/create/).
usage: docker context update [OPTIONS] CONTEXT
@y
command: docker context update
short: コンテキストを更新します。
long: |-
    既存の `context` を更新します。
    [context create](__SUBDIR__/reference/cli/docker/context/create/) を参照してください。
usage: docker context update [OPTIONS] CONTEXT
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

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Update an existing context
@y
examples: |-
    ### 既存コンテキストの更新 {#update-an-existing-context}
@z

% snip command...
% snip directives...
