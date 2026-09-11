%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Integrate Docker Scout with a container registry
linkTitle: Container registries
description: Integrate Docker Scout with any container registry using the docker scout watch CLI command
keywords: docker scout, registry, integration, image analysis, security, cves, watch, ecr, acr, artifactory, harbor, nexus
@y
title: Integrate Docker Scout with a container registry
linkTitle: Container registries
description: Integrate Docker Scout with any container registry using the docker scout watch CLI command
keywords: docker scout, registry, integration, image analysis, security, cves, watch, ecr, acr, artifactory, harbor, nexus
@z

@x
[`docker scout watch`](/reference/cli/docker/scout/watch/) is a long-running
CLI process that indexes images from a container registry and pushes the
results to Docker Scout. It works with any Docker/OCI-compliant registry,
including Amazon ECR, Azure Container Registry, JFrog Artifactory, Harbor, and
Sonatype Nexus.
@y
[`docker scout watch`](__SUBDIR__/reference/cli/docker/scout/watch/) is a long-running
CLI process that indexes images from a container registry and pushes the
results to Docker Scout. It works with any Docker/OCI-compliant registry,
including Amazon ECR, Azure Container Registry, JFrog Artifactory, Harbor, and
Sonatype Nexus.
@z

@x
## How it works
@y
## How it works
@z

@x
You run `docker scout watch` on a host you control. The process can:
@y
You run `docker scout watch` on a host you control. The process can:
@z

@x
- Watch specific repositories or an entire registry
- Optionally ingest all existing images once, using `--all-images`
- Periodically refresh repository lists, using `--refresh-registry`
- Receive webhook callbacks from registries that support them, for
  near-real-time analysis instead of polling
@y
- Watch specific repositories or an entire registry
- Optionally ingest all existing images once, using `--all-images`
- Periodically refresh repository lists, using `--refresh-registry`
- Receive webhook callbacks from registries that support them, for
  near-real-time analysis instead of polling
@z

@x
After the integration, Docker Scout automatically pulls and analyzes images
that you push to the registry. Metadata about your images are stored on the
Docker Scout platform, but Docker Scout doesn't store the container images
themselves. For more information about how Docker Scout handles image data,
see [Data handling](/manuals/scout/deep-dive/data-handling.md).
@y
After the integration, Docker Scout automatically pulls and analyzes images
that you push to the registry. Metadata about your images are stored on the
Docker Scout platform, but Docker Scout doesn't store the container images
themselves. For more information about how Docker Scout handles image data,
see [Data handling](manuals/scout/deep-dive/data-handling.md).
@z

@x
## Set up `docker scout watch`
@y
## Set up `docker scout watch`
@z

@x
1. Pick a host on which to run `docker scout watch`.
@y
1. Pick a host on which to run `docker scout watch`.
@z

@x
   The host must have network access to your registry and be able to access
   the Scout API (`https://api.scout.docker.com`) over the internet. If
   you're using webhook callbacks, the registry must also be able to reach the
   `docker scout watch` host on the configured port.
@y
   The host must have network access to your registry and be able to access
   the Scout API (`https://api.scout.docker.com`) over the internet. If
   you're using webhook callbacks, the registry must also be able to reach the
   `docker scout watch` host on the configured port.
@z

@x
2. Ensure you are running the latest version of Scout.
@y
2. Ensure you are running the latest version of Scout.
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
   If necessary, [install the latest version of Scout](/manuals/scout/install.md).
@y
   If necessary, [install the latest version of Scout](manuals/scout/install.md).
@z

@x
3. Authenticate Docker to your registry.
@y
3. Authenticate Docker to your registry.
@z

@x
   ```console
   $ docker login <registry-hostname> --username <user> --password <password-or-access-token>
   ```
@y
   ```console
   $ docker login <registry-hostname> --username <user> --password <password-or-access-token>
   ```
@z

@x
   For Amazon ECR, authenticate using the AWS CLI instead:
@y
   For Amazon ECR, authenticate using the AWS CLI instead:
