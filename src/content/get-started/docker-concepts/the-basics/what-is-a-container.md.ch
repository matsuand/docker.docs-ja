%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: What is a container?
keywords: concepts, build, images, container, docker desktop
description: What is a container? This concept page will teach you about containers and provide a quick hands-on where you will run your first container.
@y
title: コンテナーとは?
keywords: concepts, build, images, container, docker desktop
description: What is a container? This concept page will teach you about containers and provide a quick hands-on where you will run your first container.
@z

% snip youbute link...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Imagine you're developing a killer web app that has three main components - a React frontend, a Python API, and a PostgreSQL database. If you wanted to work on this project, you'd have to install Node, Python, and PostgreSQL. 
@y
今あなたは 3 つのコンポーネントから構成される優れたウェブアプリを開発しているとします。
その 3 つのコンポーネントとは React フロントエンド、Python API、PostgreSQL データベースです。
このプロジェクトで働きたいなら、自分のマシンに Node、Python、PostgreSQL をインストールしなければなりません。
@z

@x
How do you make sure you have the same versions as the other developers on your team? Or your CI/CD system? Or what's used in production?
@y
では同じチーム内の別の開発者のものと比較して、同じバージョンのソフトウェアが入っていることを、どうやって確認しますか？
あるいはあなたの利用する CI/CD システムは他の人と同じですか？
本番環境にて用いられているバージョンと違うかどうかはどう確認しますか？
@z

@x
How do you ensure the version of Python (or Node or the database) your app needs isn't affected by what's already on your machine? How do you manage potential conflicts?
@y
ではそのアプリケーションが必要としている Python (あるいは Node、あるいはデータベース) のバージョンが、すでにあなたのマシンに入っているものには全く影響を与えないことは、どうやったら分かりますか？
潜在的に競合するかもしれない状況をどのように管理しますか？
@z

@x
Enter containers!
@y
だったらコンテナーにしましょう！
@z

@x
What is a container? Simply put, containers are isolated processes for each of your app's components. Each component - the frontend React app, the Python API engine, and the database - runs in its own isolated environment, completely isolated from everything else on your machine. 
@y
コンテナーとは何なのか？
単純に言ってコンテナーとは、アプリの各コンポーネントごとに用意される独立したプロセスのことです。
各コンポーネント、つまりフロントエンドの React アプリ、Python API エンジン、データベース、これらがそれぞれに独立した環境において動きます。
それはマシン上で動作するあらゆるものから完全に独立しています。
@z

@x
Here's what makes them awesome. Containers are:
@y
コンテナーは実に優れたものであり、以下のような特徴があります。
@z

@x
- Self-contained. Each container has everything it needs to function with no reliance on any pre-installed dependencies on the host machine.
- Isolated. Since containers are run in isolation, they have minimal influence on the host and other containers, increasing the security of your applications.
- Independent. Each container is independently managed. Deleting one container won't affect any others.
- Portable. Containers can run anywhere! The container that runs on your development machine will work the same way in a data center or anywhere in the cloud!
@y
- 自己完結しています (self-contained)。
  各コンテナーはその動作に必要な機能をすべて持っています。
  ですからホストマシン上にインストールされているパッケージには一切依存しません。
- 独立しています (isolated)。
  コンテナーは独立して動作します。
  したがってホストマシンや他のコンテナーへの影響は最小限で済み、その分だけアプリケーションのセキュリティは向上します。
- 他のものに依存しません (independent)。
  各コンテナーはどこにも依存することなく管理されています。
  一つのコンテナーを削除したからといって、他のコンテナーには影響がありません。
- 可搬性に優れます (portable)。
  コンテナーはどこでも動かすことができます！
  手元の開発マシン上で動作させているコンテナーは、まったく同様にしてデータセンター上でもクラウド上でも動作させることができます。
@z

@x
### Containers versus virtual machines (VMs)
@y
### コンテナー vs. 仮想マシン {#containers-versus-virtual-machines-vms}
@z

@x
Without getting too deep, a VM is an entire operating system with its own kernel, hardware drivers, programs, and applications. Spinning up a VM only to isolate a single application is a lot of overhead.
@y
細かく言うまでもなく VM というものはオペレーティングシステムそのものであり、そのマシンに応じたカーネル、ハードウェアドライバー、アプリケーションを有しています。
ですからただ一つのアプリケーションを独立して稼働させるためだけに VM を起動するのであれば、それはオーバーヘッドとなります。
@z

