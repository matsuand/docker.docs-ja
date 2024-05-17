%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: What is an image?
keywords: concepts, build, images, container, docker desktop
description: What is an image
@y
title: イメージとは?
keywords: concepts, build, images, container, docker desktop
description: イメージとは何か。
@z

% snip youbute link...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Seeing a [container](./what-is-a-container) is an isolated process, where does it get its files and configuration? How do you share those environments? 
@y
[コンテナー](./what-is-a-container) を見てきましたが、これは独立したプロセスのことでした。
ではどこからファイルなり設定なりを取得しているのでしょう？
どうやったらこの環境を共有できるようになるのでしょう？
@z

@x
That's where container images come in! 
@y
これこそがコンテナーイメージの出番です！
@z

@x
A container image is a standardized package that includes all of the files, binaries, libraries, and configurations to run a container.
@y
コンテナーイメージとは標準化されたパッケージのことであり、コンテナー実行のために必要となるファイル、実行バイナリー、設定をすべて含んだもののことです。
@z

@x
For a [PostgreSQL](https://hub.docker.com/_/postgres) image, that image will package the database binaries, config files, and other dependencies. For a Python web app, it'll include the Python runtime, your app code, and all of its dependencies.
@y
[PostgreSQL](https://hub.docker.com/_/postgres) イメージについて言うと、このイメージにはデータベースバイナリー、設定ファイル、依存パッケージが含まれています。
Python ウェブアプリの場合であれば、Python ランタイム、アプリのコード、その依存パッケージということになるでしょう。
@z

@x
There are two important principles of images:
@y
イメージには二つの大きな原則があります。
@z

@x
1. Images are immutable. Once an image is created, it can't be modified. You can only make a new image or add changes on top of it.
@y
1. イメージは不変のものです。
   一度イメージを生成すると、それを修正することはできません。
   イメージに対してできることは、新たなイメージを作るか、あるいはイメージの最上部に変更内容を加えることだけです。
@z

@x
2. Container images are composed of layers. Each layer represented a set of file system changes that add, remove, or modify files.
@y
2. コンテナーイメージはレイヤーから構成されます。
   各レイヤーはファイルシステムに対して加えられた、ファイルの追加、削除、修正の情報によって表現されます。
@z

@x
These two principles let you to extend or add to existing images. For example, if you are building a Python app, you can start from the [Python image](https://hub.docker.com/_/python) and add additional layers to install your app's dependencies and add your code. This lets you focus on your app, rather than Python itself.
@y
この原則に従って、既存のイメージは拡張したり追加したりすることができます。
たとえば Python アプリを構築中であるとした場合、[Python イメージ](https://hub.docker.com/_/python) を原点として、そこにアプリに必要となる依存パッケージやアプリのコードをレイヤーとして追加していきます。
そのようになっているので Python 自体はもはや考慮不要となり、アプリにのみ集中して考えいくことができます。
@z

@x
### Finding images
@y
### イメージの検索 {#finding-images}
@z

@x
[Docker Hub](https://hub.docker.com) is the default global marketplace for storing and distributing images. It has over 100,000 images created by developers that you can run locally. You can search for Docker Hub images and run them directly from Docker Desktop.
@y
[Docker Hub](https://hub.docker.com) とは、イメージの保存と供給を行うデフォルトでグローバルな場所です。
ここには多くの開発者たちが生成した 100,000 にもおよぶイメージが提供されており、これを入手すれば即座に実行することができます。
Docker Hub 内のイメージの検索と実行は Docker Desktop から直接行うことができます。
@z

@x
Docker Hub provides a variety of Docker-supported and endorsed images known as Docker Trusted Content. These provide fully managed services or great starters for your own images. These include:
@y
Docker Hub が提供するのはさまざまなイメージであり、そこには Docker がサポートするものや、Docker Trusted Content として知られる認証イメージがあります。
こういったイメージは適切に管理したサービスを提供しており、ベースとするイメージとして優れた機能を提供します。
具体的には以下のものです。
@z

@x
- [Docker Official Images](https://hub.docker.com/search?q=&type=image&image_filter=official) - a curated set of Docker repositories, serve as the starting point for the majority of users, and are some of the most secure on Docker Hub
- [Docker Verified Publishers](https://hub.docker.com/search?q=&image_filter=store) - high-quality images from commercial publishers verified by Docker
- [Docker-Sponsored Open Source](https://hub.docker.com/search?q=&image_filter=open_source) - images published and maintained by open-source projects sponsored by Docker through Docker's open source program
@y
- [Docker 公式イメージ](https://hub.docker.com/search?q=&type=image&image_filter=official) - Docker が監修するリポジトリセットです。
  非常に多くのユーザーがこのイメージをベースとして利用しています。
  Docker Hub の中でも最も安全なイメージです。
- [Docker 認定公開者](https://hub.docker.com/search?q=&image_filter=store) (Docker Verified Publishers) - Docker 社が認定する商用公開者による高品質なイメージです。
- [Docker がスポンサーとなっているオープンソース](https://hub.docker.com/search?q=&image_filter=open_source) - Docker のオープンソースプログラムを通じたオープンソースプロジェクトが公開管理するイメージ。
@z

@x
For example, [Redis](https://hub.docker.com/_/redis) and [Memcached](https://hub.docker.com/_/memcached) are a few popular ready-to-go Docker Official Images. You can download these images and have these services up and running in a matter of seconds. There are also base images, like the [Node.js](https://hub.docker.com/_/node) Docker image, that you can use as a starting point and add your own files and configurations.
@y
たとえば [Redis](https://hub.docker.com/_/redis) や [Memcached](https://hub.docker.com/_/memcached) は、即座に利用できる人気の Docker 公式イメージです。
このイメージをダウンロードすれば、ほんの数秒でそのサービスを起動することができます。
また [Node.js](https://hub.docker.com/_/node) のようなベースイメージもあります。
これをベースとして利用すれば、独自のファイルや設定を加えていくことができます。
@z

@x
## Try it out
@y
## 試してみよう {#try-it-out}
@z

@x
{{< tabs group=concept-usage persist=true >}}
{{< tab name="Using the GUI" >}}
@y
{{< tabs group=concept-usage persist=true >}}
{{< tab name="GUI 利用時" >}}
@z

@x
In this hands-on, you will learn how to search and pull a container image using the Docker Desktop GUI.
@y
このチュートリアルにおいては Docker Desktop の GUI を用いて、コンテナーイメージの検索とプルの方法について学びます。
@z

@x
### Search for and download an image
@y
### イメージ検索とダウンロード {#search-for-and-download-an-image}
@z

@x
1. Open the Docker Dashboard and select the **Images** view in the left-hand navigation menu.
@y
1. Docker Desktop を開いて、左側のナビゲーションメニューにある **Images** (イメージ) 画面を選びます。
@z

@x
    ![A screenshot of the Docker Dashboard showing the image view on the left sidebar](images/click-image.webp?border=true&w=1050&h=400)
@y
    ![Docker Dashboard のスクリーンショット、左サイドバーからのイメージ画面表示](images/click-image.webp?border=true&w=1050&h=400)
@z

@x
2. Select the **Search images to run** button. If you don't see it, select the _global search bar_ at the top of the screen.
@y
2. **Search images to run** (実行イメージの検索) ボタンをクリックします。
   ボタンが見つからない場合は、画面上段にある _global search bar_ (グローバル検索バー) をクリックしてください。
@z

@x
    ![A screenshot of the Docker Dashboard showing the search ta](images/search-image.webp?border)
@y
    ![Docker Dashboard のスクリーンショット、検索欄](images/search-image.webp?border)
@z

@x
3. In the **Search** field, enter "welcome-to-docker". Once the search has completed, select the `docker/welcome-to-docker` image.
@y
3. **Search** (検索) 欄に "welcome-to-docker" を入力します。
   検索が行われたら `docker/welcome-to-docker` イメージを選択します。
@z

@x
    ![A screenshot of the Docker Dashboard showing the search results for the docker/welcome-to-docker image](images/select-image.webp?border=true&w=1050&h=400)
@y
    ![Docker Dashboard のスクリーンショット、検索結果に docker/welcome-to-docker イメージ](images/select-image.webp?border=true&w=1050&h=400)
@z

@x
4. Select **Pull** to download the image.
@y
4. **Pull** (プル) をクリックしてイメージをダウンロードします。
@z

@x
### Learn about the image
@y
### イメージについての理解 {#learn-about-the-image}
@z

@x
Once you have an image downloaded, you can learn quite a few details about the image either through the GUI or the CLI.
@y
イメージをダウンロードしたら、GUI あるいは CUI を通じてイメージについての詳細を確認していきます。
@z

@x
1. In the Docker Dashboard, select the **Images** view.
@y
1. Docker Dashboard の **Images** (イメージ) 画面を選びます。
@z

@x
2. Select the **docker/welcome-to-docker** image to open details about the image.
@y
2. **docker/welcome-to-docker** イメージをクリックして、このイメージについての詳細ページを開きます。
@z

@x
    ![A screenshot of the Docker Dashboard showing the images view with an arrow pointing to the docker/welcome-to-docker image](images/pulled-image.webp?border=true&w=1050&h=400)
@y
    ![Docker Dashboard のスクリーンショット、矢印先の docker/welcome-to-docker イメージを使ったイメージ確認](images/pulled-image.webp?border=true&w=1050&h=400)
@z

@x
3. The image details page presents you with information regarding the layers of the image, the packages and libraries installed in the image, and any discovered vulnerabilities.
@y
3. イメージ詳細ページが示す情報は、イメージのレイヤー、イメージにインストールされているパッケージやライブラリ、また検出されたぜい弱性といったものです。
@z

@x
    ![A screenshot of the image details view for the docker/welcome-to-docker image](images/image-layers.webp?border=true&w=1050&h=400)
@y
    ![イメージ詳細画面のスクリーンショット、docker/welcome-to-docker イメージ](images/image-layers.webp?border=true&w=1050&h=400)
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< tab name="Using the CLI" >}}
@y
{{< tab name="CLI 利用時" >}}
@z

@x
Follow the instructions to search and pull a Docker image using CLI to view its layers.
@y
CLI を使って Docker イメージの検索とプルを行うには以下の手順に従います。
これによりイメージの各レイヤーを確認することができます。
@z

@x
### Search for and download an image
@y
### イメージの検索とダウンロード {#search-for-and-download-an-image}
@z

@x
1. Open a terminal and search for images using the [`docker search`](/reference/cli/docker/search/) command:
@y
1. 端末を開き、イメージを検索する [`docker search`](__SUBDIR__/reference/cli/docker/search/) コマンドを実行します。
@z

% snip command...

@x
    You will see output like the following:
@y
    出力結果は以下のようなものとなります。
@z

% snip output...

@x
    This output shows you information about relevant images available on Docker Hub.
@y
    この出力には Docker Hub において利用可能な関連イメージの情報が示されています。
@z

@x
2. Pull the image using the [`docker pull`](/reference/cli/docker/image/pull/) command.
@y
2. [`docker pull`](__SUBDIR__/reference/cli/docker/image/pull/) コマンドを使ってイメージをプルします。
@z

% snip command...

@x
    You will see output like the following:
@y
    出力結果は以下のようなものとなります。
@z

% snip output...

@x
    Each of line represents a different downloaded layer of the image. Remember that each layer is a set of filesystem changes and provides functionality of the image.
@y
    ダウンロードしたイメージレイヤーについての情報が一行ずつ示されています。
    各レイヤーはファイルシステムの変更情報であり、イメージの機能性を表したものであることを思い出してください。
@z

@x
### Learn about the image
@y
### イメージについての理解 {#learn-about-the-image}
@z

@x
1. List your downloaded images using the [`docker image ls`](/reference/cli/docker/image/ls/) command:
@y
1. ダウンロード済みのイメージ一覧を見るには [`docker image ls`](__SUBDIR__/reference/cli/docker/image/ls/) コマンドを実行します。
@z

% snip command...

@x
    You will see output like the following:
@y
    出力結果は以下のようなものとなります。
@z

% snip output...

@x
    The command shows a list of Docker images currently available on your system. The `docker/welcome-to-docker` has a total size of approximately 29.7MB.
@y
    このコマンドにより、システム上において利用可能な Docker イメージの一覧が表示されます。
    `docker/welcome-to-docker` のトータルサイズはおよそ 29.7MB であることがわかります。
@z

@x
    > **Image size**
    > 
    > The image size represented here reflects the uncompressed size of the image, not the download size of the layers.
@y
    > **イメージサイズ**
    > 
    > ここに示されるイメージサイズは、イメージを伸長 (解凍) したサイズを示しており、レイヤーのダウンロードサイズではありません。
@z

@x
2. List the image's layers using the [`docker image history`](/reference/cli/docker/image/history/) command:
@y
2. [`docker image history`](__SUBDIR__/reference/cli/docker/image/history/) コマンドを使ってイメージのレイヤーを一覧表示します。
@z

% snip command...

@x
    You will see output like the following:
@y
    出力結果は以下のようなものとなります。
@z

% snip output...

@x
    This output shows you all of the layers, their sizes, and the command used to create the layer. 
@y
    この出力によって全レイヤーの情報、そのサイズ、またレイヤー生成時のコマンドを見ることができます。
@z

@x
    > **Viewing the full command**
    >
    > If you add the `--no-trunc` flag to the command, you will see the full command. Note that, since the output is in a table-like format, longer commands will cause the output to be very difficult to navigate.
    { .tip }
@y
    > **コマンドのフル表示**
    >
    > 上のコマンドに対して `--no-trunc` フラグをつけると、コマンドをフル表示にすることができます。
    > 出力結果は表形式で行われているため、コマンドが長ければ、出力結果がその分だけわかりにくくなります。
    { .tip }
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
In this walkthrough, you searched and pulled a Docker image. In addition to pulling a Docker image, you also learned about the layers of a Docker Image.
@y
このウォークスルーを通じて、Docker イメージの検索とプルを行いました。
Docker イメージのプルに加えて、Docker イメージのレイヤー内容についても学びました。
@z

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
The following resources will help you learn more about exploring, finding, and building images:
@y
以下に示す情報では、イメージに対する情報、検索方法、ビルド方法をより詳しく学ぶことができます。
@z

@x
- [Docker Trusted Content](/trusted-content/)
  - [Docker Official Images docs](/trusted-content/official-images/)
  - [Docker Verified Publisher docs](/trusted-content/dvp-program/)
  - [Docker-Sponsored Open Source Program docs](/trusted-content/dsos-program/)
- [Explore the Image view in Docker Desktop](/desktop/use-desktop/images/)
- [Packaging your software](/build/building/packaging/)
- [Docker Hub](https://hub.docker.com)
@y
- [Docker Trusted Content](__SUBDIR__/trusted-content/)
  - [Docker 公式イメージのドキュメント](__SUBDIR__/trusted-content/official-images/)
  - [Docker Verified Publisher のドキュメント](__SUBDIR__/trusted-content/dvp-program/)
  - [Docker 提供のオープンソースプログラムのドキュメント](__SUBDIR__/trusted-content/dsos-program/)
- [Explore the Image view in Docker Desktop](__SUBDIR__/desktop/use-desktop/images/)
- [ソフトウェアのパッケージング](__SUBDIR__/build/building/packaging/)
- [Docker Hub](https://hub.docker.com)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Now that you have learned the basics of images, it's time to learn about distributing images through registries.
@y
イメージの基本について学んできました。
次はレジストリを通じてイメージを配布する方法について学びます。
@z

@x
{{< button text="What is a registry?" url="what-is-a-registry" >}}
@y
{{< button text="レジストリとは?" url="what-is-a-registry" >}}
@z
