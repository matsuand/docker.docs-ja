%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Multi container apps
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using more than one container in your application
@y
title: マルチコンテナーアプリ
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using more than one container in your application
@z

@x
Up to this point, you've been working with single container apps. But, now you will add MySQL to the
application stack. The following question often arises - "Where will MySQL run? Install it in the same
container or run it separately?" In general, each container should do one thing and do it well. The following are a few reasons to run the container separately:
@y
これまでは 1 つのコンテナーからなるアプリを使って作業を進めてきました。
ここからはアプリケーションに MySQL を加えることにします。
ところが以下の質問があがってきます。
「MySQL はどこで動かすの？」
「同じコンテナー内にインストール？ それとも別に動かす？」
原則を言います。
1 つのコンテナーでは 1 つのことだけを行います。
そうするのが一番うまくいきます。
その理由はいくつかあります。
@z

@x
- There's a good chance you'd have to scale APIs and front-ends differently than databases.
- Separate containers let you version and update versions in isolation.
- While you may use a container for the database locally, you may want to use a managed service
  for the database in production. You don't want to ship your database engine with your app then.
- Running multiple processes will require a process manager (the container only starts one process), which adds complexity to container startup/shutdown.
@y
- データベースとは別にして、API やフロントエンドをスケーリングしなければならないなら、ちょうど良い機会です。
- コンテナーを別々にすれば、バージョン管理や更新操作を個別に行うことができます。
- 1 つのコンテナーをデータベース用としてローカルで利用し、本番環境ではサービスを利用してデータベースを管理することができます。
  そうすればデータベースをアプリとともに提供する必要がありません。
- プロセスを複数実行するにはプロセスマネージャーが必要です（コンテナーが起動するプロセスは 1 つです）。
  そうなるとコンテナーの起動や停止が複雑になります。
@z

@x
And there are more reasons. So, like the following diagram, it's best to run your app in multiple containers.
@y
理由はもっとあります。
では以下の図を見ましょう。
こういうときのアプリ実行を実現するにはマルチコンテナーです。
@z

@x
![Todo App connected to MySQL container](images/multi-container.webp?w=350h=250)
@y
![Todo アプリから MySQL コンテナーへの接続](images/multi-container.webp?w=350h=250)
@z

@x
## Container networking
@y
## コンテナーのネットワーク {#container-networking}
@z

@x
Remember that containers, by default, run in isolation and don't know anything about other processes
or containers on the same machine. So, how do you allow one container to talk to another? The answer is
networking. If you place the two containers on the same network, they can talk to each other.
@y
コンテナーについてもう一度確認します。
デフォルトでコンテナーは分離された状態で動作するので、それが動作するマシン上の他のプロセスや他のコンテナーのことなどまったく知りません。
それならどうやってコンテナーどうしを互いにやりとりできるようにすればよいのでしょう。
その答えはネットワークです。
2 つのコンテナーを同一のネットワーク上に置けば、両者は互いに通信することができます。
@z

@x
## Start MySQL
@y
## MySQL の起動 {#start-mysql}
@z

@x
There are two ways to put a container on a network:
 - Assign the network when starting the container.
 - Connect an already running container to a network.
@y
コンテナーをネットワークに加えるには 2 つの方法があります。
 - そのコンテナーの起動時にネットワークを割り当てる。
 - 既存のコンテナーをネットワークに接続する。
@z

@x
In the following steps, you'll create the network first and then attach the MySQL container at startup.
@y
以下の手順では、はじめにネットワークを生成して、起動時に MySQL コンテナーをアタッチします。
@z

@x
1. Create the network.
@y
1. ネットワークを生成します。
@z

% snip command...

