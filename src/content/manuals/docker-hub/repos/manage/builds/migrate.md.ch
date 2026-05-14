%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Migrate from Autobuilds to CI/CD workflows
keywords: automated builds, autobuilds, migration, github actions, bitbucket pipelines
title: Migrate from Autobuilds
linkTitle: Migrate
@y
description: Migrate from Autobuilds to CI/CD workflows
keywords: automated builds, autobuilds, migration, github actions, bitbucket pipelines
title: Migrate from Autobuilds
linkTitle: Migrate
@z

@x
> [!WARNING]
> Docker Hub Automated Builds is a deprecated feature.
> It will be fully retired on April 1, 2027.
@y
> [!WARNING]
> Docker Hub 自動ビルドは廃止予定の機能となりました。
> 2027 年 4 月 1 日に完全に削除されます。
@z

@x
This guide explains how to migrate your Docker Hub Autobuilds setup to
Continuous Integration (CI) workflows, focusing on GitHub Actions and Bitbucket
Pipelines as these are the built-in CI services for the two version control
services supported via Autobuilds.
@y
This guide explains how to migrate your Docker Hub Autobuilds setup to
Continuous Integration (CI) workflows, focusing on GitHub Actions and Bitbucket
Pipelines as these are the built-in CI services for the two version control
services supported via Autobuilds.
@z

@x
## Step 1: Create access tokens
@y
## Step 1: Create access tokens
@z

@x
To grant your CI workflows the ability to pull and push images to and from
Docker Hub, you first need to create access tokens:
@y
To grant your CI workflows the ability to pull and push images to and from
Docker Hub, you first need to create access tokens:
@z

@x
- For a personal repository: Create a [Personal
  Access Token](../../../../security/access-tokens.md) with **Read & Write**
  permissions.
@y
- For a personal repository: Create a [Personal
  Access Token](../../../../security/access-tokens.md) with **Read & Write**
  permissions.
@z

@x
- For an organization repository: Create an [Organization Access
  Token](../../../../enterprise/security/access-tokens.md) with the following
  permissions:
  - **Read public repositories**
  - **Image Pull** on any private repositories that the build needs to pull from
  - **Image Push** on the repository that the built image will be pushed to
@y
- For an organization repository: Create an [Organization Access
  Token](../../../../enterprise/security/access-tokens.md) with the following
  permissions:
  - **Read public repositories**
  - **Image Pull** on any private repositories that the build needs to pull from
  - **Image Push** on the repository that the built image will be pushed to
@z

@x
The same token can be used for all CI workflows under the account's namespace
provided it has adequate permissions to all relevant Docker Hub repositories.
@y
The same token can be used for all CI workflows under the account's namespace
provided it has adequate permissions to all relevant Docker Hub repositories.
@z

@x
Store the token securely in a password manager or your CI/CD platform's secrets
manager. Never commit tokens to source code repositories.
@y
Store the token securely in a password manager or your CI/CD platform's secrets
manager. Never commit tokens to source code repositories.
@z

@x
## Step 2: Extract your Autobuilds configuration
@y
## Step 2: Extract your Autobuilds configuration
@z

@x
For each Docker Hub repository currently configured to use Autobuilds, you need
to extract its configuration to set up your CI workflows to duplicate the
existing functionality. The only way to extract the configuration is via the
Docker Hub web interface.
@y
For each Docker Hub repository currently configured to use Autobuilds, you need
to extract its configuration to set up your CI workflows to duplicate the
existing functionality. The only way to extract the configuration is via the
Docker Hub web interface.
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Navigate to your repository by going to **My Hub** > ***Your namespace*** >
   **Repositories** > ***Your Repository***.
@y
2. Navigate to your repository by going to **My Hub** > ***Your namespace*** >
   **Repositories** > ***Your Repository***.
@z

@x
3. Go to the **Builds** tab and select **Configure automated builds**.
@y
3. Go to the **Builds** tab and select **Configure automated builds**.
@z

@x
   If there is no existing build configuration, then this repository is not
   configured for Autobuilds.
@y
   If there is no existing build configuration, then this repository is not
   configured for Autobuilds.
@z

@x
4. Note the following configuration details:
@y
4. Note the following configuration details:
@z

@x
   - **Source Repository**: The GitHub or Bitbucket repository. The organization
     is the namespace and the repository is the repository name. This is where
     you need to add your workflow.
@y
   - **Source Repository**: The GitHub or Bitbucket repository. The organization
     is the namespace and the repository is the repository name. This is where
     you need to add your workflow.
@z

@x
   - **Autotest**: If Autotest is enabled for Pull Requests (either internal
     only or internal and external), then extra steps are needed in your
     workflow to run the Autotest step.
@y
   - **Autotest**: If Autotest is enabled for Pull Requests (either internal
     only or internal and external), then extra steps are needed in your
     workflow to run the Autotest step.
@z

@x
   - **Repository Links**: Not supported and can be ignored. If chain builds are
     required, see the documentation for your CI service on how to chain builds
     together.
