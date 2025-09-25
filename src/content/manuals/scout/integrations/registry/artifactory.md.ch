%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Integrate Artifactory Container Registry with Docker Scout
keywords: docker scout, artifactory, integration, image analysis, security, cves
title: Integrate Docker Scout with Artifactory Container Registry
linkTitle: Artifactory Container Registry
@y
description: Integrate Artifactory Container Registry with Docker Scout
keywords: docker scout, artifactory, integration, image analysis, security, cves
title: Integrate Docker Scout with Artifactory Container Registry
linkTitle: Artifactory Container Registry
@z

@x
{{% experimental %}}
@y
{{% experimental %}}
@z

@x
The `docker scout watch` command is experimental.
@y
The `docker scout watch` command is experimental.
@z

@x
Experimental features are intended for testing and feedback as their
functionality or design may change between releases without warning or
can be removed entirely in a future release.
@y
Experimental features are intended for testing and feedback as their
functionality or design may change between releases without warning or
can be removed entirely in a future release.
@z

@x
{{% /experimental %}}
@y
{{% /experimental %}}
@z

@x
Integrating Docker Scout with JFrog Artifactory lets you index and analyze
images from Artifactory. This integration is powered by a long-running
`docker scout watch` process. It pulls images from your selected repositories
(optionally filtered), can receive webhook callbacks from Artifactory, and
pushes image data to Docker Scout. View results in the Docker Scout Dashboard or
with `docker scout` CLI.
@y
Integrating Docker Scout with JFrog Artifactory lets you index and analyze
images from Artifactory. This integration is powered by a long-running
`docker scout watch` process. It pulls images from your selected repositories
(optionally filtered), can receive webhook callbacks from Artifactory, and
pushes image data to Docker Scout. View results in the Docker Scout Dashboard or
with `docker scout` CLI.
@z

@x
## How it works
@y
## How it works
@z

@x
You run [`docker scout watch`](/reference/cli/docker/scout/watch/) on a host you
control and configure the Artifactory-specific registry string via `--registry
"key=value,..."`. The watch process can:
@y
You run [`docker scout watch`](__SUBDIR__/reference/cli/docker/scout/watch/) on a host you
control and configure the Artifactory-specific registry string via `--registry
"key=value,..."`. The watch process can:
@z

@x
- Watch specific repositories or an entire registry
- Optionally ingest all existing images once
- Periodically refresh repository lists
- Receive webhook callbacks from Artifactory on a local port you choose
@y
- Watch specific repositories or an entire registry
- Optionally ingest all existing images once
- Periodically refresh repository lists
- Receive webhook callbacks from Artifactory on a local port you choose
@z

@x
After the integration, Docker Scout automatically pulls and analyzes images
that you push to the Artifactory registry. Metadata about your images are stored on the
Docker Scout platform, but Docker Scout doesn't store the container images
themselves. For more information about how Docker Scout handles image data, see
[Data handling](/manuals/scout/deep-dive/data-handling.md).
@y
After the integration, Docker Scout automatically pulls and analyzes images
that you push to the Artifactory registry. Metadata about your images are stored on the
Docker Scout platform, but Docker Scout doesn't store the container images
themselves. For more information about how Docker Scout handles image data, see
[Data handling](manuals/scout/deep-dive/data-handling.md).
@z

@x
### Artifactory-specific registry string options
@y
### Artifactory-specific registry string options
@z

@x
These `type=artifactory` options override the generic registry handling for the `--registry` option:
@y
These `type=artifactory` options override the generic registry handling for the `--registry` option:
@z

@x
| Key              | Required | Description                                                                            |
|------------------|:--------:|----------------------------------------------------------------------------------------|
| `type`           |   Yes    | Must be `artifactory`.                                                                 |
| `registry`       |   Yes    | Docker/OCI registry hostname (e.g., `example.jfrog.io`).                               |
| `api`            |   Yes    | Artifactory REST API base URL (e.g., `https://example.jfrog.io/artifactory`).          |
| `repository`     |   Yes    | Repository to watch (replaces `--repository`).                                         |
| `includes`       |    No    | Globs to include (e.g., `*/frontend*`).                                                |
| `excludes`       |    No    | Globs to exclude (e.g., `*/legacy/*`).                                                 |
| `port`           |    No    | Local port to listen on for webhook callbacks.                                         |
| `subdomain-mode` |    No    | `true` or `false`; matches Artifactory’s Docker layout (subdomain versus repository-path). |
@y
| Key              | Required | Description                                                                            |
|------------------|:--------:|----------------------------------------------------------------------------------------|
| `type`           |   Yes    | Must be `artifactory`.                                                                 |
| `registry`       |   Yes    | Docker/OCI registry hostname (e.g., `example.jfrog.io`).                               |
| `api`            |   Yes    | Artifactory REST API base URL (e.g., `https://example.jfrog.io/artifactory`).          |
| `repository`     |   Yes    | Repository to watch (replaces `--repository`).                                         |
| `includes`       |    No    | Globs to include (e.g., `*/frontend*`).                                                |
| `excludes`       |    No    | Globs to exclude (e.g., `*/legacy/*`).                                                 |
| `port`           |    No    | Local port to listen on for webhook callbacks.                                         |
| `subdomain-mode` |    No    | `true` or `false`; matches Artifactory’s Docker layout (subdomain versus repository-path). |
@z

