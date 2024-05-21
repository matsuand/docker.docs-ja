%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Reproducible builds with GitHub Actions
description: How to create reproducible builds in GitHub Actions using the SOURCE_EPOCH environment variable
keywords: build, buildx, github actions, ci, gha, reproducible builds, SOURCE_DATE_EPOCH
@y
title: GitHub Actions を使った再現可能なビルド
description: How to create reproducible builds in GitHub Actions using the SOURCE_EPOCH environment variable
keywords: build, buildx, github actions, ci, gha, reproducible builds, SOURCE_DATE_EPOCH
@z

@x
`SOURCE_DATE_EPOCH` is a [standardized environment variable][source_date_epoch]
for instructing build tools to produce a reproducible output.
Setting the environment variable for a build makes the timestamps in the
image index, config, and file metadata reflect the specified Unix time.
@y
`SOURCE_DATE_EPOCH` は [標準化された環境変数][source_date_epoch] (standardized environment variable) であり、ビルドツールに対して再現可能なビルドを生成することを指示します。
ビルドの際にこの環境変数を設定しておくと、イメージインデックス、設定情報、ファイルメタデータの中にあるタイムスタンプを、指定された Unix 時間にすることができます。
@z

% snip link...

@x
To set the environment variable in GitHub Actions,
use the built-in `env` property on the build step.
@y
GitHub Actions 内にて環境変数を設定するには、ビルドステップにおいてビルトインの `env` プロパティを利用します。
@z

@x
## Unix epoch timestamps
@y
## Unix エポックのタイムスタンプ {#unix-epoch-timestamps}
@z

@x
The following example sets the `SOURCE_DATE_EPOCH` variable to 0, Unix epoch.
@y
以下の例では `SOURCE_DATE_EPOCH` を Unix エポック時間の値 0 に設定します。
@z

@x
{{< tabs group="action" >}}
{{< tab name="`docker/build-push-action`" >}}
@y
{{< tabs group="action" >}}
{{< tab name="`docker/build-push-action`" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@y
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Git commit timestamps
@y
## Git コミットのタイムスタンプ {#git-commit-timestamps}
@z

@x
The following example sets `SOURCE_DATE_EPOCH` to the Git commit timestamp.
@y
以下の例では `SOURCE_DATE_EPOCH` を Git コミットのタイムスタンプに設定します。
@z

@x
{{< tabs group="action" >}}
{{< tab name="`docker/build-push-action`" >}}
@y
{{< tabs group="action" >}}
{{< tab name="`docker/build-push-action`" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@y
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Additional information
@y
## さらなる情報 {#additional-information}
@z

@x
For more information about the `SOURCE_DATE_EPOCH` support in BuildKit,
see [BuildKit documentation](https://github.com/moby/buildkit/blob/master/docs/build-repro.md#source_date_epoch).
@y
BuildKit における `SOURCE_DATE_EPOCH` サポートの詳細は [BuildKit ドキュメント](https://github.com/moby/buildkit/blob/master/docs/build-repro.md#source_date_epoch) を参照してください。
@z
