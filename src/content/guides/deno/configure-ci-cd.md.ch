%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure CI/CD for your Deno application
linkTitle: Configure CI/CD
@y
title: Configure CI/CD for your Deno application
linkTitle: Configure CI/CD
@z

@x
keywords: ci/cd, github actions, deno, shiny
description: Learn how to configure CI/CD using GitHub Actions for your Deno application.
@y
keywords: ci/cd, github actions, deno, shiny
description: Learn how to configure CI/CD using GitHub Actions for your Deno application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Deno application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
@y
Complete all the previous sections of this guide, starting with [Containerize a Deno application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up and use GitHub Actions to build and test your Docker image as well as push it to Docker Hub. You will complete the following steps:
@y
In this section, you'll learn how to set up and use GitHub Actions to build and test your Docker image as well as push it to Docker Hub. You will complete the following steps:
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
## Step one: Create the repository
@y
## Step one: Create the repository
@z

@x
Create a GitHub repository, configure the Docker Hub credentials, and push your source code.
@y
Create a GitHub repository, configure the Docker Hub credentials, and push your source code.
@z

@x
1. [Create a new repository](https://github.com/new) on GitHub.
@y
1. [Create a new repository](https://github.com/new) on GitHub.
@z

@x
2. Open the repository **Settings**, and go to **Secrets and variables** >
   **Actions**.
@y
2. Open the repository **Settings**, and go to **Secrets and variables** >
   **Actions**.
@z

@x
3. Create a new **Repository variable** named `DOCKER_USERNAME` and your Docker ID as a value.
@y
3. Create a new **Repository variable** named `DOCKER_USERNAME` and your Docker ID as a value.
@z

@x
4. Create a new [Personal Access Token (PAT)](/manuals/security/for-developers/access-tokens.md#create-an-access-token)for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
@y
4. Create a new [Personal Access Token (PAT)](manuals/security/for-developers/access-tokens.md#create-an-access-token)for Docker Hub. You can name this token `docker-tutorial`. Make sure access permissions include Read and Write.
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

@x
   ```console
   $ git remote set-url origin https://github.com/your-username/your-repository.git
   ```
@y
   ```console
   $ git remote set-url origin https://github.com/your-username/your-repository.git
   ```
@z

@x
7. Run the following commands to stage, commit, and push your local repository to GitHub.
@y
7. Run the following commands to stage, commit, and push your local repository to GitHub.
@z

@x
   ```console
   $ git add -A
   $ git commit -m "my commit"
   $ git push -u origin main
   ```
@y
   ```console
   $ git add -A
   $ git commit -m "my commit"
   $ git push -u origin main
   ```
@z

@x
## Step two: Set up the workflow
@y
## Step two: Set up the workflow
@z

@x
Set up your GitHub Actions workflow for building and pushing the image
to Docker Hub.
@y
Set up your GitHub Actions workflow for building and pushing the image
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
3. In the editor window, copy and paste the following YAML configuration and commit the changes.
@y
3. In the editor window, copy and paste the following YAML configuration and commit the changes.
@z

@x
   ```yaml
   name: ci
@y
   ```yaml
   name: ci
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
     build:
       runs-on: ubuntu-latest
       steps:
         -
           name: Login to Docker Hub
           uses: docker/login-action@v3
           with:
             username: ${{ vars.DOCKER_USERNAME }}
             password: ${{ secrets.DOCKERHUB_TOKEN }}
         -
           name: Set up Docker Buildx
           uses: docker/setup-buildx-action@v3
         -
           name: Build and push
           uses: docker/build-push-action@v6
           with:
             platforms: linux/amd64,linux/arm64
             push: true
             tags: ${{ vars.DOCKER_USERNAME }}/${{ github.event.repository.name }}:latest
   ```
@y
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         -
           name: Login to Docker Hub
           uses: docker/login-action@v3
           with:
             username: ${{ vars.DOCKER_USERNAME }}
             password: ${{ secrets.DOCKERHUB_TOKEN }}
         -
           name: Set up Docker Buildx
           uses: docker/setup-buildx-action@v3
         -
           name: Build and push
           uses: docker/build-push-action@v6
           with:
             platforms: linux/amd64,linux/arm64
             push: true
             tags: ${{ vars.DOCKER_USERNAME }}/${{ github.event.repository.name }}:latest
   ```
@z

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
In this section, you learned how to set up a GitHub Actions workflow for your Deno application.
@y
In this section, you learned how to set up a GitHub Actions workflow for your Deno application.
@z

@x
Related information:
 - [Introduction to GitHub Actions](/manuals/build/ci/github-actions/_index.md)
 - [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
@y
Related information:
 - [Introduction to GitHub Actions](manuals/build/ci/github-actions/_index.md)
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
