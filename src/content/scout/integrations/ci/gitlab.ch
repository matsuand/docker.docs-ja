%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to integrate Docker Scout with GitLab CI
keywords: supply chain, security, ci, continuous integration, gitlab
title: Integrate Docker Scout with GitLab CI
---
@y
---
description: How to integrate Docker Scout with GitLab CI
keywords: supply chain, security, ci, continuous integration, gitlab
title: Integrate Docker Scout with GitLab CI
---
@z

@x
The following examples runs in GitLab CI in a repository containing a Docker
image's definition and contents. Triggered by a commit, the pipeline builds the
image. If the commit was to the default branch, it uses Docker Scout to get a
CVE report. If the commit was to a different branch, it uses Docker Scout to
compare the new version to the current published version.
@y
The following examples runs in GitLab CI in a repository containing a Docker
image's definition and contents. Triggered by a commit, the pipeline builds the
image. If the commit was to the default branch, it uses Docker Scout to get a
CVE report. If the commit was to a different branch, it uses Docker Scout to
compare the new version to the current published version.
@z

@x
## Steps
@y
## Steps
@z

@x
First, set up the rest of the workflow. There's a lot that's not specific to
Docker Scout but needed to create the images to compare.
@y
First, set up the rest of the workflow. There's a lot that's not specific to
Docker Scout but needed to create the images to compare.
@z

@x
Add the following to a `.gitlab-ci.yml` file at the root of your repository.
@y
Add the following to a `.gitlab-ci.yml` file at the root of your repository.
@z

@x
```yaml
docker-build:
  image: docker:latest
  stage: build
  services:
    - docker:dind
  before_script:
    - docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" $CI_REGISTRY
@y
```yaml
docker-build:
  image: docker:latest
  stage: build
  services:
    - docker:dind
  before_script:
    - docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" $CI_REGISTRY
@z

@x
    # Install curl and the Docker Scout CLI
    - |
      apk add --update curl
      curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- 
      apk del curl 
      rm -rf /var/cache/apk/*
    # Login to Docker Hub required for Docker Scout CLI
    - docker login -u "$DOCKER_HUB_USER" -p "$DOCKER_HUB_PAT"
```
@y
    # Install curl and the Docker Scout CLI
    - |
      apk add --update curl
      curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- 
      apk del curl 
      rm -rf /var/cache/apk/*
    # Login to Docker Hub required for Docker Scout CLI
    - docker login -u "$DOCKER_HUB_USER" -p "$DOCKER_HUB_PAT"
```
@z

@x
This sets up the workflow to build Docker images with Docker-in-Docker mode,
running Docker inside a container.
@y
This sets up the workflow to build Docker images with Docker-in-Docker mode,
running Docker inside a container.
@z

@x
It then downloads `curl` and the Docker Scout CLI plugin, logs into the Docker
registry using environment variables defined in your repository's settings.
@y
It then downloads `curl` and the Docker Scout CLI plugin, logs into the Docker
registry using environment variables defined in your repository's settings.
@z

@x
Add the following to the YAML file:
@y
Add the following to the YAML file:
@z

@x
```yaml
script:
  - |
    if [[ "$CI_COMMIT_BRANCH" == "$CI_DEFAULT_BRANCH" ]]; then
      tag=""
      echo "Running on default branch '$CI_DEFAULT_BRANCH': tag = 'latest'"
    else
      tag=":$CI_COMMIT_REF_SLUG"
      echo "Running on branch '$CI_COMMIT_BRANCH': tag = $tag"
    fi
  - docker build --pull -t "$CI_REGISTRY_IMAGE${tag}" .
  - |
    if [[ "$CI_COMMIT_BRANCH" == "$CI_DEFAULT_BRANCH" ]]; then
      # Get a CVE report for the built image and fail the pipeline when critical or high CVEs are detected
      docker scout cves "$CI_REGISTRY_IMAGE${tag}" --exit-code --only-severity critical,high    
    else
      # Compare image from branch with latest image from the default branch and fail if new critical or high CVEs are detected
      docker scout compare "$CI_REGISTRY_IMAGE${tag}" --to "$CI_REGISTRY_IMAGE:latest" --exit-code --only-severity critical,high --ignore-unchanged
    fi
@y
```yaml
script:
  - |
    if [[ "$CI_COMMIT_BRANCH" == "$CI_DEFAULT_BRANCH" ]]; then
      tag=""
      echo "Running on default branch '$CI_DEFAULT_BRANCH': tag = 'latest'"
    else
      tag=":$CI_COMMIT_REF_SLUG"
      echo "Running on branch '$CI_COMMIT_BRANCH': tag = $tag"
    fi
  - docker build --pull -t "$CI_REGISTRY_IMAGE${tag}" .
  - |
    if [[ "$CI_COMMIT_BRANCH" == "$CI_DEFAULT_BRANCH" ]]; then
      # Get a CVE report for the built image and fail the pipeline when critical or high CVEs are detected
      docker scout cves "$CI_REGISTRY_IMAGE${tag}" --exit-code --only-severity critical,high    
    else
      # Compare image from branch with latest image from the default branch and fail if new critical or high CVEs are detected
      docker scout compare "$CI_REGISTRY_IMAGE${tag}" --to "$CI_REGISTRY_IMAGE:latest" --exit-code --only-severity critical,high --ignore-unchanged
    fi
@z

@x
  - docker push "$CI_REGISTRY_IMAGE${tag}"
```
@y
  - docker push "$CI_REGISTRY_IMAGE${tag}"
```
@z

@x
This creates the flow mentioned previously. If the commit was to the default
branch, Docker Scout generates a CVE report. If the commit was to a different
branch, Docker Scout compares the new version to the current published version.
It only shows critical or high-severity vulnerabilities and ignores
vulnerabilities that haven't changed since the last analysis.
@y
This creates the flow mentioned previously. If the commit was to the default
branch, Docker Scout generates a CVE report. If the commit was to a different
branch, Docker Scout compares the new version to the current published version.
It only shows critical or high-severity vulnerabilities and ignores
vulnerabilities that haven't changed since the last analysis.
@z

@x
Add the following to the YAML file:
@y
Add the following to the YAML file:
@z

@x
```yaml
rules:
  - if: $CI_COMMIT_BRANCH
    exists:
      - Dockerfile
```
@y
```yaml
rules:
  - if: $CI_COMMIT_BRANCH
    exists:
      - Dockerfile
```
@z

@x
These final lines ensure that the pipeline only runs if the commit contains a
Dockerfile and if the commit was to the CI branch.
@y
These final lines ensure that the pipeline only runs if the commit contains a
Dockerfile and if the commit was to the CI branch.
@z

@x
## Video walkthrough
@y
## Video walkthrough
@z

@x
The following is a video walkthrough of the process of setting up the workflow with GitLab.
@y
The following is a video walkthrough of the process of setting up the workflow with GitLab.
@z

@x
<iframe class="border-0 w-full aspect-video mb-8" allow="fullscreen" src="https://www.loom.com/embed/451336c4508c42189532108fc37b2560?sid=f912524b-276d-417d-b44a-c2d39719aa1a"></iframe>
@y
<iframe class="border-0 w-full aspect-video mb-8" allow="fullscreen" src="https://www.loom.com/embed/451336c4508c42189532108fc37b2560?sid=f912524b-276d-417d-b44a-c2d39719aa1a"></iframe>
@z
