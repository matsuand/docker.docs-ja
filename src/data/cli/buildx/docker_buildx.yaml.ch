%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx
short: Docker Buildx
long: Extended build capabilities with BuildKit
@y
command: docker buildx
short: Docker Buildx
long: BuildKit を用いた拡張ビルド機能。
@z

% cname:
% clink:
% options:

@x builder
      description: Override the configured builder instance
@y
      description: 設定済みビルダーインスタンスをオーバーライドします。
@z

@x
examples: |-
    ### Override the configured builder instance (--builder) {#builder}

    You can also use the `BUILDX_BUILDER` environment variable.
@y
examples: |-
    ### 設定済みビルダーインスタンスのオーバーライド (--builder) {#builder}

    環境変数 `BUILDX_BUILDER` を用いることもできます。
@z

% snip directives...
