%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

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
Create a GitHub repository and configure the Docker Hub secrets.
@y
Create a GitHub repository and configure the Docker Hub secrets.
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
3. Create a new secret named `DOCKERHUB_USERNAME` and your Docker ID as value.
@y
3. Create a new secret named `DOCKERHUB_USERNAME` and your Docker ID as value.
@z

@x
4. Create a new
   [Personal Access Token (PAT)](/security/for-developers/access-tokens/#create-an-access-token)
   for Docker Hub. You can name this token `clockboxci`.
@y
4. Create a new
   [Personal Access Token (PAT)](__SUBDIR__/security/for-developers/access-tokens/#create-an-access-token)
   for Docker Hub. You can name this token `clockboxci`.
@z

@x
5. Add the PAT as a second secret in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@y
5. Add the PAT as a second secret in your GitHub repository, with the name
   `DOCKERHUB_TOKEN`.
@z

@x
With your repository created, and secrets configured, you're now ready for
action!
@y
With your repository created, and secrets configured, you're now ready for
action!
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
         - "main"
@y
   on:
     push:
       branches:
         - "main"
@z

@x
   jobs:
     build:
       runs-on: ubuntu-latest
   ```
@y
   jobs:
     build:
       runs-on: ubuntu-latest
   ```
@z

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

@x
```yaml
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      -
        name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/clockbox:latest
```
@y
```yaml
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      -
        name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/clockbox:latest
```
@z

@x
The previous YAML snippet contains a sequence of steps that:
@y
The previous YAML snippet contains a sequence of steps that:
@z

@x
1. Checks out the repository on the build machine.
2. Signs in to Docker Hub, using the
   [Docker Login](https://github.com/marketplace/actions/docker-login) action and your Docker Hub credentials.
3. Creates a BuildKit builder instance using the
   [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx) action.
4. Builds the container image and pushes it to the Docker Hub repository, using
   [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images).
@y
1. Checks out the repository on the build machine.
2. Signs in to Docker Hub, using the
   [Docker Login](https://github.com/marketplace/actions/docker-login) action and your Docker Hub credentials.
3. Creates a BuildKit builder instance using the
   [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx) action.
4. Builds the container image and pushes it to the Docker Hub repository, using
   [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images).
@z

@x
   The `with` key lists a number of input parameters that configures the step:
@y
   The `with` key lists a number of input parameters that configures the step:
@z

@x
   - `context`: the [build context](/build/building/context/).
   - `file`: filepath to the Dockerfile.
   - `push`: tells the action to upload the image to a registry after building
     it.
   - `tags`: tags that specify where to push the image.
@y
   - `context`: the [build context](__SUBDIR__/build/building/context/).
   - `file`: filepath to the Dockerfile.
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
      - "main"
@y
on:
  push:
    branches:
      - "main"
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      -
        name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/clockbox:latest
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      -
        name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/clockbox:latest
```
@z

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
   successfully pushed the image to Docker Hub!
@y
   If you see the new repository in that list, it means the GitHub Actions
   successfully pushed the image to Docker Hub!
@z
