%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: ExposeProtoCasing
description: >-
  Protocol in EXPOSE instruction should be lowercase
@y
title: ExposeProtoCasing
description: >-
  EXPOSE 命令のプロトコル記述は英小文字でなければなりません
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Defined protocol '80/TcP' in EXPOSE instruction should be lowercase
```
@y
```text
Defined protocol '80/TcP' in EXPOSE instruction should be lowercase
```
(訳： EXPOSE 命令における定義済みプロトコル '80/TcP' は英小文字でなければなりません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Protocol names in the [`EXPOSE`](https://docs.docker.com/reference/dockerfile/#expose)
instruction should be specified in lowercase to maintain consistency and
readability. This rule checks for protocols that are not in lowercase and
reports them.
@y
[`EXPOSE`](__SUBDIR__/reference/dockerfile/#expose) 命令に記述するプロトコル名は、一貫性と読みやすさを維持するために英小文字として記述することが必要です。
本ルールはプロトコル名が英小文字でなかった場合にそれを警告します。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: protocol is not in lowercase.
@y
❌ 不可: プロトコルが英小文字で書かれていません。
@z

% snip code...

@x
✅ Good: protocol is in lowercase.
@y
✅ 可: プロトコルが英小文字で書かれています。
@z

% snip code...
