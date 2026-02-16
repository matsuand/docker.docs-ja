%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: 'Mirror a Docker Hardened Image repository <span class="not-prose bg-blue-500 dark:bg-blue-400 rounded-sm px-1 text-xs text-white whitespace-nowrap">DHI Enterprise</span>'
linktitle: Mirror a repository
description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
@y
title: 'Mirror a Docker Hardened Image repository <span class="not-prose bg-blue-500 dark:bg-blue-400 rounded-sm px-1 text-xs text-white whitespace-nowrap">DHI Enterprise</span>'
linktitle: Mirror a repository
description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
@z

@x
keywords: mirror docker image, private container registry, docker hub automation, webhook image sync, secure image distribution, internal registry, jfrog artifactory, harbor registry, amazon ecr, google artifact registry, github container registry
@y
keywords: mirror docker image, private container registry, docker hub automation, webhook image sync, secure image distribution, internal registry, jfrog artifactory, harbor registry, amazon ecr, google artifact registry, github container registry
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
Mirroring requires a DHI Enterprise subscription. Without a DHI Enterprise
subscription, you can pull Docker Hardened Images directly from `dhi.io` without
mirroring. With a DHI Enterprise subscription, you must mirror to get:
@y
Mirroring requires a DHI Enterprise subscription. Without a DHI Enterprise
subscription, you can pull Docker Hardened Images directly from `dhi.io` without
mirroring. With a DHI Enterprise subscription, you must mirror to get:
@z

@x
- Compliance variants (FIPS-enabled or STIG-ready images)
- Extended Lifecycle Support (ELS) variants (requires add-on)
- Image or Helm chart customization
- Air-gapped or restricted network environments
- SLA-backed security updates
@y
- Compliance variants (FIPS-enabled or STIG-ready images)
- Extended Lifecycle Support (ELS) variants (requires add-on)
- Image or Helm chart customization
- Air-gapped or restricted network environments
- SLA-backed security updates
@z

@x
## How to mirror
@y
## How to mirror
@z

@x
This topic covers two types of mirroring for Docker Hardened Image (DHI)
repositories:
@y
This topic covers two types of mirroring for Docker Hardened Image (DHI)
repositories:
@z

