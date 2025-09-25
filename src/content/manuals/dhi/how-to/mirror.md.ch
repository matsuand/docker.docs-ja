%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Mirror a Docker Hardened Image repository
linktitle: Mirror an image
description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
@y
title: Mirror a Docker Hardened Image repository
linktitle: Mirror an image
description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
@z

@x
keywords: mirror docker image, private container registry, docker hub automation, webhook image sync, secure image distribution
@y
keywords: mirror docker image, private container registry, docker hub automation, webhook image sync, secure image distribution
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
Before you can use a Docker Hardened Image (DHI), you must mirror its repository
to your organization. Only organization owners can perform this action. Once
mirrored, the image becomes available in your organization's namespace, and
users with access can begin pulling and using it.
@y
Before you can use a Docker Hardened Image (DHI), you must mirror its repository
to your organization. Only organization owners can perform this action. Once
mirrored, the image becomes available in your organization's namespace, and
users with access can begin pulling and using it.
@z

@x
Mirrored repositories automatically stay up to date. Docker continues to sync
new tags and image updates from the upstream DHI catalog, so you always have
access to the latest secure version.
@y
Mirrored repositories automatically stay up to date. Docker continues to sync
new tags and image updates from the upstream DHI catalog, so you always have
access to the latest secure version.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- To manage mirroring, you must be an [organization owner](/admin/).
- Your organization must be [signed
  up](https://www.docker.com/products/hardened-images/#getstarted) to use
  Docker Hardened Images.
@y
- To manage mirroring, you must be an [organization owner](__SUBDIR__/admin/).
- Your organization must be [signed
  up](https://www.docker.com/products/hardened-images/#getstarted) to use
  Docker Hardened Images.
@z

@x
## Mirror an image repository
@y
## Mirror an image repository
@z

@x
To mirror a Docker Hardened Image repository:
@y
To mirror a Docker Hardened Image repository:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has access to DHI.
4. Select **Hardened Images** > **Catalog**.
5. Select a DHI repository to view its details.
6. Select **Mirror to repository** and follow the on-screen instructions.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has access to DHI.
4. Select **Hardened Images** > **Catalog**.
5. Select a DHI repository to view its details.
6. Select **Mirror to repository** and follow the on-screen instructions.
@z

@x
It may take a few minutes for all the tags to finish mirroring. Once an image
has been mirrored, the **Mirror to repository** button changes to **View in
repository**. Selecting **View in repository** opens a drop-down list of
repositories that the image has already been mirrored to. From this drop-down,
you can:
@y
It may take a few minutes for all the tags to finish mirroring. Once an image
has been mirrored, the **Mirror to repository** button changes to **View in
repository**. Selecting **View in repository** opens a drop-down list of
repositories that the image has already been mirrored to. From this drop-down,
you can:
@z

@x
 - Select an existing mirrored repository to view its details
 - Select **Mirror to repository** again to mirror the image to an additional
   repository
@y
 - Select an existing mirrored repository to view its details
 - Select **Mirror to repository** again to mirror the image to an additional
   repository
@z

@x
After mirroring a repository, the repository appears in your organization's
repository list under the name you specified, prefixed by `dhi-`. It will
continue to receive updated images.
@y
After mirroring a repository, the repository appears in your organization's
repository list under the name you specified, prefixed by `dhi-`. It will
continue to receive updated images.
@z

@x
![Repository list with mirrored repository showing](../images/dhi-python-mirror.png)
@y
![Repository list with mirrored repository showing](../images/dhi-python-mirror.png)
@z

@x
> [!IMPORTANT]
>
> The mirrored repository's visibility must remain private. Changing its
> visibility to public will stop updates from being mirrored.
@y
> [!IMPORTANT]
>
> The mirrored repository's visibility must remain private. Changing its
> visibility to public will stop updates from being mirrored.
@z

@x
Once mirrored, the image repository works like any other private repository on
Docker Hub. Team members with access to the repository can now pull and use the
image. To learn how to manage access, view tags, or configure settings, see
[Repositories](/manuals/docker-hub/repos.md).
@y
Once mirrored, the image repository works like any other private repository on
Docker Hub. Team members with access to the repository can now pull and use the
image. To learn how to manage access, view tags, or configure settings, see
[Repositories](manuals/docker-hub/repos.md).
@z

@x
### Webhook integration for syncing and alerts
@y
### Webhook integration for syncing and alerts
@z

@x
To keep external registries or systems in sync with your mirrored Docker
Hardened Images, and to receive notifications when updates occur, you can
configure a [webhook](/docker-hub/repos/manage/webhooks/) on the mirrored
repository in Docker Hub. A webhook sends a `POST` request to a URL you define
whenever a new image tag is pushed or updated.
@y
To keep external registries or systems in sync with your mirrored Docker
Hardened Images, and to receive notifications when updates occur, you can
configure a [webhook](__SUBDIR__/docker-hub/repos/manage/webhooks/) on the mirrored
repository in Docker Hub. A webhook sends a `POST` request to a URL you define
whenever a new image tag is pushed or updated.
@z

@x
For example, you might configure a webhook to call a CI/CD system at
`https://ci.example.com/hooks/dhi-sync` whenever a new tag is mirrored. The
automation triggered by this webhook can pull the updated image from Docker Hub
and push it to an internal registry such as Amazon ECR, Google Artifact
Registry, or GitHub Container Registry.
@y
For example, you might configure a webhook to call a CI/CD system at
`https://ci.example.com/hooks/dhi-sync` whenever a new tag is mirrored. The
automation triggered by this webhook can pull the updated image from Docker Hub
and push it to an internal registry such as Amazon ECR, Google Artifact
Registry, or GitHub Container Registry.
@z

@x
Other common webhook use cases include:
@y
Other common webhook use cases include:
@z

@x
- Triggering validation or vulnerability scanning workflows
- Signing or promoting images
- Sending notifications to downstream systems
@y
- Triggering validation or vulnerability scanning workflows
- Signing or promoting images
- Sending notifications to downstream systems
@z

@x
#### Example webhook payload
@y
#### Example webhook payload
@z

@x
When a webhook is triggered, Docker Hub sends a JSON payload like the following:
@y
When a webhook is triggered, Docker Hub sends a JSON payload like the following:
@z

@x
```json
{
  "callback_url": "https://registry.hub.docker.com/u/exampleorg/dhi-python/hook/abc123/",
  "push_data": {
    "pushed_at": 1712345678,
    "pusher": "trustedbuilder",
    "tag": "3.13-alpine3.21"
  },
  "repository": {
    "name": "dhi-python",
    "namespace": "exampleorg",
    "repo_name": "exampleorg/dhi-python",
    "repo_url": "https://hub.docker.com/r/exampleorg/dhi-python",
    "is_private": true,
    "status": "Active",
    ...
  }
}
```
@y
```json
{
  "callback_url": "https://registry.hub.docker.com/u/exampleorg/dhi-python/hook/abc123/",
  "push_data": {
    "pushed_at": 1712345678,
    "pusher": "trustedbuilder",
    "tag": "3.13-alpine3.21"
  },
  "repository": {
    "name": "dhi-python",
    "namespace": "exampleorg",
    "repo_name": "exampleorg/dhi-python",
    "repo_url": "https://hub.docker.com/r/exampleorg/dhi-python",
    "is_private": true,
    "status": "Active",
    ...
  }
}
```
@z

@x
## Stop mirroring an image repository
@y
## Stop mirroring an image repository
@z

@x
Only organization owners can stop mirroring a repository. After you stop
mirroring, the repository remains, but it will
no longer receive updates. You can still pull the last image that was mirrored,
but the repository will not receive new tags or updates from the original
repository.
@y
Only organization owners can stop mirroring a repository. After you stop
mirroring, the repository remains, but it will
no longer receive updates. You can still pull the last image that was mirrored,
but the repository will not receive new tags or updates from the original
repository.
@z

@x
 To stop mirroring an image repository:
@y
 To stop mirroring an image repository:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has access to DHI.
4. Select **Hardened Images** > **Management**.
5. In the far right column of the repository you want to stop mirroring, select the menu icon.
6. Select **Stop mirroring**.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has access to DHI.
4. Select **Hardened Images** > **Management**.
5. In the far right column of the repository you want to stop mirroring, select the menu icon.
6. Select **Stop mirroring**.
@z

@x
Once you have stopped mirroring a repository, you can choose another DHI
repository to mirror.
@y
Once you have stopped mirroring a repository, you can choose another DHI
repository to mirror.
@z

@x
## Mirror from Docker Hub to another registry
@y
## Mirror from Docker Hub to another registry
@z

@x
After you've mirrored a Docker Hardened Image repository to your organization's
namespace on Docker Hub, you can optionally mirror it to another container
registry, such as Amazon ECR, Google Artifact Registry, GitHub Container
Registry, or a private Harbor instance.
@y
After you've mirrored a Docker Hardened Image repository to your organization's
namespace on Docker Hub, you can optionally mirror it to another container
registry, such as Amazon ECR, Google Artifact Registry, GitHub Container
Registry, or a private Harbor instance.
@z

@x
You can use any standard workflow to mirror the image, such as the
[Docker CLI](/reference/cli/docker/_index.md), [Docker Hub Registry
API](/reference/api/registry/latest/), third-party registry tools, or CI/CD
automation.
@y
You can use any standard workflow to mirror the image, such as the
[Docker CLI](reference/cli/docker/_index.md), [Docker Hub Registry
API](__SUBDIR__/reference/api/registry/latest/), third-party registry tools, or CI/CD
automation.
@z

@x
However, to preserve the full security context, including attestations, you must
also mirror its associated OCI artifacts. Docker Hardened Images store the image
layers on Docker Hub (`docker.io`) and the signed attestations in a separate
registry (`registry.scout.docker.com`).
@y
However, to preserve the full security context, including attestations, you must
also mirror its associated OCI artifacts. Docker Hardened Images store the image
layers on Docker Hub (`docker.io`) and the signed attestations in a separate
registry (`registry.scout.docker.com`).
@z

@x
To copy both, you can use [`regctl`](https://regclient.org/cli/regctl/), an
OCI-aware CLI that supports mirroring images along with attached artifacts such
as SBOMs, vulnerability reports, and SLSA provenance. For ongoing synchronization,
you can use [`regsync`](https://regclient.org/cli/regsync/).
@y
To copy both, you can use [`regctl`](https://regclient.org/cli/regctl/), an
OCI-aware CLI that supports mirroring images along with attached artifacts such
as SBOMs, vulnerability reports, and SLSA provenance. For ongoing synchronization,
you can use [`regsync`](https://regclient.org/cli/regsync/).
@z

@x
### Example mirroring with `regctl`
@y
### Example mirroring with `regctl`
@z

@x
The following example shows how to mirror a specific tag of a Docker Hardened
Image from Docker Hub to another registry, along with its associated
attestations using `regctl`. You must [install
`regctl`](https://github.com/regclient/regclient) first.
@y
The following example shows how to mirror a specific tag of a Docker Hardened
Image from Docker Hub to another registry, along with its associated
attestations using `regctl`. You must [install
`regctl`](https://github.com/regclient/regclient) first.
@z

@x
1. Set environment variables for your specific environment. Replace the
   placeholders with your actual values.
@y
1. Set environment variables for your specific environment. Replace the
   placeholders with your actual values.
@z

@x
   In this example, you use a Docker username to represent a member of the Docker
   Hub organization that the DHI repositories are mirrored in. Prepare a
   [personal access token (PAT)](../../security/access-tokens.md) for the user
   with `read only` access. Alternatively, you can use an organization namespace and
   an [organization access token
   (OAT)](../../enterprise/security/access-tokens.md) to sign in to Docker Hub, but OATs
   are not yet supported for `registry.scout.docker.com`.
@y
   In this example, you use a Docker username to represent a member of the Docker
   Hub organization that the DHI repositories are mirrored in. Prepare a
   [personal access token (PAT)](../../security/access-tokens.md) for the user
   with `read only` access. Alternatively, you can use an organization namespace and
   an [organization access token
   (OAT)](../../enterprise/security/access-tokens.md) to sign in to Docker Hub, but OATs
   are not yet supported for `registry.scout.docker.com`.
@z

@x
   ```console
   $ export DOCKER_USERNAME="YOUR_DOCKER_USERNAME"
   $ export DOCKER_PAT="YOUR_DOCKER_PAT"
   $ export DOCKER_ORG="YOUR_DOCKER_ORG"
   $ export DEST_REG="registry.example.com"
   $ export DEST_REPO="mirror/dhi-python"
   $ export DEST_REG_USERNAME="YOUR_DESTINATION_REGISTRY_USERNAME"
   $ export DEST_REG_TOKEN="YOUR_DESTINATION_REGISTRY_TOKEN"
   $ export SRC_REPO="docker.io/${DOCKER_ORG}/dhi-python"
   $ export SRC_ATT_REPO="registry.scout.docker.com/${DOCKER_ORG}/dhi-python"
   $ export TAG="3.13-alpine3.21"
   ```
@y
   ```console
   $ export DOCKER_USERNAME="YOUR_DOCKER_USERNAME"
   $ export DOCKER_PAT="YOUR_DOCKER_PAT"
   $ export DOCKER_ORG="YOUR_DOCKER_ORG"
   $ export DEST_REG="registry.example.com"
   $ export DEST_REPO="mirror/dhi-python"
   $ export DEST_REG_USERNAME="YOUR_DESTINATION_REGISTRY_USERNAME"
   $ export DEST_REG_TOKEN="YOUR_DESTINATION_REGISTRY_TOKEN"
   $ export SRC_REPO="docker.io/${DOCKER_ORG}/dhi-python"
   $ export SRC_ATT_REPO="registry.scout.docker.com/${DOCKER_ORG}/dhi-python"
   $ export TAG="3.13-alpine3.21"
   ```
@z

@x
2. Sign in via `regctl` to Docker Hub, the Scout registry that contains
   the attestations, and your destination registry.
@y
2. Sign in via `regctl` to Docker Hub, the Scout registry that contains
   the attestations, and your destination registry.
@z

@x
   ```console
   $ echo $DOCKER_PAT | regctl registry login -u "$DOCKER_USERNAME" --pass-stdin docker.io
   $ echo $DOCKER_PAT | regctl registry login -u "$DOCKER_USERNAME" --pass-stdin registry.scout.docker.com
   $ echo $DEST_REG_TOKEN | regctl registry login -u "$DEST_REG_USERNAME" --pass-stdin "$DEST_REG"
   ```
@y
   ```console
   $ echo $DOCKER_PAT | regctl registry login -u "$DOCKER_USERNAME" --pass-stdin docker.io
   $ echo $DOCKER_PAT | regctl registry login -u "$DOCKER_USERNAME" --pass-stdin registry.scout.docker.com
   $ echo $DEST_REG_TOKEN | regctl registry login -u "$DEST_REG_USERNAME" --pass-stdin "$DEST_REG"
   ```
@z

@x
3. Mirror the image and attestations using `--referrers` and referrer endpoints:
@y
3. Mirror the image and attestations using `--referrers` and referrer endpoints:
@z

@x
   ```console
   $ regctl image copy \
        "${SRC_REPO}:${TAG}" \
        "${DEST_REG}/${DEST_REPO}:${TAG}" \
        --referrers \
        --referrers-src "${SRC_ATT_REPO}" \
        --referrers-tgt "${DEST_REG}/${DEST_REPO}" \
        --force-recursive
   ```
@y
   ```console
   $ regctl image copy \
        "${SRC_REPO}:${TAG}" \
        "${DEST_REG}/${DEST_REPO}:${TAG}" \
        --referrers \
        --referrers-src "${SRC_ATT_REPO}" \
        --referrers-tgt "${DEST_REG}/${DEST_REPO}" \
        --force-recursive
   ```
@z

@x
4. Verify that artifacts were preserved.
@y
4. Verify that artifacts were preserved.
@z

@x
   First, get a digest for a specific tag and platform. For example, `linux/amd64`.
@y
   First, get a digest for a specific tag and platform. For example, `linux/amd64`.
@z

@x
   ```console
   DIGEST="$(regctl manifest head "${DEST_REG}/${DEST_REPO}:${TAG}" --platform linux/amd64)"
   ```
@y
   ```console
   DIGEST="$(regctl manifest head "${DEST_REG}/${DEST_REPO}:${TAG}" --platform linux/amd64)"
   ```
@z

@x
   List attached artifacts (SBOM, provenance, VEX, vulnerability reports).
@y
   List attached artifacts (SBOM, provenance, VEX, vulnerability reports).
@z

@x
   ```console
   $ regctl artifact list "${DEST_REG}/${DEST_REPO}@${DIGEST}"
   ```
@y
   ```console
   $ regctl artifact list "${DEST_REG}/${DEST_REPO}@${DIGEST}"
   ```
@z

@x
   Or, list attached artifacts with `docker scout`.
@y
   Or, list attached artifacts with `docker scout`.
@z

@x
   ```console
   $ docker scout attest list "registry://${DEST_REG}/${DEST_REPO}@${DIGEST}"
   ```
@y
   ```console
   $ docker scout attest list "registry://${DEST_REG}/${DEST_REPO}@${DIGEST}"
   ```
@z

@x
### Example ongoing mirroring with `regsync`
@y
### Example ongoing mirroring with `regsync`
@z

@x
`regsync` automates pulling from your organizations mirrored DHI repositories on
Docker Hub and pushing to your external registry including attestations. It
reads a YAML configuration file and can filter tags.
@y
`regsync` automates pulling from your organizations mirrored DHI repositories on
Docker Hub and pushing to your external registry including attestations. It
reads a YAML configuration file and can filter tags.
@z

@x
The following example uses a `regsync.yaml` file that syncs Node 24 and Python
3.12 Debian 13 variants, excluding Alpine and Debian 12.
@y
The following example uses a `regsync.yaml` file that syncs Node 24 and Python
3.12 Debian 13 variants, excluding Alpine and Debian 12.
@z

@x
```yaml{title="regsync.yaml"}
version: 1
# Optional: inline creds if not relying on prior CLI logins
# creds:
#   - registry: docker.io
#     user: <your-docker-username>
#     pass: "{{file \"/run/secrets/docker_token\"}}"
#   - registry: registry.scout.docker.com
#     user: <your-docker-username>
#     pass: "{{file \"/run/secrets/docker_token\"}}"
#   - registry: registry.example.com
#     user: <service-user>
#     pass: "{{file \"/run/secrets/dest_token\"}}"
@y
```yaml{title="regsync.yaml"}
version: 1
# Optional: inline creds if not relying on prior CLI logins
# creds:
#   - registry: docker.io
#     user: <your-docker-username>
#     pass: "{{file \"/run/secrets/docker_token\"}}"
#   - registry: registry.scout.docker.com
#     user: <your-docker-username>
#     pass: "{{file \"/run/secrets/docker_token\"}}"
#   - registry: registry.example.com
#     user: <service-user>
#     pass: "{{file \"/run/secrets/dest_token\"}}"
@z

@x
sync:
  - source: docker.io/<your-org>/dhi-node
    target: registry.example.com/mirror/dhi-node
    type: repository
    fastCopy: true
    referrers: true
    referrerSource: registry.scout.docker.com/<your-org>/dhi-node
    referrerTarget: registry.example.com/mirror/dhi-node
    tags:
      allow: [ "24.*" ]
      deny: [ ".*alpine.*", ".*debian12.*" ]
@y
sync:
  - source: docker.io/<your-org>/dhi-node
    target: registry.example.com/mirror/dhi-node
    type: repository
    fastCopy: true
    referrers: true
    referrerSource: registry.scout.docker.com/<your-org>/dhi-node
    referrerTarget: registry.example.com/mirror/dhi-node
    tags:
      allow: [ "24.*" ]
      deny: [ ".*alpine.*", ".*debian12.*" ]
@z

@x
  - source: docker.io/<your-org>/dhi-python
    target: registry.example.com/mirror/dhi-python
    type: repository
    fastCopy: true
    referrers: true
    referrerSource: registry.scout.docker.com/<your-org>/dhi-python
    referrerTarget: registry.example.com/mirror/dhi-python
    tags:
      allow: [ "3.12.*" ]
      deny: [ ".*alpine.*", ".*debian12.*" ]
```
@y
  - source: docker.io/<your-org>/dhi-python
    target: registry.example.com/mirror/dhi-python
    type: repository
    fastCopy: true
    referrers: true
    referrerSource: registry.scout.docker.com/<your-org>/dhi-python
    referrerTarget: registry.example.com/mirror/dhi-python
    tags:
      allow: [ "3.12.*" ]
      deny: [ ".*alpine.*", ".*debian12.*" ]
```
@z

@x
To do a dry run with the configuration file, you can run the following command.
You must [install `regsync`](https://github.com/regclient/regclient) first.
@y
To do a dry run with the configuration file, you can run the following command.
You must [install `regsync`](https://github.com/regclient/regclient) first.
@z

@x
```console
$ regsync check -c regsync.yaml
```
@y
```console
$ regsync check -c regsync.yaml
```
@z

@x
To run the sync with the configuration file:
@y
To run the sync with the configuration file:
@z

@x
```console
$ regsync once -c regsync.yaml
```
@y
```console
$ regsync once -c regsync.yaml
```
@z

@x
## What's next
@y
## What's next
@z

@x
After mirroring an image repository, you can you can start [using the
image](./use.md).
@y
After mirroring an image repository, you can you can start [using the
image](./use.md).
@z
