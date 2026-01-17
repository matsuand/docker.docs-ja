%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Build and push your first image
keywords: concepts, container, docker desktop
description: This concept page will teach you how to build and push your first image
@y
title: 初めてのイメージ作りとプッシュ
keywords: concepts, container, docker desktop
description: This concept page will teach you how to build and push your first image
@z

@x
summary: |
  Learn how to build your first Docker image, a key step in containerizing your
  application. We'll guide you through the process of creating an image
  repository and building and pushing your image to Docker Hub. This enables
  you to share your image easily within your team.
@y
summary: |
  はじめて行う Docker イメージのビルド、つまりアプリケーションコンテナー化のキーポイントについて学びます。
  そしてイメージリポジトリの生成手順について説明し、イメージをビルドした上で Docker Hub へのプッシュを行います。
  こうして開発チーム内では簡単にイメージを共有できるようになります。
@z

% snip youbute...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Now that you've updated the [to-do list app](develop-with-containers.md), you’re ready to create a container image for the application and share it on Docker Hub. To do so, you will need to do the following:
@y
ここまでに [todo リストのアプリ](develop-with-containers.md) を更新してきたので、このアプリケーションに対応するコンテナーイメージを生成して、Docker Hub 上にて共有することにします。
そのためには、以下のことを行っていく必要があります。
@z

@x
1. Sign in with your Docker account
2. Create an image repository on Docker Hub
3. Build the container image
4. Push the image to Docker Hub
@y
1. Docker アカウントを使ってサインイン
2. Docker Hub 上でのイメージリポジトリの生成
3. コンテナーイメージのビルド
4. Docker Hub へのイメージのプッシュ
@z

@x
Before you dive into the hands-on guide, the following are a few core concepts that you should be aware of.
@y
この実践的なガイドに進んでいくにあたり、確認しておくべき基本的な考え方について、以下に見ておくことにしましょう。
@z

@x
### Container images
@y
### コンテナーイメージ {#container-images}
@z

@x
If you’re new to container images, think of them as a standardized package that contains everything needed to run an application, including its files, configuration, and dependencies. These packages can then be distributed and shared with others.
@y
コンテナーイメージについてよく分かっていないなら、以下のように考えてください。
つまりコンテナーイメージとはパッケージが標準化されたものであり、そこにはアプリケーションの実行に必要なファイル、設定、依存パッケージがすべて含まれているものです。
このようなパッケージは他者への配布や共有を容易にしてくれます。
@z

@x
### Docker Hub
@y
### Docker Hub
@z

@x
To share your Docker images, you need a place to store them. This is where registries come in. While there are many registries, Docker Hub is the default and go-to registry for images. Docker Hub provides both a place for you to store your own images and to find images from others to either run or use as the bases for your own images.
@y
Docker イメージを共有したいなら、それを保存しておく場所が必要になります。
ですからレジストリの登場となります。
レジストリにはいろいろなものがありますが、Docker Hub はデフォルトの信頼できるレジストリです。
Docker Hub はご自身のイメージを保存する場所となると同時に、他の人が作ったイメージを検索することができます。
そうやって探し出したイメージは直接実行したり、ご自身のイメージのベースとして利用することもできます。
@z

@x
When choosing base images, Docker Hub offers two categories of trusted, Docker-maintained images:
@y
ベースイメージを選ぶにあたって、Docker Hub は Docker 社メンテナンスによる信頼のおけるイメージを二種類提供しています。
@z

