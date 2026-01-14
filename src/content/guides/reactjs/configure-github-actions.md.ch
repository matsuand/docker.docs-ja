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
keywords: CI/CD, GitHub( Actions), React.js, Next.js
description: Learn how to configure CI/CD using GitHub Actions for your React.js application.
@y
keywords: CI/CD, GitHub( Actions), React.js, Next.js
description: Learn how to configure CI/CD using GitHub Actions for your React.js application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize React.js application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize React.js application](containerize.md).
@z

@x
You must also have:
- A [GitHub](https://github.com/signup) account.
- A [Docker Hub](https://hub.docker.com/signup) account.
@y
You must also have:
- A [GitHub](https://github.com/signup) account.
- A [Docker Hub](https://hub.docker.com/signup) account.
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
- Build your React.js application inside a Docker container.
- Run tests in a consistent environment.
- Push the production-ready image to [Docker Hub](https://hub.docker.com).
@y
- Build your React.js application inside a Docker container.
- Run tests in a consistent environment.
- Push the production-ready image to [Docker Hub](https://hub.docker.com).
@z

@x
## Connect your GitHub repository to Docker Hub
@y
## Connect your GitHub repository to Docker Hub
@z

@x
To enable GitHub Actions to build and push Docker images, you’ll securely store your Docker Hub credentials in your new GitHub repository.
@y
To enable GitHub Actions to build and push Docker images, you’ll securely store your Docker Hub credentials in your new GitHub repository.
@z

@x
### Step 1: Connect your GitHub repository to Docker Hub
@y
### Step 1: Connect your GitHub repository to Docker Hub
@z

@x
1. Create a Personal Access Token (PAT) from [Docker Hub](https://hub.docker.com)
   1. Go to your **Docker Hub account → Account Settings → Security**.
   2. Generate a new Access Token with **Read/Write** permissions.
   3. Name it something like `docker-reactjs-sample`.
   4. Copy and save the token — you’ll need it in Step 4.
@y
1. Create a Personal Access Token (PAT) from [Docker Hub](https://hub.docker.com)
   1. Go to your **Docker Hub account → Account Settings → Security**.
   2. Generate a new Access Token with **Read/Write** permissions.
   3. Name it something like `docker-reactjs-sample`.
   4. Copy and save the token — you’ll need it in Step 4.
@z

@x
2. Create a repository in [Docker Hub](https://hub.docker.com/repositories/)
   1. Go to your **Docker Hub account → Create a repository**.
   2. For the Repository Name, use something descriptive — for example: `reactjs-sample`.
   3. Once created, copy and save the repository name — you’ll need it in Step 4.
@y
2. Create a repository in [Docker Hub](https://hub.docker.com/repositories/)
   1. Go to your **Docker Hub account → Create a repository**.
   2. For the Repository Name, use something descriptive — for example: `reactjs-sample`.
   3. Once created, copy and save the repository name — you’ll need it in Step 4.
@z

@x
3. Create a new [GitHub repository](https://github.com/new) for your React.js project
@y
3. Create a new [GitHub repository](https://github.com/new) for your React.js project
@z

@x
4. Add Docker Hub credentials as GitHub repository secrets
@y
4. Add Docker Hub credentials as GitHub repository secrets
@z

@x
   In your newly created GitHub repository:
@y
   In your newly created GitHub repository:
@z

@x
   1. Navigate to:
   **Settings → Secrets and variables → Actions → New repository secret**.
@y
   1. Navigate to:
   **Settings → Secrets and variables → Actions → New repository secret**.
@z

@x
   2. Add the following secrets:
@y
   2. Add the following secrets:
@z

@x
   | Name              | Value                          |
   |-------------------|--------------------------------|
   | `DOCKER_USERNAME` | Your Docker Hub username       |
   | `DOCKERHUB_TOKEN` | Your Docker Hub access token (created in Step 1)   |
   | `DOCKERHUB_PROJECT_NAME` | Your Docker Project Name (created in Step 2)   |
@y
   | Name              | Value                          |
   |-------------------|--------------------------------|
   | `DOCKER_USERNAME` | Your Docker Hub username       |
   | `DOCKERHUB_TOKEN` | Your Docker Hub access token (created in Step 1)   |
   | `DOCKERHUB_PROJECT_NAME` | Your Docker Project Name (created in Step 2)   |
@z

@x
   These secrets let GitHub Actions to authenticate securely with Docker Hub during automated workflows.
@y
   These secrets let GitHub Actions to authenticate securely with Docker Hub during automated workflows.
@z

@x
5. Connect Your Local Project to GitHub
@y
5. Connect Your Local Project to GitHub
@z

@x
   Link your local project `docker-reactjs-sample` to the GitHub repository you just created by running the following command from your project root:
@y
   Link your local project `docker-reactjs-sample` to the GitHub repository you just created by running the following command from your project root:
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
   >[!IMPORTANT]
   >Replace `{your-username}` and `{your-repository}` with your actual GitHub username and repository name.
@y
   >[!IMPORTANT]
   >Replace `{your-username}` and `{your-repository}` with your actual GitHub username and repository name.
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
6. Push Your Source Code to GitHub
@y
6. Push Your Source Code to GitHub
@z

@x
   Follow these steps to commit and push your local project to your GitHub repository:
@y
   Follow these steps to commit and push your local project to your GitHub repository:
@z

@x
   1. Stage all files for commit.
@y
   1. Stage all files for commit.
@z

@x
      ```console
      $ git add -A
      ```
      This command stages all changes — including new, modified, and deleted files — preparing them for commit.
@y
      ```console
      $ git add -A
      ```
      This command stages all changes — including new, modified, and deleted files — preparing them for commit.
@z

@x
   2. Commit your changes.
@y
   2. Commit your changes.
@z

@x
      ```console
      $ git commit -m "Initial commit"
      ```
      This command creates a commit that snapshots the staged changes with a descriptive message.  
@y
      ```console
      $ git commit -m "Initial commit"
      ```
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
      This command pushes your local commits to the `main` branch of the remote GitHub repository and sets the upstream branch.
@y
      ```console
      $ git push -u origin main
      ```
      This command pushes your local commits to the `main` branch of the remote GitHub repository and sets the upstream branch.
@z

@x
Once completed, your code will be available on GitHub, and any GitHub Actions workflow you’ve configured will run automatically.
@y
Once completed, your code will be available on GitHub, and any GitHub Actions workflow you’ve configured will run automatically.
@z

@x
> [!NOTE]  
> Learn more about the Git commands used in this step:
> - [Git add](https://git-scm.com/docs/git-add) – Stage changes (new, modified, deleted) for commit  
> - [Git commit](https://git-scm.com/docs/git-commit) – Save a snapshot of your staged changes  
> - [Git push](https://git-scm.com/docs/git-push) – Upload local commits to your GitHub repository  
> - [Git remote](https://git-scm.com/docs/git-remote) – View and manage remote repository URLs
@y
> [!NOTE]  
> Learn more about the Git commands used in this step:
> - [Git add](https://git-scm.com/docs/git-add) – Stage changes (new, modified, deleted) for commit  
> - [Git commit](https://git-scm.com/docs/git-commit) – Save a snapshot of your staged changes  
> - [Git push](https://git-scm.com/docs/git-push) – Upload local commits to your GitHub repository  
> - [Git remote](https://git-scm.com/docs/git-remote) – View and manage remote repository URLs
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
1. Go to your repository on GitHub and select the **Actions** tab in the top menu.
@y
1. Go to your repository on GitHub and select the **Actions** tab in the top menu.
@z

@x
2. Select **Set up a workflow yourself** when prompted.
@y
2. Select **Set up a workflow yourself** when prompted.
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
name: CI/CD – React.js Application with Docker
@y
```yaml
name: CI/CD – React.js Application with Docker
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
  build-test-push:
    name: Build, Test and Push Docker Image
    runs-on: ubuntu-latest
@y
jobs:
  build-test-push:
    name: Build, Test and Push Docker Image
    runs-on: ubuntu-latest
@z

@x
    steps:
      # 1. Checkout source code
      - name: Checkout source code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0 # Fetches full history for better caching/context
@y
    steps:
      # 1. Checkout source code
      - name: Checkout source code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0 # Fetches full history for better caching/context
@z

@x
      # 2. Set up Docker Buildx
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      # 2. Set up Docker Buildx
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      # 3. Cache Docker layers
      - name: Cache Docker layers
        uses: actions/cache@v4
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: ${{ runner.os }}-buildx-
@y
      # 3. Cache Docker layers
      - name: Cache Docker layers
        uses: actions/cache@v4
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: ${{ runner.os }}-buildx-
@z

@x
      # 4. Cache npm dependencies
      - name: Cache npm dependencies
        uses: actions/cache@v4
        with:
          path: ~/.npm
          key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
          restore-keys: ${{ runner.os }}-npm-
@y
      # 4. Cache npm dependencies
      - name: Cache npm dependencies
        uses: actions/cache@v4
        with:
          path: ~/.npm
          key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
          restore-keys: ${{ runner.os }}-npm-
@z

@x
      # 5. Extract metadata
      - name: Extract metadata
        id: meta
        run: |
          echo "REPO_NAME=${GITHUB_REPOSITORY##*/}" >> "$GITHUB_OUTPUT"
          echo "SHORT_SHA=${GITHUB_SHA::7}" >> "$GITHUB_OUTPUT"
@y
      # 5. Extract metadata
      - name: Extract metadata
        id: meta
        run: |
          echo "REPO_NAME=${GITHUB_REPOSITORY##*/}" >> "$GITHUB_OUTPUT"
          echo "SHORT_SHA=${GITHUB_SHA::7}" >> "$GITHUB_OUTPUT"
@z

@x
      # 6. Build dev Docker image
      - name: Build Docker image for tests
        uses: docker/build-push-action@v6
        with:
          context: .
          file: Dockerfile.dev
          tags: ${{ steps.meta.outputs.REPO_NAME }}-dev:latest
          load: true # Load to local Docker daemon for testing
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache,mode=max
@y
      # 6. Build dev Docker image
      - name: Build Docker image for tests
        uses: docker/build-push-action@v6
        with:
          context: .
          file: Dockerfile.dev
          tags: ${{ steps.meta.outputs.REPO_NAME }}-dev:latest
          load: true # Load to local Docker daemon for testing
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache,mode=max
@z

@x
      # 7. Run Vitest tests
      - name: Run Vitest tests and generate report
        run: |
          docker run --rm \
            --workdir /app \
            --entrypoint "" \
            ${{ steps.meta.outputs.REPO_NAME }}-dev:latest \
            sh -c "npm ci && npx vitest run --reporter=verbose"
        env:
          CI: true
          NODE_ENV: test
        timeout-minutes: 10
@y
      # 7. Run Vitest tests
      - name: Run Vitest tests and generate report
        run: |
          docker run --rm \
            --workdir /app \
            --entrypoint "" \
            ${{ steps.meta.outputs.REPO_NAME }}-dev:latest \
            sh -c "npm ci && npx vitest run --reporter=verbose"
        env:
          CI: true
          NODE_ENV: test
        timeout-minutes: 10
@z

@x
      # 8. Login to Docker Hub
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      # 8. Login to Docker Hub
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      # 9. Build and push prod image
      - name: Build and push production image
        uses: docker/build-push-action@v6
        with:
          context: .
          file: Dockerfile
          push: true
          platforms: linux/amd64,linux/arm64
          tags: |
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:latest
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:${{ steps.meta.outputs.SHORT_SHA }}
          cache-from: type=local,src=/tmp/.buildx-cache
```
@y
      # 9. Build and push prod image
      - name: Build and push production image
        uses: docker/build-push-action@v6
        with:
          context: .
          file: Dockerfile
          push: true
          platforms: linux/amd64,linux/arm64
          tags: |
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:latest
            ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKERHUB_PROJECT_NAME }}:${{ steps.meta.outputs.SHORT_SHA }}
          cache-from: type=local,src=/tmp/.buildx-cache
```
@z

@x
This workflow performs the following tasks for your React.js application:
- Triggers on every `push` or `pull request` targeting the `main` branch.
- Builds a development Docker image using `Dockerfile.dev`, optimized for testing.
- Executes unit tests using Vitest inside a clean, containerized environment to ensure consistency.
- Halts the workflow immediately if any test fails — enforcing code quality.
- Caches both Docker build layers and npm dependencies for faster CI runs.
- Authenticates securely with Docker Hub using GitHub repository secrets.
- Builds a production-ready image using the `prod` stage in `Dockerfile`.
- Tags and pushes the final image to Docker Hub with both `latest` and short SHA tags for traceability.
@y
This workflow performs the following tasks for your React.js application:
- Triggers on every `push` or `pull request` targeting the `main` branch.
- Builds a development Docker image using `Dockerfile.dev`, optimized for testing.
- Executes unit tests using Vitest inside a clean, containerized environment to ensure consistency.
- Halts the workflow immediately if any test fails — enforcing code quality.
- Caches both Docker build layers and npm dependencies for faster CI runs.
- Authenticates securely with Docker Hub using GitHub repository secrets.
- Builds a production-ready image using the `prod` stage in `Dockerfile`.
- Tags and pushes the final image to Docker Hub with both `latest` and short SHA tags for traceability.
@z

@x
> [!NOTE]
>  For more information about  `docker/build-push-action`, refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@y
> [!NOTE]
>  For more information about  `docker/build-push-action`, refer to the [GitHub Action README](https://github.com/docker/build-push-action/blob/master/README.md).
@z

@x
### Step 3: Run the workflow
@y
### Step 3: Run the workflow
@z

@x
After you've added your workflow file, it's time to trigger and observe the CI/CD process in action.
@y
After you've added your workflow file, it's time to trigger and observe the CI/CD process in action.
@z

@x
1. Commit and push your workflow file
@y
1. Commit and push your workflow file
@z

@x
   Select "Commit changes…" in the GitHub editor.
@y
   Select "Commit changes…" in the GitHub editor.
@z

@x
   - This push will automatically trigger the GitHub Actions pipeline.
@y
   - This push will automatically trigger the GitHub Actions pipeline.
@z

@x
2. Monitor the workflow execution
@y
2. Monitor the workflow execution
@z

@x
   1. Go to the Actions tab in your GitHub repository.
   2. Click into the workflow run to follow each step: **build**, **test**, and (if successful) **push**.
@y
   1. Go to the Actions tab in your GitHub repository.
   2. Click into the workflow run to follow each step: **build**, **test**, and (if successful) **push**.
@z

@x
3. Verify the Docker image on Docker Hub
@y
3. Verify the Docker image on Docker Hub
@z

@x
   - After a successful workflow run, visit your [Docker Hub repositories](https://hub.docker.com/repositories).
   - You should see a new image under your repository with:
      - Repository name: `${your-repository-name}`
      - Tags include:
         - `latest` – represents the most recent successful build; ideal for quick testing or deployment.
         - `<short-sha>` – a unique identifier based on the commit hash, useful for version tracking, rollbacks, and traceability.
@y
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
>  - Navigate to your **GitHub repo → Settings → Branches**.
>  - Under Branch protection rules, click **Add rule**.
>  - Specify `main` as the branch name.
>  - Enable options like:
>     - *Require a pull request before merging*.
>     - *Require status checks to pass before merging*.
>
>  This ensures that only tested and reviewed code is merged into `main` branch.
---
@y
> [!TIP] Protect your main branch
> To maintain code quality and prevent accidental direct pushes, enable branch protection rules:
>  - Navigate to your **GitHub repo → Settings → Branches**.
>  - Under Branch protection rules, click **Add rule**.
>  - Specify `main` as the branch name.
>  - Enable options like:
>     - *Require a pull request before merging*.
>     - *Require status checks to pass before merging*.
>
>  This ensures that only tested and reviewed code is merged into `main` branch.
---
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you set up a complete CI/CD pipeline for your containerized React.js application using GitHub Actions.
@y
In this section, you set up a complete CI/CD pipeline for your containerized React.js application using GitHub Actions.
@z

@x
Here's what you accomplished:
@y
Here's what you accomplished:
@z

@x
- Created a new GitHub repository specifically for your project.
- Generated a secure Docker Hub access token and added it to GitHub as a secret.
- Defined a GitHub Actions workflow to:
   - Build your application inside a Docker container.
   - Run tests in a consistent, containerized environment.
   - Push a production-ready image to Docker Hub if tests pass.
- Triggered and verified the workflow execution through GitHub Actions.
- Confirmed that your image was successfully published to Docker Hub.
@y
- Created a new GitHub repository specifically for your project.
- Generated a secure Docker Hub access token and added it to GitHub as a secret.
- Defined a GitHub Actions workflow to:
   - Build your application inside a Docker container.
   - Run tests in a consistent, containerized environment.
   - Push a production-ready image to Docker Hub if tests pass.
- Triggered and verified the workflow execution through GitHub Actions.
- Confirmed that your image was successfully published to Docker Hub.
@z

@x
With this setup, your React.js application is now ready for automated testing and deployment across environments — increasing confidence, consistency, and team productivity.
@y
With this setup, your React.js application is now ready for automated testing and deployment across environments — increasing confidence, consistency, and team productivity.
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
- [Compose file reference](/compose/compose-file/) – Full configuration reference for `compose.yaml`  
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Optimize your image for performance and security  
@y
- [Introduction to GitHub Actions](guides/gha.md) – Learn how GitHub Actions automate your workflows  
- [Docker Build GitHub Actions](manuals/build/ci/github-actions/_index.md) – Set up container builds with GitHub Actions  
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) – Full reference for writing GitHub workflows  
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Full configuration reference for `compose.yaml`  
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Optimize your image for performance and security  
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, learn how you can locally test and debug your React.js workloads on Kubernetes before deploying. This helps you ensure your application behaves as expected in a production-like environment, reducing surprises during deployment.
@y
Next, learn how you can locally test and debug your React.js workloads on Kubernetes before deploying. This helps you ensure your application behaves as expected in a production-like environment, reducing surprises during deployment.
@z
