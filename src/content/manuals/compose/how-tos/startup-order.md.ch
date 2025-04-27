%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to control service startup and shutdown order in Docker Compose
keywords: documentation, docs, docker, compose, startup, shutdown, order
title: Control startup and shutdown order in Compose
@y
description: Docker Compose においてサービスの起動順、停止順を制御する方法を説明します。
keywords: documentation, docs, docker, compose, startup, shutdown, order
title: Compose における起動、停止順の制御
@z

@x
You can control the order of service startup and shutdown with the
[depends_on](/reference/compose-file/services.md#depends_on) attribute. Compose always starts and stops
containers in dependency order, where dependencies are determined by
`depends_on`, `links`, `volumes_from`, and `network_mode: "service:..."`.
@y
サービスの起動順や停止順は [depends_on](reference/compose-file/services.md#depends_on) 属性を使って制御することができます。
Compose では必ず依存順に応じて、コンテナーの起動または停止を行いますが、この依存順とは `depends_on`、`links`、`volumes_from`、`network_mode: "service:..."` によって決定されます。
@z

@x
A good example of when you might use this is an application which needs to access a database. If both services are started with `docker compose up`, there is a chance this will fail since the application service might start before the database service and won't find a database able to handle its SQL statements. 
@y
この仕組みを使いたくなる良い例として、データベースアクセスを必要とするアプリケーションがあります。
`docker compose up` によって 2 つのサービスを起動させても、その起動に失敗することがあります。
それはデータベースサービスの起動よりも前にウェブサービスが起動してしまったとしたら、データベースを見つけることができずに SQL ステートメントを取り扱えなくなるからです。
@z

@x
## Control startup
@y
## 起動順の制御 {#control-startup}
@z

@x
On startup, Compose does not wait until a container is "ready", only until it's running. This can cause issues if, for example, you have a relational database system that needs to start its own services before being able to handle incoming connections.
@y
Compose の起動時には、コンテナーが「準備状態」となるまで Compose が処理を待つことはありません。
実行状態になっただけで Compose は次の処理に進んでしまいます。
たとえばリレーショナルデータベースを利用している場合に、接続要求を取り扱えるような状態になる前にデータベースサービスを起動していないと、問題が発生することになります。
@z

@x
The solution for detecting the ready state of a service is  to use the `condition` attribute with one of the following options:
@y
サービスが準備状態であることを検知する方法としては、`condition` 属性である以下のいずれかのオプションを利用することになります。
@z

@x
- `service_started`
- `service_healthy`. This specifies that a dependency is expected to be “healthy”, which is defined with `healthcheck`, before starting a dependent service.
- `service_completed_successfully`. This specifies that a dependency is expected to run to successful completion before starting a dependent service.
@y
- `service_started`
- `service_healthy`. This specifies that a dependency is expected to be “healthy”, which is defined with `healthcheck`, before starting a dependent service.
- `service_completed_successfully`. This specifies that a dependency is expected to run to successful completion before starting a dependent service.
@z

@x
## Example
@y
## 例 {#example}
@z

% snip code...

@x
Compose creates services in dependency order. `db` and `redis` are created before `web`. 
@y
Compose はサービス依存の順にサービスを生成します。
つまり `db` と `redis` は `web` よりも前に生成されます。
@z

@x
Compose waits for healthchecks to pass on dependencies marked with `service_healthy`. `db` is expected to be "healthy" (as indicated by `healthcheck`) before `web` is created.
@y
Compose waits for healthchecks to pass on dependencies marked with `service_healthy`. `db` is expected to be "healthy" (as indicated by `healthcheck`) before `web` is created.
@z

@x
`restart: true` ensures that if `db` is updated or restarted due to an explicit Compose operation, for example `docker compose restart`, the `web` service is also restarted automatically, ensuring it re-establishes connections or dependencies correctly.
@y
`restart: true` ensures that if `db` is updated or restarted due to an explicit Compose operation, for example `docker compose restart`, the `web` service is also restarted automatically, ensuring it re-establishes connections or dependencies correctly.
@z

@x
The healthcheck for the `db` service uses the `pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}` command to check if the PostgreSQL database is ready. The service is retried every 10 seconds, up to 5 times.
@y
`db` サービスに対するヘルスチェックでは `pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}` というコマンドを実行することで、PostgreSQL データベースが準備されたかどうかを確認します。
これは 10 秒ごとに 5 回まで再確認が行われます。
@z

@x
Compose also removes services in dependency order. `web` is removed before `db` and `redis`.
@y
Compose でのサービスの削除もまた、サービス依存の順に行われます。
`web` は `db` と `redis` 
@z

@x
## Reference information 
@y
## 関連情報 {#reference-information}
@z

@x
- [`depends_on`](/reference/compose-file/services.md#depends_on)
- [`healthcheck`](/reference/compose-file/services.md#healthcheck)
@y
- [`depends_on`](reference/compose-file/services.md#depends_on)
- [`healthcheck`](reference/compose-file/services.md#healthcheck)
@z
