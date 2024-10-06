%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configure CI/CD for your Node.js application
linkTitle: Configure CI/CD
@y
title: Node.js アプリケーション向けの CI/CD 設定
linkTitle: CI/CD の設定
@z

@x
keywords: ci/cd, github actions, node.js, node
description: Learn how to configure CI/CD using GitHub Actions for your Node.js application.
@y
keywords: ci/cd, github actions, node.js, node
description: Learn how to configure CI/CD using GitHub Actions for your Node.js application.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
@y
[Node.js アプリケーションのコンテナー化](containerize.md) から始まる、ここまでのガイドすべてを終えていること。
本節を進めるには [GitHub](https://github.com/signup) アカウントと [Docker](https://hub.docker.com/signup) アカウントを持っていることが必要です。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up and use GitHub Actions to build and test your Docker image as well as push it to Docker Hub. You will complete the following steps:
@y
本節では GitHub アクションを利用した CI/CD パイプラインの設定と利用方法について学び、Docker イメージのビルドとテストを行った上で Docker Hub へのプッシュを行います。
これより以下の手順を進めます。
@z

@x
1. Create a new repository on GitHub.
2. Define the GitHub Actions workflow.
3. Run the workflow.
@y
1. GitHub 上に新たなリポジトリを生成します。
2. GitHub アクションワークフローを定義します。
3. ワークフローを実行します。
@z

@x
## Step one: Create the repository
@y
## 手順1: リポジトリの生成 {#step-one-create-the-repository}
@z

@x
Create a GitHub repository, configure the Docker Hub credentials, and push your source code.
@y
GitHub リポジトリの生成、Docker Hub 機密情報の設定、ソースコードのプッシュを行います。
@z

@x
1. [Create a new repository](https://github.com/new) on GitHub.
@y
1. GitHub 上に [新たなリポジトリを生成](https://github.com/new) します。
@z

@x
2. Open the repository **Settings**, and go to **Secrets and variables** >
   **Actions**.
@y
2. リポジトリの **Settings** (設定) を開き、**Secrets and variables** > **Actions** に進みます。
@z

@x
3. Create a new **Repository variable** named `DOCKER_USERNAME` and your Docker ID as value.
@y
3. **Repository variable** (リポジトリ変数) として新たに `DOCKER_USERNAME` という名前の変数を生成します。
   その変数値にはご自身の Docker ID を設定します。
@z

@x
4. Create a new [Personal Access Token (PAT)](/manuals/security/for-developers/access-tokens.md#create-an-access-token) for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
@y
4. Docker Hub に対する新たな [パーソナルアクセストークン (Personal Access Token; PAT)](manuals/security/for-developers/access-tokens.md#create-an-access-token) を生成します。
   このトークンの名前を `docker-tutorial` とします。
   アクセス権限は読み書き可能としてください。
@z

@x
5. Add the PAT as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@y
5. GitHub リポジトリにおいて、この PAT を **Repository secret** (リポジトリの機密情報) として追加します。
   その名前を `DOCKERHUB_TOKEN` とします。
@z

@x
6. In your local repository on your machine, run the following command to change
   the origin to the repository you just created. Make sure you change
   `your-username` to your GitHub username and `your-repository` to the name of
   the repository you created.
@y
6. 手元のマシン上にあるローカルリポジトリにおいて以下のコマンドを実行し、ここで生成した新たなリポジトリを origin として設定します。
   なお `your-username` は自身の GitHub ユーザー名に、また `your-repository` は生成したリポジトリ名としてください。
@z

% snip command...

@x
7. Run the following commands to stage, commit, and push your local repository to GitHub.
@y
7. 以下のコマンドを実行して、ローカルリポジトリの内容を GitHub に対してステージング、コミット、プッシュを行います。
@z

% snip command...

@x
## Step two: Set up the workflow
@y
## 手順 2: ワークフローの設定 {#step-one-create-the-repository}
@z

@x
Set up your GitHub Actions workflow for building, testing, and pushing the image
to Docker Hub.
@y
イメージのビルド、テスト、Docker Hub へのプッシュを行う GitHub アクションワークフローを設定します。
@z

@x
1. Go to your repository on GitHub and then select the **Actions** tab.
@y
1. GitHub 上の対象リポジトリにアクセスして **Actions** (アクション) タブを選びます。
@z

@x
2. Select **set up a workflow yourself**.
@y
2. **set up a workflow yourself** (ワークフローの独自設定) を選びます。
@z

@x
   This takes you to a page for creating a new GitHub actions workflow file in
   your repository, under `.github/workflows/main.yml` by default.
@y
   これを選ぶと、リポジトリ内に GitHub アクションワークフロー用のファイルを生成するためのページが開きます。
   そのファイル名はデフォルトでは `.github/workflows/main.yml` となっています。
@z

@x
3. In the editor window, copy and paste the following YAML configuration.
@y
3. 編集ウィンドウにおいて、以下に示す YAML 設定をコピーペーストします。
@z

% snip code...

@x
   For more information about the YAML syntax for `docker/build-push-action`,
   refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@y
   `docker/build-push-action` の YAML 文法についての詳細は [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md) を参照してください。
@z

@x
## Step three: Run the workflow
@y
## 手順 3: ワークフローの実行 {#step-three-run-the-workflow}
@z

@x
Save the workflow file and run the job.
@y
ワークフローファイルを保存してジョブ実行します。
@z

@x
1. Select **Commit changes...** and push the changes to the `main` branch.
@y
1. **Commit changes...** (変更のコミット) を選んで、変更内容を `main` ブランチにプッシュします。
@z

@x
   After pushing the commit, the workflow starts automatically.
@y
   コミット内容をプッシュすると、ワークフローが自動的に実行されます。
@z

@x
2. Go to the **Actions** tab. It displays the workflow.
@y
2. **Actions** (アクション) タブに進み、ワークフローを表示します。
@z

@x
   Selecting the workflow shows you the breakdown of all the steps.
@y
   ワークフローを選ぶと、すべてのステップを確認することができます。
@z

@x
3. When the workflow is complete, go to your
   [repositories on Docker Hub](https://hub.docker.com/repositories).
@y
3. ワークフローが終了したら、ご自身の [Docker Hub のリポジトリ](https://hub.docker.com/repositories) にアクセスします。
@z

@x
   If you see the new repository in that list, it means the GitHub Actions
   successfully pushed the image to Docker Hub.
@y
   その一覧リスト内に新たなリポジトリ名があれば、GitHub アクションによる Docker Hub へのイメージプッシュが成功したことを意味しています。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to set up a GitHub Actions workflow for your Node.js application.
@y
本節では、Node.js アプリケーションに対する GitHub アクションワークフローの設定方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Introduction to GitHub Actions](/manuals/build/ci/github-actions/_index.md)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@y
- [GitHub アクション導入](manuals/build/ci/github-actions/_index.md)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Next, learn how you can locally test and debug your workloads on Kubernetes before deploying.
@y
次はデプロイを行う前に、Kubernetes 上でのローカルなテストとデバッグ方法について学びます。
@z
