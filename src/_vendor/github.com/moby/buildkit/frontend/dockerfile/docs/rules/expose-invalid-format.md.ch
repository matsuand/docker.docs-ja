%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: ExposeInvalidFormat
description: >-
  IP address and host-port mapping should not be used in EXPOSE instruction. This will become an error in a future release
@y
title: ExposeInvalidFormat
description: >-
  EXPOSE 命令には IP アドレスやホストのポートマッピングを記述してはなりません。これは今後のリリースにおいてエラー扱いとなります
@z

@x
## Output
@y
## 出力 {#output}
@z

% snip text...
@x
## Description
@y
## 内容説明 {#description}
@z

@x
The [`EXPOSE`](https://docs.docker.com/reference/dockerfile/#expose) instruction
in a Dockerfile is used to indicate which ports the container listens on at
runtime. It should not include an IP address or host-port mapping, as this is
not the intended use of the `EXPOSE` instruction. Instead, it should only
specify the port number and optionally the protocol (TCP or UDP).
@y
Dockerfile 内において [`EXPOSE`](__SUBDIR__/reference/dockerfile/#expose) 命令は、実行時にコンテナーがどのポートを利用するかを設定します。
そこには IP アドレスやホスト側のポートマッピングを含めるものではありません。
それを含めることは、この `EXPOSE` 命令の意図するものではありません。
この命令ではポート番号のみを示すものであり、必要に応じてプロトコル (TCP または UDP) を記述します。
@z

@x
> [!IMPORTANT]
> This will become an error in a future release.
@y
> [!IMPORTANT]
> これは今後のリリースにおいてエラー扱いとなります。
@z

@x
## Examples
@y
## 利用例 {#examples}
@z

@x
❌ Bad: IP address and host-port mapping used.
@y
❌ 不可: IP アドレスとホスト側のポートマッピングが記述されています。
@z

% snip code...

@x
✅ Good: only the port number is specified.
@y
✅ 可: ポート番号のみが指定されています。
@z

% snip code...

@x
❌ Bad: Host-port mapping used.
@y
❌ 不可: ホスト側のポートマッピングが記述されています。
@z

% snip code...

@x
✅ Good: only the port number is specified.
@y
✅ 可: ポート番号のみが指定されています。
@z

% snip code...