@x
- [Mirror to Docker Hub](#mirror-a-dhi-repository-to-docker-hub): Mirror a DHI
  repository to your organization's namespace on Docker Hub. This requires a DHI
  Enterprise subscription and is used to [customize an image or
  chart](./customize.md) and access compliance variants and ELS variants
  (requires add-on). This must be done through the Docker Hub web interface.
@y
- [Mirror to Docker Hub](#mirror-a-dhi-repository-to-docker-hub): Mirror a DHI
  repository to your organization's namespace on Docker Hub. This requires a DHI
  Enterprise subscription and is used to [customize an image or
  chart](./customize.md) and access compliance variants and ELS variants
  (requires add-on). This must be done through the Docker Hub web interface.
@z

@x
- [Mirror to a third-party
  registry](#mirror-a-dhi-repository-to-a-third-party-registry): Mirror a
  repository to another container registry, such as Amazon ECR, Google Artifact
  Registry, or a private Harbor instance.
@y
- [Mirror to a third-party
  registry](#mirror-a-dhi-repository-to-a-third-party-registry): Mirror a
  repository to another container registry, such as Amazon ECR, Google Artifact
  Registry, or a private Harbor instance.
@z

@x
## Mirror a DHI repository to Docker Hub
@y
## Mirror a DHI repository to Docker Hub
@z

@x
Mirroring a repository to Docker Hub requires a DHI Enterprise subscription and
enables access to compliance variants, Extended Lifecycle Support (ELS) variants
(requires add-on), and customization capabilities:
@y
Mirroring a repository to Docker Hub requires a DHI Enterprise subscription and
enables access to compliance variants, Extended Lifecycle Support (ELS) variants
(requires add-on), and customization capabilities:
@z

@x
- Image repositories: Mirroring lets you customize images by adding packages,
  OCI artifacts (such as custom certificates or additional tools), environment
  variables, labels, and other configuration settings. For more details, see
  [Customize a Docker Hardened Image](./customize.md#customize-a-docker-hardened-image).
@y
- Image repositories: Mirroring lets you customize images by adding packages,
  OCI artifacts (such as custom certificates or additional tools), environment
  variables, labels, and other configuration settings. For more details, see
  [Customize a Docker Hardened Image](./customize.md#customize-a-docker-hardened-image).
@z

@x
- Chart repositories: Mirroring lets you customize image references within
  the chart. This is particularly useful when using customized images or when
  you've mirrored images to a third-party registry and need the chart to
  reference those custom locations. For more details, see [Customize a Docker
  Hardened Helm chart](./customize.md#customize-a-docker-hardened-helm-chart).
@y
- Chart repositories: Mirroring lets you customize image references within
  the chart. This is particularly useful when using customized images or when
  you've mirrored images to a third-party registry and need the chart to
  reference those custom locations. For more details, see [Customize a Docker
  Hardened Helm chart](./customize.md#customize-a-docker-hardened-helm-chart).
@z

@x
Only organization owners can perform mirroring. Once mirrored, the repository
becomes available in your organization's namespace, and you can customize it as
needed.
@y
Only organization owners can perform mirroring. Once mirrored, the repository
becomes available in your organization's namespace, and you can customize it as
needed.
@z

@x
To mirror a Docker Hardened Image repository:
@y
To mirror a Docker Hardened Image repository:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Catalog**.
5. Select a DHI repository to view its details.
6. Mirror the repository:
    - To mirror an image repository, select **Use this image** > **Mirror
      repository**, and then follow the on-screen instructions. If you have the ELS add-on, you can also
      select **Enable support for end-of-life versions**.
    - To mirror a Helm chart repository, select **Get Helm chart**, and then follow the on-screen instructions.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Catalog**.
5. Select a DHI repository to view its details.
6. Mirror the repository:
    - To mirror an image repository, select **Use this image** > **Mirror
      repository**, and then follow the on-screen instructions. If you have the ELS add-on, you can also
      select **Enable support for end-of-life versions**.
    - To mirror a Helm chart repository, select **Get Helm chart**, and then follow the on-screen instructions.
@z

@x
It may take a few minutes for all the tags to finish mirroring.
@y
It may take a few minutes for all the tags to finish mirroring.
@z

@x
After mirroring a repository, the repository appears in your organization's
repository list, prefixed by `dhi-`. It will continue to receive updated images.
@y
After mirroring a repository, the repository appears in your organization's
repository list, prefixed by `dhi-`. It will continue to receive updated images.
@z

@x
Once mirrored, the repository is a standard Docker Hub repository in your
organization's namespace. It behaves exactly like any other Hub repository,
which means you can manage access and permissions, configure webhooks, and use
other standard Hub features. See [Docker Hub
repositories](/manuals/docker-hub/repos/_index.md) for details.
@y
Once mirrored, the repository is a standard Docker Hub repository in your
organization's namespace. It behaves exactly like any other Hub repository,
which means you can manage access and permissions, configure webhooks, and use
other standard Hub features. See [Docker Hub
repositories](/manuals/docker-hub/repos/_index.md) for details.
@z

@x
Additionally, mirrored DHI repositories let you customize images and charts. To
learn more, see [Customize a Docker Hardened Image or chart](./customize.md).
@y
Additionally, mirrored DHI repositories let you customize images and charts. To
learn more, see [Customize a Docker Hardened Image or chart](./customize.md).
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
### Stop mirroring a repository
@y
### Stop mirroring a repository
@z

@x
Only organization owners can stop mirroring a repository. After you stop
mirroring, the repository remains, but it will
no longer receive updates. You can still use the last images or charts that were mirrored,
but the repository will not receive new tags or updates from the original
repository.
@y
Only organization owners can stop mirroring a repository. After you stop
mirroring, the repository remains, but it will
no longer receive updates. You can still use the last images or charts that were mirrored,
but the repository will not receive new tags or updates from the original
repository.
@z

@x
> [!NOTE]
>
> If you only want to stop mirroring ELS versions, you can uncheck the ELS
> option in the mirrored repository's **Settings** tab. For more details, see
> [Disable ELS for a repository](./els.md#disable-els-for-a-repository).
@y
> [!NOTE]
>
> If you only want to stop mirroring ELS versions, you can uncheck the ELS
> option in the mirrored repository's **Settings** tab. For more details, see
> [Disable ELS for a repository](./els.md#disable-els-for-a-repository).
@z

@x
 To stop mirroring a repository:
@y
 To stop mirroring a repository:
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has access to DHI.
4. Select **Hardened Images** > **Manage**.
5. Select the **Mirrored Images** or **Mirrored Helm charts** tab.
6. In the far right column of the repository you want to stop mirroring, select the menu icon.
7. Select **Stop mirroring**.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has access to DHI.
4. Select **Hardened Images** > **Manage**.
5. Select the **Mirrored Images** or **Mirrored Helm charts** tab.
6. In the far right column of the repository you want to stop mirroring, select the menu icon.
7. Select **Stop mirroring**.
@z

@x
## Mirror a DHI repository to a third-party registry
@y
## Mirror a DHI repository to a third-party registry
@z

@x
You can optionally mirror a DHI repository to another container registry, such as Amazon
ECR, Google Artifact Registry, GitHub Container Registry, or a private Harbor
instance.
@y
You can optionally mirror a DHI repository to another container registry, such as Amazon
ECR, Google Artifact Registry, GitHub Container Registry, or a private Harbor
instance.
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
also mirror its associated OCI artifacts. DHI repositories store the image
layers on `dhi.io` (or `docker.io` for customized images) and the signed
attestations in a separate registry (`registry.scout.docker.com`).
@y
However, to preserve the full security context, including attestations, you must
also mirror its associated OCI artifacts. DHI repositories store the image
layers on `dhi.io` (or `docker.io` for customized images) and the signed
attestations in a separate registry (`registry.scout.docker.com`).
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
The example assumes you have mirrored the DHI repository to your organization's
namespace on Docker Hub as described in the previous section. You can apply the
same steps to a non-mirrored image by updating the the `SRC_ATT_REPO` and
`SRC_REPO` variables accordingly.
@y
The example assumes you have mirrored the DHI repository to your organization's
namespace on Docker Hub as described in the previous section. You can apply the
same steps to a non-mirrored image by updating the the `SRC_ATT_REPO` and
`SRC_REPO` variables accordingly.
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
## What next
@y
## What next
@z

@x
After mirroring, see [Pull a DHI](./use.md#pull-a-dhi) to learn how to pull and use mirrored images.
@y
After mirroring, see [Pull a DHI](./use.md#pull-a-dhi) to learn how to pull and use mirrored images.
@z
