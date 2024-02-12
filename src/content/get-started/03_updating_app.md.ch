%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
title: Update the application
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making changes to your application
---
@y
---
title: アプリケーションの更新
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: アプリケーションに変更を加えます。
---
@z

@x
In [part 2](./02_our_app.md), you containerized a todo application. In this part, you'll update the application and image. You'll also learn how to stop and remove a container.
@y
[2 部](./02_our_app.md) においては todo アプリケーションのコンテナー化を行いました。
この部ではアプリケーションとイメージの更新を行っていきます。
またコンテナーの停止や削除の方法についても学びます。
@z

@x
## Update the source code
@y
## ソースコードの更新 {#updat-the-source-code}
@z

@x
In the following steps, you'll change the "empty text" when you don't have any todo list items to "You have no todo items yet! Add one above!"
@y
以下の手順では、todo リストアイテムを何も登録していない場合に「空っぽですよ」を示すテキストを、"You have no todo items yet! Add one above!" ("まだ todo アイテムがありません！ ここから追加してください！") に変更します。
@z

@x
1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.
@y
1. `src/static/js/app.js`ファイルにおいて、空っぽであることを示すテキストが 56 行めにあり、これを変更します。
@z

@x
   ```diff
   - <p className="text-center">No items yet! Add one above!</p>
   + <p className="text-center">You have no todo items yet! Add one above!</p>
   ```
@y
   ```diff
   - <p className="text-center">No items yet! Add one above!</p>
   + <p className="text-center">You have no todo items yet! Add one above!</p>
   ```
@z

@x
2. Build your updated version of the image, using the `docker build` command.
@y
2. 更新バージョンに基づいてイメージをビルドします。
   実行するコマンドは `docker build` です。
@z

@x
   ```console
   $ docker build -t getting-started .
   ```
@y
   ```console
   $ docker build -t getting-started .
   ```
@z

@x
3. Start a new container using the updated code.
@y
3. 更新したソースコードを利用した新たなコンテナーを起動します。
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@z

@x
You probably saw an error like this:
@y
おそらく以下のようなエラーが表示されます。
@z

@x
```console
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 127.0.0.1:3000 failed: port is already allocated.
```
@y
```console
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 127.0.0.1:3000 failed: port is already allocated.
```
@z

@x
The error occurred because you aren't able to start the new container while your old container is still running. The reason is that the old container is already using the host's port 3000 and only one process on the machine (containers included) can listen to a specific port. To fix this, you need to remove the old container.
@y
エラーが発生した理由は、それまでにコンテナーが実行しており、新たなコンテナーを起動できないためです。
それまでの古いコンテナーがすでにホストのポート 3000 を利用しています。
そもそもマシン上において (コンテナーも含み)、特定のポートを利用できるのはただ一つのプロセスしか許容されないためです。
これを解決するには、古いコンテナーを削除することが必要です。
@z

@x
## Remove the old container
@y
## 古いコンテナーの削除 {#remove-the-old-container}
@z

@x
To remove a container, you first need to stop it. Once it has stopped, you can remove it. You can remove the old container using the CLI or Docker Desktop's graphical interface. Choose the option that you're most comfortable with.
@y
コンテナーを削除するには、まずコンテナーを停止させなければなりません。
停止していれば削除することができます。
古いコンテナーを削除する方法としては、CLI を使う方法と Docker Desktop のグラフィカルインターフェースを使う方法があります。
どちらでもやりやすい方法をとってください。
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
### Remove a container using the CLI
@y
### CLI を用いたコンテナーの削除 {#remove-a-container-using-the-cli}
@z

@x
1. Get the ID of the container by using the `docker ps` command.
@y
1. `docker ps` コマンドを実行してコンテナーの ID を確認します。
@z

@x
   ```console
   $ docker ps
   ```
@y
   ```console
   $ docker ps
   ```
@z

@x
2. Use the `docker stop` command to stop the container. Replace `<the-container-id>` with the ID from `docker ps`.
@y
2. `docker stop` コマンドを実行してコンテナーを停止します。
   `<the-container-id>` の部分は `docker ps` によって得られた ID に置き換えてください。
@z

@x
   ```console
   $ docker stop <the-container-id>
   ```
@y
   ```console
   $ docker stop <the-container-id>
   ```
@z

@x
3. Once the container has stopped, you can remove it by using the `docker rm` command.
@y
3. コンテナーを停止したら `docker rm` コマンドを実行してコンテナーを削除します。
@z

@x
   ```console
   $ docker rm <the-container-id>
   ```
@y
   ```console
   $ docker rm <the-container-id>
   ```
@z

@x
>**Note**
>
>You can stop and remove a container in a single command by adding the `force` flag to the `docker rm` command. For example: `docker rm -f <the-container-id>`
@y
>**メモ**
>
>コンテナーの停止と削除を 1 つのコマンドで実行することができます。
>これは `docker rm` コマンドに `force` フラグをつけます。
>たとえば `docker rm -f <the-container-id>` とします。
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
### Remove a container using Docker Desktop
@y
### Docker Desktop を用いたコンテナーの削除 {#remove-a-container-using-docker-desktop}
@z

@x
1. Open Docker Desktop to the **Containers** view.
2. Select the trash can icon under the **Actions** column for the container that you want to delete.
3. In the confirmation dialog, select **Delete forever**.
@y
1. Docker Desktop を開いて **Containers** (コンテナー) 画面を表示します。
2. 削除したい対象コンテナーに対する **Actions** カラムの下にある、ごみ箱アイコンをクリックします。
3. 確認ダイアログが表示されるので、**Delete forever** (完全に削除) をクリックします。
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Start the updated app container
@y
### 更新したアプリコンテナーの起動 {#start-the-updated-app-container}
@z

@x
1. Now, start your updated app using the `docker run` command.
@y
1. そこで更新したアプリを起動します。
   コマンドは `docker run` です。
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@z

@x
2. Refresh your browser on [http://localhost:3000](http://localhost:3000) and you should see your updated help text.
@y
2. ブラウザー上で [http://localhost:3000](http://localhost:3000) にアクセスしている画面を更新します。
   更新したヘルプテキストが表示されたはずです。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to update and rebuild a container, as well as how to stop and remove a container.
@y
本節では、コンテナーの更新と再ビルドの方法を学びました。
またコンテナーの停止と削除の方法も学びました。
@z

@x
Related information:
 - [docker CLI reference](/engine/reference/commandline/cli/)
@y
関連情報
 - [Docker CLI リファレンス](__SUBDIR__/engine/reference/commandline/cli/)
@z

@x
## Next steps
@y
## 次のステップ {#next-step}
@z

@x
Next, you'll learn how to share images with others.
@y
次では他の方々とイメージを共有する方法について学びます。
@z

@x
{{< button text="Share the application" url="04_sharing_app.md" >}}
@y
{{< button text="アプリケーションの共有" url="04_sharing_app.md" >}}
@z