@x
- [Docker Official Images (DOI)](/manuals/docker-hub/image-library/trusted-content.md#docker-official-images) – Curated images for popular software, following best practices and regularly updated.
- [Docker Hardened Images (DHI)](/manuals/dhi/_index.md) – Minimal, secure, production-ready images with near-zero CVEs, designed to reduce attack surface and simplify compliance. DHI images are free and open source under Apache 2.0.
@y
- [Docker 公式イメージ (Docker Official Images; DOI)](manuals/docker-hub/image-library/trusted-content.md#docker-official-images) – 人気のソフトウェアを厳選したイメージ。
  ベストプラクティスに従い定期的に更新されます。
- [Docker Hardened イメージ (Docker Hardened Images; DHI)](manuals/dhi/_index.md) – コンパクトにまとめられたセキュアな実運用向けイメージであり、CVE はほぼゼロ、攻撃面を廃しコンプライアンスを単純化するように設計されています。
  DHI イメージは無償であり Apache 2.0 に基づくオープンソースです。
@z

@x
In [Develop with containers](develop-with-containers.md), you used the following images that came from Docker Hub, each of which are [Docker Official Images](/manuals/docker-hub/image-library/trusted-content.md#docker-official-images):
@y
[コンテナーを使った開発](develop-with-containers.md) では Docker Hub から入手した以下のイメージを利用しました。
すべては [Docker 公式イメージ](manuals/docker-hub/image-library/trusted-content.md#docker-official-images) です。
@z

@x
- [node](https://hub.docker.com/_/node) - provides a Node environment and is used as the base of your development efforts. This image is also used as the base for the final application image.
- [mysql](https://hub.docker.com/_/mysql) - provides a MySQL database to store the to-do list items
- [phpmyadmin](https://hub.docker.com/_/phpmyadmin) - provides phpMyAdmin, a web-based interface to the MySQL database
- [traefik](https://hub.docker.com/_/traefik) - provides Traefik, a modern HTTP reverse proxy and load balancer that routes requests to the appropriate container based on routing rules
@y
- [node](https://hub.docker.com/_/node) - Node 環境を提供するものであり、開発作業のベースとして利用します。このイメージは最終イメージのベースとしても利用されます。
- [mysql](https://hub.docker.com/_/mysql) - MySQL データベースを提供し、todo リストのアイテムを保持します。
- [phpmyadmin](https://hub.docker.com/_/phpmyadmin) - MySQL データベースへのウェブインターフェースである phpMyAdmin を提供します。
- [traefik](https://hub.docker.com/_/traefik) - Traefik を提供します。これは最新の HTTP リバースプロキシーおよびロードバランサーであり、ルーティングルールに基づいてリクエストを適切なコンテナーに振り分けます。
@z

@x
Explore the full catalog of trusted content on Docker Hub:
- [Docker Official Images](https://hub.docker.com/search?badges=official) – Curated images for popular software
- [Docker Hardened Images](https://hub.docker.com/hardened-images/catalog) – Security-hardened, minimal production images (also available at [dhi.io](https://dhi.io))
- [Docker Verified Publishers](https://hub.docker.com/search?badges=verified_publisher) – Images from verified software vendors
- [Docker Sponsored Open Source](https://hub.docker.com/search?badges=open_source) – Images from sponsored OSS projects
@y
Docker Hub 上の信頼できる以下のコンテンツを確認してください。
- [Docker 公式イメージ](https://hub.docker.com/search?badges=official) – 人気の高いソフトウェアから厳選されたイメージ。
- [Docker Hardened イメージ](https://hub.docker.com/hardened-images/catalog) – セキュリティ的に堅牢で最小の本番環境向けイメージ ([dhi.io](https://dhi.io) からも入手可能)。
- [Docker 認定公開者](https://hub.docker.com/search?badges=verified_publisher) – 認定公開者が提供するイメージ。
- [Docker 支援のオープンソース](https://hub.docker.com/search?badges=open_source) – Docker 社が支援する OSS プロジェクトのイメージ。
@z

@x
## Try it out
@y
## ためしてみよう {#try-it-out}
@z

@x
In this hands-on guide, you'll learn how to sign in to Docker Hub and push images to Docker Hub repository.
@y
この実践ガイドでは、Docker Hub へのサインインと Docker Hub リポジトリへのイメージプッシュの方法について学びます。
@z

@x
## Sign in with your Docker account
@y
## Docker アカウントを使ったサインイン {#sign-in-with-your-docker-account}
@z

@x
To push images to Docker Hub, you will need to sign in with a Docker account.
@y
Docker Hub にイメージをプッシュするには、Docker アカウントを使ってサインインしておくことが必要です。
@z

@x
1. Open the Docker Dashboard.
@y
1. Docker ダッシュボードを開きます。
@z

@x
2. Select **Sign in** at the top-right corner.
@y
2. 右上隅の **Sign in** (サインイン) を選びます。
@z

@x
3. If needed, create an account and then complete the sign-in flow.
@y
3. アカウントが未生成の場合はこれを生成して、サインイン手続きを完了させます。
@z

@x
Once you're done, you should see the **Sign in** button turn into a profile picture.
@y
サインインを行えば **Sign in** (サインイン) ボタンはプロファイルアイコンに変わります。
@z

@x
## Create an image repository
@y
## イメージリポジトリの生成 {#create-an-image-repository}
@z

@x
Now that you have an account, you can create an image repository. Just as a Git repository holds source code, an image repository stores container images.
@y
アカウントを生成していれば、イメージリポジトリを生成することができます。
Git リポジトリというものがソースコードを収納しているのと同じように、イメージリポジトリはコンテナーイメージを保持します。
@z

@x
1. Go to [Docker Hub](https://hub.docker.com).
@y
1. [Docker Hub](https://hub.docker.com) にアクセスします。
@z

@x
2. Select **Create repository**.
@y
2. **Create repository** (リポジトリの生成) を選びます。
@z

@x
3. On the **Create repository** page, enter the following information:
@y
3. **Create repository** (リポジトリの生成) ページにおいて以下の情報を入力します。
@z

@x
    - **Repository name** - `getting-started-todo-app`
    - **Short description** - feel free to enter a description if you'd like
    - **Visibility** - select **Public** to allow others to pull your customized to-do app
@y
    - **Repository name** (リポジトリ名) - `getting-started-todo-app`
    - **Short description** (簡易な説明) - 簡単な説明文を好きなように記述します。
    - **Visibility** (可視性) - **Public** (パブリック) を選ぶことで、開発している todo アプリを他者でもプルできるようにします。
@z

@x
4. Select **Create** to create the repository.
@y
4. **Create** (生成) を選んでリポジトリを生成します。
@z

@x
## Build and push the image
@y
## イメージのビルドとプッシュ {#build-and-push-the-image}
@z

@x
Now that you have a repository, you are ready to build and push your image. An important note is that the image you are building extends the Node image, meaning you don't need to install or configure Node, yarn, etc. You can simply focus on what makes your application unique.
@y
リポジトリの準備ができたので、イメージのビルドとプッシュを行っていきます。
重要なこととして、そもそもビルドしたイメージは Node イメージを拡張したものでした。
これはつまり、Node や yarn のインストールや設定などは行う必要がありません。
アプリケーション独自の作業を行うことだけに集中すればよいといいことです。
@z

@x
> **What is an image/Dockerfile?**
>
> Without going too deep yet, think of a container image as a single package that contains
> everything needed to run a process. In this case, it will contain a Node environment,
> the backend code, and the compiled React code. 
>
> Any machine that runs a container using the image, will then be able to run the application as 
> it was built without needing anything else pre-installed on the machine. 
>
> A `Dockerfile` is a text-based script that provides the instruction set on how to build
> the image. For this quick start, the repository already contains the Dockerfile.
@y
> **イメージ/Dockerfile とはなにか？**
>
> まだ十分に理解できていない方は、コンテナーイメージというものが、所定のプロセスの実行に必要なものすべてを含んだ単一のパッケージであると考えてください。
> 今の場合、Node 環境、バックエンドコード、コンパイル済みの React コードが含まれているわけです。
>
> イメージを使ってコンテナーを実行させるマシンでは、アプリケーションを実行することができるわけですが、ビルドの際にはマシンにインストールされている以外のものはまったく不要です。
>
> `Dockerfile` はテキストベースのスクリプトであり、イメージをどのようにビルドするのかを指示する命令が記述されてます。
> 作業を簡単に進めるため、以下のリポジトリではあらかじめ Dockerfile を用意しています。
@z

@x
{{< tabs group="cli-or-vs-code" persist=true >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="cli-or-vs-code" persist=true >}}
{{< tab name="CLI" >}}
@z

@x
1. To get started, either clone or [download the project as a ZIP file](https://github.com/docker/getting-started-todo-app/archive/refs/heads/main.zip) to your local machine.
@y
1. まずはじめに、ローカルマシンに対してクローンを行うか [ZIP ファイル](https://github.com/docker/getting-started-todo-app/archive/refs/heads/main.zip) をダウンロードします。
@z

% snip command...

@x
   And after the project is cloned, navigate into the new directory created by the clone:
@y
   プロジェクトがクローンできたら、クローンによって新たに生成されたディレクトリに移動します。
@z

% snip command...

@x
2. Build the project by running the following command, swapping out `DOCKER_USERNAME` with your username.
@y
2. 以下のコマンドを実行してプロジェクトをビルドします。
   `DOCKER_USERNAME` の部分は自身のユーザー名に置き換えます。
@z

% snip command...

@x
    For example, if your Docker username was `mobydock`, you would run the following:
@y
    たとえば Docker ユーザー名が `mobydock` であった場合、以下のようにコマンド実行します。
@z

% snip command...

@x
3. To verify the image exists locally, you can use the `docker image ls` command:
@y
3. ローカルにイメージが生成されたことを確認するため `docker image ls` コマンドを実行します。
@z

% snip command...

@x
    You will see output similar to the following:
@y
    以下のような出力が得られるはずです。
@z

% snip output...

@x
4. To push the image, use the `docker push` command. Be sure to replace `DOCKER_USERNAME` with your username:
@y
4. イメージをプッシュのため `docker push` コマンドを実行します。
   `DOCKER_USERNAME` の部分は自身のユーザー名に置き換えます。
@z

% snip command...

@x
    Depending on your upload speeds, this may take a moment to push.
@y
    アップロード速度により、プッシュにはある程度の時間がかかります。
@z

@x
{{< /tab >}}
{{< tab name="VS Code" >}}
@y
{{< /tab >}}
{{< tab name="VS Code" >}}
@z

@x
1. Open Visual Studio Code. Ensure you have the **Docker extension for VS Code** installed from [Extension Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker).
@y
1. Visual Studio Code を開きます。
[Extension Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) から **Docker extension for VS Code** がインストールできていることを確認します。
@z

@x
   ![Screenshot of VS code extension marketplace](images/install-docker-extension.webp)
@y
   ![VS code extension marketplace のスクリーンショット](images/install-docker-extension.webp)
@z

@x
2. In the **File** menu, select **Open Folder**. Choose **Clone Git Repository** and paste this URL: [https://github.com/docker/getting-started-todo-app](https://github.com/docker/getting-started-todo-app)
@y
2. **File** (ファイル) メニューにおいて **Open Folder** (フォルダーを開く) を選びます。
   **Clone Git Repository** (Git リポジトリのクローン) を選んで以下の URL  [https://github.com/docker/getting-started-todo-app](https://github.com/docker/getting-started-todo-app) をペーストします。
@z

@x
    ![Screenshot of VS code showing how to clone a repository](images/clone-the-repo.webp?border=true)
@y
    ![リポジトリのクローン方法を示した VS Code のスクリーンショット](images/clone-the-repo.webp?border=true)
@z

@x
3. Right-click the `Dockerfile` and select the **Build Image...** menu item.
@y
3. `Dockerfile` 上にて右クリックして、メニュー項目の中から **Build Image...** (イメージのビルド) を選びます。
@z

@x
    ![Screenshot of VS Code showing the right-click menu and "Build Image" menu item](images/build-vscode-menu-item.webp?border=true)
@y
    ![VS Code にて右クリック、"Build Image" メニューを選んだスクリーンショット](images/build-vscode-menu-item.webp?border=true)
@z

@x
4. In the dialog that appears, enter a name of `DOCKER_USERNAME/getting-started-todo-app`, replacing `DOCKER_USERNAME` with your Docker username. 
@y
4. ダイアログ画面が表示されるので、名前欄に `DOCKER_USERNAME/getting-started-todo-app` を入力します。
   `DOCKER_USERNAME` の部分は自身の Docker ユーザー名に置き換えます。
@z

@x
5. After pressing **Enter**, you'll see a terminal appear where the build will occur. Once it's completed, feel free to close the terminal.
@y
5. **Enter** を押すと、ビルド実行するディレクトリにてターミナル画面が開きます。
   ビルドが完了したらターミナル画面は閉じてかまいません。
@z

@x
6. Open the Docker Extension for VS Code by selecting the Docker logo in the left nav menu.
@y
6. VS Code の Docker Extension を開くために、左側ナビメニュー内の Docker ロゴを選びます。
@z

@x
7. Find the image you created. It'll have a name of `docker.io/DOCKER_USERNAME/getting-started-todo-app`. 
@y
7. 生成したイメージを探し出します。
   イメージ名称は `docker.io/DOCKER_USERNAME/getting-started-todo-app` となっているはずです。
@z

@x
8. Expand the image to view the tags (or different versions) of the image. You should see a tag named `latest`, which is the default tag given to an image.
@y
8. イメージを展開して、イメージのタグ (あるいはいくつかあるバージョン) を確認します。
   タグ名として `latest` があるはずです。
   このタグはイメージに対して与えられるデフォルト名です。
@z

@x
9. Right-click on the **latest** item and select the **Push...** option.
@y
9. **latest** 上で右クリックして **Push...** (プッシュ) オプションを選びます。
@z

@x
    ![Screenshot of the Docker Extension and the right-click menu to push an image](images/build-vscode-push-image.webp)
@y
    ![Docker Extension を使い右クリック目ny－によりイメージプッシュするスクリーンショット](images/build-vscode-push-image.webp)
@z

@x
10. Press **Enter** to confirm and then watch as your image is pushed to Docker Hub. Depending on your upload speeds, it might take a moment to push the image.
@y
10. **Enter** を押して、Docker Hub に対してイメージがプッシュされることを確認します。
   アップロード速度により、プッシュにはある程度の時間がかかります。
@z

@x
    Once the upload is finished, feel free to close the terminal.
@y
    アップロードが終了したら、ターミナル画面を閉じてかまいません。
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Recap
@y
## まとめ {#recap}
@z

@x
Before you move on, take a moment and reflect on what happened here. Within a few moments, you were able to build a container image that packages your application and push it to Docker Hub.
@y
これより先に進む前に、もう一度、ここで行った内容を思い起こしてください。
ほんの数分の中で、アプリケーションをパッケージ化したコンテナーイメージをビルドし、それを Docker Hub にプッシュすることができました。
@z

@x
Going forward, you’ll want to remember that:
@y
先に進んでいく際には以下のことを覚えておいてください。
@z

@x
- Docker Hub is the go-to registry for finding trusted content. Docker provides a collection of trusted content, composed of Docker Official Images, Docker Verified Publishers, and Docker Sponsored Open Source Software, to use directly or as bases for your own images.
@y
- Docker Hub は信頼できるコンテンツを探し出せる有用なレジストリです。
  Docker では Docker 公式イメージ、Docker Verified Publishers、Docker Sponsored Open Source Software から構成される、信頼性の高いさまざまなイメージを提供しています。
  それを直接利用するか、あるいは自身のイメージのベースとして利用してください。
@z

@x
- Docker Hub provides a marketplace to distribute your own applications. Anyone can create an account and distribute images. While you are publicly distributing the image you created, private repositories can ensure your images are accessible to only authorized users.
@y
- Docker Hub は独自のアプリケーションを配布するマーケットプレースを提供しています。
  アカウント生成やイメージ配布はどなたでも行うことができます。
  生成したイメージをパブリックに配布することができると同時に、プライベートリポジトリとすれば承認ユーザーのみがイメージにアクセスできるようになります。
@z

@x
> **Usage of other registries**
>
> While Docker Hub is the default registry, registries are standardized and made 
> interoperable through the [Open Container Initiative](https://opencontainers.org/). This allows companies and 
> organizations to run their own private registries. Quite often, trusted content 
> is mirrored (or copied) from Docker Hub into these private registries.
>
@y
> **その他のレジストリの利用**
>
> Docker Hub はデフォルトのレジストリですが、レジストリは [Open Container Initiative](https://opencontainers.org/) によって標準化されており、相互運用が可能となっています。
> このことから各企業や組織は独自のプライベートリポジトリを運用することが可能となっています。
> 信頼性の高いコンテンツは Docker Hub からそのようなプライベートリポジトリにミラーリング (またはコピー) がよく行われています。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Now that you’ve built an image, it's time to discuss why you as a developer should learn more about Docker and how it will help you in your day-to-day tasks.
@y
イメージのビルドができるようになったので、ここから先は開発者であるあなたがなぜ Docker を学ぶ必要があるのか、日々のタスクにとってどのように役立てることができるのかについて説明していきます。
@z

@x
{{< button text="What's Next" url="whats-next" >}}
@y
{{< button text="次は何" url="whats-next" >}}
@z
