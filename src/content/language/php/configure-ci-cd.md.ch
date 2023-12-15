%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Configure CI/CD for your PHP application
keywords: php, CI/CD
description: Learn how to Configure CI/CD for your PHP application
---
@y
---
title: Configure CI/CD for your PHP application
keywords: php, CI/CD
description: Learn how to Configure CI/CD for your PHP application
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a PHP application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
@y
Complete all the previous sections of this guide, starting with [Containerize a PHP application](containerize.md). You must have a [GitHub](https://github.com/signup) account and a [Docker](https://hub.docker.com/signup) account to complete this section.
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
Create a GitHub repository, configure the Docker Hub secrets, and push your source code.
@y
Create a GitHub repository, configure the Docker Hub secrets, and push your source code.
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
3. Create a new secret named `DOCKER_USERNAME` and your Docker ID as value.
@y
3. Create a new secret named `DOCKER_USERNAME` and your Docker ID as value.
@z

@x
4. Create a new [Personal Access Token (PAT)](../../security/for-developers/access-tokens.md/#create-an-access-token) for Docker Hub. You can name this token `tutorial-docker`.
@y
4. Create a new [Personal Access Token (PAT)](../../security/for-developers/access-tokens.md/#create-an-access-token) for Docker Hub. You can name this token `tutorial-docker`.
@z

@x
5. Add the PAT as a second secret in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@y
5. Add the PAT as a second secret in your GitHub repository, with the name
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
7. In your local repository on your machine, run the following command to rename
   the branch to main.
@y
7. In your local repository on your machine, run the following command to rename
   the branch to main.
@z

@x
   ```console
   $ git branch -M main
   ```
@y
   ```console
   $ git branch -M main
   ```
@z

@x
8. Run the following commands to stage, commit, and then push your local
   repository to GitHub.
@y
8. Run the following commands to stage, commit, and then push your local
   repository to GitHub.
@z

@x
   ```console
   $ git add -A
   $ git commit -m "my first commit"
   $ git push -u origin main
   ```
@y
   ```console
   $ git add -A
   $ git commit -m "my first commit"
   $ git push -u origin main
   ```
@z

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
           name: Checkout
           uses: actions/checkout@v4
         -
           name: Login to Docker Hub
           uses: docker/login-action@v3
           with:
             username: ${{ secrets.DOCKER_USERNAME }}
             password: ${{ secrets.DOCKERHUB_TOKEN }}
         -
           name: Set up Docker Buildx
           uses: docker/setup-buildx-action@v3
         -
           name: Build and test
           uses: docker/build-push-action@v5
           with:
             context: .
             target: test
             load: true
         -
           name: Build and push
           uses: docker/build-push-action@v5
           with:
             context: .
             push: true
             target: final
             tags: ${{ secrets.DOCKER_USERNAME }}/${{ github.event.repository.name }}:latest
   ```
@y
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         -
           name: Checkout
           uses: actions/checkout@v4
         -
           name: Login to Docker Hub
           uses: docker/login-action@v3
           with:
             username: ${{ secrets.DOCKER_USERNAME }}
             password: ${{ secrets.DOCKERHUB_TOKEN }}
         -
           name: Set up Docker Buildx
           uses: docker/setup-buildx-action@v3
         -
           name: Build and test
           uses: docker/build-push-action@v5
           with:
             context: .
             target: test
             load: true
         -
           name: Build and push
           uses: docker/build-push-action@v5
           with:
             context: .
             push: true
             target: final
             tags: ${{ secrets.DOCKER_USERNAME }}/${{ github.event.repository.name }}:latest
   ```
@z

@x
   For more information about the YAML syntax used here, see [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions).
@y
   For more information about the YAML syntax used here, see [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions).
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
In this section, you learned how to set up a GitHub Actions workflow for your application.
@y
In this section, you learned how to set up a GitHub Actions workflow for your application.
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
