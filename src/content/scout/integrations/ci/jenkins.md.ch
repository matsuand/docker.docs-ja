%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% (no slash) 対応

@x
description: How to integrate Docker Scout with Jenkins
keywords: supply chain, security, ci, continuous integration, jenkins
title: Integrate Docker Scout with Jenkins
@y
description: How to integrate Docker Scout with Jenkins
keywords: supply chain, security, ci, continuous integration, jenkins
title: Integrate Docker Scout with Jenkins
@z

@x
You can add the following stage and steps definition to a `Jenkinsfile` to run
Docker Scout as part of a Jenkins pipeline. The pipeline needs a `DOCKER_HUB`
credential containing the username and password for authenticating to Docker
Hub. It also needs an environment variable defined for the image and tag.
@y
You can add the following stage and steps definition to a `Jenkinsfile` to run
Docker Scout as part of a Jenkins pipeline. The pipeline needs a `DOCKER_HUB`
credential containing the username and password for authenticating to Docker
Hub. It also needs an environment variable defined for the image and tag.
@z

@x
```groovy
pipeline {
    agent {
        // Agent details
    }
@y
```groovy
pipeline {
    agent {
        // Agent details
    }
@z

@x
    environment {
        DOCKER_HUB = credentials('jenkins-docker-hub-credentials')
        IMAGE_TAG  = 'myorg/scout-demo-service:latest'
    }
@y
    environment {
        DOCKER_HUB = credentials('jenkins-docker-hub-credentials')
        IMAGE_TAG  = 'myorg/scout-demo-service:latest'
    }
@z

@x
    stages {
        stage('Analyze image') {
            steps {
                // Install Docker Scout
                sh 'curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- -b /usr/local/bin'
@y
    stages {
        stage('Analyze image') {
            steps {
                // Install Docker Scout
                sh 'curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s -- -b /usr/local/bin'
@z

@x
                // Log into Docker Hub
                sh 'echo $DOCKER_HUB_PSW | docker login -u $DOCKER_HUB_USR --password-stdin'
@y
                // Log into Docker Hub
                sh 'echo $DOCKER_HUB_PSW | docker login -u $DOCKER_HUB_USR --password-stdin'
@z

@x
                // Analyze and fail on critical or high vulnerabilities
                sh 'docker-scout cves $IMAGE_TAG --exit-code --only-severity critical,high'
            }
        }
    }
}
```
@y
                // Analyze and fail on critical or high vulnerabilities
                sh 'docker-scout cves $IMAGE_TAG --exit-code --only-severity critical,high'
            }
        }
    }
}
```
@z

@x
This installs Docker Scout, logs into Docker Hub, and then runs Docker Scout to
generate a CVE report for an image and tag. It only shows critical or
high-severity vulnerabilities.
@y
This installs Docker Scout, logs into Docker Hub, and then runs Docker Scout to
generate a CVE report for an image and tag. It only shows critical or
high-severity vulnerabilities.
@z

@x (no slash) 対応
> **Note**
>
> If you're seeing a `permission denied` error related to the image cache, try
> setting the [`DOCKER_SCOUT_CACHE_DIR`](/scout/how-tos/configure-cli.md) environment
> variable to a writable directory. Or alternatively, disable local caching
> entirely with `DOCKER_SCOUT_NO_CACHE=true`.
@y
> **Note**
>
> If you're seeing a `permission denied` error related to the image cache, try
> setting the [`DOCKER_SCOUT_CACHE_DIR`](scout/how-tos/configure-cli.md) environment
> variable to a writable directory. Or alternatively, disable local caching
> entirely with `DOCKER_SCOUT_NO_CACHE=true`.
@z
