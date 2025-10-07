%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: WorkdirRelativePath
description: >-
  Relative workdir without an absolute workdir declared within the build can have unexpected results if the base image changes
@y
title: WorkdirRelativePath
description: >-
  ビルド内に絶対パス WORKDIR がないのに相対パス WORKDIR があると、ベースイメージ変更時に予期しない結果を生み出します
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Relative workdir 'app/src' can have unexpected results if the base image changes
```
@y
```text
Relative workdir 'app/src' can have unexpected results if the base image changes
```
(訳： WORKDIR の相対パス指定 'app/src' は、ベースイメージの変更により予期しないことが発生する可能性があります)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
When specifying `WORKDIR` in a build stage, you can use an absolute path, like
`/build`, or a relative path, like `./build`. Using a relative path means that
the working directory is relative to whatever the previous working directory
was. So if your base image uses `/usr/local/foo` as a working directory, and
you specify a relative directory like `WORKDIR build`, the effective working
directory becomes `/usr/local/foo/build`.
@y
ビルドステージにおいて `WORKDIR` の指定を行う際には、`/build` のように絶対パスを指定するか、`./build` のように相対パスを指定することができます。
相対パスを用いるということは、その直前までのワーキングディレクトリからの相対位置としてディレクトリが定まるということです。
たとえばベースイメージがワーキングディレクトリとして `/usr/local/foo` を指定しているとして、相対パスに `WORKDIR build` といった指定を行ったとしたら、ワーキングディレクトリは `/usr/local/foo/build` になります。
@z

@x
The `WorkdirRelativePath` build rule warns you if you use a `WORKDIR` with a
relative path without first specifying an absolute path in the same Dockerfile.
The rationale for this rule is that using a relative working directory for base
image built externally is prone to breaking, since working directory may change
upstream without warning, resulting in a completely different directory
hierarchy for your build.
@y
ビルドルール `WorkdirRelativePath` は `WORKDIR` に相対パスを指定していながら、同じ Dockerfile 内において初めに絶対パスによる指定を行っていない場合に警告を出します。
このルールの考え方は以下のとおりです。
ベースイメージに対して相対パスによるワーキングディレクトリを指定した際に、そのベースイメージが外部でビルドされたものであるとすると、うまく動作しない場合があります。
というのもワーキングディレクトリは上流の開発者により通知なく変更されるかもしれません。
もしそうなったら、ビルド時におけるディレクトリ構造は完全に間違ったものになってしまいます。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: this assumes that `WORKDIR` in the base image is `/`
(if that changes upstream, the `web` stage is broken).
@y
❌ 不可: これはベースイメージ内の `WORKDIR` が `/` であることを前提にしています (上流の開発者がこれを変更したら、`web` ステージは意図しないものになります)。
@z

% snip code...

@x
✅ Good: a leading slash ensures that `WORKDIR` always ends up at the desired path.
@y
✅ 可: 先頭にスラッシュがあることから、`WORKDIR` は常に意図したパスとなります。
@z

% snip code...
