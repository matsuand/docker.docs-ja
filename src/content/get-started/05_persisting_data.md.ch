%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Persist the DB
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making your DB persistent in your application
@y
title: DB への保存
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making your DB persistent in your application
@z

@x
In case you didn't notice, your todo list is empty every single time
you launch the container. Why is this? In this part, you'll dive into how the container is working.
@y
気づかないままでいると todo リストの中身は、コンテナーを起動するたびに空っぽになってしまいます。
なぜそうなっているのでしょう？
この部では、コンテナーがどうやって動作しているのかについて学んでいきます。
@z

@x
## The container's filesystem
@y
## コンテナーのファイルシステム {#the-containers-filesystem}
@z

@x
When a container runs, it uses the various layers from an image for its filesystem.
Each container also gets its own "scratch space" to create/update/remove files. Any
changes won't be seen in another container, even if they're using the same image.
@y
コンテナーが起動すると、イメージ内のさまざまなレイヤーがファイルシステムに利用されます。
また各コンテナーには、ファイルの生成/更新/削除を行うための「スクラッチスペース」（scratch space、一時的な領域）をもっています。
1 つのイメージを共通に利用しているからといって、1 つのコンテナー上の変更が他のコンテナーに及ぶわけではありません。
@z

@x
### See this in practice
@y
### 実際を確認 {#see-this-in-practice}
@z

@x
To see this in action, you're going to start two containers. In one container, you'll create a file. In the other container, you'll verify the file exists.
What you'll see is that the file created in one container isn't available in another.
@y
実際の動作を見てみるために 2 つのコンテナーを起動させます。
1 つのコンテナーではファイル生成を行います。
もう 1 つのコンテナーでは、ファイルの存在を確認します。
そこでわかってくるのは、1 つのコンテナーで生成したファイルは、もう 1 つのコンテナーで利用することはできないということです。
@z

@x
1. Start an Alpine container and access its shell.
@y
1. Alpine コンテナーを起動させて、そのシェルにアクセスします。
@z

% snip command...

@x
2. In the container, create a `greeting.txt` file with `hello` inside.
@y
2. コンテナー内に `greeting.txt` というファイルを生成して、その中に `hello` と書き込みます。
@z

% snip command...

@x
3. Exit the container.
@y
3. コンテナーから抜け出ます。
@z

% snip command...

@x
4. Run a new Alpine container and use the `cat` command to verify that the
   file does not exist.
@y
4. 新たな Alpine コンテナーを起動して `cat` コマンドを実行し、先のファイルは存在していないことを確認します。
@z

% snip command...

@x
   You should see output similar to the following that indicates the file does not exist in the new container.
@y
   以下のようなメッセージが表示されるはずです。
   これは、新たなコンテナー内にはそのファイルが含まれていないことを示しています。
@z

% snip output...

@x
5. Go ahead and remove the containers using `docker ps --all` to get the IDs,
   and then `docker rm -f <container-id>` to remove the containers.
@y
5. `docker ps --all` を実行して ID の一覧を取得します。
   そして `docker rm -f <container-id>` の実行によってコンテナーを削除します。
@z

@x
## Container volumes
@y
## コンテナーボリューム {#container-volumes}
@z

@x
With the previous experiment, you saw that each container starts from the image definition each time it starts. 
While containers can create, update, and delete files, those changes are lost when you remove the container 
and Docker isolates all changes to that container. With volumes, you can change all of this.
@y
上で行った実験では、起動元となるイメージ定義に基づいて、各コンテナーがその都度起動する様子を見ました。
コンテナーではファイルの生成、更新、削除を行うことができますが、コンテナーを削除すると、そういった変更はすべて失われ、コンテナーから切り離されます。
そこでボリュームを利用すると、この状況を変えることができます。
@z

@x
[Volumes](../storage/volumes.md) provide the ability to connect specific filesystem paths of 
the container back to the host machine. If you mount a directory in the container, changes in that
directory are also seen on the host machine. If you mount that same directory across container restarts, you'd see
the same files.
@y
[ボリューム](../storage/volumes.md) とは、コンテナー内に特別なファイルシステムがホストシステムに向けて生成され、そこにアクセスする機能を提供するものです。
コンテナー内のあるディレクトリがマウントされていると、そのディレクトリ内で行われた変更がホストマシンからも見ることができます。
仮にコンテナーの再起動の前後で 1 つのディレクトリをマウントしておけば、同一のファイルを維持できることになります。
@z

@x
There are two main types of volumes. You'll eventually use both, but you'll start with volume mounts.
@y
ボリュームには大きく 2 つの種類があります。
最終的にはその両方を利用しますが、まずはボリュームマウントから始めます。
@z

