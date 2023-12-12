%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to integrate Docker Scout with Circle CI
keywords: supply chain, security, ci, continuous integration, circle ci
title: Integrate Docker Scout with Circle CI
---
@y
---
description: How to integrate Docker Scout with Circle CI
keywords: supply chain, security, ci, continuous integration, circle ci
title: Integrate Docker Scout with Circle CI
---
@z

@x
The following examples runs when triggered in CircleCI. When triggered, it
checks out the "docker/scout-demo-service:latest" image and tag and then uses
Docker Scout to create a CVE report.
@y
The following examples runs when triggered in CircleCI. When triggered, it
checks out the "docker/scout-demo-service:latest" image and tag and then uses
Docker Scout to create a CVE report.
@z

@x
Add the following to a _.circleci/config.yml_ file.
@y
Add the following to a _.circleci/config.yml_ file.
@z

@x
First, set up the rest of the workflow. Add the following to the YAML file:
@y
First, set up the rest of the workflow. Add the following to the YAML file:
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
  build:
    docker:
      - image: cimg/base:stable
    environment:
      IMAGE_TAG: docker/scout-demo-service:latest
```
@y
jobs:
  build:
    docker:
      - image: cimg/base:stable
    environment:
      IMAGE_TAG: docker/scout-demo-service:latest
```
@z

@x
This defines the container image the workflow uses and an environment variable
for the image.
@y
This defines the container image the workflow uses and an environment variable
for the image.
@z

@x
Add the following to the YAML file to define the steps for the workflow:
@y
Add the following to the YAML file to define the steps for the workflow:
@z

@x
```yaml
steps:
  # Checkout the repository files
  - checkout
@y
```yaml
steps:
  # Checkout the repository files
  - checkout
@z

@x
  # Set up a separate Docker environment to run `docker` commands in
  - setup_remote_docker:
      version: 20.10.24
@y
  # Set up a separate Docker environment to run `docker` commands in
  - setup_remote_docker:
      version: 20.10.24
@z

@x
  # Install Docker Scout and login to Docker Hub
  - run:
      name: Install Docker Scout
      command: |
        env
        curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- -b /home/circleci/bin
        echo $DOCKER_HUB_PAT | docker login -u $DOCKER_HUB_USER --password-stdin
@y
  # Install Docker Scout and login to Docker Hub
  - run:
      name: Install Docker Scout
      command: |
        env
        curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- -b /home/circleci/bin
        echo $DOCKER_HUB_PAT | docker login -u $DOCKER_HUB_USER --password-stdin
@z

@x
  # Build the Docker image
  - run:
      name: Build Docker image
      command: docker build -t $IMAGE_TAG .
@y
  # Build the Docker image
  - run:
      name: Build Docker image
      command: docker build -t $IMAGE_TAG .
@z

@x
  # Run Docker Scout          
  - run:
      name: Scan image for CVEs
      command: |
        docker-scout cves $IMAGE_TAG --exit-code --only-severity critical,high
```
@y
  # Run Docker Scout          
  - run:
      name: Scan image for CVEs
      command: |
        docker-scout cves $IMAGE_TAG --exit-code --only-severity critical,high
```
@z

@x
This checks out the repository files and then sets up a separate Docker
environment to run commands in.
@y
This checks out the repository files and then sets up a separate Docker
environment to run commands in.
@z

@x
It installs Docker Scout, logs into Docker Hub, builds the Docker image, and
then runs Docker Scout to generate a CVE report. It only shows critical or
high-severity vulnerabilities.
@y
It installs Docker Scout, logs into Docker Hub, builds the Docker image, and
then runs Docker Scout to generate a CVE report. It only shows critical or
high-severity vulnerabilities.
@z

@x
Finally, add a name for the workflow and the workflow's jobs:
@y
Finally, add a name for the workflow and the workflow's jobs:
@z

@x
```yaml
workflows:
  build-docker-image:
    jobs:
      - build
```
@y
```yaml
workflows:
  build-docker-image:
    jobs:
      - build
```
@z
