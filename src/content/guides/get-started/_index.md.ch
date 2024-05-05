%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__対応

@x
title: Overview of get started
keywords: get started, quick start, intro, concepts
description: Find quick, hands-on guides on containerization concepts and how to use Docker Desktop
@y
title: はじめるにあたって
keywords: get started, quick start, intro, concepts
description: Find quick, hands-on guides on containerization concepts and how to use Docker Desktop
@z

@x
grid:
  - title: "What is a container?"
    link: "/guides/walkthroughs/what-is-a-container/"
    image: "/guides/walkthroughs/images/what-is-a-container.webp"
  - title: "Run a container"
    image: "/guides/walkthroughs/images/how-do-i-run-a-container.webp"
    link: "/guides/walkthroughs/run-a-container/"
  - title: "Run Docker Hub images"
    image: "/guides/walkthroughs/images/run-docker-hub-images.webp"
    link: "/guides/walkthroughs/run-hub-images/"
  - title: "Multi-container apps"
    image: "/guides/walkthroughs/images/multi-container-apps.webp"
    link: "/guides/walkthroughs/multi-container-apps/"
  - title: "Persist container data"
    link: "/guides/walkthroughs/persist-data/"
    image: "/guides/walkthroughs/images/persist-data.webp"
  - title: "Access a local folder"
    link: "/guides/walkthroughs/access-local-folder/"
    image: "/guides/walkthroughs/images/bind-mounts.webp"
  - title: "Containerize your application"
    link: "/guides/walkthroughs/containerize-your-app/"
    image: "/guides/walkthroughs/images/containerize-app.webp"
  - title: "Publish your image to Docker Hub"
    link: "/guides/walkthroughs/publish-your-image/"
    image: "/guides/walkthroughs/images/publish-your-images.webp"
aliases:
- /get-started/hands-on-overview/
---
@y
grid:
  - title: "コンテナーとは何か"
    link: "__SUBDIR__/guides/walkthroughs/what-is-a-container/"
    image: "__SUBDIR__/guides/walkthroughs/images/what-is-a-container.webp"
  - title: "コンテナーの実行"
    image: "__SUBDIR__/guides/walkthroughs/images/how-do-i-run-a-container.webp"
    link: "__SUBDIR__/guides/walkthroughs/run-a-container/"
  - title: "Docker Hub イメージの実行"
    image: "__SUBDIR__/guides/walkthroughs/images/run-docker-hub-images.webp"
    link: "__SUBDIR__/guides/walkthroughs/run-hub-images/"
  - title: "マルチコンテナーアプリ"
    image: "__SUBDIR__/guides/walkthroughs/images/multi-container-apps.webp"
    link: "__SUBDIR__/guides/walkthroughs/multi-container-apps/"
  - title: "コンテナーデータの保存"
    link: "__SUBDIR__/guides/walkthroughs/persist-data/"
    image: "__SUBDIR__/guides/walkthroughs/images/persist-data.webp"
  - title: "ローカルフォルダーへのアクセス"
    link: "__SUBDIR__/guides/walkthroughs/access-local-folder/"
    image: "__SUBDIR__/guides/walkthroughs/images/bind-mounts.webp"
  - title: "アプリケーションのコンテナー化"
    link: "__SUBDIR__/guides/walkthroughs/containerize-your-app/"
    image: "__SUBDIR__/guides/walkthroughs/images/containerize-app.webp"
  - title: "Docker Hub へのイメージ公開"
    link: "__SUBDIR__/guides/walkthroughs/publish-your-image/"
    image: "__SUBDIR__/guides/walkthroughs/images/publish-your-images.webp"
aliases:
- __SUBDIR__/get-started/hands-on-overview/
---
@z

@x
## Quick hands-on guides
@y
## かんたん実践ガイド {#quick-hands-on-guides}
@z

@x
Let these 5-minute hands-on guides show you around Docker Desktop and introduce you to containerization concepts.
@y
5 分程度の各実践ガイドでは Docker Desktop について紹介し、コンテナー化の考え方について説明していきます。
@z

@x
{{< grid cols=2 >}}
@y
{{< grid cols=2 >}}
@z

@x
> **Note**
>
> These hands-on guides are also available as interactive walkthroughs inside
> Docker Desktop's learning center.
@y
> **メモ**
>
> この実践ガイドは Docker Desktop の教育センター内においても、対話的なウォークスルーを通じて利用されています。
@z

@x
## Getting started guide
@y
## ガイドをはじめましょう {#getting-started-guide}
@z

@x
Dive deeper into Docker and containerization concepts in this end-to-end guide.
@y
このガイドをすべて見ていきながら Docker やコンテナー化の概念を深く理解していきましょう。
@z

@x
{{< card
  title="Getting started guide"
  link=/get-started/
  description="A 45-minute guide where you start by containerizing a simple application and then follow along to develop it into a multi-container application."
  icon="/assets/images/rocket.svg"
>}}
@y
{{< card
  title="ガイドをはじめましょう"
  link=/get-started/
  description="この 45 分のガイドは、簡単なアプリケーションをコンテナー化するところから始めて、ガイドに沿ってマルチコンテナーアプリケーションの開発にまで進みます。"
  icon="__SUBDIR__/assets/images/rocket.svg"
>}}
@z