@y
   - **Repository Links**: Not supported and can be ignored. If chain builds are
     required, see the documentation for your CI service on how to chain builds
     together.
@z

@x
   - **Build Rules**: Specify the triggers, tags, and paths of your builds.
     Ignore any entry where **Autobuild** is toggled off.
@y
   - **Build Rules**: Specify the triggers, tags, and paths of your builds.
     Ignore any entry where **Autobuild** is toggled off.
@z

@x
   - **Build Environment Variables**: User-defined variables injected as
     environment variables into your build. You need to add these to your
     workflow. If the environment variables contain secrets, add them to your CI
     service's secrets manager. Then update your Dockerfile or build scripts to
     reference these secrets using your CI platform's syntax. See your CI
     service documentation on how to handle secrets.
@y
   - **Build Environment Variables**: User-defined variables injected as
     environment variables into your build. You need to add these to your
     workflow. If the environment variables contain secrets, add them to your CI
     service's secrets manager. Then update your Dockerfile or build scripts to
     reference these secrets using your CI platform's syntax. See your CI
     service documentation on how to handle secrets.
@z

@x
### Example configuration
@y
### Example configuration
@z

@x
The following image shows an example Autobuilds configuration.
@y
The following image shows an example Autobuilds configuration.
@z

@x
![Example Autobuilds configuration](./images/autobuild-example.png)
@y
![Example Autobuilds configuration](./images/autobuild-example.png)
@z

@x
Based on the pictured example, you would note the following items for this
Autobuilds configuration:
@y
Based on the pictured example, you would note the following items for this
Autobuilds configuration:
@z

@x
- Source code repository: GitHub repository `docker/docker-rust-hello`
- Autotest: Disabled
- Build rule 1: Build and push the image with tag `latest` when a new commit to
  the `main` branch is detected. The Dockerfile is at `./Dockerfile` and the
  build context is the root of the cloned code.
- Build rule 2: Build and push the image with tag `v{\1}` when a new commit
  to a tag matching the regex `^v([0-9.]+)$` is detected. The Dockerfile is at
  `./Dockerfile` and the build context is the root of the cloned code.
- Environment variable: Key `ENV_KEY` with value `ENV_VALUE`
@y
- Source code repository: GitHub repository `docker/docker-rust-hello`
- Autotest: Disabled
- Build rule 1: Build and push the image with tag `latest` when a new commit to
  the `main` branch is detected. The Dockerfile is at `./Dockerfile` and the
  build context is the root of the cloned code.
- Build rule 2: Build and push the image with tag `v{\1}` when a new commit
  to a tag matching the regex `^v([0-9.]+)$` is detected. The Dockerfile is at
  `./Dockerfile` and the build context is the root of the cloned code.
- Environment variable: Key `ENV_KEY` with value `ENV_VALUE`
@z

@x
## Step 3: Migrate to your CI/CD platform
@y
## Step 3: Migrate to your CI/CD platform
@z

@x
Select the tab that matches your source code repository hosting platform.
@y
Select the tab that matches your source code repository hosting platform.
@z

@x
{{< tabs >}}
{{< tab name="GitHub Actions" >}}
@y
{{< tabs >}}
{{< tab name="GitHub Actions" >}}
@z