@x
## Integrate an Artifactory registry
@y
## Integrate an Artifactory registry
@z

@x
Use the following steps to integrate your Artifactory registry with Docker
Scout.
@y
Use the following steps to integrate your Artifactory registry with Docker
Scout.
@z

@x
1. Pick the host on which to run `docker scout watch`.
@y
1. Pick the host on which to run `docker scout watch`.
@z

@x
   The host must have local or network access to your private registry and be able
   to access the Scout API (`https://api.scout.docker.com`) over the internet. If
   you're using webhook callbacks, Artifactory must also be able to reach the Scout
   client host on the configured port.
   Override the `--workers` option (default: `3`) for optimal performance based on
   the size of the host and the expected workload.
@y
   The host must have local or network access to your private registry and be able
   to access the Scout API (`https://api.scout.docker.com`) over the internet. If
   you're using webhook callbacks, Artifactory must also be able to reach the Scout
   client host on the configured port.
   Override the `--workers` option (default: `3`) for optimal performance based on
   the size of the host and the expected workload.
@z

@x
2. Ensure you are running the latest version of Scout.
@y
2. Ensure you are running the latest version of Scout.
@z

@x
   Check your current version:
@y
   Check your current version:
@z

@x
   ```console
   $ docker scout version
   ```
@y
   ```console
   $ docker scout version
   ```
@z

