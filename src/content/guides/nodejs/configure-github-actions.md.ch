%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Automate your builds with GitHub Actions
linkTitle: Automate your builds with GitHub Actions
@y
title: Automate your builds with GitHub Actions
linkTitle: Automate your builds with GitHub Actions
@z

@x
keywords: CI/CD, GitHub Actions, Node.js, Docker
description: Learn how to configure CI/CD using GitHub Actions for your Node.js application.
@y
keywords: CI/CD, GitHub Actions, Node.js, Docker
description: Learn how to configure CI/CD using GitHub Actions for your Node.js application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
@z

@x
You must also have:
@y
You must also have:
@z

@x
- A [GitHub](https://github.com/signup) account.
- A verified [Docker Hub](https://hub.docker.com/signup) account.
@y
- A [GitHub](https://github.com/signup) account.
- A verified [Docker Hub](https://hub.docker.com/signup) account.
@z

@x
---
@y
---
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll set up a **CI/CD pipeline** using [GitHub Actions](https://docs.github.com/en/actions) to automatically:
@y
In this section, you'll set up a **CI/CD pipeline** using [GitHub Actions](https://docs.github.com/en/actions) to automatically:
@z

@x
- Build your Node.js application inside a Docker container.
- Run unit and integration tests, and make sure your application meets solid code quality standards.
- Perform security scanning and vulnerability assessment.
- Push production-ready images to [Docker Hub](https://hub.docker.com).
@y
- Build your Node.js application inside a Docker container.
- Run unit and integration tests, and make sure your application meets solid code quality standards.
- Perform security scanning and vulnerability assessment.
- Push production-ready images to [Docker Hub](https://hub.docker.com).
@z

@x
---
@y
---
@z

@x
## Connect your GitHub repository to Docker Hub
@y
## Connect your GitHub repository to Docker Hub
@z

@x
To enable GitHub Actions to build and push Docker images, you'll securely store your Docker Hub credentials in your new GitHub repository.
@y
To enable GitHub Actions to build and push Docker images, you'll securely store your Docker Hub credentials in your new GitHub repository.
@z

@x
### Step 1: Connect your GitHub repository to Docker Hub
@y
### Step 1: Connect your GitHub repository to Docker Hub
@z

@x
1. Create a Personal Access Token (PAT) from [Docker Hub](https://hub.docker.com).
   1. From your Docker Hub account, go to **Account Settings → Security**.
   2. Generate a new Access Token with **Read/Write** permissions.
   3. Name it something like `docker-nodejs-sample`.
   4. Copy and save the token — you'll need it in Step 4.
@y
1. Create a Personal Access Token (PAT) from [Docker Hub](https://hub.docker.com).
   1. From your Docker Hub account, go to **Account Settings → Security**.
   2. Generate a new Access Token with **Read/Write** permissions.
   3. Name it something like `docker-nodejs-sample`.
   4. Copy and save the token — you'll need it in Step 4.
@z

@x
2. Create a repository in [Docker Hub](https://hub.docker.com/repositories/).
   1. From your Docker Hub account, select **Create a repository**.
   2. For the Repository Name, use something descriptive — for example: `nodejs-sample`.
   3. Once created, copy and save the repository name — you'll need it in Step 4.
@y
2. Create a repository in [Docker Hub](https://hub.docker.com/repositories/).
   1. From your Docker Hub account, select **Create a repository**.
   2. For the Repository Name, use something descriptive — for example: `nodejs-sample`.
   3. Once created, copy and save the repository name — you'll need it in Step 4.
@z

@x
3. Create a new [GitHub repository](https://github.com/new) for your Node.js project.
@y
3. Create a new [GitHub repository](https://github.com/new) for your Node.js project.
@z

@x
4. Add Docker Hub credentials as GitHub repository secrets.
@y
4. Add Docker Hub credentials as GitHub repository secrets.
@z

@x
   In your newly created GitHub repository:
   1. From **Settings**, go to **Secrets and variables → Actions → New repository secret**.
@y
   In your newly created GitHub repository:
   1. From **Settings**, go to **Secrets and variables → Actions → New repository secret**.
@z

@x
   2. Add the following secrets:
@y
   2. Add the following secrets:
@z

@x
   | Name                     | Value                                            |
   | ------------------------ | ------------------------------------------------ |
   | `DOCKER_USERNAME`        | Your Docker Hub username                         |
   | `DOCKERHUB_TOKEN`        | Your Docker Hub access token (created in Step 1) |
   | `DOCKERHUB_PROJECT_NAME` | Your Docker Project Name (created in Step 2)     |
@y
   | Name                     | Value                                            |
   | ------------------------ | ------------------------------------------------ |
   | `DOCKER_USERNAME`        | Your Docker Hub username                         |
   | `DOCKERHUB_TOKEN`        | Your Docker Hub access token (created in Step 1) |
   | `DOCKERHUB_PROJECT_NAME` | Your Docker Project Name (created in Step 2)     |
@z

@x
   These secrets let GitHub Actions to authenticate securely with Docker Hub during automated workflows.
@y
   These secrets let GitHub Actions to authenticate securely with Docker Hub during automated workflows.
@z

@x
5. Connect your local project to GitHub.
@y
5. Connect your local project to GitHub.
@z

@x
   Link your local project `docker-nodejs-sample` to the GitHub repository you just created by running the following command from your project root:
@y
   Link your local project `docker-nodejs-sample` to the GitHub repository you just created by running the following command from your project root:
@z

@x
   ```console
      $ git remote set-url origin https://github.com/{your-username}/{your-repository-name}.git
   ```
@y
   ```console
      $ git remote set-url origin https://github.com/{your-username}/{your-repository-name}.git
   ```
@z

@x
   > [!IMPORTANT]
   > Replace `{your-username}` and `{your-repository}` with your actual GitHub username and repository name.
@y
   > [!IMPORTANT]
   > Replace `{your-username}` and `{your-repository}` with your actual GitHub username and repository name.
@z

@x
   To confirm that your local project is correctly connected to the remote GitHub repository, run:
@y
   To confirm that your local project is correctly connected to the remote GitHub repository, run:
@z

@x
   ```console
   $ git remote -v
   ```
@y
   ```console
   $ git remote -v
   ```
@z

@x
   You should see output similar to:
@y
   You should see output similar to:
@z

@x
   ```console
   origin  https://github.com/{your-username}/{your-repository-name}.git (fetch)
   origin  https://github.com/{your-username}/{your-repository-name}.git (push)
   ```
@y
   ```console
   origin  https://github.com/{your-username}/{your-repository-name}.git (fetch)
   origin  https://github.com/{your-username}/{your-repository-name}.git (push)
   ```
@z

@x
   This confirms that your local repository is properly linked and ready to push your source code to GitHub.
@y
   This confirms that your local repository is properly linked and ready to push your source code to GitHub.
@z

@x
6. Push your source code to GitHub.
@y
6. Push your source code to GitHub.
@z

@x
   Follow these steps to commit and push your local project to your GitHub repository:
   1. Stage all files for commit.
@y
   Follow these steps to commit and push your local project to your GitHub repository:
   1. Stage all files for commit.
@z

@x
      ```console
      $ git add -A
      ```
@y
      ```console
      $ git add -A
      ```
@z

@x
      This command stages all changes — including new, modified, and deleted files — preparing them for commit.
@y
      This command stages all changes — including new, modified, and deleted files — preparing them for commit.
@z

@x
   2. Commit your changes.
@y
   2. Commit your changes.
@z

@x
      ```console
      $ git commit -m "Initial commit with CI/CD pipeline"
      ```
@y
      ```console
      $ git commit -m "Initial commit with CI/CD pipeline"
      ```
@z

@x
      This command creates a commit that snapshots the staged changes with a descriptive message.
@y
      This command creates a commit that snapshots the staged changes with a descriptive message.
@z

@x
   3. Push the code to the `main` branch.
@y
   3. Push the code to the `main` branch.
@z

@x
      ```console
      $ git push -u origin main
      ```
@y
      ```console
      $ git push -u origin main
      ```
@z

@x
      This command pushes your local commits to the `main` branch of the remote GitHub repository and sets the upstream branch.
@y
      This command pushes your local commits to the `main` branch of the remote GitHub repository and sets the upstream branch.
@z

@x
Once completed, your code will be available on GitHub, and any GitHub Actions workflow you've configured will run automatically.
@y
Once completed, your code will be available on GitHub, and any GitHub Actions workflow you've configured will run automatically.
@z

@x
> [!NOTE]  
> Learn more about the Git commands used in this step:
>
> - [Git add](https://git-scm.com/docs/git-add) – Stage changes (new, modified, deleted) for commit
> - [Git commit](https://git-scm.com/docs/git-commit) – Save a snapshot of your staged changes
> - [Git push](https://git-scm.com/docs/git-push) – Upload local commits to your GitHub repository
> - [Git remote](https://git-scm.com/docs/git-remote) – View and manage remote repository URLs
@y
> [!NOTE]  
> Learn more about the Git commands used in this step:
>
> - [Git add](https://git-scm.com/docs/git-add) – Stage changes (new, modified, deleted) for commit
> - [Git commit](https://git-scm.com/docs/git-commit) – Save a snapshot of your staged changes
> - [Git push](https://git-scm.com/docs/git-push) – Upload local commits to your GitHub repository
> - [Git remote](https://git-scm.com/docs/git-remote) – View and manage remote repository URLs
@z

@x
---
@y
---
@z

@x
### Step 2: Set up the workflow
@y
### Step 2: Set up the workflow
@z

@x
Now you'll create a GitHub Actions workflow that builds your Docker image, runs tests, and pushes the image to Docker Hub.
@y
Now you'll create a GitHub Actions workflow that builds your Docker image, runs tests, and pushes the image to Docker Hub.
@z

@x
1. From your repository on GitHub, select the **Actions** tab in the top menu.
@y
1. From your repository on GitHub, select the **Actions** tab in the top menu.
@z

@x
2. When prompted, select **Set up a workflow yourself**.
@y
2. When prompted, select **Set up a workflow yourself**.
@z

@x
   This opens an inline editor to create a new workflow file. By default, it will be saved to:
   `.github/workflows/main.yml`
@y
   This opens an inline editor to create a new workflow file. By default, it will be saved to:
   `.github/workflows/main.yml`
@z

@x
3. Add the following workflow configuration to the new file:
@y
3. Add the following workflow configuration to the new file:
@z

@x
```yaml
name: CI/CD – Node.js Application with Docker
@y
```yaml
name: CI/CD – Node.js Application with Docker
@z

@x
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]
@y
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]
@z

@x
jobs:
  test:
    name: Run Node.js Tests
    runs-on: ubuntu-latest
@y
jobs:
  test:
    name: Run Node.js Tests
    runs-on: ubuntu-latest
@z

@x
    services:
      postgres:
        image: postgres:18-alpine
        env:
          POSTGRES_DB: todoapp_test
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432
@y
    services:
      postgres:
        image: postgres:18-alpine
        env:
          POSTGRES_DB: todoapp_test
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432
@z

@x
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
@y
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Cache npm dependencies
        uses: actions/cache@v4
        with:
          path: ~/.npm
          key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
          restore-keys: ${{ runner.os }}-npm-
@y
      - name: Cache npm dependencies
        uses: actions/cache@v4
        with:
          path: ~/.npm
          key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
          restore-keys: ${{ runner.os }}-npm-
@z

@x
      - name: Build test image
        uses: docker/build-push-action@v6
        with:
          context: .
          target: test
          tags: nodejs-app-test:latest
          platforms: linux/amd64
          load: true
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache,mode=max
@y
      - name: Build test image
        uses: docker/build-push-action@v6
        with:
          context: .
          target: test
          tags: nodejs-app-test:latest
          platforms: linux/amd64
          load: true
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache,mode=max
@z

@x
      - name: Run tests inside container
        run: |
          docker run --rm \
            --network host \
            -e NODE_ENV=test \
            -e POSTGRES_HOST=localhost \
            -e POSTGRES_PORT=5432 \
            -e POSTGRES_DB=todoapp_test \
            -e POSTGRES_USER=postgres \
            -e POSTGRES_PASSWORD=postgres \
            nodejs-app-test:latest
        env:
          CI: true
        timeout-minutes: 10
@y
      - name: Run tests inside container
        run: |
          docker run --rm \
            --network host \
            -e NODE_ENV=test \
            -e POSTGRES_HOST=localhost \
            -e POSTGRES_PORT=5432 \
            -e POSTGRES_DB=todoapp_test \
            -e POSTGRES_USER=postgres \
            -e POSTGRES_PASSWORD=postgres \
            nodejs-app-test:latest
        env:
          CI: true
        timeout-minutes: 10
@z

@x
  build-and-push:
    name: Build and Push Docker Image
    runs-on: ubuntu-latest
    needs: test
@y
  build-and-push:
    name: Build and Push Docker Image
    runs-on: ubuntu-latest
    needs: test
@z

@x
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
@y
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Cache Docker layers
        uses: actions/cache@v4
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: ${{ runner.os }}-buildx-
@y
      - name: Cache Docker layers
        uses: actions/cache@v4
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: ${{ runner.os }}-buildx-
@z

@x
      - name: Extract metadata
        id: meta
        run: |
          echo "REPO_NAME=${GITHUB_REPOSITORY##*/}" >> "$GITHUB_OUTPUT"
          echo "SHORT_SHA=${GITHUB_SHA::7}" >> "$GITHUB_OUTPUT"
@y
      - name: Extract metadata
        id: meta
        run: |
          echo "REPO_NAME=${GITHUB_REPOSITORY##*/}" >> "$GITHUB_OUTPUT"
          echo "SHORT_SHA=${GITHUB_SHA::7}" >> "$GITHUB_OUTPUT"
@z

@x
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Build and push multi-arch production image
        uses: docker/build-push-action@v6
        with:
          context: .
          target: production
          push: true
          platforms: linux/amd64,linux/arm64
          tags: |
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:latest
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:${{ steps.meta.outputs.SHORT_SHA }}
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache,mode=max
```
@y
      - name: Build and push multi-arch production image
        uses: docker/build-push-action@v6
        with:
          context: .
          target: production
          push: true
          platforms: linux/amd64,linux/arm64
          tags: |
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:latest
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:${{ steps.meta.outputs.SHORT_SHA }}
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache,mode=max
```
@z

@x
This workflow performs the following tasks for your Node.js application:
@y
This workflow performs the following tasks for your Node.js application:
@z

@x
- Triggers on every `push` or `pull request` to the `main` branch.
- Builds a test Docker image using the `test` stage.
- Runs tests in a containerized environment.
- Stops the workflow if any test fails.
- Caches Docker build layers and npm dependencies for faster runs.
- Authenticates with Docker Hub using GitHub secrets.
- Builds an image using the `production` stage.
- Tags and pushes the image to Docker Hub with `latest` and short SHA tags.
@y
- Triggers on every `push` or `pull request` to the `main` branch.
- Builds a test Docker image using the `test` stage.
- Runs tests in a containerized environment.
- Stops the workflow if any test fails.
- Caches Docker build layers and npm dependencies for faster runs.
- Authenticates with Docker Hub using GitHub secrets.
- Builds an image using the `production` stage.
- Tags and pushes the image to Docker Hub with `latest` and short SHA tags.
@z

@x
> [!NOTE]
> For more information about `docker/build-push-action`, refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@y
> [!NOTE]
> For more information about `docker/build-push-action`, refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@z

@x
---
@y
---
@z

@x
### Step 3: Run the workflow
@y
### Step 3: Run the workflow
@z

@x
After adding your workflow file, trigger the CI/CD process.
@y
After adding your workflow file, trigger the CI/CD process.
@z

@x
1. Commit and push your workflow file
@y
1. Commit and push your workflow file
@z

@x
   From the GitHub editor, select **Commit changes…**.
   - This push automatically triggers the GitHub Actions pipeline.
@y
   From the GitHub editor, select **Commit changes…**.
   - This push automatically triggers the GitHub Actions pipeline.
@z

@x
2. Monitor the workflow execution
   1. From your GitHub repository, go to the **Actions** tab.
   2. Select the workflow run to follow each step: **test**, **build**, **security**, and (if successful) **push** and **deploy**.
@y
2. Monitor the workflow execution
   1. From your GitHub repository, go to the **Actions** tab.
   2. Select the workflow run to follow each step: **test**, **build**, **security**, and (if successful) **push** and **deploy**.
@z

@x
3. Verify the Docker image on Docker Hub
   - After a successful workflow run, visit your [Docker Hub repositories](https://hub.docker.com/repositories).
   - You should see a new image under your repository with:
     - Repository name: `${your-repository-name}`
     - Tags include:
       - `latest` – represents the most recent successful build; ideal for quick testing or deployment.
       - `<short-sha>` – a unique identifier based on the commit hash, useful for version tracking, rollbacks, and traceability.
@y
3. Verify the Docker image on Docker Hub
   - After a successful workflow run, visit your [Docker Hub repositories](https://hub.docker.com/repositories).
   - You should see a new image under your repository with:
     - Repository name: `${your-repository-name}`
     - Tags include:
       - `latest` – represents the most recent successful build; ideal for quick testing or deployment.
       - `<short-sha>` – a unique identifier based on the commit hash, useful for version tracking, rollbacks, and traceability.
@z

@x
> [!TIP] Protect your main branch
> To maintain code quality and prevent accidental direct pushes, enable branch protection rules:
>
> - From your GitHub repository, go to **Settings → Branches**.
> - Under Branch protection rules, select **Add rule**.
> - Specify `main` as the branch name.
> - Enable options like:
>   - _Require a pull request before merging_.
>   - _Require status checks to pass before merging_.
>
> This ensures that only tested and reviewed code is merged into `main` branch.
@y
> [!TIP] Protect your main branch
> To maintain code quality and prevent accidental direct pushes, enable branch protection rules:
>
> - From your GitHub repository, go to **Settings → Branches**.
> - Under Branch protection rules, select **Add rule**.
> - Specify `main` as the branch name.
> - Enable options like:
>   - _Require a pull request before merging_.
>   - _Require status checks to pass before merging_.
>
> This ensures that only tested and reviewed code is merged into `main` branch.
@z

@x
---
@y
---
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you set up a comprehensive CI/CD pipeline for your containerized Node.js application using GitHub Actions.
@y
In this section, you set up a comprehensive CI/CD pipeline for your containerized Node.js application using GitHub Actions.
@z

@x
What you accomplished:
@y
What you accomplished:
@z

@x
- Created a new GitHub repository specifically for your project.
- Generated a Docker Hub access token and added it as a GitHub secret.
- Created a GitHub Actions workflow that:
  - Builds your application in a Docker container.
  - Run tests in a containerized environment.
  - Pushes an image to Docker Hub if tests pass.
- Verified the workflow runs successfully.
@y
- Created a new GitHub repository specifically for your project.
- Generated a Docker Hub access token and added it as a GitHub secret.
- Created a GitHub Actions workflow that:
  - Builds your application in a Docker container.
  - Run tests in a containerized environment.
  - Pushes an image to Docker Hub if tests pass.
- Verified the workflow runs successfully.
@z

@x
Your Node.js application now has automated testing and deployment.
@y
Your Node.js application now has automated testing and deployment.
@z

@x
---
@y
---
@z

@x
## Related resources
@y
## Related resources
@z

@x
Deepen your understanding of automation and best practices for containerized apps:
@y
Deepen your understanding of automation and best practices for containerized apps:
@z

@x
- [Introduction to GitHub Actions](/guides/gha.md) – Learn how GitHub Actions automate your workflows
- [Docker Build GitHub Actions](/manuals/build/ci/github-actions/_index.md) – Set up container builds with GitHub Actions
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) – Full reference for writing GitHub workflows
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) – Learn about GHCR features and usage
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Optimize your image for performance and security
@y
- [Introduction to GitHub Actions](guides/gha.md) – Learn how GitHub Actions automate your workflows
- [Docker Build GitHub Actions](manuals/build/ci/github-actions/_index.md) – Set up container builds with GitHub Actions
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) – Full reference for writing GitHub workflows
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) – Learn about GHCR features and usage
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Optimize your image for performance and security
@z

@x
---
@y
---
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, learn how you can deploy your containerized Node.js application to Kubernetes with production-ready configuration. This helps you ensure your application behaves as expected in a production-like environment, reducing surprises during deployment.
@y
Next, learn how you can deploy your containerized Node.js application to Kubernetes with production-ready configuration. This helps you ensure your application behaves as expected in a production-like environment, reducing surprises during deployment.
@z