@x
If your source code repository is hosted on GitHub, see the [Docker
Autobuilds example repository](https://github.com/docker/autobuilds-actions).
@y
If your source code repository is hosted on GitHub, see the [Docker
Autobuilds example repository](https://github.com/docker/autobuilds-actions).
@z

@x
All files except those under the `.github/workflows` directory are for example
purposes only.
@y
All files except those under the `.github/workflows` directory are for example
purposes only.
@z

@x
The repository's readme details how to migrate from Autobuilds to GitHub Actions
using one of the two provided workflows:
@y
The repository's readme details how to migrate from Autobuilds to GitHub Actions
using one of the two provided workflows:
@z

@x
- The `simple-build` workflow builds and pushes a Docker image to your Docker
  Hub repository.
- The `full-autobuilds` workflow contains all the steps commonly used within an
  Autobuilds run, including building, tagging, running Docker Compose tests, and
  running optional bash hook files.
@y
- The `simple-build` workflow builds and pushes a Docker image to your Docker
  Hub repository.
- The `full-autobuilds` workflow contains all the steps commonly used within an
  Autobuilds run, including building, tagging, running Docker Compose tests, and
  running optional bash hook files.
@z

@x
### Steps to migrate
@y
### Steps to migrate
@z

@x
1. Follow the instructions in the [example repository
   readme](https://github.com/docker/autobuilds-actions) to configure a CI GitHub
   Action workflow in your GitHub repository.
@y
1. Follow the instructions in the [example repository
   readme](https://github.com/docker/autobuilds-actions) to configure a CI GitHub
   Action workflow in your GitHub repository.
@z

@x
2. The workflows contain comments on what each step does and where changes
   should be made. Important changes to make include:
@y
2. The workflows contain comments on what each step does and where changes
   should be made. Important changes to make include:
@z

@x
   - Set the `DOCKER_REPOSITORY_NAME` environment variable to the full name of your Docker Hub repository
   - Set your image tagging policy
   - Set the workflow triggers
@y
   - Set the `DOCKER_REPOSITORY_NAME` environment variable to the full name of your Docker Hub repository
   - Set your image tagging policy
   - Set the workflow triggers
@z

@x
   Links to relevant documentation are provided in the readme and the workflow comments.
@y
   Links to relevant documentation are provided in the readme and the workflow comments.
@z

@x
3. After you have completed migrating to GitHub Actions, delete the build
   configuration from your Docker Hub repository:
@y
3. After you have completed migrating to GitHub Actions, delete the build
   configuration from your Docker Hub repository:
@z

@x
   1. Navigate to the repository's **Builds** tab.
@y
   1. Navigate to the repository's **Builds** tab.
@z

@x
   2. Select **Configure automated builds**.
@y
   2. Select **Configure automated builds**.
@z

@x
   3. Select **Delete Build Configuration**.
@y
   3. Select **Delete Build Configuration**.
@z

@x
{{< /tab >}}
{{< tab name="Bitbucket Pipelines" >}}
@y
{{< /tab >}}
{{< tab name="Bitbucket Pipelines" >}}
@z

@x
If your source code repository is hosted on Bitbucket, see the [Docker
Autobuilds Bitbucket example
repository](https://bitbucket.org/docker-io/autobuilds-pipeline).
@y
If your source code repository is hosted on Bitbucket, see the [Docker
Autobuilds Bitbucket example
repository](https://bitbucket.org/docker-io/autobuilds-pipeline).
@z

@x
All files except the `bitbucket-pipelines.yml` file are for example purposes only.
@y
All files except the `bitbucket-pipelines.yml` file are for example purposes only.
@z

@x
The repository's readme details how to migrate from Autobuilds to Bitbucket
Pipelines using the provided example `bitbucket-pipelines.yml` configuration
file.
@y
The repository's readme details how to migrate from Autobuilds to Bitbucket
Pipelines using the provided example `bitbucket-pipelines.yml` configuration
file.
@z

@x
The pipeline example contains three separate pipelines:
@y
The pipeline example contains three separate pipelines:
@z

@x
- `branches/main`: Shows how to build, test, and push an image on changes to a specific branch
- `tags/*`: Shows how to build, test, and push an image on tag pushes, including
  tagging the image the same as the Git tag
- `pull-requests/*`: Shows how to build and test, but not push, an image from a pull request
@y
- `branches/main`: Shows how to build, test, and push an image on changes to a specific branch
- `tags/*`: Shows how to build, test, and push an image on tag pushes, including
  tagging the image the same as the Git tag
- `pull-requests/*`: Shows how to build and test, but not push, an image from a pull request
@z

@x
### Steps to migrate
@y
### Steps to migrate
@z

@x
1. Follow the instructions in the [example repository
   readme](https://bitbucket.org/docker-io/autobuilds-pipeline) to configure
   a Bitbucket Pipeline in your Bitbucket repository.
@y
1. Follow the instructions in the [example repository
   readme](https://bitbucket.org/docker-io/autobuilds-pipeline) to configure
   a Bitbucket Pipeline in your Bitbucket repository.
@z

@x
2. Comments in the pipeline configuration explain what each part does and where
   changes need to be made. Important changes to make include:
@y
2. Comments in the pipeline configuration explain what each part does and where
   changes need to be made. Important changes to make include:
@z

@x
   - Set the `DOCKER_REPOSITORY_NAME` environment variable to the full name of
     your Docker Hub repository
   - Set your image tagging policy (see where the `DOCKER_TAG` variable is set in each pipeline)
   - Set the pipeline triggers for branches, tags, and/or pull-requests
@y
   - Set the `DOCKER_REPOSITORY_NAME` environment variable to the full name of
     your Docker Hub repository
   - Set your image tagging policy (see where the `DOCKER_TAG` variable is set in each pipeline)
   - Set the pipeline triggers for branches, tags, and/or pull-requests
@z

@x
   Links to relevant documentation are provided in the readme and the workflow comments.
@y
   Links to relevant documentation are provided in the readme and the workflow comments.
@z

@x
3. After you have completed migrating to Bitbucket Pipelines, delete the Build
   configuration from your Docker Hub repository:
@y
3. After you have completed migrating to Bitbucket Pipelines, delete the Build
   configuration from your Docker Hub repository:
@z

@x
   1. Navigate to the repository's **Builds** tab.
@y
   1. Navigate to the repository's **Builds** tab.
@z

@x
   2. Select **Configure automated builds**.
@y
   2. Select **Configure automated builds**.
@z

@x
   3. Select **Delete Build Configuration**.
@y
   3. Select **Delete Build Configuration**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
