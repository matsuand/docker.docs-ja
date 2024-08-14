%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Share the application
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop, docker hub, sharing
description: Sharing your image you built for your example application so you can
  run it else where and other developers can use it
@y
title: アプリケーションの共有
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop, docker hub, sharing
description: Sharing your image you built for your example application so you can
  run it else where and other developers can use it
@z

@x
Now that you've built an image, you can share it. To share Docker images, you have to use a Docker
registry. The default registry is Docker Hub and is where all of the images you've used have come from.
@y
ここまでにイメージをビルドしたので、それを共有していきます。
Docker イメージを共有するためには Docker レジストリを利用することになります。
デフォルトのリポジトリは Docker Hub です。
これはここまでに利用してきたイメージがすべて収容されている場所です。
@z

@x
> **Docker ID**
>
> A Docker ID lets you access Docker Hub, which is the world's largest library and community for container images. Create a [Docker ID](https://hub.docker.com/signup) for free if you don't have one.
@y
> **Docker ID**
>
> Docker ID は Docker Hub にアクセスするためのものです。
> Docker Hub は世界でも最大規模を誇るコンテナーイメージのライブラリおよびコミュニティです。
> 無料の [Docker ID](https://hub.docker.com/signup) をまだ取得していない場合は、作成しておいてください。
@z

@x
## Create a repository
@y
## リポジトリの生成 {#create-a-repository}
@z

@x
To push an image, you first need to create a repository on Docker Hub.
@y
イメージをプッシュするためには、あらかじめ Docker Hub 上にリポジトリを生成しておくことが必要です。
@z

@x
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or Sign in to [Docker Hub](https://hub.docker.com).
@y
1. [Docker Hub](https://hub.docker.com) に [サインアップ](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) またはサインインします。
@z

@x
2. Select the **Create Repository** button.
@y
2. **Create Repository** (リポジトリ生成) ボタンをクリックします。
@z

@x
3. For the repository name, use `getting-started`. Make sure the **Visibility** is **Public**.
@y
3. リポジトリ名は `getting-started` とします。
   **Visibility** は **Public** とします。
@z

@x
4. Select **Create**.
@y
4. **Create** (生成) をクリックします。
@z

@x
In the following image, you can see an example Docker command from Docker Hub. This command will push to this repository.
@y
以下の画像から、Docker Hub が示す Docker コマンドを見ることができます。
このコマンドはリポジトリへのプッシュを行うものです。
@z

@x
![Docker command with push example](images/push-command.webp)
@y
![プッシュを行う Docker コマンド例](images/push-command.webp)
@z

@x
## Push the image
@y
## イメージのプッシュ {#push-the-image}
@z

@x
1. In the command line, run the `docker push` command that you see on Docker
   Hub. Note that your command will have your Docker ID, not "docker". For example, `docker push YOUR-USER-NAME/getting-started`.
@y
1. コマンドライン上から Docker Hub で確認した `docker push` コマンドを実行します。
   ちなみに実行コマンド内ではご自身の Docker ID を用いてください。
   "docker" ではありません。
   たとえば `docker push YOUR-USER-NAME/getting-started` とします。
@z

@x
   ```console
   $ docker push docker/getting-started
   The push refers to repository [docker.io/docker/getting-started]
   An image does not exist locally with the tag: docker/getting-started
   ```
@y
   ```console
   $ docker push docker/getting-started
   The push refers to repository [docker.io/docker/getting-started]
   An image does not exist locally with the tag: docker/getting-started
   ```
@z

@x
    Why did it fail? The push command was looking for an image named `docker/getting-started`, but
    didn't find one. If you run `docker image ls`, you won't see one either.
@y
    エラーが出て失敗したのはなぜでしょう？
    プッシュを行うコマンドが `docker/getting-started` というイメージを探しましたが、それが見つからなかったためです。
    `docker image ls` を実行しても見当たらないはずです。
@z

@x
    To fix this, you need to tag your existing image you've built to give it another name.
@y
    これを解決するには、ビルド済みの既存イメージに対してタグづけを行って、別の名前を設定することが必要です。
@z

@x
2. Sign in to Docker Hub using the command `docker login -u YOUR-USER-NAME`.
@y
2. コマンド `docker login -u YOUR-USER-NAME` を実行して Docker Hub にサインインします。
@z

@x
3. Use the `docker tag` command to give the `getting-started` image a new name. Replace `YOUR-USER-NAME` with your Docker ID.
@y
3. `docker tag` コマンドを実行して `getting-started` イメージに対して新たな名前を設定します。
   `YOUR-USER-NAME` の部分は利用している Docker ID に置き換えてください。
@z

@x
   ```console
   $ docker tag getting-started YOUR-USER-NAME/getting-started
   ```
@y
   ```console
   $ docker tag getting-started YOUR-USER-NAME/getting-started
   ```
@z

@x
4. Now run the `docker push` command again. If you're copying the value from
   Docker Hub, you can drop the `tagname` part, as you didn't add a tag to the
   image name. If you don't specify a tag, Docker uses a tag called `latest`.
@y
4. そこでもう一度 `docker push` コマンドを実行します。
   Docker Hub の画面からコマンドのコピーを行っている場合、`tagname` の部分を取り除くこともできます。
   イメージ名にタグをつけていない場合にはそのようにします。
   イメージ名に対してタグ名をつけなかった場合、Docker は `latest` というタグ名を利用します。
@z

@x
   ```console
   $ docker push YOUR-USER-NAME/getting-started
   ```
@y
   ```console
   $ docker push YOUR-USER-NAME/getting-started
   ```
@z

@x
## Run the image on a new instance
@y
## 新たなインスタンス上でのイメージ実行 {#run-the-image-on-a-new-instance}
@z

@x
Now that your image has been built and pushed into a registry, try running your app on a brand
new instance that has never seen this container image. To do this, you will use Play with Docker.
@y
イメージをビルドしそれをレジストリにプッシュしました。
そこでこれまでとはまったく違うコンテナーイメージからビルドされた、新たなインスタンス上にアプリを実行してみます。
具体的には Play with Docker を利用します。
@z

@x
> **Note**
>
> Play with Docker uses the amd64 platform. If you are using an ARM based Mac with Apple silicon, you will need to rebuild the image to be compatible with Play with Docker and push the new image to your repository.
>
> To build an image for the amd64 platform, use the `--platform` flag.
> ```console
> $ docker build --platform linux/amd64 -t YOUR-USER-NAME/getting-started .
> ```
>
> Docker buildx also supports building multi-platform images. To learn more, see [Multi-platform images](../../build/building/multi-platform.md).
@y
> **メモ**
>
> Play with Docker は amd64 プラットフォームを利用しています。
> Apple silicon による ARM ベースの Mac を利用している場合、Play with Docker と互換性のあるイメージを再ビルドして、新たなイメージとしてリポジトリにプッシュする必要があります。
>
> amd64 プラットフォーム向けにイメージをビルドするには `--platform` フラグを用います。
> ```console
> $ docker build --platform linux/amd64 -t YOUR-USER-NAME/getting-started .
> ```
>
> Docker buildx ではマルチプラットフォームのビルドをサポートしています。
> 詳しくは [マルチプラットフォームイメージ](../../build/building/multi-platform.md) を参照してください。
@z

@x
1. Open your browser to [Play with Docker](https://labs.play-with-docker.com/).
@y
1. ブラウザーを開いて [Play with Docker](https://labs.play-with-docker.com/) にアクセスします。
@z

@x
2. Select **Login** and then select **docker** from the drop-down list.
@y
2. **Login** (ログイン) をクリックして、ドロップダウンリストの中から **docker** を選びます。
@z

@x
3. Sign in with your Docker Hub account and then select **Start**.
@y
3. Docker Hub アカウントを使ってサインインし、**Start** をクリックします。
@z

@x
4. Select the **ADD NEW INSTANCE** option on the left side bar. If you don't see it, make your browser a little wider. After a few seconds, a terminal window opens in your browser.
@y
4. 左サイドバーにある **ADD NEW INSTANCE** (新規インスタンスの追加) オプションをクリックします。
   オプションが見えない場合は、ブラウザーを広げてみてください。
   しばらくしてブラウザー上に端末ウィンドウが開きます。
@z

@x
    ![Play with Docker add new instance](images/pwd-add-new-instance.webp)
@y
    ![Play with Docker における新規インスタンス追加](images/pwd-add-new-instance.webp)
@z

@x
5. In the terminal, start your freshly pushed app.
@y
5. 端末ウィンドウにて、プッシュしたばかりのアプリを起動します。
@z

@x
   ```console
   $ docker run -dp 0.0.0.0:3000:3000 YOUR-USER-NAME/getting-started
   ```
@y
   ```console
   $ docker run -dp 0.0.0.0:3000:3000 YOUR-USER-NAME/getting-started
   ```
@z

@x
    You should see the image get pulled down and eventually start up.
@y
    イメージがプルされ、しばらくしてアプリが起動します。
@z

@x
    > **Tip**
    >
    > You may have noticed that this command binds the port mapping to a
    > different IP address. Previous `docker run` commands published ports to
    > `127.0.0.1:3000` on the host. This time, you're using `0.0.0.0`.
    >
    > Binding to `127.0.0.1` only exposes a container's ports to the loopback
    > interface. Binding to `0.0.0.0`, however, exposes the container's port
    > on all interfaces of the host, making it available to the outside world.
    >
    > For more information about how port mapping works, see
    > [Networking](/engine/network/_index.md#published-ports).
    { .tip }
@y
    > **情報**
    >
    > お気づきかと思いますが、このコマンドにてポートマッピングを行っているのは別 IP アドレスに対してです。
    > その前に実行した `docker run` コマンドでは、ホスト上の `127.0.0.1:3000` にポート公開を行っていました。
    > 今回はそれが `0.0.0.0` です。
    >
    > `127.0.0.1` へバインディングされると、コンテナーのポートはループバックインターフェースにのみにバインドされます。
    > 一方で `0.0.0.0` へのバインディングは、コンテナーのポートが全インターフェースにバインドすることができます。
    > この場合は外部への接続が可能となります。
    >
    > ポートマッピングが動作する様子に関しての詳細は [ネットワーク処理](engine/network/_index.md#published-ports) を参照してください。
    { .tip }
@z

@x
6. Select the 3000 badge when it appears.
@y
6. 3000 バッジが現れるのでクリックします。
@z

@x
   If the 3000 badge doesn't appear, you can select **Open Port** and specify `3000`.
@y
   3000 バッジが現れなかった場合は、**Open Port** をクリックして `3000` を指定してください。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to share your images by pushing them to a
registry. You then went to a brand new instance and were able to run the freshly
pushed image. This is quite common in CI pipelines, where the pipeline will
create the image and push it to a registry and then the production environment
can use the latest version of the image.
@y
本節ではイメージを共有する方法として、レジストリにイメージをプッシュする方法を学びました。
そして新たなインスタンスを使って、プッシュしたばかりのイメージを実行しました。
CI パイプラインではごく普通のことであり、そこではイメージを生成しレジストリにプッシュします。
そして本番環境であればイメージの最新版を利用します。
@z

@x
Related information:
@y
関連情報
@z

@x
 - [docker CLI reference](/reference/cli/docker/)
 - [Multi-platform images](../../build/building/multi-platform.md)
 - [Docker Hub overview](../../docker-hub/_index.md)
@y
 - [Docker CLI リファレンス](__SUBDIR__/reference/cli/docker/)
 - [マルチプラットフォームイメージ](../../build/building/multi-platform.md)
 - [Docker Hub 概要](../../docker-hub/_index.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how to persist data in your containerized application.
@y
次節では、コンテナー化したアプリケーション内のデータを保存する方法について学びます。
@z

@x
{{< button text="Persist the DB" url="05_persisting_data.md" >}}
@y
{{< button text="DB への保存" url="05_persisting_data.md" >}}
@z
