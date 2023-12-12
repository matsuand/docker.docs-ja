%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Integrate your runtime environments with Docker Scout using the CLI client
keywords: docker scout, integration, image analysis, runtime, workloads, cli, environments
title: Generic environment integration with CLI
---
@y
---
description: Integrate your runtime environments with Docker Scout using the CLI client
keywords: docker scout, integration, image analysis, runtime, workloads, cli, environments
title: Generic environment integration with CLI
---
@z

@x
{{< include "scout-early-access.md" >}}
@y
{{< include "scout-early-access.md" >}}
@z

@x
You can create a generic environment integration by running the Docker Scout
CLI client in your CI workflows. The CLI client is available as a binary on
GitHub and as a container image on Docker Hub. Use the client to invoke the
`docker scout environment` command to assign your images to environments.
@y
You can create a generic environment integration by running the Docker Scout
CLI client in your CI workflows. The CLI client is available as a binary on
GitHub and as a container image on Docker Hub. Use the client to invoke the
`docker scout environment` command to assign your images to environments.
@z

@x
For more information about how to use the `docker scout environment` command,
refer to the [CLI reference](../../../engine/reference/commandline/scout_environment.md).
@y
For more information about how to use the `docker scout environment` command,
refer to the [CLI reference](../../../engine/reference/commandline/scout_environment.md).
@z

@x
## Examples
@y
## Examples
@z

@x
Before you start, set the following environment variables in your CI system:
@y
Before you start, set the following environment variables in your CI system:
@z

@x
- `DOCKER_SCOUT_HUB_USER`: your Docker Hub username
- `DOCKER_SCOUT_HUB_PASSWORD`: your Docker Hub personal access token
@y
- `DOCKER_SCOUT_HUB_USER`: your Docker Hub username
- `DOCKER_SCOUT_HUB_PASSWORD`: your Docker Hub personal access token
@z

@x
Make sure the variables are accessible to your project.
@y
Make sure the variables are accessible to your project.
@z

@x
{{< tabs >}}
{{< tab name="Circle CI" >}}
@y
{{< tabs >}}
{{< tab name="Circle CI" >}}
@z

@x
```yaml
version: 2.1
@y
```yaml
version: 2.1
@z

@x
jobs:
  record_environment:
    machine:
      image: ubuntu-2204:current
    image: namespace/repo
    steps:
      - run: |
          if [[ -z "$CIRCLE_TAG" ]]; then
            tag="$CIRCLE_TAG"
            echo "Running tag '$CIRCLE_TAG'"
          else
            tag="$CIRCLE_BRANCH"
            echo "Running on branch '$CI_COMMIT_BRANCH'"
          fi    
          echo "tag = $tag"
      - run: docker run -it \
          -e DOCKER_SCOUT_HUB_USER=$DOCKER_SCOUT_HUB_USER \
          -e DOCKER_SCOUT_HUB_PASSWORD=$DOCKER_SCOUT_HUB_PASSWORD \
          docker/scout-cli:1.0.2 environment \
          --org "<MY_DOCKER_ORG>" \
          "<ENVIRONMENT>" ${image}:${tag}
```
@y
jobs:
  record_environment:
    machine:
      image: ubuntu-2204:current
    image: namespace/repo
    steps:
      - run: |
          if [[ -z "$CIRCLE_TAG" ]]; then
            tag="$CIRCLE_TAG"
            echo "Running tag '$CIRCLE_TAG'"
          else
            tag="$CIRCLE_BRANCH"
            echo "Running on branch '$CI_COMMIT_BRANCH'"
          fi    
          echo "tag = $tag"
      - run: docker run -it \
          -e DOCKER_SCOUT_HUB_USER=$DOCKER_SCOUT_HUB_USER \
          -e DOCKER_SCOUT_HUB_PASSWORD=$DOCKER_SCOUT_HUB_PASSWORD \
          docker/scout-cli:1.0.2 environment \
          --org "<MY_DOCKER_ORG>" \
          "<ENVIRONMENT>" ${image}:${tag}
```
@z

@x
{{< /tab >}}
{{< tab name="GitLab" >}}
@y
{{< /tab >}}
{{< tab name="GitLab" >}}
@z

