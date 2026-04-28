%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

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

@x within code
        // Agent details
@y
        // Agent details
@z
@x
                // Install Docker Scout
@y
                // Install Docker Scout
@z
@x
                // Log into Docker Hub
@y
                // Log into Docker Hub
@z
@x
                // Analyze and fail on critical or high vulnerabilities
@y
                // Analyze and fail on critical or high vulnerabilities
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

@x
> [!NOTE]
>
> If you're seeing a `permission denied` error related to the image cache, try
> setting the [`DOCKER_SCOUT_CACHE_DIR`](/manuals/scout/how-tos/configure-cli.md) environment
> variable to a writable directory. Or alternatively, disable local caching
> entirely with `DOCKER_SCOUT_NO_CACHE=true`.
@y
> [!NOTE]
>
> If you're seeing a `permission denied` error related to the image cache, try
> setting the [`DOCKER_SCOUT_CACHE_DIR`](manuals/scout/how-tos/configure-cli.md) environment
> variable to a writable directory. Or alternatively, disable local caching
> entirely with `DOCKER_SCOUT_NO_CACHE=true`.
@z
