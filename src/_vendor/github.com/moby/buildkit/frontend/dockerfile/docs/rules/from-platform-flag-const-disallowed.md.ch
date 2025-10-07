%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: FromPlatformFlagConstDisallowed
description: >-
  FROM --platform flag should not use a constant value
@y
title: FromPlatformFlagConstDisallowed
description: >-
  FROM の --platform フラグでは固定値を用いるべきではありません
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
FROM --platform flag should not use constant value "linux/amd64"
```
@y
```text
FROM --platform flag should not use constant value "linux/amd64"
```
(訳： FROM の --platform フラグでは定数値 "linux/amd64" を用いるべきではありません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Specifying `--platform` in the Dockerfile `FROM` instruction forces the image to build on only one target platform. This prevents building a multi-platform image from this Dockerfile and you must build on the same platform as specified in `--platform`.
@y
Dockerfile 内にて `--platform` を指定すると `FROM` 命令はただ一つのプラットフォームを対象としてイメージビルドを行います。
これを行ってしまうと、この Dockerfile からはマルチプラットフォームイメージのビルドができなくなります。
つまり `--platform` に指定したプラットフォームしかビルドできないということです。
@z

@x
The recommended approach is to:
@y
この場合に推奨される方法は以下のとおりです。
@z

@x
* Omit `FROM --platform` in the Dockerfile and use the `--platform` argument on the command line.
* Use `$BUILDPLATFORM` or some other combination of variables for the `--platform` argument.
* Stage name should include the platform, OS, or architecture name to indicate that it only contains platform-specific instructions.
@y
* Dockerfile では `FROM --platform` の記述を行わず、コマンドラインから `--platform` 引数として指定する。
* `--platform` 引数として `$BUILDPLATFORM` あるいは他の変数の組み合わせを指定する。
* ステージ名にはプラットフォーム、OS、アーキテクチャーを必ず含めるようにして、そこではプラットフォーム固有の命令のみを実現するようにする。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: using a constant argument for `--platform`
@y
❌ 不可: `--platform` に対して定数引数を指定しています。
@z

% snip code...

@x
✅ Good: using the default platform
@y
✅ 可: デフォルトのプラットフォームを用いています。
@z

% snip code...

@x
✅ Good: using a meta variable
@y
✅ 可: メタ変数を用いています。
@z

% snip code...

@x
✅ Good: used in a multi-stage build with a target architecture
@y
✅ 可: マルチステージビルドにおいてターゲットアーキテクチャーを用いています。
@z

% snip code...
