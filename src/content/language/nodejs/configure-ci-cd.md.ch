%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configure CI/CD for your Node.js application
keywords: ci/cd, github actions, node.js, node
description: Learn how to configure CI/CD using GitHub Actions for your Node.js application.
@y
title: Node.js アプリケーション向けの CI/CD 設定
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
3. Create a new **Repository variable** named `DOCKER_USERNAME` and your Docker ID as value.
@z

@x
4. Create a new [Personal Access Token (PAT)](../../security/for-developers/access-tokens.md/#create-an-access-token) for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
@y
4. Create a new [Personal Access Token (PAT)](../../security/for-developers/access-tokens.md/#create-an-access-token) for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
@z

@x
5. Add the PAT as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@y
5. Add the PAT as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@z

@x
6. In your local repository on your machine, run the following command to change
   the origin to the repository you just created. Make sure you change
   `your-username` to your GitHub username and `your-repository` to the name of
   the repository you created.
@y
6. In your local repository on your machine, run the following command to change
   the origin to the repository you just created. Make sure you change
   `your-username` to your GitHub username and `your-repository` to the name of
   the repository you created.
@z

% snip command...

@x
7. Run the following commands to stage, commit, and push your local repository to GitHub.
@y
7. Run the following commands to stage, commit, and push your local repository to GitHub.
@z

% snip command...

@x
## Step two: Set up the workflow
@y
## Step two: Set up the workflow
@z

@x
Set up your GitHub Actions workflow for building, testing, and pushing the image
to Docker Hub.
@y
Set up your GitHub Actions workflow for building, testing, and pushing the image
to Docker Hub.
@z

@x
1. Go to your repository on GitHub and then select the **Actions** tab.
@y
1. Go to your repository on GitHub and then select the **Actions** tab.
@z

@x
2. Select **set up a workflow yourself**.
@y
2. Select **set up a workflow yourself**.
@z

@x
   This takes you to a page for creating a new GitHub actions workflow file in
   your repository, under `.github/workflows/main.yml` by default.
@y
   This takes you to a page for creating a new GitHub actions workflow file in
   your repository, under `.github/workflows/main.yml` by default.
@z

@x
3. In the editor window, copy and paste the following YAML configuration.
@y
3. In the editor window, copy and paste the following YAML configuration.
@z

% snip code...

@x
   For more information about the YAML syntax for `docker/build-push-action`,
   refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@y
   For more information about the YAML syntax for `docker/build-push-action`,
   refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@z

@x
## Step three: Run the workflow
@y
## Step three: Run the workflow
@z

@x
Save the workflow file and run the job.
@y
Save the workflow file and run the job.
@z

@x
1. Select **Commit changes...** and push the changes to the `main` branch.
@y
1. Select **Commit changes...** and push the changes to the `main` branch.
@z

@x
   After pushing the commit, the workflow starts automatically.
@y
   After pushing the commit, the workflow starts automatically.
@z

@x
2. Go to the **Actions** tab. It displays the workflow.
@y
2. Go to the **Actions** tab. It displays the workflow.
@z

@x
   Selecting the workflow shows you the breakdown of all the steps.
@y
   Selecting the workflow shows you the breakdown of all the steps.
@z

@x
3. When the workflow is complete, go to your
   [repositories on Docker Hub](https://hub.docker.com/repositories).
@y
3. When the workflow is complete, go to your
   [repositories on Docker Hub](https://hub.docker.com/repositories).
@z

@x
   If you see the new repository in that list, it means the GitHub Actions
   successfully pushed the image to Docker Hub.
@y
   If you see the new repository in that list, it means the GitHub Actions
   successfully pushed the image to Docker Hub.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to set up a GitHub Actions workflow for your Node.js application.
@y
In this section, you learned how to set up a GitHub Actions workflow for your Node.js application.
@z

@x
Related information:
 - [Introduction to GitHub Actions](../../build/ci/github-actions/index.md)
 - [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@y
Related information:
 - [Introduction to GitHub Actions](../../build/ci/github-actions/index.md)
 - [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, learn how you can locally test and debug your workloads on Kubernetes before deploying.
@y
Next, learn how you can locally test and debug your workloads on Kubernetes before deploying.
@z

@x
{{< button text="Test your deployment" url="./deploy.md" >}}
@y
{{< button text="Test your deployment" url="./deploy.md" >}}
@z
