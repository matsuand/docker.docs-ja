%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose build
short: Build or rebuild services
@y
command: docker compose build
short: サービスのビルドまたは再ビルド
@z

@x
long: |-
    Services are built once and then tagged, by default as `project-service`.

    If the Compose file specifies an
    [image](https://github.com/compose-spec/compose-spec/blob/main/spec.md#image) name,
    the image is tagged with that name, substituting any variables beforehand. See
    [variable interpolation](https://github.com/compose-spec/compose-spec/blob/main/spec.md#interpolation).

    If you change a service's `Dockerfile` or the contents of its build directory,
    run `docker compose build` to rebuild it.
@y
long: |-
    サービスのビルドは一度だけ行われタグづけされます。
    タグのデフォルト名は `プロジェクト名-サービス名` となります。

    Compose ファイルが [イメージ](https://github.com/compose-spec/compose-spec/blob/main/spec.md#image) 名を指定している場合、イメージはその名前によってタグづけされ、変数が用いられていればその前に置換されます。
    詳しくは [変数補完](https://github.com/compose-spec/compose-spec/blob/main/spec.md#interpolation) を参照してください。

    サービスの `Dockerfile` やビルドディレクトリ先を変更した場合は、`docker compose build` を実行すれば再ビルドされます。
@z

@x
usage: docker compose build [OPTIONS] [SERVICE...]
@y
usage: docker compose build [OPTIONS] [SERVICE...]
@z

% options:

@x build-arg
      description: Set build-time variables for services
@y
      description: サービスにおけるビルド時変数を設定します。
@z

@x builder
      description: Set builder to use
@y
      description: 利用するビルダーを指定します。
@z

@x check
      description: Check build configuration
@y
      description: ビルド設定をチェックします。
@z

@x compress
      description: Compress the build context using gzip. DEPRECATED
@y
      description: ビルドコンテキストを gzip により圧縮します。非推奨。
@z

@x force-rm
      description: Always remove intermediate containers. DEPRECATED
@y
      description: 中間コンテナーを常時削除します。非推奨。
@z

@x memory
      description: |
        Set memory limit for the build container. Not supported by BuildKit.
@y
      description: |
        ビルドコンテナーのメモリ制限を設定します。BuildKit ではサポートされません。
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: イメージビルド時にキャッシュを使わないようにします。
@z

@x no-rm
      description: |
        Do not remove intermediate containers after a successful build. DEPRECATED
@y
      description: |
        ビルド成功時に中間コンテナーを削除しないようにします。非推奨。
@z

@x parallel
      description: Build images in parallel. DEPRECATED
@y
      description: イメージを同時並行にビルドします。非推奨。
@z

@x print
      description: Print equivalent bake file
@y
      description: bake ファイル相当を出力します。
@z

@x progress
      description: Set type of ui output (auto, tty, plain, json, quiet)
@y
      description: UI 出力タイプを指定します (auto, tty, plain, json, quiet)。
@z

@x provenance
      description: Add a provenance attestation
@y
      description: 来歴情報 (provenance attestation) を追加します。
@z

@x pull
      description: Always attempt to pull a newer version of the image
@y
      description: 常にイメージの最新バージョンのプルを試みます。
@z

@x push
      description: Push service images
@y
      description: サービスイメージをプッシュします。
@z

@x quiet
      description: Suppress the build output
@y
      description: ビルド時のメッセージ出力を行いません。
@z

@x sbom
      description: Add a SBOM attestation
@y
      description: SBOM 証明情報を追加します。
@z

@x ssh
      description: |
        Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent)
@y
      description: |
        サービスイメージのビルド時に用いる SSH 認証を設定します (デフォルトの SSH Agent の利用時は 'default' を指定します)。
@z

@x with-dependencies
      description: Also build dependencies (transitively)
@y
      description: 依存サービスも (順次) ビルドします。
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: ドライランモードでコマンド実行します。
@z
