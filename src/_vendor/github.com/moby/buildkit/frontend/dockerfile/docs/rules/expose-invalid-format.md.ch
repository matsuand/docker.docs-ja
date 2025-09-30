%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: ExposeInvalidFormat
description: >-
  IP address and host-port mapping should not be used in EXPOSE instruction. This will become an error in a future release
@y
title: ExposeInvalidFormat
description: >-
  IP address and host-port mapping should not be used in EXPOSE instruction. This will become an error in a future release
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
The [`EXPOSE`](https://docs.docker.com/reference/dockerfile/#expose) instruction
in a Dockerfile is used to indicate which ports the container listens on at
runtime. It should not include an IP address or host-port mapping, as this is
not the intended use of the `EXPOSE` instruction. Instead, it should only
specify the port number and optionally the protocol (TCP or UDP).
@z

@x
> [!IMPORTANT]
> This will become an error in a future release.
@y
> [!IMPORTANT]
> This will become an error in a future release.
@z

@x
## Examples
@y
## 利用例 {#examples}
@z

@x
❌ Bad: IP address and host-port mapping used.
@y
❌ Bad: IP address and host-port mapping used.
@z

% snip code...

@x
✅ Good: only the port number is specified.
@y
✅ Good: only the port number is specified.
@z

% snip code...

@x
❌ Bad: Host-port mapping used.
@y
❌ Bad: Host-port mapping used.
@z

% snip code...

@x
✅ Good: only the port number is specified.
@y
✅ Good: only the port number is specified.
@z

% snip code...
