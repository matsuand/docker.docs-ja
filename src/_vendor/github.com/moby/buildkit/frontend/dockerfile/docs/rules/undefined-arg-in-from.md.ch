%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: UndefinedArgInFrom
description: >-
  FROM command must use declared ARGs
@y
title: UndefinedArgInFrom
description: >-
  FROM コマンドで用いる ARG は宣言されていなければなりません。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
FROM argument 'VARIANT' is not declared
```
@y
```text
FROM argument 'VARIANT' is not declared
```
(訳： FROM の引数 'VARIANT' が宣言されていません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
This rule warns for cases where you're consuming an undefined build argument in
`FROM` instructions.
@y
このルールは `FROM` 命令において未定義のビルド引数が指定された場合に警告します。
@z

@x
Interpolating build arguments in `FROM` instructions can be a good way to add
flexibility to your build, and lets you pass arguments that overriding the base
image of a stage. For example, you might use a build argument to specify the
image tag:
@y
`FROM` 命令内にビルド引数による補間機能を用いると、ビルド処理を柔軟に行うことができます。
つまり引数を与えることで、特定のステージにおけるベースイメージを上書きすることができます。
たとえば、イメージタグの指定にビルド引数を用いるものとします。
@z

% snip command...

@x
This makes it possible to run the build with a different `alpine` version by
specifying a build argument:
@y
このようにするとビルドを実行する際に、ビルド引数を指定することによって `alpine` の異なるバージョンをビルドできるようになります。
@z

% snip command...

@x
This check also tries to detect and warn when a `FROM` instruction reference
miss-spelled built-in build arguments, like `BUILDPLATFORM`.
@y
このチェックは同時に `FROM` 命令がスペル誤りによって、たとえば `BUILDPLATFORM` のような組み込みのビルド引数を参照していないかを確認し警告を出します。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: the `VARIANT` build argument is undefined.
@y
❌ 不可: ビルド引数 `VARIANT` が定義されていません。
@z

% snip code...

@x
✅ Good: the `VARIANT` build argument is defined.
@y
✅ 可: ビルド引数 `VARIANT` が定義されています。
@z

% snip code...
