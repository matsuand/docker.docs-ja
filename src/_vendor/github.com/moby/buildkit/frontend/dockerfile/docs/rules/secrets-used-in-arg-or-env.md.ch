%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: SecretsUsedInArgOrEnv
description: >-
  Sensitive data should not be used in the ARG or ENV commands
@y
title: SecretsUsedInArgOrEnv
description: >-
  機密情報は ARG や ENV コマンド内に用いるべきではありません
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Potentially sensitive data should not be used in the ARG or ENV commands
```
@y
```text
Potentially sensitive data should not be used in the ARG or ENV commands
```
(訳： 潜在的に漏洩リスクのある機密情報は ARG や ENV コマンド内に用いるべきではありません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
While it is common to pass secrets to running processes
through environment variables during local development,
setting secrets in a Dockerfile using `ENV` or `ARG`
is insecure because they persist in the final image.
This rule reports violations where `ENV` and `ARG` keys
indicate that they contain sensitive data.
@y
実行プロセスに対して機密情報を受け渡す場合に、ローカル環境であれば環境変数を通じて実現するのは普通に行われることです。
しかし Dockerfile 内の `ENV` や `ARG` に機密情報を設定するのは安全ではありません。
なぜならこの情報は最終イメージに残り続けるからです。
本ルールは `ENV` と `ARG` のキーとして機密情報が含まれているという危険を警告するものです。
@z

@x
Instead of `ARG` or `ENV`, you should use secret mounts,
which expose secrets to your builds in a secure manner,
and do not persist in the final image or its metadata.
See [Build secrets](https://docs.docker.com/build/building/secrets/).
@y
`ARG` や `ENV` に代わりとしては、シークレットマウントを用いるべきです。
これはビルド時の機密情報を受け渡す際に、セキュアな方法により実現するものです。
そして最終イメージやメタデータ内にその情報を残しません。
詳しくは [機密情報のビルド](__SUBDIR__/build/building/secrets/) を参照してください。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: `AWS_SECRET_ACCESS_KEY` is a secret value.
@y
❌ 不可: `AWS_SECRET_ACCESS_KEY` は機密情報です。
@z

% snip code...
