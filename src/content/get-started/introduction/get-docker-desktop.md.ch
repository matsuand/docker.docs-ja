%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Get Docker Desktop 
keywords: concepts, container, docker desktop
description: This concept page will teach you download Docker Desktop and install it on Windows, Mac, and Linux
@y
title: Docker Desktop の入手
keywords: concepts, container, docker desktop
description: This concept page will teach you download Docker Desktop and install it on Windows, Mac, and Linux
@z

% snip youbute...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Docker Desktop is the all-in-one package to build images, run containers, and so much more.
This guide will walk you through the installation process, enabling you to experience Docker Desktop firsthand.
@y
Docker Desktop は、イメージビルド、コンテナー実行など数々のことを実現するオールインワンのパッケージです。
本ガイドではそのインストール手順を説明し、初めての Docker Desktop 体験を進めていきます。
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid subscription](https://www.docker.com/pricing/?_gl=1*1nyypal*_ga*MTYxMTUxMzkzOS4xNjgzNTM0MTcw*_ga_XJWPQMJYHQ*MTcxNjk4MzU4Mi4xMjE2LjEuMTcxNjk4MzkzNS4xNy4wLjA.).
@y
> **Docker Desktop 契約条項**
>
> より大きなエンタープライズ向け（従業員 250 名以上、あるいは年間収益 1 千万 US ドル以上）に Docker Desktop を商用利用する場合は [有償サブスクリプション](https://www.docker.com/pricing/?_gl=1*1nyypal*_ga*MTYxMTUxMzkzOS4xNjgzNTM0MTcw*_ga_XJWPQMJYHQ*MTcxNjk4MzU4Mi4xMjE2LjEuMTcxNjk4MzkzNS4xNy4wLjA.) が必要です。
@z

@x
{{< card
  title="Docker Desktop for Mac"
  description="[Download (Apple Silicon)](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64) | [Download (Intel)](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64) | [Install instructions](/desktop/install/mac-install)"
  icon="/assets/images/apple_48.svg" >}}
@y
{{< card
  title="Docker Desktop for Mac"
  description="[ダウンロード (Apple Silicon)](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64) | [ダウンロード (Intel)](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64) | [インストール手順](__SUBDIR__/desktop/install/mac-install)"
  icon="__SUBDIR__/assets/images/apple_48.svg" >}}
@z

@x
{{< card
  title="Docker Desktop for Windows"
  description="[Download](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-windows) | [Install instructions](/desktop/install/windows-install)"
  icon="/assets/images/windows_48.svg" >}}
@y
{{< card
  title="Docker Desktop for Windows"
  description="[ダウンロード](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-windows) | [インストール手順](__SUBDIR__/desktop/install/windows-install)"
  icon="__SUBDIR__/assets/images/windows_48.svg" >}}
@z

@x
{{< card
  title="Docker Desktop for Linux"
  description="[Install instructions](/desktop/install/linux-install/)"
  icon="/assets/images/linux_48.svg" >}}
@y
{{< card
  title="Docker Desktop for Linux"
  description="[インストール手順](__SUBDIR__/desktop/install/linux-install/)"
  icon="__SUBDIR__/assets/images/linux_48.svg" >}}
@z

@x
Once it's installed, complete the setup process and you're all set to run a Docker container.
@y
インストールとセットアップを終えれば、Docker コンテナー実行の準備は完了です。
@z

@x
## Try it out
@y
## 試してみよう {#try-it-out}
@z

@x
In this hands-on guide, you will see how to run a Docker container using Docker Desktop.
@y
このハンズオンガイドでは、Docker Desktop を使った Docker コンテナーの実行方法を見ていきます。
@z

@x
Follow the instructions to run a container using the CLI.
@y
CLI を使った以下の命令によりコンテナーを起動します。
@z

@x
## Run your first container
@y
## はじめてのコンテナー実行 {#run-your-first-container}
@z

@x
Open your CLI terminal and start a container by running the `docker run` command:
@y
CLI 端末を開きます。
そして `docker run` というコマンドを実行してコンテナーを起動します。
@z

% snip command...

@x
## Access the frontend
@y
## フロントエンドへのアクセス {#access-the-frontend}
@z

@x
For this container, the frontend is accessible on port `8080`. To open the website, visit [http://localhost:8080](http://localhost:8080) in your browser.
@y
このコンテナーのフロントエンドへは、ポート `8080` からアクセスできます。
ブラウザーを開いて [http://localhost:8080](http://localhost:8080) にアクセスしてください。
@z

@x
![Screenshot of the landing page of the Nginx web server, coming from the running container](../docker-concepts/the-basics/images/access-the-frontend.webp?border=true)
@y
![実行コンテナーが提供する Nginx ウェブサーバーの初期ページのスクリーンショット](../docker-concepts/the-basics/images/access-the-frontend.webp?border=true)
@z

@x
## Manage containers using Docker Desktop
@y
## Docker Desktop を使ったコンテナー管理 {#manage-containers-using-docker-desktop}
@z

@x
1. Open Docker Desktop and select the **Containers** field on the left sidebar.
2. You can view information about your container including logs, and files, and even access the shell by selecting the **Exec** tab.
@y
1. Docker Desktop を開き、左側サイドバーにある **Containers** (コンテナー) を選びます。
2. そこではコンテナーについての情報としてログやファイルなどが確認できます。
   また **Exec** (実行) タブを選べばシェルにアクセスすることもできます。
@z

@x
   ![Screenshot of exec into the running container in Docker Desktop](images/exec-into-docker-container.webp?border=true)
@y
   ![Docker Desktop 上から実行コンテナーへの exec 実行のスクリーンショット](images/exec-into-docker-container.webp?border=true)
@z

@x
3. Select the **Inspect** field to obtain detailed information about the container. You can perform various actions such as pause, resume, start or stop containers, or explore the **Logs**, **Bind mounts**, **Exec**, **Files**, and **Stats** tabs.
@y
3. **Inspect** (詳細確認) 欄を選び、コンテナーについての詳細な情報を確認します。
   ここではコンテナーの一時停止、再開、起動、停止といったさまざまな指示を行うことができ、また **Logs** (ログ)、**Bind mounts** (バインドマウント)、**Exec** (実行)、**Files** (ファイル)、**Stats**  (状態) といったタブを利用することができます。
@z

@x
![Screenshot of inspecting the running container in Docker Desktop](images/inspecting-container.webp?border=true)
@y
![Screenshot of inspecting the running container in Docker Desktop](images/inspecting-container.webp?border=true)
@z

@x
Docker Desktop simplifies container management for developers by streamlining the setup, configuration, and compatibility of applications across different environments, thereby addressing the pain points of environment inconsistencies and deployment challenges.
@y
開発者は、さまざまな環境に対するアプリケーションのセットアップ、設定、互換性の維持などを行っています。
Docker Desktop を使えば、そういった作業を合理的に簡素化します。
そして環境において発生する矛盾やデプロイ作業への対処を行います。
@z

@x
## What's next?
@y
## 次は何？ {#whats-next}
@z

@x
Now that you have Docker Desktop installed and ran your first container, it's time to start developing with containers.
@y
Docker Desktop のインストールを行い、初めてのコンテナー実行を行いました。
次はコンテナー開発に進んでいきます。
@z

@x
{{< button text="Develop with containers" url="develop-with-containers" >}}
@y
{{< button text="コンテナーを使った開発" url="develop-with-containers" >}}
@z
