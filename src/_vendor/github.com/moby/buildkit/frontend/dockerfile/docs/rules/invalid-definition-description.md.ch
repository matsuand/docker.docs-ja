%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: InvalidDefinitionDescription
description: >-
  Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
@y
title: InvalidDefinitionDescription
description: >-
  Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
@z

@x
> [!NOTE]
> This check is experimental and is not enabled by default. To enable it, see
> [Experimental checks](https://docs.docker.com/go/build-checks-experimental/).
@y
> [!NOTE]
> 本チェックは試験的であり、デフォルトでは無効となっています。
> これを有効にする方法は [試験的チェック](__SUBDIR__/build/checks/#experimental-checks) を参照してください。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
```
@y
```text
Comment for build stage or argument should follow the format: `# <arg/stage name> <description>`. If this is not intended to be a description comment, add an empty line or comment between the instruction and the comment.
```
(訳： ビルドステージや引数に対するコメントは `# <引数/ステージ 名> <内容説明>` という書式に従う必要があります。説明書きを意図するコメントではない場合は、命令とコメントの間に、空行または空のコメント行を入れてください)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
The [`--call=outline`](https://docs.docker.com/reference/cli/docker/buildx/build/#call-outline)
and [`--call=targets`](https://docs.docker.com/reference/cli/docker/buildx/build/#call-outline)
flags for the `docker build` command print descriptions for build targets and arguments.
The descriptions are generated from [Dockerfile comments](https://docs.docker.com/reference/cli/docker/buildx/build/#descriptions)
that immediately precede the `FROM` or `ARG` instruction
and that begin with the name of the build stage or argument.
For example:
@y
`docker build` コマンドの [`--call=outline`](__SUBDIR__/reference/cli/docker/buildx/build/#call-outline) や [`--call=targets`](__SUBDIR__/reference/cli/docker/buildx/build/#call-outline) フラグは、ビルドターゲットや引数についての説明を出力します。
その説明は [Dockerfile コメント](__SUBDIR__/reference/cli/docker/buildx/build/#descriptions) から生成されるものです。
そして `FROM` や `ARG` 命令の直前に記述され、その内容はビルドステージまたは引数の名前から書き始めるものです。
たとえば以下のとおりです。
@z

@x within code
# build-cli builds the CLI binary
@y
# build-cli CLI バイナリをビルドします。
@z
@x
# VERSION controls the version of the program
@y
# VERSION プログラムバージョンを決定します。
@z

@x
In cases where preceding comments are not meant to be descriptions,
add an empty line or comment between the instruction and the preceding comment.
@y
直前のコメントが説明を行う意図がないものである場合、命令とそのコメントとの間には空行または空コメント行を加えてください。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: A non-descriptive comment on the line preceding the `FROM` command.
@y
❌ 不可: 説明を意図していないコメントが `FROM` コマンドの直前行に記述されています。
@z

@x within code
# a non-descriptive comment
@y
# 説明を意図していないコメント
@z
@x
# another non-descriptive comment
@y
# 説明を意図していない別のコメント
@z

@x
✅ Good: An empty line separating non-descriptive comments.
@y
✅ Good: 説明を意図していないコメントが空行をはさんで記述されています。
@z

@x within code
# a non-descriptive comment
@y
# 説明を意図していないコメント
@z
@x
# another non-descriptive comment
@y
# 説明を意図していない別のコメント
@z

@x
✅ Good: Comments describing `ARG` keys and stages immediately proceeding the command.
@y
✅ Good: `ARG` キーやステージを説明するコメントがコマンドの直前に記述されています。
@z

@x within code
# base is a stage for compiling source
@y
# base ソースコンパイルを行うステージです。
@z
@x
# VERSION This is the version number.
@y
# VERSION これがバージョン番号です。
@z
