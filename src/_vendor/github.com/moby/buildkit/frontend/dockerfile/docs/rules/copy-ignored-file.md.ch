%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: CopyIgnoredFile
description: >-
  Attempting to Copy file that is excluded by .dockerignore
@y
title: CopyIgnoredFile
description: >-
  .dockerignore によって除外されているファイルをコピーしようとしてます
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
```
@y
```text
Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
```
(訳： "./tmp/Dockerfile" ファイルをコピーしようとしていますが、これは .dockerignore によって除外されています)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
When you use the Add or Copy instructions from within a Dockerfile, you should
ensure that the files to be copied into the image do not match a pattern
present in `.dockerignore`.
@y
Add や Copy 命令を Dockerfile 内で利用するにあたって、イメージにコピーするファイルは `.dockerignore` ファイルには該当しないパターンであることが必要です。
@z

@x
Files which match the patterns in a `.dockerignore` file are not present in the
context of the image when it is built. Trying to copy or add a file which is
missing from the context will result in a build error.
@y
`.dockerignore`  ファイルに指定されたパターンに合致するファイルは、イメージビルド時にコンテキストに存在しないファイルです。
コンテキストにないファイルをコピーしたり追加したりすることは、ビルドエラーを引き起こします。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
With the given `.dockerignore` file:
@y
`.dockerignore` ファイルが以下のものであるとします。
@z

% snip text...

@x
❌ Bad: Attempting to Copy file "./tmp/Dockerfile" that is excluded by .dockerignore
@y
❌ 不可: "./tmp/Dockerfile" をコピーしようとしていますが、これは .dockerignore にて除外されています。
@z

% snip code...

@x
✅ Good: Copying a file which is not excluded by .dockerignore
@y
✅ 可: コピーしようとしているファイルは .dockerignore ファイルによって除外されていません。
@z

% snip code...
