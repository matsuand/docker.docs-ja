%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Use Docker Compose
@y
title: Docker Compose の利用
@z

@x
linkTitle: "Part 7: Use Docker Compose"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using Docker Compose for multi-container applications
@y
linkTitle: "7 部: Docker Compose の利用"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using Docker Compose for multi-container applications
@z

@x
[Docker Compose](/manuals/compose/_index.md) is a tool that helps you define and
share multi-container applications. With Compose, you can create a YAML file to define the services
and with a single command, you can spin everything up or tear it all down.
@y
[Docker Compose](manuals/compose/_index.md) とは、マルチコンテナーアプリケーションを定義し共有するためのツールです。
Compose においては YAML ファイルを生成してサービスを定義します。
そしてたった一つのコマンドを通じて、すべてを立ち上げたり終了させたりできるようになります。
@z

@x
The big advantage of using Compose is you can define your application stack in a file, keep it at the root of
your project repository (it's now version controlled), and easily enable someone else to contribute to your project.
Someone would only need to clone your repository and start the app using Compose. In fact, you might see quite a few projects
on GitHub/GitLab doing exactly this now.
@y
Compose を利用する大きな利点は、アプリケーションのもろもろをただ一つのファイルに定義できることです。
このファイルはプロジェクトリポジトリのルートにおきます (バージョン管理されているものとします)。
そうしておけば、別の開発者がプロジェクトに簡単に参加できるようになります。
その開発者はリポジトリをクローンして Compose を使ったアプリ起動ができさえすれば良いわけです。
GitHub/GitLab 上を覗いてみれば、これを実現しているプロジェクトをいくらでも見ることができるでしょう。
@z

@x
## Create the Compose file
@y
## Compose ファイルの生成 {#create-the-compose-file}
@z

@x
In the `getting-started-app` directory, create a file named `compose.yaml`.
@y
`getting-started-app` ディレクトリに `compose.yaml` というファイルを生成します。
@z

% snip text...

@x
## Define the app service
@y
## アプリケーションサービスの定義 {#define-the-app-service}
@z

@x
In [part 6](./07_multi_container.md), you used the following command to start the application service.
@y
[6 部](./07_multi_container.md) において、アプリケーションサービスの起動には以下のコマンドを利用しました。
@z

% snip command...

@x
You'll now define this service in the `compose.yaml` file.
@y
このサービスを今度は `compose.yaml` ファイルに定義します。
@z

@x
1. Open `compose.yaml` in a text or code editor, and start by defining the name and image of the first service (or container) you want to run as part of your application.
   The name will automatically become a network alias, which will be useful when defining your MySQL service.
@y
1. テキストエディターまたはコードエディターを使って `compose.yaml` ファイルを開きます。
   まずサービス名から書き始め、アプリケーションの一部として構成したい第一のサービス (あるいはコンテナー) のイメージを定めます。
   サービス名は自動的にネットワークのエイリアス名となります。
   このエイリアスは後に MySQL サービスを定義する際に用います。
@z

% snip code...

@x
2. Typically, you will see `command` close to the `image` definition, although there is no requirement on ordering. Add the `command` to your `compose.yaml` file.
@y
2. 普通 `image` 定義の近くに `command` を見かけることがあります。
   その順序は特に制約はありません。
   そこで `compose.yaml` ファイルに `command` を記述します。
@z

% snip code...

@x
3. Now migrate the `-p 127.0.0.1:3000:3000` part of the command by defining the `ports` for the service.
@y
3. コマンドラインにおいて `-p 127.0.0.1:3000:3000` と書いてきた部分を、サービスの `ports` として定義します。
@z

% snip code...

@x
4. Next, migrate both the working directory (`-w /app`) and the volume mapping
   (`-v ".:/app"`) by using the `working_dir` and `volumes` definitions.
@y
4. またワーキングディレクトリ (`-w /app`)、ボリュームマッピング (`-v ".:/app"`) として定めていたものを、それぞれ `working_dir`、`volumes` を使って定義します。
@z

@x
    One advantage of Docker Compose volume definitions is you can use relative paths from the current directory.
@y
    Docker Compose のボリューム定義における利点として、パス指定にはカレントディレクトリからの相対パスを用いることができます。
@z

% snip code...

@x
5. Finally, you need to migrate the environment variable definitions using the `environment` key.
@y
5. 最後は環境変数です。
   環境変数の定義は `environment` キーを使って置き換えます。
@z

% snip code...

@x
### Define the MySQL service
@y
### MySQL サービスの定義 {#define-the-mysql-service}
@z

@x
Now, it's time to define the MySQL service. The command that you used for that container was the following:
@y
では MySQL サービスを定義することにします。
コンテナー起動の際に実行していたコマンドは、以下のようなものでした。
@z

% snip command...

@x
1. First define the new service and name it `mysql` so it automatically gets the network alias. Also specify the image to use as well.
@y
1. 最初に新たなサービス名を定めます。
   名前を `mysql` とします。
   これによってネットワークエイリアスが自動的に定義されます。
   利用するイメージをここでも指定します。
@z

@x within code
       # The app service definition
@y
       # アプリケーションサービスの定義
@z

@x
2. Next, define the volume mapping. When you ran the container with `docker
   run`, Docker created the named volume automatically. However, that doesn't
   happen when running with Compose. You need to define the volume in the
   top-level `volumes:` section and then specify the mountpoint in the service
   config. By simply providing only the volume name, the default options are
   used.
@y
2. 次にボリュームマッピングを定義します。
   `docker run` を使ってコンテナーを実行した時は、Docker が名前つきボリュームを自動で生成していました。
   しかし Compose を使った場合には自動で生成されません。
   トップレベルの `volumes:` セクションにおいてボリュームを定義し、サービス設定においてマウントポイントを指定なければなりません。
   ボリューム名を指定するだけで、各種オプションはデフォルト値が用いられます。
@z

@x within code
       # The app service definition
@y
       # アプリケーションサービスの定義
@z

@x
3. Finally, you need to specify the environment variables.
@y
3. 最後に環境変数を設定します。
@z


@x within code
       # The app service definition
@y
       # アプリケーションサービスの定義
@z

@x
At this point, your complete `compose.yaml` should look like this:
@y
ここまでをまとめると、`compose.yaml` は全体として以下のようになります。
@z

% snip code...

@x
## Run the application stack
@y
## アプリケーションの起動 {#run-the-application-stack}
@z

@x
Now that you have your `compose.yaml` file, you can start your application.
@y
`compose.yaml` ファイルが用意できたので、アプリケーションを起動します。
@z

@x
1. Make sure no other copies of the containers are running first. Use `docker ps` to list the containers and `docker rm -f <ids>` to remove them.
@y
1. まずは同じコンテナーが動作していないことを確認します。
   `docker ps` を使ってコンテナー一覧を確認し `docker rm -f <ids>` によってこれらを削除します。
@z

@x
2. Start up the application stack using the `docker compose up` command. Add the
   `-d` flag to run everything in the background.
@y
2. `docker compose up` コマンドを使ってアプリケーションを起動します。
   -d` フラグをつけることで、バックグラウンド起動とします。
@z

% snip command...

@x
    When you run the previous command, you should see output like the following:
@y
    上のコマンドを実行すると、出力結果は以下のようになります。
@z

% snip output...

@x
    You'll notice that Docker Compose created the volume as well as a network. By default, Docker Compose automatically creates a network specifically for the application stack (which is why you didn't define one in the Compose file).
@y
    Docker Compose がボリュームとネットワークを生成したことがわかります。
    デフォルトで Docker Compose はアプリケーションに固有のネットワークを自動生成します (だからこそ Compose ファイルにおいて定義しなかったわけです)。
@z

@x
3. Look at the logs using the `docker compose logs -f` command. You'll see the logs from each of the services interleaved
    into a single stream. This is incredibly useful when you want to watch for timing-related issues. The `-f` flag follows the
    log, so will give you live output as it's generated.
@y
3. `docker compose logs -f` コマンドを使ってログを見てみます。
    各サービスのログは一つにまとめて確認することができます。
    そのように確認できるため、時間に関わる問題を見ていきたいような場合には、非常に有用なものとなります。
    `-f` フラグが指定されているので、ログ生成のたびに順に出力が行われます。
@z

@x
    If you have run the command already, you'll see output that looks like this:
@y
    コマンドを実行すると、以下のような出力が行われます。
@z

% snip output...

@x
    The service name is displayed at the beginning of the line (often colored) to help distinguish messages. If you want to
    view the logs for a specific service, you can add the service name to the end of the logs command (for example,
    `docker compose logs -f app`).
@y
    メッセージを区別できるように、各行の先頭にはサービス名が (場合によっては色つきで) 表示されます。
    特定サービスのログを確認したい場合は、logs コマンドの最後にサービス名を指定します (たとえば `docker compose logs -f app` とします)。
@z

@x
4. At this point, you should be able to open your app in your browser on [http://localhost:3000](http://localhost:3000) and see it running.
@y
4. ここまで行ったらブラウザーにおいて [http://localhost:3000](http://localhost:3000) にアクセスしてアプリを開きます。
   アプリが動作していることが確認できるはずです。
@z

@x
## See the app stack in Docker Desktop Dashboard
@y
## Docker Desktop Dashboard からのアプリ確認 {#see-the-app-stack-in-docker-desktop-dashboard}
@z

@x
If you look at the Docker Desktop Dashboard, you'll see that there is a group named **getting-started-app**. This is the project name from Docker
Compose and used to group the containers together. By default, the project name is simply the name of the directory that the
`compose.yaml` was located in.
@y
Docker Desktop Dashboard を見てみると、グループ名として **getting-started-app** というものが表示されています。
これは Docker Compose におけるプロジェクト名であり、コンテナーを取りまとめる名前です。
デフォルトでプロジェクト名は、`compose.yaml` が置かれているディレクトリの名前になります。
@z

@x
If you expand the stack, you'll see the two containers you defined in the Compose file. The names are also a little
more descriptive, as they follow the pattern of `<service-name>-<replica-number>`. So, it's very easy to
quickly see what container is your app and which container is the mysql database.
@y
アプリケーションの表示を展開すると、Compose ファイル内に定義した 2 つのサービスが表示されます。
その名前は、多少は内容を表している命名になっています。
たいていは `<サービス名>-<レプリカ番号>` という形式に従います。
そこでどのコンテナーがアプリケーションであって、どのコンテナーが mysql データベースであるかはすぐに識別できます。
@z

@x
## Tear it all down
@y
## アプリケーションの停止 {#tear-it-all-down}
@z

@x
When you're ready to tear it all down, simply run `docker compose down` or hit the trash can on the Docker Desktop Dashboard
for the entire app. The containers will stop and the network will be removed.
@y
アプリケーションを終了してよければ、`docker compose down` を実行するか、Docker Desktop Dashboard 上のアプリ項目欄にあるゴミ箱アイコンをクリックします。
コンテナーがすべて停止し、ネットワークは削除されます。
@z

@x
> [!WARNING]
>
> By default, named volumes in your compose file are not removed when you run `docker compose down`. If you want to
>remove the volumes, you need to add the `--volumes` flag.
>
> The Docker Desktop Dashboard does not remove volumes when you delete the app stack.
@y
> [!WARNING]
>
> `docker compose down` を実行しても、Compose ファイルに定義された名前つきボリュームはデフォルトでは削除されません。
> そのボリュームも削除したい場合は `--volumes` フラグをつける必要があります。
>
> Docker Desktop Dashboard にてアプリを削除しても、ボリュームは削除されません。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned about Docker Compose and how it helps you simplify
the way you define and share multi-service applications.
@y
この節では Docker Compose を用いることで、マルチサービスのアプリケーションを定義し共有する簡単な方法を学びました。
@z

@x
Related information:
 - [Compose overview](/manuals/compose/_index.md)
 - [Compose file reference](/reference/compose-file/_index.md)
 - [Compose CLI reference](/reference/cli/docker/compose/_index.md)
@y
関連情報
 - [Compose 概要](manuals/compose/_index.md)
 - [Compose ファイルリファレンス](reference/compose-file/_index.md)
 - [Compose CLI リファレンス](reference/cli/docker/compose/_index.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Next, you'll learn about a few best practices you can use to improve your Dockerfile.
@y
次は Dockerfile の改善を目指したベストプラクティスについて学びます。
@z

@x
{{< button text="Image-building best practices" url="09_image_best.md" >}}
@y
{{< button text="イメージビルドのベストプラクティス" url="09_image_best.md" >}}
@z
