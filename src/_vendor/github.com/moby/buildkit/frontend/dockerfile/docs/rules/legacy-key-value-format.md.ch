%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: LegacyKeyValueFormat
description: >-
  Legacy key/value format with whitespace separator should not be used
@y
title: LegacyKeyValueFormat
description: >-
  キーバリュー記述においてホワイトスペース区切りを用いるのは旧書式であって用いるべきではありません。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
"ENV key=value" should be used instead of legacy "ENV key value" format
```
@y
```text
"ENV key=value" should be used instead of legacy "ENV key value" format
```
(訳： 旧表記 "ENV key value" ではなく "ENV key=value" を用いるべきです)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
The correct format for declaring environment variables and build arguments in a
Dockerfile is `ENV key=value` and `ARG key=value`, where the variable name
(`key`) and value (`value`) are separated by an equals sign (`=`).
Historically, Dockerfiles have also supported a space separator between the key
and the value (for example, `ARG key value`). This legacy format is deprecated,
and you should only use the format with the equals sign.
@y
Dockerfile における環境変数やビルド引数を宣言する場合は、`ENV key=value` や `ARG key=value` とするのが正しい書式です。
つまり変数名 (`key`) と値 (`value`) は等号 (`=`) によって区切ります。
これまで Dockerfile では、キーと値の区切り文字として空白もサポートしてきました (たとえば `ARG key value`)。
この書式は古いものとして廃止予定になっています。
等号を用いた書式のみを用いるようにしてください。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: using a space separator for variable key and value.
@y
❌ 不可: 変数キーと値の間に空白区切りを用いています。
@z

% snip code...

@x
✅ Good: use an equals sign to separate key and value.
@y
✅ 可: キーと値の区切りに等号を用いています。
@z

% snip code...

@x
❌ Bad: multi-line variable declaration with a space separator.
@y
❌ 不可: 複数行で構成される宣言にて空白区切りが用いられています。
@z

% snip code...

@x
✅ Good: use an equals sign and wrap the value in quotes.
@y
✅ 可: 値をクォーテーション内にラップして等号を用いています。
@z

% snip code...
