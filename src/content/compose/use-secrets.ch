%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: How to use secrets in Docker Compose
description: How to use secrets in Compose and their benefits
keywords: secrets, compose, security, environment variables
---
@y
---
title: How to use secrets in Docker Compose
description: How to use secrets in Compose and their benefits
keywords: secrets, compose, security, environment variables
---
@z

@x
A secret is any piece of data, such as a password, certificate, or API key, that shouldn’t be transmitted over a network or stored unencrypted in a Dockerfile or in your application’s source code.
@y
A secret is any piece of data, such as a password, certificate, or API key, that shouldn’t be transmitted over a network or stored unencrypted in a Dockerfile or in your application’s source code.
@z

@x
Docker Compose provides a way for you to use secrets without having to use environment variables to store information. If you’re injecting passwords and API keys as environment variables, you risk unintentional information exposure. Environment variables are often available to all processes, and it can be difficult to track access. They can also be printed in logs when debugging errors without your knowledge. Using secrets mitigates these risks.
@y
Docker Compose provides a way for you to use secrets without having to use environment variables to store information. If you’re injecting passwords and API keys as environment variables, you risk unintentional information exposure. Environment variables are often available to all processes, and it can be difficult to track access. They can also be printed in logs when debugging errors without your knowledge. Using secrets mitigates these risks.
@z

@x
## Use secrets
@y
## Use secrets
@z

@x
Getting a secret into a container is a two-step process. First, define the secret using the [top-level secrets element in your Compose file](compose-file/09-secrets.md). Next, update your service definitions to reference the secrets they require with the [secrets attribute](compose-file/05-services.md#secrets). Compose grants access to secrets on a per-service basis.
@y
Getting a secret into a container is a two-step process. First, define the secret using the [top-level secrets element in your Compose file](compose-file/09-secrets.md). Next, update your service definitions to reference the secrets they require with the [secrets attribute](compose-file/05-services.md#secrets). Compose grants access to secrets on a per-service basis.
@z

@x
Unlike the other methods, this permits granular access control within a service container via standard filesystem permissions.
@y
Unlike the other methods, this permits granular access control within a service container via standard filesystem permissions.
@z

@x
## Examples
@y
## Examples
@z

@x
### Simple
@y
### Simple
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
> **Note**
>
> The `_FILE` environment variables demonstrated here are a convention used by some images, including Docker Official Images like [mysql](https://hub.docker.com/_/mysql) and [postgres](https://hub.docker.com/_/postgres).
@y
> **Note**
>
> The `_FILE` environment variables demonstrated here are a convention used by some images, including Docker Official Images like [mysql](https://hub.docker.com/_/mysql) and [postgres](https://hub.docker.com/_/postgres).
@z

@x
## Resources:
@y
## Resources:
@z

@x
- [Secrets top-level element](compose-file/09-secrets.md)
- [Secrets attribute for services top-level element](compose-file/05-services.md#secrets)
@y
- [Secrets top-level element](compose-file/09-secrets.md)
- [Secrets attribute for services top-level element](compose-file/05-services.md#secrets)
@z
