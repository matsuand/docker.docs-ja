%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Introduction to GitHub Actions
linkTitle: GitHub Actions
@y
title: GitHub Actions について
linkTitle: GitHub Actions
@z

@x
description: Docker maintains a set of official GitHub Actions for building Docker images.
keywords: ci, github actions, gha,  build, introduction, tutorial
@y
description: Docker では Docker イメージをビルドする公式の GitHub Actions を提供しています。
keywords: ci, github actions, gha,  build, introduction, tutorial
@z

@x
GitHub Actions is a popular CI/CD platform for automating your build, test, and
deployment pipeline. Docker provides a set of official GitHub Actions for you to
use in your workflows. These official actions are reusable, easy-to-use
components for building, annotating, and pushing images.
@y
GitHub Actions はビルド、テスト、デプロイの連携作業を自動化する、一般的な CI/CD プラットフォームです。
Docker では、開発ワークフロー内で利用可能な GitHub Actions を公式に提供しています。
この Actions は、イメージのビルド、アノテーション、プッシュを行うための、再利用可能で使い方も簡単なコンポーネントです。
@z

@x
The following GitHub Actions are available:
@y
以下のような GitHub Actions が利用できます。
@z

@x
- [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images):
  build and push Docker images with BuildKit.
- [Docker Login](https://github.com/marketplace/actions/docker-login):
  sign in to a Docker registry.
- [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx):
  initiates a BuildKit builder.
- [Docker Metadata action](https://github.com/marketplace/actions/docker-metadata-action):
  extracts metadata from Git reference and GitHub events.
- [Docker Setup QEMU](https://github.com/marketplace/actions/docker-setup-qemu):
  installs [QEMU](https://github.com/qemu/qemu) static binaries for multi-arch
  builds.
- [Docker Buildx Bake](https://github.com/marketplace/actions/docker-buildx-bake):
  enables using high-level builds with [Bake](../../bake/_index.md).
- [Docker Scout](https://github.com/docker/scout-action):
  analyze Docker images for security vulnerabilities.
@y
- [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images):
  BuildKit を利用して Docker イメージのビルドとプッシュを行います。
- [Docker Login](https://github.com/marketplace/actions/docker-login):
  Docker レジストリへのサインインを行います。
- [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx):
  BuildKit ビルダーの初期化を行います。
- [Docker Metadata action](https://github.com/marketplace/actions/docker-metadata-action):
  Git リファレンスや GitHub イベントからメタデータを抽出します。
- [Docker Setup QEMU](https://github.com/marketplace/actions/docker-setup-qemu):
  マルチアーキテクチャービルド向けに [QEMU](https://github.com/qemu/qemu) のスタティックバイナリをインストールします。
- [Docker Buildx Bake](https://github.com/marketplace/actions/docker-buildx-bake):
  [Bake](../../bake/_index.md) を使った高度なビルドを可能にします。
- [Docker Scout](https://github.com/docker/scout-action):
  Docker イメージのセキュリティぜい弱性を分析します。
@z

@x
Using Docker's actions provides an easy-to-use interface, while still allowing
flexibility for customizing build parameters.
@y
Docker のアクションでは簡単なインターフェースを提供します。
それでもビルドパラメーターをカスタマイズできる機能は十分に維持しています。
@z

@x
## Examples
@y
## 利用例 {#examples}
@z

@x
If you're looking for examples on how to use the Docker GitHub Actions,
refer to the following sections:
@y
Docker GitHub Actions を使った利用例を確認したい場合は、以下の節を参照してください。
@z

@x
{{% sectionlinks %}}
@y
{{% sectionlinks %}}
@z

@x
## Get started with GitHub Actions
@y
## GitHub Actions を使ってみよう {#get-started-with-gitHub-actions}
@z

@x
{{< include "gha-tutorial.md" >}}
@y
{{< include "gha-tutorial.md" >}}
@z

@x
This tutorial walks you through the process of setting up and using Docker GitHub
Actions for building Docker images, and pushing images to Docker Hub. You will
complete the following steps:
@y
This tutorial walks you through the process of setting up and using Docker GitHub
Actions for building Docker images, and pushing images to Docker Hub. You will
complete the following steps:
@z

@x
1. Create a new repository on GitHub.
2. Define the GitHub Actions workflow.
3. Run the workflow.
@y
1. Create a new repository on GitHub.
2. Define the GitHub Actions workflow.
3. Run the workflow.
@z

@x
To follow this tutorial, you need a Docker ID and a GitHub account.
@y
To follow this tutorial, you need a Docker ID and a GitHub account.
@z

@x
### Step one: Create the repository
@y
### Step one: Create the repository
@z

@x
Create a GitHub repository and configure the Docker Hub credentials.
@y
Create a GitHub repository and configure the Docker Hub credentials.
@z

@x
1. Create a new GitHub repository using
   [this template repository](https://github.com/dvdksn/clockbox/generate).
@y
1. Create a new GitHub repository using
   [this template repository](https://github.com/dvdksn/clockbox/generate).
@z

@x
   The repository contains a simple Dockerfile, and nothing else. Feel free to
   use another repository containing a working Dockerfile if you prefer.
@y
   The repository contains a simple Dockerfile, and nothing else. Feel free to
   use another repository containing a working Dockerfile if you prefer.
@z

@x
2. Open the repository **Settings**, and go to **Secrets and variables** > **Actions**.
@y
2. Open the repository **Settings**, and go to **Secrets and variables** > **Actions**.
@z

@x
3. Create a new **Repository variable** named `DOCKERHUB_USERNAME` and your Docker ID as value.
@y
3. Create a new **Repository variable** named `DOCKERHUB_USERNAME` and your Docker ID as value.
@z

@x
4. Create a new
   [personal access token](/security/for-developers/access-tokens/#create-an-access-token)
   for Docker Hub. You can name this token `clockboxci`.
@y
4. Create a new
   [personal access token](__SUBDIR__/security/for-developers/access-tokens/#create-an-access-token)
   for Docker Hub. You can name this token `clockboxci`.
@z

@x
5. Add the Docker Hub access token as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@y
5. Add the Docker Hub access token as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@z

@x
With your repository created, and credentials configured, you're now ready for
action.
@y
With your repository created, and credentials configured, you're now ready for
action.
@z

@x
### Step two: Set up the workflow
@y
### Step two: Set up the workflow
@z

@x
Set up your GitHub Actions workflow for building and pushing the image to Docker
Hub.
@y
Set up your GitHub Actions workflow for building and pushing the image to Docker
Hub.
@z

@x
1. Go to your repository on GitHub and then select the **Actions** tab.
2. Select **set up a workflow yourself**.
@y
1. Go to your repository on GitHub and then select the **Actions** tab.
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
   - `name`: the name of this workflow.
   - `on.push.branches`: specifies that this workflow should run on every push
     event for the branches in the list.
   - `jobs`: creates a job ID (`build`) and declares the type of machine that
     the job should run on.
@y
   - `name`: the name of this workflow.
   - `on.push.branches`: specifies that this workflow should run on every push
     event for the branches in the list.
   - `jobs`: creates a job ID (`build`) and declares the type of machine that
     the job should run on.
@z

@x
For more information about the YAML syntax used here, see
[Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions).
@y
For more information about the YAML syntax used here, see
[Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions).
@z

@x
### Step three: Define the workflow steps
@y
### Step three: Define the workflow steps
@z

@x
Now the essentials: what steps to run, and in what order to run them.
@y
Now the essentials: what steps to run, and in what order to run them.
@z

% snip code...

@x
The previous YAML snippet contains a sequence of steps that:
@y
The previous YAML snippet contains a sequence of steps that:
@z

@x
1. Signs in to Docker Hub, using the
   [Docker Login](https://github.com/marketplace/actions/docker-login) action and your Docker Hub credentials.
2. Creates a BuildKit builder instance using the
   [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx) action.
3. Builds the container image and pushes it to the Docker Hub repository, using
   [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images).
@y
1. Signs in to Docker Hub, using the
   [Docker Login](https://github.com/marketplace/actions/docker-login) action and your Docker Hub credentials.
2. Creates a BuildKit builder instance using the
   [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx) action.
3. Builds the container image and pushes it to the Docker Hub repository, using
   [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images).
@z

@x
   The `with` key lists a number of input parameters that configures the step:
@y
   The `with` key lists a number of input parameters that configures the step:
@z

@x
   - `push`: tells the action to upload the image to a registry after building
     it.
   - `tags`: tags that specify where to push the image.
@y
   - `push`: tells the action to upload the image to a registry after building
     it.
   - `tags`: tags that specify where to push the image.
@z

@x
Add these steps to your workflow file. The full workflow configuration should
look as follows:
@y
Add these steps to your workflow file. The full workflow configuration should
look as follows:
@z

% snip code...

@x
### Run the workflow
@y
### Run the workflow
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
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
This tutorial has shown you how to create a simple GitHub Actions workflow,
using the official Docker actions, to build and push an image to Docker Hub.
@y
This tutorial has shown you how to create a simple GitHub Actions workflow,
using the official Docker actions, to build and push an image to Docker Hub.
@z

@x
There are many more things you can do to customize your workflow to better suit
your needs. To learn more about some of the more advanced use cases, take a look
at the advanced examples, such as [building multi-platform images](multi-platform.md),
or [using cache storage backends](cache.md) and also how to [configure your builder](configure-builder.md).
@y
There are many more things you can do to customize your workflow to better suit
your needs. To learn more about some of the more advanced use cases, take a look
at the advanced examples, such as [building multi-platform images](multi-platform.md),
or [using cache storage backends](cache.md) and also how to [configure your builder](configure-builder.md).
@z
