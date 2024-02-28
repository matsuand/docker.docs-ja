%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Publish your image
keywords: get started, quick start, intro, concepts
description: Learn how to publish your image to Docker Hub
@y
title: イメージの公開
keywords: get started, quick start, intro, concepts
description: Docker Hub へのイメージ公開方法について学びます。
@z

@x
Follow this walkthrough to learn how to publish and share your images on Docker Hub.
@y
このウォークスルーを通じて、Docker Hub 上にイメージを公開して共有する方法について学びます。
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Get the example image
@y
## 手順 1: サンプルイメージの入手 {#step-1-get-the-example-image}
@z

@x
To get the example image:
@y
以下を行ってサンプルイメージを入手します。
@z

@x
1. In Docker Desktop, select the search bar.
2. In the search bar, specify `docker/welcome-to-docker`.
3. Select **Pull** to pull the image from Docker Hub to your computer.
@y
1. Docker Desktop 画面にて検索バーをクリックします。
2. 検索欄に `docker/welcome-to-docker` と入力します。
3. **Pull** をクリックすることで、Docker Hub から手元のコンピューターに向けてイメージがプルされます。
@z

@x
![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)
@y
![Docker Desktop 画面から welcome-to-docker イメージの検索](images/getting-started-search.webp?w=650&border=true)
@z

@x
## Step 2: Sign in to Docker
@y
## 手順 2: Docker へのサインイン {#step-2-sign-in-to-docker}
@z

@x
Select **Sign in** on the top-right of Docker Desktop to either sign in or create a new Docker account.
@y
Docker Desktop 画面の右上にある **Sign in** (サインイン) をクリックして、サインインを行うか、あるいは Docker アカウントを新規に生成します。
@z

@x
![Signing in to Docker Desktop](images/getting-started-signin.webp?w=300&border=true)
@y
![Docker Desktop へのサインイン](images/getting-started-signin.webp?w=300&border=true)
@z

@x
## Step 3: Rename your image
@y
## 手順 3: イメージ名の変更 {#step-3-rename-your-image}
@z

@x
Before you can publish your image, you need to rename it so that Docker Hub knows that the image is yours. In a terminal, run the following command to rename your image. Replace `YOUR-USERNAME` with your Docker ID.
@y
これからイメージを公開していきますが、その前にイメージ名を変更することが必要です。
Docker Hub に対してそのイメージがあなたのものであることを伝えるためです。
端末画面にて以下のコマンドを実行して、イメージ名を変更します。
`YOUR-USERNAME` の部分は、ご自身の Docker ID に置き換えてください。
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ docker tag docker/welcome-to-docker YOUR-USERNAME/welcome-to-docker
```
@y
```console
$ docker tag docker/welcome-to-docker YOUR-USERNAME/welcome-to-docker
```
@z

@x
## Step 4: Push your image to Docker Hub
@y
## Step 4: Docker Hub へのイメージ公開 {#step-4-push-your-image-to-docker-hub}
@z

@x
To push your image to Docker Hub:
@y
以下により Docker Hub へのイメージのプッシュを行います。
@z

@x
1. In Docker Desktop, go to the **Images** tab
2. In the **Actions** column for your image, select the **Show image actions** icon.
3. Select **Push to Hub**.
@y
1. Docker Desktop 画面にて **Images** (イメージ) タブを開きます。
2. 対象イメージの **Actions** (アクション) カラムから、**Show image actions** (イメージアクションの表示) アイコンをクリックします。
3. **Push to Hub** (Hub への公開) をクリックします。
@z

@x
![Pushing an image to Docker Hub](images/getting-started-push.webp?border=true)
@y
![Docker Hub へのイメージのプッシュ](images/getting-started-push.webp?border=true)
@z

@x
Go to [Docker Hub](https://hub.docker.com)⁠ and verify that the list of your repositories now contains `YOUR-USERNAME/welcome-to-docker`.
@y
[Docker Hub](https://hub.docker.com) にアクセスして、自分のリポジトリ内を確認します。
そこには `YOUR-USERNAME/welcome-to-docker` が含まれているはずです。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you pushed and shared an image on Docker Hub.
@y
このウォークスルーでは、Docker Hub にイメージをプッシュして共有することを行いました。
@z

@x
Related information:
@y
関連情報
@z

@x
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Learn more about the [docker tag](../../reference/cli/docker/image/tag.md)
  command
@y
- より詳しくは [Docker Hub マニュアル](../../docker-hub/_index.md) を確認してください。
- [docker tag](../../reference/cli/docker/image/tag.md) コマンドを確認してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Continue to the language-specific guides to learn how you can use Docker to containerize and develop applications in your favorite language. Choose one of the following guides.
@y
この先はプログラミング言語の特化したガイドを通じて、その言語に基づくアプリケーションのコンテナー化と開発を Docker にて行う方法について学んでください。
以下のいずれかのガイドを選んでください。
@z

@x
- [C# (.NET)](../../language/dotnet/_index.md)
- [Go](../../language/golang/_index.md)
- [Java](../../language/java/_index.md)
- [Node.js](../../language/nodejs/_index.md)
- [PHP](../../language/php/_index.md)
- [Python](../../language/python/_index.md)
- [Rust](../../language/rust/_index.md)
@y
- [C# (.NET)](../../language/dotnet/_index.md)
- [Go](../../language/golang/_index.md)
- [Java](../../language/java/_index.md)
- [Node.js](../../language/nodejs/_index.md)
- [PHP](../../language/php/_index.md)
- [Python](../../language/python/_index.md)
- [Rust](../../language/rust/_index.md)
@z
