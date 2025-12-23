%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Migration checklist
description: A checklist of considerations when migrating to Docker Hardened Images
@y
title: 移行チェックリスト
description: A checklist of considerations when migrating to Docker Hardened Images
@z

@x
keywords: migration checklist, dhi, docker hardened images
@y
keywords: migration checklist, dhi, docker hardened images
@z

@x
Use this checklist to ensure you address key considerations when migrating to Docker Hardened Images.
@y
Docker Hardened イメージへの移行を行う際には、以下のチェックリストを用いて、重要な各項目への対処を確実に行ってください。
@z

@x
## Migration considerations
@y
## 移行における考慮事項 {#migration-considerations}
@z

@x
| Item               | Action required                                                                                                                                                                                                                                                                                                                 |
|:-------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Base image         | Update your Dockerfile `FROM` statements to reference a Docker Hardened Image instead of your current base image.                                                                                                                                                                                                                                                      |
| Package management | Install packages only in `dev`-tagged images during build stages. Use `apk` for Alpine-based images or `apt` for Debian-based images. Copy the necessary artifacts to your runtime stage, as runtime images don't include package managers.                                                                                                                                                                        |
| Non-root user      | Verify that all files and directories your application needs are readable and writable by the nonroot user (UID 65532), as runtime images run as nonroot by default.                                                                                                                                                                              |
| Multi-stage build  | Use `dev` or `sdk`-tagged images for build stages where you need build tools and package managers. Use non-dev images for your final runtime stage.                                                                                                                                                                                                                                     |
| TLS certificates   | Remove any steps that install ca-certificates, as DHIs include ca-certificates by default.                                                                                                                                                                                                                               |
| Ports              | Configure your application to listen on port 1025 or higher inside the container, as the nonroot user can't bind to privileged ports (below 1024) in Kubernetes or Docker Engine versions older than 20.10. |
| Entry point        | Check the entry point of your chosen DHI using `docker inspect` or the image documentation. Update your Dockerfile's `ENTRYPOINT` or `CMD` instructions if your application relies on a different entry point.                                                                                                                                                                        |
| No shell           | Move any shell commands (`RUN`, `SHELL`) to build stages using `dev`-tagged images. Runtime images don't include a shell, so copy all necessary artifacts from the build stage.                                                                                                                                                                            |
@y
| 項目                 | 必要な作業                                                                                                                                                                                                                                                                                                                     |
|:---------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ベースイメージ       | Dockerfile の `FROM` 文は、それまでのベースイメージから Docker Hardened イメージにします。                                                                                                                                                                                                                                     |
| パッケージ管理       | パッケージのインストールはビルドステージにおいて `dev` のタグをつけたイメージ内でのみ行うものとします。Alpine ベースでは `apk`、Debian ベースでは `apt` を用います。ランタイムイメージには必要となる生成物をコピーします。これはランタイムにはパッケージマネージャーがないからです。                                           |
| 非 root ユーザー     | アプリケーションがアクセスするファイルやディレクトリは、非 root ユーザー (UID 65532) によって読み書きが可能とします。なぜならランタイムイメージは、非 root ユーザーにより実行されるのがデフォルトであるからです。                                                                                                              |
| マルチステージビルド | ビルドツールやパッケージマネージャーを必要とする場合は、ビルドステージ向けのイメージとして `dev` や `sdk` のタグづけされたものを用います。最終のランタイムステージでは、非 dev のイメージを用います。                                                                                                                          |
| TLS 証明書           | ca 証明書をインストールする処理はすべて削除します。DHI にはデフォルトで ca 証明書が含まれているからです。                                                                                                                                                                                                                      |
| ポート               | アプリケーションはコンテナー内部におけるポート 1025 またはそれ以降を利用するように設定します。なぜなら Kubernetes を用いる場合や Docker Engine バージョンが 20.10 よりも古い場合に、非 root ユーザーは特権ポート (1024 以下) をバインドすることができないからです。                                                            |
| エントリーポイント   | 利用する DHI のエントリーポイントを確認します。これは `docker inspect` を実行するか、あるいはイメージのドキュメントから確認します。アプリケーションが別のエントリーポイントに依存しているようなら、Dockerfile 内の `ENTRYPOINT` や `CMD` 命令の内容を修正します。                                                              |
| シェルの除去         | シェルコマンド (`RUN`, `SHELL`) は、`dev` タグづけしたビルドステージに移動させます。つまりランタイムイメージにはシェルを含めないようにします。したがって必要となる成果物はビルドステージからコピーするようにします。                                                                                                           |
@z
