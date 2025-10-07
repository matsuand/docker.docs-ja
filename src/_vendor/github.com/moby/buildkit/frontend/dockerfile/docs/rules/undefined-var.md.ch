%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: UndefinedVar
description: >-
  Variables should be defined before their use
@y
title: UndefinedVar
description: >-
  変数は利用する前に定義しなければなりません
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Usage of undefined variable '$foo'
```
@y
```text
Usage of undefined variable '$foo'
```
(訳： 定義されていない変数 '$foo' が使われています)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
This check ensures that environment variables and build arguments are correctly
declared before being used. While undeclared variables might not cause an
immediate build failure, they can lead to unexpected behavior or errors later
in the build process.
@y
このチェックは、環境変数やビルド引数が利用される前に正しく宣言されていることを確認します。
変数が宣言されていなかったとしても、即座にビルドエラーになることはないかもしれません。
しかしビルド処理のどこかにおいて、予期しない動作を引き起こす可能性があります。
@z

@x
This check does not evaluate undefined variables for `RUN`, `CMD`, and
`ENTRYPOINT` instructions where you use the [shell form](https://docs.docker.com/reference/dockerfile/#shell-form).
That's because when you use shell form, variables are resolved by the command
shell.
@y
このチェックにおいては、`RUN`、`CMD`、`ENTRYPOINT` といった命令の [シェル形式](https://docs.docker.com/reference/dockerfile/#shell-form) を使った場合には、変数が未定義であったとしてもその評価はしません。
シェル形式の場合、変数はコマンドシェルが解決するからです。
@z

@x
It also detects common mistakes like typos in variable names. For example, in
the following Dockerfile:
@y
またこのチェックでは変数名のタイポのような、よく引き起こすミスについてもチェックします。
たとえば Dockerfile 内において以下のように記述したとします。
@z

% snip code...

@x
The check identifies that `$PAHT` is undefined and likely a typo for `$PATH`:
@y
このチェックにおいて `$PAHT` は未定義であることを検出すると同時に `$PATH` のタイポであろうと予測します。
@z

@x
```text
Usage of undefined variable '$PAHT' (did you mean $PATH?)
```
@y
```text
Usage of undefined variable '$PAHT' (did you mean $PATH?)
```
(訳： 定義されていない変数 '$PAHT' が使われています ($PATH のことですか？) )
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: `$foo` is an undefined build argument.
@y
❌ 不可: `$foo` は定義されていないビルド引数です。
@z

% snip code...

@x
✅ Good: declaring `foo` as a build argument before attempting to access it.
@y
✅ 可: `foo` は変数アクセスする前に、ビルド引数として宣言しています。
@z

% snip code...

@x
❌ Bad: `$foo` is undefined.
@y
❌ 不可: `$foo` は定義されていません。
@z

% snip code...

@x
✅ Good: the base image defines `$PYTHON_VERSION`
@y
✅ 可: ベースイメージが `$PYTHON_VERSION` を定義しています。
@z

% snip code...
