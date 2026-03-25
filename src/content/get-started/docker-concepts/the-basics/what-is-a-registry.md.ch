%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: What is a registry?
@y
title: レジストリとは？
@z

@x
keywords: concepts, build, images, container, docker desktop
description: What is a registry? This Docker Concept will explain what a registry is, explore their interoperability, and have you interact with registries.
@y
keywords: concepts, build, images, container, docker desktop
description: レジストリとは何か？ Docker の考え方ではレジストリとは何か、その利用方法、レジストリとの対話方法を説明します。
@z

% snip youtube...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Now that you know what a container image is and how it works, you might wonder - where do you store these images? 
@y
ここまでにコンテナーイメージが何であって、どのように動作するのかを理解しました。
そこで疑問に思うかもしれません。
そのイメージはどこに保存されているのだろうと。
@z

@x
Well, you can store your container images on your computer system, but what if you want to share them with your friends or use them on another machine? That's where the image registry comes in.
@y
コンテナーイメージは手元のコンピューターシステムに保存できます。
しかし友人とそれを共有したいと考えたり、別のマシンでも利用したいと思った場合にはどうしますか？
そういったときにレジストリの出番となります。
@z

@x
An image registry is a centralized location for storing and sharing your container images. It can be either public or private. [Docker Hub](https://hub.docker.com) is a public registry that anyone can use and is the default registry. 
@y
イメージレジストリは、コンテナーイメージを保存し共有するための場所です。
それをパブリックにもプライベートにもできます。
[Docker Hub](https://hub.docker.com) がまさにパブリックなレジストリであり、誰でも利用できるデフォルトのレジストリです。
@z

@x
While Docker Hub is a popular option, there are many other available container registries available today, including [Amazon Elastic Container Registry (ECR)](https://aws.amazon.com/ecr/), [Azure Container Registry (ACR)](https://azure.microsoft.com/en-in/products/container-registry), and [Google Container Registry (GCR)](https://cloud.google.com/artifact-registry). You can even run your private registry on your local system or inside your organization. For example, Harbor, JFrog Artifactory, GitLab Container registry etc.
@y
Docker Hub がもっとも人気のあるレジストリですが、利用可能なコンテナーレジストリは他にもいろいろとあります。
[Amazon Elastic Container Registry (ECR)](https://aws.amazon.com/ecr/)、[Azure Container Registry (ACR)](https://azure.microsoft.com/en-in/products/container-registry)、[Google Container Registry (GCR)](https://cloud.google.com/artifact-registry) といったものです。
またローカルマシンや組織内部にプライベートなレジストリを立ち上げることもできます。
たとえば Harbor、JFrog Artifactory、GitLab Container registry などがあります。
@z

@x
### Registry vs. repository
@y
### レジストリ 対 リポジトリ {#registry-vs-repository}
@z

@x
While you're working with registries, you might hear the terms _registry_ and _repository_ as if they're interchangeable. Even though they're related, they're not quite the same thing.
@y
レジストリを使った作業をしていると、**レジストリ** と **リポジトリ** という用語がどちらも同じものと思ってくるかもしれません。
確かに両者には関係がありますが、まるで違うものです。
@z

@x
A _registry_ is a centralized location that stores and manages container images, whereas a _repository_ is a collection of related container images within a registry. Think of it as a folder where you organize your images based on projects. Each repository contains one or more container images.
@y
**レジストリ** (registry) はコンテナーイメージを保存して管理するための中心的な場所のことです。
一方 **リポジトリ** (repository) はレジストリ内における関連コンテナーイメージの集合体のことです。
プロジェクトにおいて管理するイメージ収容フォルダーとして考えてみてください。
各リポジトリには 1 つあるいは複数のイメージが含まれます。
@z

@x
The following diagram shows the relationship between a registry, repositories, and images.
@y
以下の図は、レジストリ、リポジトリ、イメージの関係を示すものです。
@z

% snip text...

@x
> [!TIP]
>
>A Docker Personal plan gives you one private repository and unlimited public repositories. To get unlimited private repositories, upgrade to the [Docker Team plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsConceptsRegistry).
@y
> [!TIP]
>
>Docker Personal プランでは 1 つのプライベートリポジトリと無制限のパブリックリポジトリが提供されます。プライベートリポジトリ数を無制限にするには [Docker Team プラン](https://www.docker.com/pricing?ref=Docs&refAction=DocsConceptsRegistry) にアップグレードする必要があります。
@z

@x
## Try it out
@y
## ためしてみよう {#try-it-out}
@z

@x
In this hands-on, you will learn how to build and push a Docker image to the Docker Hub repository.
@y
このチュートリアルでは、ビルドした Docker イメージを Docker Hub レポジトリに対してプッシュする方法について学んでいきます。
@z

@x
### Sign up for a free Docker account
@y
### 無償 Docker アカウントのサインアップ {#sign-up-for-a-free-docker-account}
@z

@x
1. If you haven't created one yet, head over to the [Docker Hub](https://hub.docker.com) page to sign up for a new Docker account. Be sure to finish the verification steps sent to your email.
@y
1. まだ Docker アカウントを生成していない場合は、[Docker Hub](https://hub.docker.com) ページにアクセスして、新規の Docker アカウントをサインアップします。
   メールに送信された認証手順を必ず完了してください。
@z

@x
    ![Screenshot of the official Docker Hub page showing the Sign up page](images/dockerhub-signup.webp?border)
@y
    ![公式 Docker Hub でのサインアップページのスクリーンショット](./images/dockerhub-signup.webp?border)
@z

@x
    You can use your Google or GitHub account to authenticate.
@y
    認証にあたっては Google アカウントや GitHub アカウントを利用することもできます。
@z

@x
### Create your first repository
@y
### はじめてのリポジトリ生成 {#create-your-first-repository}
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select the **Create repository** button in the top-right corner.
3. Select your namespace (most likely your username) and enter `docker-quickstart` as the repository name.
@y
1. [Docker Hub](https://hub.docker.com) にサインインします。
2. 右上の **Create repository** (リポジトリ生成) ボタンを選択します。
3. 名前空間 (たいていは自身のユーザー名) を選択し、リポジトリ名として `docker-quickstart` を入力します。
@z

@x
    ![Screenshot of the Docker Hub page that shows how to create a public repository](images/create-hub-repository.webp?border)
@y
    ![公式 Docker Hub での新規パブリックリポジトリの生成方法を示すスクリーンショット](images/create-hub-repository.webp?border)
@z

@x
4. Set the visibility to **Public**. 
5. Select the **Create** button to create the repository.
@y
4. visibility (可視性) を **Public** (パブリック) に設定します。
5. **Create** (生成) ボタンをクリックしてリポジトリを生成します。
@z

@x
That's it. You've successfully created your first repository. 🎉
@y
やりました。
はじめてのリポジトリ生成が成功しました 🎉
@z

@x
This repository is empty right now. You'll now fix this by pushing an image to it.
@y
今の時点でこのリポジトリは空です。
ここにイメージをプッシュして作り上げていきます。
@z

@x
### Sign in with Docker Desktop
@y
### Docker Desktop を使ったサインイン {#sign-in-with-docker-desktop}
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop, if not already installed.
2. In the Docker Desktop GUI, select the **Sign in** button in the top-right corner
@y
1. Docker Desktop をまだインストールしていない場合は [ダウンロードおよびインストール](https://www.docker.com/products/docker-desktop/) します。
2. Docker Desktop の GUI 画面の右上にある **Sign in** (サインイン) ボタンをクリックします。
@z

@x
### Clone sample Node.js code
@y
### Node.js サンプルコードのクローン {#clone-sample-nodejs-code}
@z

@x
In order to create an image, you first need a project. To get you started quickly, you'll use a sample Node.js project found at [github.com/dockersamples/helloworld-demo-node](https://github.com/dockersamples/helloworld-demo-node). This repository contains a pre-built Dockerfile necessary for building a Docker image.
@y
イメージを生成するためには、プロジェクトの生成が必要です。
すぐにはじめようとするなら、 [github.com/dockersamples/helloworld-demo-node](https://github.com/dockersamples/helloworld-demo-node) にある Node.js のサンプルプロジェクトを利用する方法があります。
このリポジトリには Docker イメージの生成に必要となる Dockerfile がすでに用意されています。
@z

@x
Don't worry about the specifics of the Dockerfile, as you'll learn about that in later sections.
@y
その Dockerfile の中身については気にかける必要はありません。
その内容は後の節において学んでいきます。
@z

@x
1. Clone the GitHub repository using the following command:
@y
1. 以下のコマンドを使って GitHub リポジトリをクローンします。
@z

% snip command...

@x
2. Navigate into the newly created directory.
@y
2. 新規に生成されたディレクトリに移動します。
@z

% snip command...

@x
3. Run the following command to build a Docker image, swapping out `YOUR_DOCKER_USERNAME` with your username.
@y
3. 以下のコマンドを実行して Docker イメージをビルドします。
   `YOUR_DOCKER_USERNAME` の部分は自身のユーザー名に置き換えてください。
@z

% snip command...

@x
    > [!NOTE]
    >
    > Make sure you include the dot (.) at the end of the `docker build` command. This tells Docker where to find the Dockerfile.
@y
    > [!NOTE]
    >
    > `docker build` コマンドの最後にドット (.) があることを忘れないでください。
    > これは Docker に対して Dockerfile を探し出す場所を指定するものです。
@z

@x
4. Run the following command to list the newly created Docker image:
@y
4. 以下のコマンドを実行して、新たに生成された Docker イメージを一覧表示します。
@z

% snip command...

@x
    You will see output like the following:
@y
    以下のような出力が得られるはずです。
@z

% snip output...

@x
5. Start a container to test the image by running the following command (swap out the username with your own username):
@y
5. イメージの内容を確認するため、以下のコマンドを実行してコンテナーを起動します。
   (ユーザー名部分は自身のものに置き換えます。)
@z

% snip command...

@x
    You can verify if the container is working by visiting [http://localhost:8080](http://localhost:8080) with your browser.
@y
    コンテナーが動作しているかどうかを確認するには、ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスします。
@z

@x
6. Use the [`docker tag`](/reference/cli/docker/image/tag/) command to tag the Docker image. Docker tags allow you to label and version your images. 
@y
6. [`docker tag`](__SUBDIR__/reference/cli/docker/image/tag/) コマンドを使って Docker イメージにタグづけを行います。
   Docker タグは、イメージに対してラベルやバージョンをつけるものです。
@z

% snip command...

@x
7. Finally, it's time to push the newly built image to your Docker Hub repository by using the [`docker push`](/reference/cli/docker/image/push/) command:
@y
7. 以上により Docker Hub リポジトリに対して、新規ビルドしたイメージをプッシュする準備が整ったので、[`docker push`](__SUBDIR__/reference/cli/docker/image/push/) コマンドを実行します。
@z

% snip command...

@x
8. Open [Docker Hub](https://hub.docker.com) and navigate to your repository. Navigate to the **Tags** section and see your newly pushed image.
@y
8. [Docker Hub](https://hub.docker.com) にアクセスして、自身のリポジトリ画面を開きます。
   **Tags** (タグ) セクションへ進み、新たにプッシュされたイメージを確認します。
@z

@x
    ![Screenshot of the Docker Hub page that displays the newly added image tag](images/dockerhub-tags.webp?border=true) 
@y
    ![公式 Docker Hub にて新規追加したイメージタグが表示されたスクリーンショット](images/dockerhub-tags.webp?border=true) 
@z

@x
In this walkthrough, you signed up for a Docker account, created your first Docker Hub repository, and built, tagged, and pushed a container image to your Docker Hub repository.
@y
このウォークスルーを通じて Docker アカウントにサインアップし、Docker Hub に新規にリポジトリを生成しました。
そしてコンテナーイメージのビルド、タグづけを行って Docker Hub リポジトリにプッシュしました。
@z

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
- [Docker Hub Quickstart](/docker-hub/quickstart/)
- [Manage Docker Hub Repositories](/docker-hub/repos/)
@y
- [Docker Hub クィックスタート](__SUBDIR__/docker-hub/quickstart/)
- [Docker Hub リポジトリの管理](__SUBDIR__/docker-hub/repos/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Now that you understand the basics of containers and images, you're ready to learn about Docker Compose.
@y
コンテナーとイメージについての基本は理解できました。
次に学ぶのは Docker Compose です。
@z

@x
{{< button text="What is Docker Compose?" url="what-is-Docker-Compose" >}}
@y
{{< button text="Docker Compose とは?" url="what-is-Docker-Compose" >}}
@z