@z

@x
   ```console
   $ aws ecr get-login-password --region <region> | \
     docker login --username AWS --password-stdin \
     <aws_account_id>.dkr.ecr.<region>.amazonaws.com
   ```
@y
   ```console
   $ aws ecr get-login-password --region <region> | \
     docker login --username AWS --password-stdin \
     <aws_account_id>.dkr.ecr.<region>.amazonaws.com
   ```
@z

@x
   The AWS identity used must have at least `ecr:GetAuthorizationToken` and
   `ecr:BatchGetImage` permissions on the target registry.
@y
   The AWS identity used must have at least `ecr:GetAuthorizationToken` and
   `ecr:BatchGetImage` permissions on the target registry.
@z

@x
   For Azure Container Registry:
@y
   For Azure Container Registry:
@z

@x
   ```console
   $ docker login <registry-name>.azurecr.io \
     --username <username> \
     --password <password-or-access-token>
   ```
@y
   ```console
   $ docker login <registry-name>.azurecr.io \
     --username <username> \
     --password <password-or-access-token>
   ```
@z

@x
   > [!TIP]
   >
   > As a best practice, use a dedicated user or token with read-only access
   > to the registry.
@y
   > [!TIP]
   >
   > As a best practice, use a dedicated user or token with read-only access
   > to the registry.
@z

@x
4. Set up your Scout credentials.
@y
4. Set up your Scout credentials.
@z

