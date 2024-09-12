%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: How to use secrets in Docker Compose
linkTitle: Secrets in Compose
@y
title: Docker Compose における Secrets の利用
linkTitle: Secrets in Compose
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
Getting a secret into a container is a two-step process. First, define the secret using the [top-level secrets element in your Compose file](/reference/compose-file/secrets.md). Next, update your service definitions to reference the secrets they require with the [secrets attribute](/reference/compose-file/services.md#secrets). Compose grants access to secrets on a per-service basis.
@y
Getting a secret into a container is a two-step process. First, define the secret using the [top-level secrets element in your Compose file](reference/compose-file/secrets.md). Next, update your service definitions to reference the secrets they require with the [secrets attribute](reference/compose-file/services.md#secrets). Compose grants access to secrets on a per-service basis.
@z

@x
Unlike the other methods, this permits granular access control within a service container via standard filesystem permissions.
@y
Unlike the other methods, this permits granular access control within a service container via standard filesystem permissions.
@z

@x
## Examples
@y
## 利用例 {#examples}
@z

@x
### Simple
@y
### Simple {#simple}
@z

@x
In the following example, the frontend service is given access to the `my_secret` secret. In the container, `/run/secrets/my_secret` is set to the contents of the file `./my_secret.txt`.
@y
In the following example, the frontend service is given access to the `my_secret` secret. In the container, `/run/secrets/my_secret` is set to the contents of the file `./my_secret.txt`.
@z

@x
```yaml
services:
  myapp:
    image: myapp:latest
    secrets:
      - my_secret
secrets:
  my_secret:
    file: ./my_secret.txt
```
@y
```yaml
services:
  myapp:
    image: myapp:latest
    secrets:
      - my_secret
secrets:
  my_secret:
    file: ./my_secret.txt
```
@z

@x
### Advanced
@y
### Advanced
@z

@x
```yaml
services:
   db:
     image: mysql:latest
     volumes:
       - db_data:/var/lib/mysql
     environment:
       MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD_FILE: /run/secrets/db_password
     secrets:
       - db_root_password
       - db_password
@y
```yaml
services:
   db:
     image: mysql:latest
     volumes:
       - db_data:/var/lib/mysql
     environment:
       MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD_FILE: /run/secrets/db_password
     secrets:
       - db_root_password
       - db_password
@z

@x
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD_FILE: /run/secrets/db_password
     secrets:
       - db_password
@y
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD_FILE: /run/secrets/db_password
     secrets:
       - db_password
@z

@x
secrets:
   db_password:
     file: db_password.txt
   db_root_password:
     file: db_root_password.txt
@y
secrets:
   db_password:
     file: db_password.txt
   db_root_password:
     file: db_root_password.txt
@z

@x
volumes:
    db_data:
```
In the advanced example above:
@y
volumes:
    db_data:
```
In the advanced example above:
@z

@x
- The `secrets` attribute under each service defines the secrets you want to inject into the specific container.
- The top-level `secrets` section defines the variables `db_password` and `db_root_password` and provides the `file` that populates their values.
- The deployment of each container means Docker creates a temporary filesystem mount under `/run/secrets/<secret_name>` with their specific values.
@y
- The `secrets` attribute under each service defines the secrets you want to inject into the specific container.
- The top-level `secrets` section defines the variables `db_password` and `db_root_password` and provides the `file` that populates their values.
- The deployment of each container means Docker creates a temporary filesystem mount under `/run/secrets/<secret_name>` with their specific values.
@z

@x
> [!NOTE]
>
> The `_FILE` environment variables demonstrated here are a convention used by some images, including Docker Official Images like [mysql](https://hub.docker.com/_/mysql) and [postgres](https://hub.docker.com/_/postgres).
@y
> [!NOTE]
>
> The `_FILE` environment variables demonstrated here are a convention used by some images, including Docker Official Images like [mysql](https://hub.docker.com/_/mysql) and [postgres](https://hub.docker.com/_/postgres).
@z

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
- [Secrets top-level element](reference/compose-file/secrets.md)
- [Secrets attribute for services top-level element](reference/compose-file/services.md#secrets)
- [Build secrets](https://docs.docker.com/build/building/secrets/)
@z
