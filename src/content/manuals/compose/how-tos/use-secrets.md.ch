%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: How to use secrets in Docker Compose
linkTitle: Secrets in Compose
@y
title: Docker Compose における Secrets の利用
linkTitle: Compose における Secrets
@z

@x
description: How to use secrets in Compose and their benefits
keywords: secrets, compose, security, environment variables
@y
description: Compose における Secrets の利用方法と里程について説明します。
keywords: secrets, compose, security, environment variables
@z

@x
A secret is any piece of data, such as a password, certificate, or API key, that shouldn’t be transmitted over a network or stored unencrypted in a Dockerfile or in your application’s source code.
@y
Secrets というのは、パスワード、証明書、API キーといった種類のデータを扱うものであり、ネットワークを介して送信することが不適切であったり、Dockerfile 内やアプリケーションソースコード内に暗号化せずにそのまま保存することが不適切であるような、あらゆるデータを指します。
@z

% snip include...

@x
Environment variables are often available to all processes, and it can be difficult to track access. They can also be printed in logs when debugging errors without your knowledge. Using secrets mitigates these risks.
@y
環境変数は場合によっては全プロセスからの利用が可能であるため、アクセスをすべて追跡することは困難です。
また感知していないところで、エラーデバッグを行う際に出力されてしまうかもしれません。
Secrets を利用すれば、こういったリスクは軽減されます。
@z

@x
## Use secrets
@y
## Secrets の利用 {#use-secrets}
@z

@x
Secrets are mounted as a file in `/run/secrets/<secret_name>` inside the container.
@y
secret はコンテナー内部において `/run/secrets/<secret_name>` 内のファイルとしてマウントします。
@z

@x
Getting a secret into a container is a two-step process. First, define the secret using the [top-level secrets element in your Compose file](/reference/compose-file/secrets.md). Next, update your service definitions to reference the secrets they require with the [secrets attribute](/reference/compose-file/services.md#secrets). Compose grants access to secrets on a per-service basis.
@y
secret をコンテナーに含めるには 2 つのステップを経ます。
まず [Compose ファイル内のトップレベル項目の secret](reference/compose-file/secrets.md) として secret を定義します。
そしてその secret を利用して [secret の属性](reference/compose-file/services.md#secrets) を参照するサービスの定義を適切に設定します。
Compose において secret へのアクセス権限は、各サービスごとに扱われます。
@z

@x
Unlike the other methods, this permits granular access control within a service container via standard filesystem permissions.
@y
アクセス権限に関する手法は他のものとは異なっているため、標準的なファイルシステム上の権限を介して、きめ細かなアクセス制御が可能です。
@z

@x
## Examples
@y
## 利用例 {#examples}
@z

@x
### Simple
@y
### 単純な例 {#simple}
@z

@x
In the following example, the frontend service is given access to the `my_secret` secret. In the container, `/run/secrets/my_secret` is set to the contents of the file `./my_secret.txt`.
@y
以下の利用例では、フロントエンドサービスにおいて `my_secret` という secret へのアクセス権が与えられています。
このコンテナーでは `./my_secret.txt` のファイル内容が `/run/secrets/my_secret` に設定されます。
@z

% snip code...

@x
### Advanced
@y
### 応用的な例 {#advanced}
@z

% snip code...

@x
In the advanced example above:
@y
この応用的な利用例では以下のことが行われています。
@z

@x
- The `secrets` attribute under each service defines the secrets you want to inject into the specific container.
- The top-level `secrets` section defines the variables `db_password` and `db_root_password` and provides the `file` that populates their values.
- The deployment of each container means Docker creates a temporary filesystem mount under `/run/secrets/<secret_name>` with their specific values.
@y
- 各サービスにおける `secrets` 属性として、所定コンテナー内に含めたい secret を定義しています。
- トップレベルの `secrets` セクションでは、変数 `db_password` および `db_root_password` を定義して、`file` によってそれらの値を提供するファイルを指定しています。
- 各コンテナーのデプロイを行うと、Docker が `/run/secrets/<secret_name>` の配下に一時的なファイルシステムを生成し、そこに指定の値を設定します。
@z

@x
> [!NOTE]
>
> The `_FILE` environment variables demonstrated here are a convention used by some images, including Docker Official Images like [mysql](https://hub.docker.com/_/mysql) and [postgres](https://hub.docker.com/_/postgres).
@y
> [!NOTE]
>
> 上に示している `_FILE` 環境変数は、Docker の公式イメージ [mysql](https://hub.docker.com/_/mysql) や [postgres](https://hub.docker.com/_/postgres) などにおいて慣例的に用いられているものです。
@z

@x
### Build secrets
@y
### secret のビルド {#build-secrets}
@z

@x
In the following example, the `npm_token` secret is made available at build time. Its value is taken from the `NPM_TOKEN` environment variable.
@y
以下の利用例では `npm_token` という secret がビルド時に利用可能となるようにしています。
その値は環境変数 `NPM_TOKEN` から取得されます。
@z

% snip code...

@x
## Resources
@y
## リソース {#resources}
@z

@x
- [Secrets top-level element](/reference/compose-file/secrets.md)
- [Secrets attribute for services top-level element](/reference/compose-file/services.md#secrets)
- [Build secrets](https://docs.docker.com/build/building/secrets/)
@y
- [secret のトップレベル要素](reference/compose-file/secrets.md)
- [サービスのトップレベル要素に対する secret 属性](reference/compose-file/services.md#secrets)
- [secret のビルド](https://docs.docker.com/build/building/secrets/)
@z
