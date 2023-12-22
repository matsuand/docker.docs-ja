%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Run Docker Hub images
keywords: get started, quick start, intro, concepts
description: Learn how to run Docker Hub images
aliases:
- /get-started/run-docker-hub-images/
---
@y
---
title: Docker Hub イメージの実行
keywords: get started, quick start, intro, concepts
description: Learn how to run Docker Hub images
aliases:
- /get-started/run-docker-hub-images/
---
@z

@x
You can share and store images in Docker Hub
([http://hub.docker.com](http://hub.docker.com)). Docker Hub has over 100,000
images created by developers that you can run locally. You can search for Docker
Hub images and run them directly from Docker Desktop.
@y
イメージを共有し保存するものとして Docker Hub([http://hub.docker.com](http://hub.docker.com)) があります。
Docker Hub には 100,000 にもおよぶイメージが開発者たちによって作られているので、ローカル環境でそれを実行することができます。
Docker Desktop を使えば、Docker Hub イメージを検索し、それを直接実行することができます。
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Search for the image
@y
## 手順 1: イメージの検索 {#step-1-search-for-the-image}
@z

@x
You can search for Docker Hub images on Docker Desktop. To search for the image used in this walkthrough:
@y
Docker Hub イメージは Docker Desktop を使って検索することができます。
このウォークスルーで利用するイメージを検索するには、以下を行います。
@z

@x
1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search.
@y
1. Docker Desktop を開いて検索欄をクリックします。
2. 検索欄に `docker/welcome-to-docker` を入力します。
@z

@x
![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)
@y
![Docker Desktop 上での welcome-to-docker イメージの検索](images/getting-started-search.webp?w=650&border=true)
@z

@x
## Step 2: Run the image
@y
## 手順 2: イメージの実行 {#step-2-run-the-image}
@z

@x
To run the `docker/welcome-to-docker` image:
@y
`docker/welcome-to-docker` イメージを実行するには、以下を行います。
@z

@x
1. After finding the image using search, select **Run**.
2. Expand the **Optional settings**.
3. In **Host port**, specify `8090`.
   ![Specifying host port 8090](images/getting-started-run.webp?w=500&border=true)
4. Select **Run**.
@y
1. 検索欄を使ってイメージを検索したら、**Run** をクリックします。
2. **Optional settings**（オプション選択）を展開します。
3. **Host port**（ホストポート欄）に `8090` を入力します。
   ![ホストポート 8090 の指定](images/getting-started-run.webp?w=500&border=true)
4. **Run** をクリックします。
@z

@x
> **Note**
>
> Many images hosted on Docker Hub have a description that highlights what
> settings must be set in order to run them. You can read the description for
> the image on Docker Hub by selecting the image name in the search or by
> searching for the image directly on
> [https://hub.docker.com](https://hub.docker.com).
@y
> **メモ**
>
> Docker Hub にホストされている多くのイメージでは、実行にあたってどのような設定を行うべきかが説明されています。
> Docker Hub イメージに対するそういった説明は、検索欄のイメージ名を選択するか、あるいは [https://hub.docker.com](https://hub.docker.com) を直接検索することによって参照できます。
@z

@x
## Step 3: Explore the container
@y
## 手順 3: コンテナーの確認 {#step-3-explore-the-container}
@z

@x
That's it! The container is ready to use. Go to the **Containers** tab in Docker Desktop to view the container.
@y
出てきました！
コンテナーが利用可能となっています。
Docker Desktop 上の **Containers**（コンテナー）タブを開いて、コンテナーを確認します。
@z

@x
![Viewing the Containers tab in Docker Desktop](images/getting-started-view.webp?border=true)
@y
![Docker Desktop のコンテナータブからの確認](images/getting-started-view.webp?border=true)
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you searched for an image on Docker Hub and ran it as a container. Docker Hub has over 100,000 more images that you can use to help build your own application.
@y
このウォークスルーでは、Docker Hub からイメージを検索して、それをコンテナーとして実行しました。
Docker Hub には 100,000 におよぶイメージがあり、自分が作り出すアプリケーションの構築に利用することができます。
@z

@x
Related information:
@y
関連情報
@z

@x
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Explore more images on [Docker Hub](https://hub.docker.com)
@y
- 詳しくは [Docker マニュアル](__SUBDIR__/docker-hub/) を参照してください。
- イメージを詳しく確認するには [Docker Hub](https://hub.docker.com) を参照してください。
@z

@x
## Next steps
@y
## 次のステップ {#next-step}
@z

@x
Continue to the next walkthrough to learn how you can use Docker to run
multi-container applications.
@y
次のウォークスルーに進んでください。
Docker を使ってマルチコンテナーアプリを実行する方法について学びます。
@z

@x
{{< button url="./multi-container-apps.md" text="Run multi-container apps" >}}
@y
{{< button url="./multi-container-apps.md" text="マルチコンテナーアプリの実行" >}}
@z