@x
## Persist the todo data
@y
## todo データの保存 {#persist-the-todo-data}
@z

@x
By default, the todo app stores its data in a SQLite database at
`/etc/todos/todo.db` in the container's filesystem. If you're not familiar with SQLite, no worries! It's simply a relational database that stores all the data in a single file. While this isn't the best for large-scale applications,
it works for small demos. You'll learn how to switch this to a different database engine later.
@y
Todo アプリはデフォルトで、各種データをコンテナーのファイルシステムの `/etc/todos/todo.db` にある SQLite データベースに保存します。
SQLite がよくわからなくても心配無用です。
これは単純なリレーショナルデータベースであって、すべてのデータを 1 つのファイルに保存するものです。
大規模アプリケーションに対して利用するのは適切ではありませんが、ちょっとしたデモであれば十分に動作します。
この後には別のデータベースエンジンについて学んでいきます。
@z

@x
With the database being a single file, if you can persist that file on the host and make it available to the
next container, it should be able to pick up where the last one left off. By creating a volume and attaching
(often called "mounting") it to the directory where you stored the data, you can persist the data. As your container 
writes to the `todo.db` file, it will persist the data to the host in the volume.
@y
データベースが 1 つのファイルに収められているので、ホスト上のファイルとして保存しておけば、新たなコンテナーからも利用できます。
したがって最後に更新されたものを、その次にも使い続けられます。
ボリュームを生成して、データを保存するディレクトリに割り当てます（通常これを「マウンティングする」と言い表します）。
こうすればデータを失うことなく保存できます。
今の場合、コンテナーから `todo.db` ファイルへの書き込みを行っているので、ボリュームを通じてホスト上にデータが保持されることになります。
@z

@x
As mentioned, you're going to use a volume mount. Think of a volume mount as an opaque bucket of data. 
Docker fully manages the volume, including the storage location on disk. You only need to remember the
name of the volume.
@y
先ほど言ったように、これから扱うのはボリュームマウントです。
ボリュームマウントとは、単純にデータが入った 1 つのバケツだと思ってください。
Docker は、ボリュームによって確保される保存領域を含め、このボリュームを完全に管理します。
ボリュームという名前を覚えるだけで十分です。
@z

@x
### Create a volume and start the container
@y
### ボリューム生成とコンテナー起動 {#create-a-volume-and-start-the-container}
@z

@x
You can create the volume and start the container using the CLI or Docker Desktop's graphical interface.
@y
ボリュームを生成してコンテナーを起動するのは、CLI あるいは Docker Desktop のグラフィック画面のいずれからでも行うことができます。
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
1. Create a volume by using the `docker volume create` command.
@y
1. `docker volume create` コマンドを使ってボリュームを生成します。
@z

% snip command...

@x
2. Stop and remove the todo app container once again with `docker rm -f <id>`,
   as it is still running without using the persistent volume.
@y
2. `docker rm -f <id>` を実行して todo アプリのコンテナーを再び停止させて削除します。
   実行中のコンテナーは、まだ永続的なボリュームを利用していないからです。
@z

@x
3. Start the todo app container, but add the `--mount` option to specify a
   volume mount. Give the volume a name, and mount it to `/etc/todos` in the
   container, which captures all files created at the path.
@y
3. todo アプリコンテナーを起動します。
   今回は `--mount` オプションをつけてボリュームマウントを指定します。
   そこではボリューム名を指定し、コンテナー内の `/etc/todos` へのマウントを行います。
   このパス内に生成されるファイルをすべて把握することができます。
@z

% snip command...

@x
   > **Note**
   >
   > If you're using Git Bash, you must use different syntax for this command.
@y
   > **メモ**
   >
   > Git Bash を利用している場合は、このコマンドにおいて異なる文法を用いる必要があります。
   >
@z

% snip command...