@x
2. Start a MySQL container and attach it to the network. You're also going to define a few environment variables that the
   database will use to initialize the database. To learn more about the MySQL environment variables, see the "Environment Variables" section in the [MySQL Docker Hub listing](https://hub.docker.com/_/mysql/).
@y
2. MySQL コンテナーを起動してネットワークに割り当てます。
   同時に環境変数をいくつか定義して、データベースの初期化に利用します。
   MySQL の環境変数についての詳細は、[MySQL Docker Hub 一覧](https://hub.docker.com/_/mysql/) の「Environment Variables」の節を参照してください。
@z

@x
   {{< tabs >}}
   {{< tab name="Mac / Linux / Git Bash" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac / Linux / Git Bash" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="PowerShell" >}}
@y
   {{< /tab >}}
   {{< tab name="PowerShell" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Command Prompt" >}}
@y
   {{< /tab >}}
   {{< tab name="コマンドプロンプト" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
   In the previous command, you can see the `--network-alias` flag. In a later section, you'll learn more about this flag.
@y
   上のコマンドでは `--network-alias` フラグを利用しています。
   このフラグについては後の節で説明します。
@z

@x
   > [!TIP]
   >
   > You'll notice a volume named `todo-mysql-data` in the above command that is mounted at `/var/lib/mysql`, which is where MySQL stores its data. However, you never ran a `docker volume create` command. Docker recognizes you want to use a named volume and creates one automatically for you.
@y
   > [!TIP]
   >
   > 上ではボリューム名として `todo-mysql-data` を指定し `/var/lib/mysql` にマウントしています。
   > このディレクトリは MySQL がデータを保存する場所です。
   > だからといって `docker volume create` コマンドは実行していません。
   > Docker は名前つきボリュームが指定されたことを認識して、これを自動的に生成してくれます。
@z

@x
3. To confirm you have the database up and running, connect to the database and verify that it connects.
@y
3. データベースが起動され実行していることを確認するため、データベースに接続して接続確認を行います。
@z

% snip command...

@x
   When the password prompt comes up, type in `secret`. In the MySQL shell, list the databases and verify
   you see the `todos` database.
@y
   パスワードプロンプトが表示されたら `secret` と入力します。
   MySQL シェルにおいてデータベース一覧を表示し `todos`データベースがあることを確認します。
@z

% snip command...

@x
   You should see output that looks like this:
@y
   出力は以下のようになるはずです。
@z

% snip output...

@x
4. Exit the MySQL shell to return to the shell on your machine.
@y
4. MySQL シェルを終了して、マシン上のシェルに戻ります。
@z

% snip command...

@x
   You now have a `todos` database and it's ready for you to use.
@y
   `todos` データベースが生成できたので、これを利用していくことにします。
@z

@x
## Connect to MySQL
@y
## MySQL への接続 {#connect-to-mysql}
@z

@x
Now that you know MySQL is up and running, you can use it. But, how do you use it? If you run
another container on the same network, how do you find the container? Remember that each container has its own IP address.
@y
MySQL が起動し実行されていることが確認できたので、さっそく使ってみます。
だけど、どうやって？
同一ネットワーク上に別のコンテナーを実行したとき、そのコンテナーをどうやって認識したらよいのでしょう？
各コンテナーにはそれぞれに IP アドレスがありますが。
@z

@x
To answer the questions above and better understand container networking, you're going to make use of the [nicolaka/netshoot](https://github.com/nicolaka/netshoot) container,
which ships with a lot of tools that are useful for troubleshooting or debugging networking issues.
@y
To answer the questions above and better understand container networking, you're going to make use of the [nicolaka/netshoot](https://github.com/nicolaka/netshoot) container,
which ships with a lot of tools that are useful for troubleshooting or debugging networking issues.
@z

@x
1. Start a new container using the nicolaka/netshoot image. Make sure to connect it to the same network.
@y
1. nicolaka/netshoot というイメージを使ったコンテナーを新たに起動します。
   ネットワークは同一のものに接続するようにします。
@z

% snip command...

@x
2. Inside the container, you're going to use the `dig` command, which is a useful DNS tool. You're going to look up
   the IP address for the hostname `mysql`.
@y
2. コンテナー内部にて `dig` コマンドを実行することにします。
   これは便利な DNS ツールです。
   ホスト名 `mysql` に対する IP アドレスを探し出してみます。
@z

% snip command...

@x
   You should get output like the following.
@y
   そうすると以下のような出力となります。
@z

% snip output...

@x
   In the "ANSWER SECTION", you will see an `A` record for `mysql` that resolves to `172.23.0.2`
   (your IP address will most likely have a different value). While `mysql` isn't normally a valid hostname,
   Docker was able to resolve it to the IP address of the container that had that network alias. Remember, you used the
   `--network-alias` earlier.
@y
   「ANSWER SECTION」において `mysql` における `A` という 1 つのレコードが `172.23.0.2` を持っているのがわかります（この IP アドレスはお手元では、まず間違いなく別の値になっているはずです）。
    `mysql` というのは、普通は適正なホスト名ではないので、Docker はこの名前から IP アドレスを解決しています。
    この IP アドレスはこのコンテナーのものであって、ネットワークエイリアスを持っていたからです。
    前の手順において `--network-alias` フラグを用いたことを思い出してください。
@z

@x
   What this means is that your app only simply needs to connect to a host named `mysql` and it'll talk to the
   database.
@y
   これがどういうことかと言えば、アプリとしては単にホスト名 `mysql` に接続できて、データベースとやりとりができさえすればよいということです。
@z

@x
## Run your app with MySQL
@y
## MySQL を使ったアプリ実行 {#run-your-app-with-mysql}
@z

@x
The todo app supports the setting of a few environment variables to specify MySQL connection settings. They are:
@y
todo アプリは環境変数をいくつか設定することによって MySQL への接続をサポートしています。
それは以下のようなものです。
@z

@x
- `MYSQL_HOST` - the hostname for the running MySQL server
- `MYSQL_USER` - the username to use for the connection
- `MYSQL_PASSWORD` - the password to use for the connection
- `MYSQL_DB` - the database to use once connected
@y
- `MYSQL_HOST` - 実行している MySQL サーバーのホスト名。
- `MYSQL_USER` - 接続に利用するユーザー名。
- `MYSQL_PASSWORD` - 接続に利用するパスワード。
- `MYSQL_DB` - 接続後の利用データベース。
@z

@x
> [!NOTE]
>
> While using env vars to set connection settings is generally accepted for development, it's highly discouraged
> when running applications in production. Diogo Monica, a former lead of security at Docker,
> [wrote a fantastic blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/)
> explaining why.
>
> A more secure mechanism is to use the secret support provided by your container orchestration framework. In most cases,
> these secrets are mounted as files in the running container. You'll see many apps (including the MySQL image and the todo app)
> also support env vars with a `_FILE` suffix to point to a file containing the variable.
>
> As an example, setting the `MYSQL_PASSWORD_FILE` var will cause the app to use the contents of the referenced file
> as the connection password. Docker doesn't do anything to support these env vars. Your app will need to know to look for
> the variable and get the file contents.
@y
> [!NOTE]
>
> While using env vars to set connection settings is generally accepted for development, it's highly discouraged
> when running applications in production. Diogo Monica, a former lead of security at Docker,
> [wrote a fantastic blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/)
> explaining why.
>
> A more secure mechanism is to use the secret support provided by your container orchestration framework. In most cases,
> these secrets are mounted as files in the running container. You'll see many apps (including the MySQL image and the todo app)
> also support env vars with a `_FILE` suffix to point to a file containing the variable.
>
> As an example, setting the `MYSQL_PASSWORD_FILE` var will cause the app to use the contents of the referenced file
> as the connection password. Docker doesn't do anything to support these env vars. Your app will need to know to look for
> the variable and get the file contents.
@z

@x
You can now start your dev-ready container.
@y
You can now start your dev-ready container.
@z

@x
1. Specify each of the previous environment variables, as well as connect the container to your app network. Make sure that you are in the `getting-started-app` directory when you run this command.
@y
1. Specify each of the previous environment variables, as well as connect the container to your app network. Make sure that you are in the `getting-started-app` directory when you run this command.
@z

@x
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="PowerShell" >}}
   In Windows, run this command in PowerShell.
@y
   {{< /tab >}}
   {{< tab name="PowerShell" >}}
   In Windows, run this command in PowerShell.
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Command Prompt" >}}
   In Windows, run this command in Command Prompt.
@y
   {{< /tab >}}
   {{< tab name="Command Prompt" >}}
   In Windows, run this command in Command Prompt.
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Git Bash" >}}
@y
   {{< /tab >}}
   {{< tab name="Git Bash" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. If you look at the logs for the container (`docker logs -f <container-id>`), you should see a message similar to the following, which indicates it's
   using the mysql database.
@y
2. If you look at the logs for the container (`docker logs -f <container-id>`), you should see a message similar to the following, which indicates it's
   using the mysql database.
@z

% snip command...

@x
3. Open the app in your browser and add a few items to your todo list.
@y
3. Open the app in your browser and add a few items to your todo list.
@z

@x
4. Connect to the mysql database and prove that the items are being written to the database. Remember, the password
   is `secret`.
@y
4. Connect to the mysql database and prove that the items are being written to the database. Remember, the password
   is `secret`.
@z

% snip command...

@x
   And in the mysql shell, run the following:
@y
   And in the mysql shell, run the following:
@z

% snip command...

@x
   Your table will look different because it has your items. But, you should see them stored there.
@y
   Your table will look different because it has your items. But, you should see them stored there.
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
At this point, you have an application that now stores its data in an external database running in a separate
container. You learned a little bit about container networking and service discovery using DNS.
@y
At this point, you have an application that now stores its data in an external database running in a separate
container. You learned a little bit about container networking and service discovery using DNS.
@z

@x
Related information:
 - [docker CLI reference](/reference/cli/docker/)
 - [Networking overview](/engine/network/_index.md)
@y
関連情報
 - [docker CLI リファレンス](__SUBDIR__/reference/cli/docker/)
 - [Networking 概要](engine/network/_index.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
There's a good chance you are starting to feel a little overwhelmed with everything you need to do to start up
this application. You have to create a network, start containers, specify all of the environment variables, expose
ports, and more. That's a lot to remember and it's certainly making things harder to pass along to someone else.
@y
There's a good chance you are starting to feel a little overwhelmed with everything you need to do to start up
this application. You have to create a network, start containers, specify all of the environment variables, expose
ports, and more. That's a lot to remember and it's certainly making things harder to pass along to someone else.
@z

@x
In the next section, you'll learn about Docker Compose. With Docker Compose, you can share your application stacks in a
much easier way and let others spin them up with a single, simple command.
@y
In the next section, you'll learn about Docker Compose. With Docker Compose, you can share your application stacks in a
much easier way and let others spin them up with a single, simple command.
@z

@x
{{< button text="Use Docker Compose" url="08_using_compose.md" >}}
@y
{{< button text="Docker Compose の利用" url="08_using_compose.md" >}}
@z