@x
   1. Generate an organization access token. For more details, see
      [Create an organization access token](/manuals/security/access-tokens/organization-access-tokens.md#create-an-organization-access-token).
   2. Sign in to Docker using the organization access token.
@y
   1. Generate an organization access token. For more details, see
      [Create an organization access token](manuals/security/access-tokens/organization-access-tokens.md#create-an-organization-access-token).
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
      When prompted for a password, paste the organization access token.
@y
      When prompted for a password, paste the organization access token.
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
   ```console
   $ docker scout watch --registry <registry-hostname> --all-images
   ```
@y
   ```console
   $ docker scout watch --registry <registry-hostname> --all-images
   ```
@z

@x
6. Confirm the images have been indexed by viewing them on the
   [Scout Dashboard](https://scout.docker.com/).
@y
6. Confirm the images have been indexed by viewing them on the
   [Scout Dashboard](https://scout.docker.com/).
@z

@x
7. Continuously watch for new images.
@y
7. Continuously watch for new images.
@z

@x
   ```console
   $ docker scout watch --registry <registry-hostname> --refresh-registry
   ```
@y
   ```console
   $ docker scout watch --registry <registry-hostname> --refresh-registry
   ```
@z

@x
   `docker scout watch` is a long-running process. Run it as a system
   service, for example using `systemd` or `nohup`, to ensure it continues
   running in the background. Use `--interval` (default 60 seconds) to
   control polling frequency, and `--repository` and `--tag` to narrow scope.
@y
   `docker scout watch` is a long-running process. Run it as a system
   service, for example using `systemd` or `nohup`, to ensure it continues
   running in the background. Use `--interval` (default 60 seconds) to
   control polling frequency, and `--repository` and `--tag` to narrow scope.
@z

@x
Reference: [`docker scout watch`](/reference/cli/docker/scout/watch/)
@y
Reference: [`docker scout watch`](__SUBDIR__/reference/cli/docker/scout/watch/)
@z

@x
## Registry-specific options
@y
## Registry-specific options
@z

@x
Some registries need extra configuration beyond a hostname, passed through
the `--registry` flag as a `key=value` string, for example a REST API
endpoint for webhook callbacks, or a non-standard repository layout. Built-in
adapters exist for `type=artifactory`, `type=harbor`, and `type=nexus`, and a
`type=oci` adapter covers any OCI-compliant registry that implements the
`_catalog` endpoint. For the full option reference for each type, see
[`docker scout watch`](/reference/cli/docker/scout/watch/).
@y
Some registries need extra configuration beyond a hostname, passed through
the `--registry` flag as a `key=value` string, for example a REST API
endpoint for webhook callbacks, or a non-standard repository layout. Built-in
adapters exist for `type=artifactory`, `type=harbor`, and `type=nexus`, and a
`type=oci` adapter covers any OCI-compliant registry that implements the
`_catalog` endpoint. For the full option reference for each type, see
[`docker scout watch`](__SUBDIR__/reference/cli/docker/scout/watch/).
@z

@x
The following example walks through the `type=artifactory` adapter in detail.
See the CLI reference for equivalent Harbor, Nexus, and generic OCI examples.
@y
The following example walks through the `type=artifactory` adapter in detail.
See the CLI reference for equivalent Harbor, Nexus, and generic OCI examples.
@z

@x
### Example: JFrog Artifactory
@y
### Example: JFrog Artifactory
@z

@x
These `type=artifactory` options override the generic registry handling for
the `--registry` option:
@y
These `type=artifactory` options override the generic registry handling for
the `--registry` option:
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
| `subdomain-mode` |    No    | `true` or `false`; matches Artifactory's Docker layout (subdomain versus repository-path). |
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
| `subdomain-mode` |    No    | `true` or `false`; matches Artifactory's Docker layout (subdomain versus repository-path). |
@z

@x
Set up credentials for the Scout client to authenticate with Artifactory, and
a secret for Artifactory to authenticate its webhook callbacks:
@y
Set up credentials for the Scout client to authenticate with Artifactory, and
a secret for Artifactory to authenticate its webhook callbacks:
@z

@x
```console
$ export DOCKER_SCOUT_ARTIFACTORY_API_USER=<user>
$ export DOCKER_SCOUT_ARTIFACTORY_API_PASSWORD=<password-or-access-token>
$ export DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET=<random-64-128-character-secret>
```
@y
```console
$ export DOCKER_SCOUT_ARTIFACTORY_API_USER=<user>
$ export DOCKER_SCOUT_ARTIFACTORY_API_PASSWORD=<password-or-access-token>
$ export DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET=<random-64-128-character-secret>
```
@z

@x
> [!TIP]
>
> As a best practice, create a dedicated user with read-only access and use an
> access token instead of a password. Generate the webhook secret as a
> high-entropy random string of 64-128 characters.
@y
> [!TIP]
>
> As a best practice, create a dedicated user with read-only access and use an
> access token instead of a password. Generate the webhook secret as a
> high-entropy random string of 64-128 characters.
@z

@x
Index existing images with the Artifactory-specific registry string:
@y
Index existing images with the Artifactory-specific registry string:
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
Then configure Artifactory to call the webhook: in your Artifactory UI or via
REST API, set up a webhook for image push/update events, pointing to your
`docker scout watch` host and port, and include the
`DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET` for authentication. For more
information, see the [JFrog Artifactory Webhooks
documentation](https://jfrog.com/help/r/jfrog-platform-administration-documentation/webhooks)
or the [JFrog Artifactory REST API Webhooks
documentation](https://jfrog.com/help/r/jfrog-rest-apis/webhooks).
@y
Then configure Artifactory to call the webhook: in your Artifactory UI or via
REST API, set up a webhook for image push/update events, pointing to your
`docker scout watch` host and port, and include the
`DOCKER_SCOUT_ARTIFACTORY_WEBHOOK_SECRET` for authentication. For more
information, see the [JFrog Artifactory Webhooks
documentation](https://jfrog.com/help/r/jfrog-platform-administration-documentation/webhooks)
or the [JFrog Artifactory REST API Webhooks
documentation](https://jfrog.com/help/r/jfrog-rest-apis/webhooks).
@z

@x
Finally, run the same command with `--refresh-registry` instead of
`--all-images` as your long-running watch process, so new images are picked up
going forward:
@y
Finally, run the same command with `--refresh-registry` instead of
`--all-images` as your long-running watch process, so new images are picked up
going forward:
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
