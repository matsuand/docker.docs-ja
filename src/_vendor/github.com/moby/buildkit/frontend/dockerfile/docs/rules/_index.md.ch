%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Build checks
description: |
  BuildKit has built-in support for analyzing your build configuration based on
  a set of pre-defined rules for enforcing Dockerfile and building best
  practices.
keywords: buildkit, linting, dockerfile, frontend, rules
@y
title: ビルドチェック
description: |
  BuildKit has built-in support for analyzing your build configuration based on
  a set of pre-defined rules for enforcing Dockerfile and building best
  practices.
keywords: buildkit, linting, dockerfile, frontend, rules
@z

@x
BuildKit has built-in support for analyzing your build configuration based on a
set of pre-defined rules for enforcing Dockerfile and building best practices.
Adhering to these rules helps avoid errors and ensures good readability of your
Dockerfile.
@y
BuildKit にはあらかじめ定められたルールに基づいて、ビルド設定を分析する機能がビルドインとして組み込まれています。
この機能により Dockerfile やビルド時のベストプラクティスを提供します。
こういったルールを定めることでエラーを回避し、Dockerfile の可読性を向上させます。
@z

@x
Checks run as a build invocation, but instead of producing a build output, it
performs a series of checks to validate that your build doesn't violate any of
the rules. To run a check, use the `--check` flag:
@y
チェック機能はビルド実行の形で実現します。
ただしそのときにはビルド出力は行われません。
一連のチェックを行って、ビルド処理の中にルールを逸脱するようなものがないかどうかを検証します。
チェックを実行するには `--check` フラグを使います。
@z

% snip command...

