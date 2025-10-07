%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: NoEmptyContinuation
description: >-
  Empty continuation lines will become errors in a future release
@y
title: NoEmptyContinuation
description: >-
  継続行の中の空行は今後のリリースにおいてエラー扱いとなります。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Empty continuation line found in: RUN apk add     gnupg     curl
```
@y
```text
Empty continuation line found in: RUN apk add     gnupg     curl
```
(訳： 継続行の中に空行があります： RUN apk add　　　gnupg　　　curl)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Support for empty continuation (`/`) lines have been deprecated and will
generate errors in future versions of the Dockerfile syntax.
@y
継続行 (`/` により実現) の中の空行は廃止予定の扱いになっており、Dockerfile 文法の今後のバージョンにおいてエラー扱いとなります。
@z

@x
Empty continuation lines are empty lines following a newline escape:
@y
継続行の中の空行とは、改行文字の次に続く空行のことです。
@z

% snip code...

@x
Support for such empty lines is deprecated, and a future BuildKit release will
remove support for this syntax entirely, causing builds to break. To avoid
future errors, remove the empty lines, or add comments, since lines with
comments aren't considered empty.
@y
こういった継続行内の空行は廃止予定の扱いであり、今後の BuildKit リリースにおいては、この文法を完全に削除する予定です。
これを用いた場合にはエラー終了することになります。
今後のエラー扱いを避けるため、空行を避けるかコメントを埋めることで、コメント行内が空にならないようにしてください。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: empty continuation line between `EXPOSE` and 80.
@y
❌ 不可: 継続行で記述された `EXPOSE` と 80 の間に空行があります。
@z

% snip code...

@x
✅ Good: comments do not count as empty lines.
@y
✅ 可: コメントは空行としてカウントされません。
@z

% snip code...