@x
   If necessary, [install the latest version of Scout](https://docs.docker.com/scout/install/).
@y
   If necessary, [install the latest version of Scout](https://docs.docker.com/scout/install/).
@z

@x
3. Set up your Artifactory credentials.
@y
3. Set up your Artifactory credentials.
@z

@x
   Store the credentials that the Scout client will use to authenticate with
   Artifactory. The following is an example using environment variables. Replace
   `<user>` and `<password-or-access-token>` with your actual values.
@y
   Store the credentials that the Scout client will use to authenticate with
   Artifactory. The following is an example using environment variables. Replace
   `<user>` and `<password-or-access-token>` with your actual values.
@z

@x
   ```console
   $ export DOCKER_SCOUT_ARTIFACTORY_API_USER=<user>
   $ export DOCKER_SCOUT_ARTIFACTORY_API_PASSWORD=<password-or-access-token>
   ```
@y
   ```console
   $ export DOCKER_SCOUT_ARTIFACTORY_API_USER=<user>
   $ export DOCKER_SCOUT_ARTIFACTORY_API_PASSWORD=<password-or-access-token>
   ```
@z

@x
   > [!TIP]
   >
   > As a best practice, create a dedicated user with read-only access and use
   > an access token instead of a password.
@y
   > [!TIP]
   >
   > As a best practice, create a dedicated user with read-only access and use
   > an access token instead of a password.
@z

@x
   Store the credential that Artifactory will use to authenticate webhook
   callbacks. The following is an example using an environment variable. Replace
   `<random-64-128-character-secret>` with an actual secret.
@y
   Store the credential that Artifactory will use to authenticate webhook
   callbacks. The following is an example using an environment variable. Replace
   `<random-64-128-character-secret>` with an actual secret.
@z

@x
   ```console
   $ export DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET=<random-64-128-character-secret>
   ````
@y
   ```console
   $ export DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET=<random-64-128-character-secret>
   ````
@z

@x
   > [!TIP]
   >
   > As a best practice, generate a high-entropy random string of 64-128 characters.
@y
   > [!TIP]
   >
   > As a best practice, generate a high-entropy random string of 64-128 characters.
@z

@x
4. Set up your Scout credentials.
@y
4. Set up your Scout credentials.
@z

@x
   1. Generate an organization access token for accessing Scout. For more
      details, see [Create an organization access
      token](/enterprise/security/access-tokens/#create-an-organization-access-token).
   2. Sign in to Docker using the organization access token.
@y
   1. Generate an organization access token for accessing Scout. For more
      details, see [Create an organization access
      token](__SUBDIR__/enterprise/security/access-tokens/#create-an-organization-access-token).
   2. Sign in to Docker using the organization access token.
@z

@x
       ```console
       $ docker login --username <your_organization_name>
       ```
@y
       ```console
       $ docker login --username <your_organization_name>
       ```
@z

@x
       When prompted for a password, paste the organization access token you
       generated.
@y
       When prompted for a password, paste the organization access token you
       generated.
@z

@x
   3. Connect your local Docker environment to your organization's Docker Scout service.
@y
   3. Connect your local Docker environment to your organization's Docker Scout service.
@z

@x
       ```console
       $ docker scout enroll <your_organization_name>
       ```
@y
       ```console
       $ docker scout enroll <your_organization_name>
       ```
@z

@x
5. Index existing images. You only need to do this once.
@y
5. Index existing images. You only need to do this once.
@z

@x
    Run `docker scout watch` with the `--all-images` option to index all images in the specified Artifactory repository. The following is an example command:
@y
    Run `docker scout watch` with the `--all-images` option to index all images in the specified Artifactory repository. The following is an example command:
@z

@x
   ```console
   $ docker scout watch --registry \
   "type=artifactory,registry=example.jfrog.io,api=https://example.jfrog.io/artifactory,include=*/frontend*,exclude=*/dta/*,repository=docker-local,port=9000,subdomain-mode=true" \
   --all-images
   ```
@y
   ```console
   $ docker scout watch --registry \
   "type=artifactory,registry=example.jfrog.io,api=https://example.jfrog.io/artifactory,include=*/frontend*,exclude=*/dta/*,repository=docker-local,port=9000,subdomain-mode=true" \
   --all-images
   ```
@z

@x
6. Confirm the images have been indexed by viewing them on the [Scout
   Dashboard](https://scout.docker.com/).
@y
6. Confirm the images have been indexed by viewing them on the [Scout
   Dashboard](https://scout.docker.com/).
@z

@x
7. Configure Artifactory callbacks.
@y
7. Configure Artifactory callbacks.
@z

@x
   In your Artifactory UI or via REST API, configure webhooks for image
   push/update events. Set the endpoint to your `docker scout watch` host and
   port, and include the `DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET` for
   authentication.
@y
   In your Artifactory UI or via REST API, configure webhooks for image
   push/update events. Set the endpoint to your `docker scout watch` host and
   port, and include the `DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET` for
   authentication.
@z

@x
   For more information, see the [JFrog Artifactory Webhooks
   documentation](https://jfrog.com/help/r/jfrog-platform-administration-documentation/webhooks)
   or the [JFrog Artifactory REST API Webhooks
   documentation](https://jfrog.com/help/r/jfrog-rest-apis/webhooks).
@y
   For more information, see the [JFrog Artifactory Webhooks
   documentation](https://jfrog.com/help/r/jfrog-platform-administration-documentation/webhooks)
   or the [JFrog Artifactory REST API Webhooks
   documentation](https://jfrog.com/help/r/jfrog-rest-apis/webhooks).
@z

@x
8. Continuously watch for new or updated images.
@y
8. Continuously watch for new or updated images.
@z

@x
   Run `docker scout watch` with the `--refresh-registry` option to watch for
   new images to index. The following is an example command:
@y
   Run `docker scout watch` with the `--refresh-registry` option to watch for
   new images to index. The following is an example command:
@z

@x
   ```console
   $ docker scout watch --registry \
   "type=artifactory,registry=example.jfrog.io,api=https://example.jfrog.io/artifactory,include=*/frontend*,exclude=*/dta/*,repository=docker-local,port=9000,subdomain-mode=true" \
   --refresh-registry
   ```
@y
   ```console
   $ docker scout watch --registry \
   "type=artifactory,registry=example.jfrog.io,api=https://example.jfrog.io/artifactory,include=*/frontend*,exclude=*/dta/*,repository=docker-local,port=9000,subdomain-mode=true" \
   --refresh-registry
   ```
@z

@x
9. Optional. Set up Scout integration for real-time notifications from popular
   collaboration platforms. For details, see [Integrate Docker Scout with
   Slack](../team-collaboration/slack.md).
@y
9. Optional. Set up Scout integration for real-time notifications from popular
   collaboration platforms. For details, see [Integrate Docker Scout with
   Slack](../team-collaboration/slack.md).
@z