@x
   > For more details about Git Bash's syntax differences, see
   > [Working with Git Bash](../desktop/troubleshoot/topics/#working-with-git-bash).
@y
   > Git Bash の文法の相違に関しては [Git Bash を使った操作](../desktop/troubleshoot/topics/#working-with-git-bash) を参照してください。
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
To create a volume:
@y
ボリューム生成のために以下を行います。
@z

@x
1. Select **Volumes** in Docker Desktop.
2. In **Volumes**, select **Create**.
3. Specify `todo-db` as the volume name, and then select **Create**.
@y
1. Docker Desktop において **Volumes** (ボリューム) を開きます。
2. **Volumes** (ボリューム) において **Create** (生成) をクリックします。
3. ボリューム名として `todo-db` を入力し **Create** (生成) をクリックします。
@z

@x
To stop and remove the app container:
@y
アプリコンテナーの停止と削除は以下を行います。
@z

@x
1. Select **Containers** in Docker Desktop.
2. Select **Delete** in the **Actions** column for the container.
@y
1. Docker Desktop において **Containers** (コンテナー) を開きます。
2. 対象コンテナーの **Actions** (動作) カラムにおいて **Delete** (削除) を選択します。
@z

@x
To start the todo app container with the volume mounted:
@y
ボリュームマウントを行った todo アプリコンテナーの起動は以下を行います。
@z

@x
1. Select the search box at the top of Docker Desktop.
2. In the search window, select the **Images** tab.
3. In the search box, specify the container name, `getting-started`.
@y
1. Docker Desktop の最上段の検索欄を選択します。
2. 検索画面にて **Images** タブを選択します。
3. 検索欄においてコンテナー名として `getting-started` を入力します。
@z

@x
   > **Tip**
   >
   >  Use the search filter to filter images and only show **Local images**.
   { .tip }
@y
   > **ヒント**
   >
   >  検索フィルターを用いてイメージの絞り込みを行えば **ローカルイメージ** のみを表示することができます。
   { .tip }
@z

@x
4. Select your image and then select **Run**.
5. Select **Optional settings**.
6. In **Host port**, specify the port, for example, `3000`.
7. In **Host path**, specify the name of the volume, `todo-db`.
8. In **Container path**, specify `/etc/todos`.
9. Select **Run**.
@y
4. イメージを選択して **Run** (実行) をクリックします。
5. **Optional settings** (オプション設定) をクリックします。
6. **Host port** (ホストポート) に、たとえば `3000` といったポートを入力します。
7. **Host path** (ホストパス) にボリューム名 `todo-db` を入力します。
8. **Container path** (コンテナーパス) に `/etc/todos` を入力します。
9. **Run** (実行) をクリックします。
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Verify that the data persists
@y
### データの保存確認 {#verify-that-the-data-persists}
@z

@x
1. Once the container starts up, open the app and add a few items to your todo list.
@y
1. コンテナーが起動したら、アプリケーションを開いて todo リストにアイテムをいくつか追加します。
@z

@x
    ![Items added to todo list](images/items-added.webp)
@y
    ![todo リストに追加したアイテム](images/items-added.webp)
@z

@x
2. Stop and remove the container for the todo app. Use Docker Desktop or `docker ps` to get the ID and then `docker rm -f <id>` to remove it.
@y
2. todo アプリのコンテナーを停止して削除します。
   これを行うには Docker Desktop を利用します。
   または `docker ps` を実行して ID を確認した上で `docker rm -f <id>` により削除します。
@z

@x
3. Start a new container using the previous steps.
@y
3. 以前行った手順を使って新たなコンテナーを起動します。
@z

@x
4. Open the app. You should see your items still in your list.
@y
4. アプリを開きます。
   追加したアイテムがリストの中にあるはずです。
@z

@x
5. Go ahead and remove the container when you're done checking out your list.
@y
5. リストの確認を終えたら、コンテナーを削除して先に進みます。
@z

@x
You've now learned how to persist data.
@y
ここまでにデータの保存方法について学びました。
@z

@x
## Dive into the volume
@y
## ボリュームの中身 {#dive-into-the-volume}
@z

@x
A lot of people frequently ask "Where is Docker storing my data when I use a volume?" If you want to know, 
you can use the `docker volume inspect` command.
@y
多くの人からよく尋ねられます。
「ボリューム利用時に Docker はデータをどこに保存するのか？」
この答えを知りたければ `docker volume inspect` コマンドを実行してみてください。
@z

% snip command...

@x
The `Mountpoint` is the actual location of the data on the disk. Note that on most machines, you will
need to have root access to access this directory from the host.
@y
`Mountpoint` というのが、ディスク上にデータが保存される実際の場所です。
ほとんどのマシンにおいて、ホスト上からそのディレクトリにアクセスするには、root アクセス権限を必要とします。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to persist container data.
@y
本節ではコンテナーデータの保存方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
 - [docker CLI reference](/reference/cli/docker/)
 - [Volumes](../storage/volumes.md)
@y
 - [docker CLI リファレンス](__SUBDIR__/reference/cli/docker/)
 - [ボリューム](../storage/volumes.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Next, you'll learn how you can develop your app more efficiently using bind mounts.
@y
次は、より効果的にアプリ開発を行うためにバインドマウントの利用方法について学びます。
@z

@x
{{< button text="Use bind mounts" url="06_bind_mounts.md" >}}
@y
{{< button text="バインドマウントの利用" url="06_bind_mounts.md" >}}
@z
