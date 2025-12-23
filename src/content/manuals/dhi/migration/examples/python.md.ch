%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Python
description: Migrate a Python application to Docker Hardened Images
@y
title: Python
description: Python アプリケーションを Docker Hardened イメージに移行します。
@z

@x
keywords: python, migration, dhi
@y
keywords: python, migration, dhi
@z

@x
This example shows how to migrate a Python application to Docker Hardened Images.
@y
ここに示す例は、Python アプリケーションを Docker Hardened イメージに移行する方法を示すものです。
@z

@x
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@y
以下の例では Docker Hardened イメージへの移行前後における Dockerfile を示します。
例は 4 種類あります。
@z

@x
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@y
- 移行前 (Wolfi): サンプルの Dockerfile は Wolfi ディストリビューションイメージを用いているものであり、DHI への移行前のものです。
- 移行前 (DOI): サンプルの Dockerfile Docker 公式イメージを用いているものであり、DHI への移行前のものです。
- 移行後 (マルチステージ): サンプルの Dockerfile を DHI へ移行した後のものであり、マルチステージビルドとしています (最小でセキュアなイメージとして推奨されます)。
- 移行後 (シングルステージ): サンプルの Dockerfile を DHI へ移行した後のものであり、シングルステージビルドとしています (より単純なものですが、イメージサイズは大きくなり、攻撃対象領域も大きくなります)。
@z

@x
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Run `docker login dhi.io` to authenticate.
@y
> [!NOTE]
>
> マルチステージビルドは、たいていのユースケースに対して推奨されます。
> シングルステージビルドは、単純であるためにサポートされていますが、サイズやセキュリティとのトレードオフを考慮することが必要です。
>
> Docker Hardened イメージをプルするにあたっては、あらかじめ `dhi.io` への認証を行っておく必要があります。
> 認証をするには `docker login dhi.io` を実行します。
@z

@x
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@y
{{< tabs >}}
{{< tab name="移行前 (Wolfi)" >}}
@z

@x within code
# Install any additional packages if needed using apk
@y
# パッケージの追加を必要とする場合は apk を使ってインストールすること
@z

@x
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@y
{{< /tab >}}
{{< tab name="移行前 (DOI)" >}}
@z

@x within code
# Install any additional packages if needed using apt
@y
# パッケージの追加を必要とする場合は apt を使ってインストールすること
@z

@x
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@y
{{< /tab >}}
{{< tab name="移行後 (マルチステージ)" >}}
@z

@x within code
# === Build stage: Install dependencies and create virtual environment ===
@y
# === ビルドステージ: 依存パッケージのインストールと仮想環境生成 ===
@z
@x
# Install any additional packages if needed using apk
@y
# パッケージの追加を必要とする場合は apk を使ってインストールすること
@z
@x
# === Final stage: Create minimal runtime image ===
@y
# === 最終ステージ: 最小ランタイムイメージの生成 ===
@z

@x
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@y
{{< /tab >}}
{{< tab name="移行後 (シングルステージ)" >}}
@z

@x within code
# Install any additional packages if needed using apk
@y
# パッケージの追加を必要とする場合は apk を使ってインストールすること
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