@x
A container is simply an isolated process with all of the files it needs to run. If you run multiple containers, they all share the same kernel, allowing you to run more applications on less infrastructure.
@y
コンテナーは単に独立したプロセスに過ぎず、実行に必要なファイルを利用するだけです。
複数のコンテナーを実行しているなら、そのコンテナーはすべて同一のカーネルを用います。
つまりアプリケーションはより多く動作させることができ、それに比べてインフラは少なくて済みます。
@z

@x
> **Using VMs and containers together**
>
> Quite often, you will see containers and VMs used together. As an example, in a cloud environment, the provisioned machines are typically VMs. However, instead of provisioning one machine to run one application, a VM with a container runtime can run multiple containerized applications, increasing resource utilization and reducing costs.
@y
> **VM とコンテナーの同時利用**
>
> コンテナーと VM を同時に利用している例はよく見かけます。
> たとえばクラウド環境において暫定的に用意されるマシンといえば、通常は VM です。
> ただし単に一つのアプリケーションを暫定的なマシン上で動作させるよりも、コンテナーランタイムを有する VM を使って複数のコンテナー化アプリケーションを実行することの方が、リソース利用率が向上し、かつコストは削減できます。
@z

@x
## Try it out
@y
## 試してみよう {#try-it-out}
@z

@x
In this hands-on, you will see how to run a Docker container using the Docker Desktop GUI.
@y
このチュートリアルでは Docker Desktop の GUI を使って Docker コンテナーを起動する方法について示していきます。
@z

@x
{{< tabs group=concept-usage persist=true >}}
{{< tab name="Using the GUI" >}}
@y
{{< tabs group=concept-usage persist=true >}}
{{< tab name="GUI 利用時" >}}
@z

@x
Use the following instructions to run a container.
@y
以下の手順によりコンテナーを起動します。
@z

@x
1. Open Docker Desktop and select the **Search** field on the top navigation bar.
@y
1. Docker Desktop を開いて、最上段のナビゲーションバーにある **Search** (検索) 欄を選びます。
@z

@x
2. Specify `welcome-to-docker` in the search input and then select the **Pull** button.
@y
2. 検索語として `welcome-to-docker` を入力し **Pull** ボタンをクリックします。
@z

@x
    ![A screenshot of the Docker Dashboard showing the search result for welcome-to-docker Docker image ](images/search-the-docker-image.webp?border=true&w=1000&h=700)
@y
    ![Docker Dashboard のスクリーンショット、Docker イメージ welcome-to-docker の検索結果](images/search-the-docker-image.webp?border=true&w=1000&h=700)
@z

@x
3. Once the image is successfully pulled, select the **Run** button.
@y
3. イメージが正常にプルできたら **Run** (実行) ボタンをクリックします。
@z

@x
4. Expand the **Optional settings**.
@y
4. **Optional settings** (任意の設定) を展開します。
@z

@x
5. In the **Container name**, specify `welcome-to-docker`.
@y
5. **Container name** (コンテナー名) 欄に `welcome-to-docker` と入力します。
@z

@x
6. In the **Host port**, specify `8080`.
@y
6. **Host port** (ホストポート) 欄に `8080` と入力します。
@z

@x
    ![A screenshot of Docker Dashboard showing the container run dialog with welcome-to-docker typed in as the container name and 8080 specified as the port number](images/run-a-new-container.webp?border=true&w=550&h=400)
@y
    ![Docker Dashboard のスクリーンショット、コンテナーの実行ダイアログにおいてコンテナー名に welcome-to-docker、ポート番号に 8080 を指定](images/run-a-new-container.webp?border=true&w=550&h=400)
@z

@x
7. Select **Run** to start your container.
@y
7. **Run** (実行) をクリックしてコンテナーを起動させます。
@z

@x
Congratulations! You just ran your first container! 🎉
@y
おめでとうございます！
初めてのコンテナー起動を行いました！ 🎉
@z

@x
### View your container
@y
### コンテナーの確認 {#view-your-container}
@z

@x
You can view all of your containers by going to the **Containers** view of the Docker Dashboard.
@y
コンテナーを確認するには Docker Dashboard の **Containers** (コンテナー) 画面を表示します。.
@z

@x
![Screenshot of the container view of the Docker Desktop GUI showing the welcome-to-docker container running on the host port 8080](images/view-your-containers.webp?border=true&w=750&h=600)
@y
![Docker Desktop GUI のコンテナー画面のスクリーンショット、welcome-to-docker がホストポート 8080 にて起動中](images/view-your-containers.webp?border=true&w=750&h=600)
@z