@x
The following example uses the [Docker executor](https://docs.gitlab.com/runner/executors/docker.html).
@y
The following example uses the [Docker executor](https://docs.gitlab.com/runner/executors/docker.html).
@z

@x
```yaml
variables:
  image: namespace/repo
@y
```yaml
variables:
  image: namespace/repo
@z

@x
record_environment:
  image: docker/scout-cli:1.0.2
  script:
    - |
      if [[ -z "$CI_COMMIT_TAG" ]]; then
        tag="latest"
        echo "Running tag '$CI_COMMIT_TAG'"
      else
        tag="$CI_COMMIT_REF_SLUG"
        echo "Running on branch '$CI_COMMIT_BRANCH'"
      fi    
      echo "tag = $tag"
    - environment --org <MY_DOCKER_ORG> "PRODUCTION" ${image}:${tag}
```
@y
record_environment:
  image: docker/scout-cli:1.0.2
  script:
    - |
      if [[ -z "$CI_COMMIT_TAG" ]]; then
        tag="latest"
        echo "Running tag '$CI_COMMIT_TAG'"
      else
        tag="$CI_COMMIT_REF_SLUG"
        echo "Running on branch '$CI_COMMIT_BRANCH'"
      fi    
      echo "tag = $tag"
    - environment --org <MY_DOCKER_ORG> "PRODUCTION" ${image}:${tag}
```
@z

@x
{{< /tab >}}
{{< tab name="Azure DevOps" >}}
@y
{{< /tab >}}
{{< tab name="Azure DevOps" >}}
@z

@x
```yaml
trigger:
  - main
@y
```yaml
trigger:
  - main
@z

@x
resources:
  - repo: self
@y
resources:
  - repo: self
@z

@x
variables:
  tag: "$(Build.BuildId)"
  image: "namespace/repo"
@y
variables:
  tag: "$(Build.BuildId)"
  image: "namespace/repo"
@z

@x
stages:
  - stage: Docker Scout
    displayName: Docker Scout environment integration
    jobs:
      - job: Record
        displayName: Record environment
        pool:
          vmImage: ubuntu-latest
        steps:
          - task: Docker@2
          - script: docker run -it \
              -e DOCKER_SCOUT_HUB_USER=$DOCKER_SCOUT_HUB_USER \
              -e DOCKER_SCOUT_HUB_PASSWORD=$DOCKER_SCOUT_HUB_PASSWORD \
              docker/scout-cli:1.0.2 environment \
              --org "<MY_DOCKER_ORG>" \
              "<ENVIRONMENT>" $(image):$(tag)
```
@y
stages:
  - stage: Docker Scout
    displayName: Docker Scout environment integration
    jobs:
      - job: Record
        displayName: Record environment
        pool:
          vmImage: ubuntu-latest
        steps:
          - task: Docker@2
          - script: docker run -it \
              -e DOCKER_SCOUT_HUB_USER=$DOCKER_SCOUT_HUB_USER \
              -e DOCKER_SCOUT_HUB_PASSWORD=$DOCKER_SCOUT_HUB_PASSWORD \
              docker/scout-cli:1.0.2 environment \
              --org "<MY_DOCKER_ORG>" \
              "<ENVIRONMENT>" $(image):$(tag)
```
@z

@x
{{< /tab >}}
{{< tab name="Jenkins" >}}
@y
{{< /tab >}}
{{< tab name="Jenkins" >}}
@z

@x
```groovy
stage('Analyze image') {
    steps {
        // Install Docker Scout
        sh 'curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- -b /usr/local/bin'
@y
```groovy
stage('Analyze image') {
    steps {
        // Install Docker Scout
        sh 'curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- -b /usr/local/bin'
@z

@x
        // Log into Docker Hub
        sh 'echo $DOCKER_SCOUT_HUB_PASSWORD | docker login -u $DOCKER_SCOUT_HUB_USER --password-stdin'
@y
        // Log into Docker Hub
        sh 'echo $DOCKER_SCOUT_HUB_PASSWORD | docker login -u $DOCKER_SCOUT_HUB_USER --password-stdin'
@z

@x
        // Analyze and fail on critical or high vulnerabilities
        sh 'docker-scout environment --org "<MY_DOCKER_ORG>" "<ENVIRONMENT>" $IMAGE_TAG
    }
}
```
@y
        // Analyze and fail on critical or high vulnerabilities
        sh 'docker-scout environment --org "<MY_DOCKER_ORG>" "<ENVIRONMENT>" $IMAGE_TAG
    }
}
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