@x
To learn more about how to use build checks, see
[Checking your build configuration](https://docs.docker.com/build/checks/).
@y
ビルドチェック方法の詳細は [ビルド設定のチェック](__SUBDIR__/build/checks/) を参照してください。
@z

@x
      <th>Name</th>
      <th>Description</th>
@y
      <th>名前</th>
      <th>内容説明</th>
@z

@x
      <td><a href="./stage-name-casing/">StageNameCasing</a></td>
      <td>Stage names should be lowercase</td>
@y
      <td><a href="./stage-name-casing/">StageNameCasing</a></td>
      <td>ステージ名は英小文字を用いるべきです</td>
@z

@x
      <td><a href="./from-as-casing/">FromAsCasing</a></td>
      <td>The 'as' keyword should match the case of the 'from' keyword</td>
@y
      <td><a href="./from-as-casing/">FromAsCasing</a></td>
      <td>'as' キーワードと 'from' キーワードは、英大文字小文字のいずれかに統一していなければなりません。</td>
@z

@x
      <td><a href="./no-empty-continuation/">NoEmptyContinuation</a></td>
      <td>Empty continuation lines will become errors in a future release</td>
@y
      <td><a href="./no-empty-continuation/">NoEmptyContinuation</a></td>
      <td>継続行の中の空行は今後のリリースにおいてエラー扱いとなります。</td>
@z

@x
      <td><a href="./consistent-instruction-casing/">ConsistentInstructionCasing</a></td>
      <td>All commands within the Dockerfile should use the same casing (either upper or lower)</td>
@y
      <td><a href="./consistent-instruction-casing/">ConsistentInstructionCasing</a></td>
      <td>Dockerfile 内のコマンドはすべて英大文字か小文字に統一する必要があります。</td>
@z

@x
      <td><a href="./duplicate-stage-name/">DuplicateStageName</a></td>
      <td>Stage names should be unique</td>
@y
      <td><a href="./duplicate-stage-name/">DuplicateStageName</a></td>
      <td>ステージ名は一意でなければなりません。</td>
@z

@x
      <td><a href="./reserved-stage-name/">ReservedStageName</a></td>
      <td>Reserved words should not be used as stage names</td>
@y
      <td><a href="./reserved-stage-name/">ReservedStageName</a></td>
      <td>予約語はステージ名として用いることはできません。</td>
@z

@x
      <td><a href="./json-args-recommended/">JSONArgsRecommended</a></td>
      <td>JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals</td>
@y
      <td><a href="./json-args-recommended/">JSONArgsRecommended</a></td>
      <td>ENTRYPOINT/CMD に対する JSON 引数は OS シグナルを起こすような意図しない動作は避けるべきです</td>
@z

@x
      <td><a href="./maintainer-deprecated/">MaintainerDeprecated</a></td>
      <td>The MAINTAINER instruction is deprecated, use a label instead to define an image author</td>
@y
      <td><a href="./maintainer-deprecated/">MaintainerDeprecated</a></td>
      <td>MAINTAINER 命令は廃止予定であり, イメージ作者の定義には label の使用が推奨されます</td>
@z

@x
      <td><a href="./undefined-arg-in-from/">UndefinedArgInFrom</a></td>
      <td>FROM command must use declared ARGs</td>
@y
      <td><a href="./undefined-arg-in-from/">UndefinedArgInFrom</a></td>
      <td>FROM コマンドで用いる ARG は宣言されていなければなりません</td>
@z

@x
      <td><a href="./workdir-relative-path/">WorkdirRelativePath</a></td>
      <td>Relative workdir without an absolute workdir declared within the build can have unexpected results if the base image changes</td>
@y
      <td><a href="./workdir-relative-path/">WorkdirRelativePath</a></td>
      <td>ビルド内に絶対パス WORKDIR がないのに相対パス WORKDIR があると、ベースイメージ変更時に予期しない結果を生み出します</td>
@z

@x
      <td><a href="./undefined-var/">UndefinedVar</a></td>
      <td>Variables should be defined before their use</td>
@y
      <td><a href="./undefined-var/">UndefinedVar</a></td>
      <td>変数は利用する前に定義しなければなりません</td>
@z

@x
      <td><a href="./multiple-instructions-disallowed/">MultipleInstructionsDisallowed</a></td>
      <td>Multiple instructions of the same type should not be used in the same stage</td>
@y
      <td><a href="./multiple-instructions-disallowed/">MultipleInstructionsDisallowed</a></td>
      <td>一つのステージ内では同一タイプの命令を複数用いることはできません</td>
@z

@x
      <td><a href="./legacy-key-value-format/">LegacyKeyValueFormat</a></td>
      <td>Legacy key/value format with whitespace separator should not be used</td>
@y
      <td><a href="./legacy-key-value-format/">LegacyKeyValueFormat</a></td>
      <td>キーバリュー記述においてホワイトスペース区切りを用いるのは旧書式であって用いるべきではありません</td>
@z

@x
      <td><a href="./redundant-target-platform/">RedundantTargetPlatform</a></td>
      <td>Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior</td>
@y
      <td><a href="./redundant-target-platform/">RedundantTargetPlatform</a></td>
      <td>FROM において定義済み $TARGETPLATFORM をプラットフォーム指定することは、デフォルト動作であって冗長です</td>
@z

@x
      <td><a href="./secrets-used-in-arg-or-env/">SecretsUsedInArgOrEnv</a></td>
      <td>Sensitive data should not be used in the ARG or ENV commands</td>
@y
      <td><a href="./secrets-used-in-arg-or-env/">SecretsUsedInArgOrEnv</a></td>
      <td>機密情報は ARG や ENV コマンド内に用いるべきではありません</td>
@z

@x
      <td><a href="./invalid-default-arg-in-from/">InvalidDefaultArgInFrom</a></td>
      <td>Default value for global ARG results in an empty or invalid base image name</td>
@y
      <td><a href="./invalid-default-arg-in-from/">InvalidDefaultArgInFrom</a></td>
      <td>グローバルな ARG のデフォルト値によっては、ベースイメージ名が空か不適切なものになります</td>
@z

@x
      <td><a href="./from-platform-flag-const-disallowed/">FromPlatformFlagConstDisallowed</a></td>
      <td>FROM --platform flag should not use a constant value</td>
@y
      <td><a href="./from-platform-flag-const-disallowed/">FromPlatformFlagConstDisallowed</a></td>
      <td>FROM の --platform フラグでは固定値を用いるべきではありません</td>
@z

@x
      <td><a href="./copy-ignored-file/">CopyIgnoredFile (experimental)</a></td>
      <td>Attempting to Copy file that is excluded by .dockerignore</td>
@y
      <td><a href="./copy-ignored-file/">CopyIgnoredFile (試験的)</a></td>
      <td>.dockerignore によって除外されているファイルをコピーしようとしてます</td>
@z

@x
      <td><a href="./invalid-definition-description/">InvalidDefinitionDescription (experimental)</a></td>
      <td>Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.</td>
@y
      <td><a href="./invalid-definition-description/">InvalidDefinitionDescription (試験的)</a></td>
      <td>ビルドステージや引数に対するコメントは `# <引数/ステージ 名> <内容説明>` という書式に従う必要があります。説明書きを意図するコメントではない場合は、命令とコメントの間に、空行または空のコメント行を入れてください</td>
@z

@x
      <td><a href="./expose-proto-casing/">ExposeProtoCasing</a></td>
      <td>Protocol in EXPOSE instruction should be lowercase</td>
@y
      <td><a href="./expose-proto-casing/">ExposeProtoCasing</a></td>
      <td>EXPOSE 命令のプロトコル記述は英小文字でなければなりません</td>
@z

@x
      <td><a href="./expose-invalid-format/">ExposeInvalidFormat</a></td>
      <td>IP address and host-port mapping should not be used in EXPOSE instruction. This will become an error in a future release</td>
@y
      <td><a href="./expose-invalid-format/">ExposeInvalidFormat</a></td>
      <td>EXPOSE 命令には IP アドレスやホストのポートマッピングを記述してはなりません。これは今後のリリースにおいてエラー扱いとなります</td>
@z