@x
This container runs a web server that displays a simple website. When working with more complex projects, you'll run different parts in different containers. For example, you might run a different container for the frontend, backend, and database.
@y
このコンテナーはウェブサーバーを起動するものであって、単純なウェブサイトを表示します。
これよりも複雑なプロジェクトで作業する場合には、さまざまなコンテナー内のさまざまな機能を実行することになります。
たとえばフロントエンド、バックエンド、データベースといった用途でコンテナーを動作させることも出てくることでしょう。
@z

@x
### Access the frontend
@y
### フロントエンドへのアクセス {#access-the-frontend}
@z

@x
When you launched the container, you exposed one of the container's ports onto your machine. Think of this as creating configuration to let you to connect through the isolated environment of the container. 
@y
コンテナーを起動した際に、コンテナー内のポートをホストマシンに向けて公開していました。
それができるということは、つまり独立したコンテナー環境に対して接続を行う設定ができるということです。
@z

@x
For this container, the frontend is accessible on port `8080`. To open the website, select the link in the **Port(s)** column of your container or visit [http://localhost:8080](https://localhost:8080) in your browser.
@y
このコンテナーはフロントエンドとしてポート `8080` によりアクセスできます。
ウェブサイトを開くには、このコンテナーの **Port(s)** (ポート) カラムに表示されているリンクをクリックするか、あるいはウェブブラウザーから [http://localhost:8080](https://localhost:8080) にアクセスします。
@z

@x
![Screenshot of the landing page coming from the running container](images/access-the-frontend.webp?border)
@y
![コンテナー起動後に表示される初期ページのスクリーンショット](images/access-the-frontend.webp?border)
@z

@x
### Explore your container
@y
### コンテナーの詳細確認 {#explore-your-container}
@z

@x
Docker Desktop lets you explore and interact with different aspects of your container. Try it out yourself. 
@y
Docker Desktop を使うと、コンテナーのさまざまな情報について確認したり設定を行ったりすることができます。
実際に操作してみます。
@z

@x
1. Go to the **Containers** view in the Docker Dashboard.
@y
1. Docker Dashboard の **Containers** (コンテナー) 画面を開きます。
@z

@x
2. Select your container.
@y
2. 目的のコンテナーを選択します。
@z

@x
3. Select the **Files** tab to explore your container's isolated file system.
@y
3. **Files** (ファイル) タブを選ぶと、そのコンテナー内にて独立するファイルシステムを確認することができます。
@z

@x
    ![Screenshot of the Docker Dashboard showing the files and directories inside a running container](images/explore-your-container.webp?border)
@y
    ![Docker Dashboard のスクリーンショット、実行中コンテナー内のファイルやディレクトリの一覧](images/explore-your-container.webp?border)
@z

@x
### Stop your container
@y
### コンテナーの停止 {#stop-your-container}
@z

@x
The `docker/welcome-to-docker` container continues to run until you stop it. 
@y
起動している `docker/welcome-to-docker` コンテナーは、停止することで止まります。
@z

@x
1. Go to the **Containers** view in the Docker Dashboard.
@y
1. Docker Dashboard の **Containers** (コンテナー) 画面を開きます。
@z

@x
2. Locate the container you'd like to stop.
@y
2. 停止したいコンテナーを選びます。
@z

@x
3. Select the **Stop** action in the **Actions** column.
@y
3. **Actions** (動作) カラムから **Stop** (停止) アクションを選びます。
@z

@x
    ![Screenshot of the Docker Dashboard with the welcome container selected and being prepared to stop](images/stop-your-container.webp?border)
@y
    ![Docker Dashboard のスクリーンショット、選択されている welcome コンテナーが停止されようとしている場面](images/stop-your-container.webp?border)
@z

@x
{{< /tab >}}
{{< tab name="Using the CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI 利用時" >}}
@z

@x
Follow the instructions to run a container using the CLI:
@y
CLI を用いる場合は、以下の手順に従ってコンテナーを起動します。
@z

@x
1. Open your CLI terminal and start a container by using the [`docker run`](/reference/cli/docker/container/run/) command:
@y
1. CLI 端末を開き、[`docker run`](__SUBDIR__/reference/cli/docker/container/run/) コマンドの実行によってコンテナーを起動させます。
@z

% snip command...

@x
    The output from this command is the full container ID. 
@y
    コマンドの出力結果にはコンテナーのフル ID が示されます。
@z

@x
Congratulations! You just fired up your first container! 🎉
@y
おめでとうございます！
初めてのコンテナー起動を行いました！ 🎉
@z

@x
### View your running containers
@y
### 起動中コンテナーの確認 {#view-your-running-containers}
@z

@x
You can verify if the container is up and running by using the [`docker ps`](/reference/cli/docker/container/ls/) command:
@y
コンテナーが起動中であることは [`docker ps`](__SUBDIR__/reference/cli/docker/container/ls/) コマンドを使って確認することができます。
@z

% snip command...

@x
You will see output like the following:
@y
出力結果は以下のようなものとなります。
@z

% snip output...

@x
This container runs a web server that displays a simple website. When working with more complex projects, you'll run different parts in different containers. For example, a different container for the `frontend`, `backend`, and `database`.
@y
このコンテナーはウェブサーバーを起動するものであって、単純なウェブサイトを表示します。
これよりも複雑なプロジェクトで作業する場合には、さまざまなコンテナー内のさまざまな機能を実行することになります。
たとえばフロントエンド、バックエンド、データベースといった用途でコンテナーを動作させることも出てくることでしょう。
@z

@x
> [!TIP]
>
> The `docker ps` command will show you _only_ running containers. To view stopped containers, add the `-a` flag to list all containers: `docker ps -a`
@y
> [!ヒント]
>
> `docker ps` コマンドが表示するのは実行中のコンテナー **のみ** です。
> 停止中のコンテナーも含めて確認するには `-a` フラグを使って `docker ps -a` とします。
> これにより全コンテナーの一覧が得られます。
@z

@x
### Access the frontend
@y
### フロントエンドへのアクセス {#access-the-frontend}
@z

@x
When you launched the container, you exposed one of the container's ports onto your machine. Think of this as creating configuration to let you to connect through the isolated environment of the container. 
@y
コンテナーを起動した際に、コンテナー内のポートをホストマシンに向けて公開していました。
それができるということは、つまり独立したコンテナー環境に対して接続を行う設定ができるということです。
@z

@x
For this container, the frontend is accessible on port `8080`. To open the website, select the link in the **Port(s)** column of your container or visit [http://localhost:8080](http://localhost:8080) in your browser.
@y
このコンテナーはフロントエンドとしてポート `8080` によりアクセスできます。
ウェブサイトを開くには、このコンテナーの **Port(s)** (ポート) カラムに表示されているリンクをクリックするか、あるいはウェブブラウザーから [http://localhost:8080](http://localhost:8080) にアクセスします。
@z

@x
![Screenshot of the landing page of the Nginx web server, coming from the running container](images/access-the-frontend.webp?border)
@y
![コンテナー起動後に表示される初期ページのスクリーンショット](images/access-the-frontend.webp?border)
@z

@x
### Stop your container
@y
### コンテナーの停止 {#stop-your-container}
@z

@x
The `docker/welcome-to-docker` container continues to run until you stop it. You can stop a container using the `docker stop` command.
@y
起動している `docker/welcome-to-docker` コンテナーは、停止することで止まります。
コンテナーの停止は `docker stop` コマンドを使います。
@z

@x
1. Run `docker ps` to get the ID of the container
@y
1. `docker ps` を実行して目的とするコンテナーの ID を得ます。
@z

@x
2. Provide the container ID or name to the [`docker stop`](/reference/cli/docker/container/stop/) command:
@y
2. [`docker stop`](__SUBDIR__/reference/cli/docker/container/stop/) コマンドに対して、コンテナーの ID かあるいは名前を指定します。
@z

% snip command...

@x
> [!TIP]
>
> When referencing containers by ID, you don't need to provide the full ID. You only need to provide enough of the ID to make it unique. As an example, the previous container could be stopped by running the following command:
>
> ```console
> docker stop a1f
> ```
@y
> [!ヒント]
>
> コンテナー ID を用いるにあたっては ID をフルで指定する必要はありません。
> コンテナー ID が唯一のものとして特定できる桁数だけ与えれば充分です。
> たとえば上のコンテナーを停止させるには、おそらく以下のコマンドを使って実現できます。
>
> ```console
> docker stop a1f
> ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
The following links provide additional guidance into containers:
@y
以下に示すリンクでは、コンテナーに関してのガイドとなる情報が示されています。
@z

@x
- [Running a container](/engine/containers/run/)
- [Overview of container](https://www.docker.com/resources/what-container/)
- [Why Docker?](https://www.docker.com/why-docker/)
@y
- [コンテナーの実行](__SUBDIR__/engine/containers/run/)
- [コンテナー概要](https://www.docker.com/resources/what-container/)
- [なぜ Docker?](https://www.docker.com/why-docker/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Now that you have learned the basics of a Docker container, it's time to learn about Docker images.
@y
ここまでに Docker コンテナーの基本について学びました。
次は Docker イメージについて学びましょう。
@z

@x
{{< button text="What is an image?" url="what-is-an-image" >}}
@y
{{< button text="イメージとは?" url="what-is-an-image" >}}
@z
