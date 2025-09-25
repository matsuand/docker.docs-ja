%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Automate your builds with GitHub Actions
linkTitle: Automate your builds with GitHub Actions
@y
title: Automate your builds with GitHub Actions
linkTitle: Automate your builds with GitHub Actions
@z

@x
keywords: ci/cd, github actions, python, flask
description: Learn how to configure CI/CD using GitHub Actions for your Python application.
@y
keywords: ci/cd, github actions, python, flask
description: Learn how to configure CI/CD using GitHub Actions for your Python application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Python application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
@y
Complete all the previous sections of this guide, starting with [Containerize a Python application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
@z

@x
If you didn't create a [GitHub repository](https://github.com/new) for your project yet, it is time to do it. After creating the repository, don't forget to [add a remote](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories) and ensure you can commit and [push your code](https://docs.github.com/en/get-started/using-git/pushing-commits-to-a-remote-repository#about-git-push) to GitHub.
@y
If you didn't create a [GitHub repository](https://github.com/new) for your project yet, it is time to do it. After creating the repository, don't forget to [add a remote](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories) and ensure you can commit and [push your code](https://docs.github.com/en/get-started/using-git/pushing-commits-to-a-remote-repository#about-git-push) to GitHub.
@z

@x
1. In your project's GitHub repository, open **Settings**, and go to **Secrets and variables** > **Actions**.
@y
1. In your project's GitHub repository, open **Settings**, and go to **Secrets and variables** > **Actions**.
@z

@x
2. Under the **Variables** tab, create a new **Repository variable** named `DOCKER_USERNAME` and your Docker ID as a value.
@y
2. Under the **Variables** tab, create a new **Repository variable** named `DOCKER_USERNAME` and your Docker ID as a value.
@z

@x
3. Create a new [Personal Access Token (PAT)](/manuals/security/access-tokens.md#create-an-access-token) for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
@y
3. Create a new [Personal Access Token (PAT)](manuals/security/access-tokens.md#create-an-access-token) for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
@z

@x
4. Add the PAT as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@y
4. Add the PAT as a **Repository secret** in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@z

@x
## Overview
@y
## Overview
@z

@x
GitHub Actions is a CI/CD (Continuous Integration and Continuous Deployment) automation tool built into GitHub. It allows you to define custom workflows for building, testing, and deploying your code when specific events occur (e.g., pushing code, creating a pull request, etc.). A workflow is a YAML-based automation script that defines a sequence of steps to be executed when triggered. Workflows are stored in the `.github/workflows/` directory of a repository.
@y
GitHub Actions is a CI/CD (Continuous Integration and Continuous Deployment) automation tool built into GitHub. It allows you to define custom workflows for building, testing, and deploying your code when specific events occur (e.g., pushing code, creating a pull request, etc.). A workflow is a YAML-based automation script that defines a sequence of steps to be executed when triggered. Workflows are stored in the `.github/workflows/` directory of a repository.
@z

@x
In this section, you'll learn how to set up and use GitHub Actions to build your Docker image as well as push it to Docker Hub. You will complete the following steps:
@y
In this section, you'll learn how to set up and use GitHub Actions to build your Docker image as well as push it to Docker Hub. You will complete the following steps:
@z

@x
1. Define the GitHub Actions workflow.
2. Run the workflow.
@y
1. Define the GitHub Actions workflow.
2. Run the workflow.
@z

@x
## 1. Define the GitHub Actions workflow
@y
## 1. Define the GitHub Actions workflow
@z

@x
You can create a GitHub Actions workflow by creating a YAML file in the `.github/workflows/` directory of your repository. To do this use your favorite text editor or the GitHub web interface. The following steps show you how to create a workflow file using the GitHub web interface.
@y
You can create a GitHub Actions workflow by creating a YAML file in the `.github/workflows/` directory of your repository. To do this use your favorite text editor or the GitHub web interface. The following steps show you how to create a workflow file using the GitHub web interface.
@z

@x
If you prefer to use the GitHub web interface, follow these steps:
@y
If you prefer to use the GitHub web interface, follow these steps:
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
   This takes you to a page for creating a new GitHub Actions workflow file in
   your repository. By default, the file is created under `.github/workflows/main.yml`, let's change it name to `build.yml`.
@y
   This takes you to a page for creating a new GitHub Actions workflow file in
   your repository. By default, the file is created under `.github/workflows/main.yml`, let's change it name to `build.yml`.
@z

@x
If you prefer to use your text editor, create a new file named `build.yml` in the `.github/workflows/` directory of your repository.
@y
If you prefer to use your text editor, create a new file named `build.yml` in the `.github/workflows/` directory of your repository.
@z

@x
Add the following content to the file:
@y
Add the following content to the file:
@z

@x
```yaml
name: Build and push Docker image
@y
```yaml
name: Build and push Docker image
@z

@x
on:
  push:
    branches:
      - main
@y
on:
  push:
    branches:
      - main
@z

@x
jobs:
  lint-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
@y
jobs:
  lint-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
@z

@x
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.12'
@y
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.12'
@z

@x
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt
@y
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt
@z

@x
      - name: Run pre-commit hooks
        run: pre-commit run --all-files
@y
      - name: Run pre-commit hooks
        run: pre-commit run --all-files
@z

@x
      - name: Run pyright
        run: pyright
@y
      - name: Run pyright
        run: pyright
@z

@x
  build_and_push:
    runs-on: ubuntu-latest
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
  build_and_push:
    runs-on: ubuntu-latest
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          push: true
          tags: ${{ vars.DOCKER_USERNAME }}/${{ github.event.repository.name }}:latest
```
@y
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          push: true
          tags: ${{ vars.DOCKER_USERNAME }}/${{ github.event.repository.name }}:latest
```
@z

@x
Each GitHub Actions workflow includes one or several jobs. Each job consists of steps. Each step can either run a set of commands or use already [existing actions](https://github.com/marketplace?type=actions). The action above has three steps:
@y
Each GitHub Actions workflow includes one or several jobs. Each job consists of steps. Each step can either run a set of commands or use already [existing actions](https://github.com/marketplace?type=actions). The action above has three steps:
@z

@x
1. [**Login to Docker Hub**](https://github.com/docker/login-action): Action logs in to Docker Hub using the Docker ID and Personal Access Token (PAT) you created earlier.
@y
1. [**Login to Docker Hub**](https://github.com/docker/login-action): Action logs in to Docker Hub using the Docker ID and Personal Access Token (PAT) you created earlier.
@z

@x
2. [**Set up Docker Buildx**](https://github.com/docker/setup-buildx-action): Action sets up Docker [Buildx](https://github.com/docker/buildx), a CLI plugin that extends the capabilities of the Docker CLI.
@y
2. [**Set up Docker Buildx**](https://github.com/docker/setup-buildx-action): Action sets up Docker [Buildx](https://github.com/docker/buildx), a CLI plugin that extends the capabilities of the Docker CLI.
@z

@x
3. [**Build and push**](https://github.com/docker/build-push-action): Action builds and pushes the Docker image to Docker Hub. The `tags` parameter specifies the image name and tag. The `latest` tag is used in this example.
@y
3. [**Build and push**](https://github.com/docker/build-push-action): Action builds and pushes the Docker image to Docker Hub. The `tags` parameter specifies the image name and tag. The `latest` tag is used in this example.
@z

@x
## 2. Run the workflow
@y
## 2. Run the workflow
@z

@x
Let's commit the changes, push them to the `main` branch. In the workflow above, the trigger is set to `push` events on the `main` branch. This means that the workflow will run every time you push changes to the `main` branch. You can find more information about the workflow triggers [here](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows).
@y
Let's commit the changes, push them to the `main` branch. In the workflow above, the trigger is set to `push` events on the `main` branch. This means that the workflow will run every time you push changes to the `main` branch. You can find more information about the workflow triggers [here](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows).
@z

@x
Go to the **Actions** tab of you GitHub repository. It displays the workflow. Selecting the workflow shows you the breakdown of all the steps.
@y
Go to the **Actions** tab of you GitHub repository. It displays the workflow. Selecting the workflow shows you the breakdown of all the steps.
@z

@x
When the workflow is complete, go to your [repositories on Docker Hub](https://hub.docker.com/repositories). If you see the new repository in that list, it means the GitHub Actions workflow successfully pushed the image to Docker Hub.
@y
When the workflow is complete, go to your [repositories on Docker Hub](https://hub.docker.com/repositories). If you see the new repository in that list, it means the GitHub Actions workflow successfully pushed the image to Docker Hub.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to set up a GitHub Actions workflow for your Python application that includes:
@y
In this section, you learned how to set up a GitHub Actions workflow for your Python application that includes:
@z

@x
- Running pre-commit hooks for linting and formatting
- Static type checking with Pyright
- Building and pushing Docker images
@y
- Running pre-commit hooks for linting and formatting
- Static type checking with Pyright
- Building and pushing Docker images
@z

@x
Related information:
@y
Related information:
@z

@x
- [Introduction to GitHub Actions](/guides/gha.md)
- [Docker Build GitHub Actions](/manuals/build/ci/github-actions/_index.md)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@y
- [Introduction to GitHub Actions](guides/gha.md)
- [Docker Build GitHub Actions](manuals/build/ci/github-actions/_index.md)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how you can develop locally using kubernetes.
@y
In the next section, you'll learn how you can develop locally using kubernetes.
@z
