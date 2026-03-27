%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

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
Mirroring requires a DHI Select or Enterprise subscription. Without a
subscription, you can pull Docker Hardened Images directly from `dhi.io` without
mirroring. With a DHI Select or Enterprise subscription, you must mirror to get:
@y
Mirroring requires a DHI Select or Enterprise subscription. Without a
subscription, you can pull Docker Hardened Images directly from `dhi.io` without
mirroring. With a DHI Select or Enterprise subscription, you must mirror to get:
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
You can mirror repositories using either the Docker Hub web interface or the DHI CLI.
@y
You can mirror repositories using either the Docker Hub web interface or the DHI CLI.
@z

@x
### Mirror using the DHI CLI
@y
### Mirror using the DHI CLI
@z

@x
The DHI CLI provides a command-line interface for managing Docker Hardened
Images, including mirroring operations. For installation instructions and usage
details, see [Use the DHI CLI](./cli.md#mirror-dhi-images).
@y
The DHI CLI provides a command-line interface for managing Docker Hardened
Images, including mirroring operations. For installation instructions and usage
details, see [Use the DHI CLI](./cli.md#mirror-dhi-images).
@z

@x
### Stop mirroring with the CLI
@y
### Stop mirroring with the CLI
@z

% snip command...

@x
After stopping mirroring, the repository remains but will no longer receive updates.
@y
After stopping mirroring, the repository remains but will no longer receive updates.
@z

@x
### Mirror using the Docker Hub web interface
@y
### Mirror using the Docker Hub web interface
@z

@x
To mirror a Docker Hardened Image repository using the web interface:
@y
To mirror a Docker Hardened Image repository using the web interface:
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
repositories](manuals/docker-hub/repos/_index.md) for details.
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

% snip code...

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
> If you only want to stop mirroring ELS versions, you can clear the ELS
> option in the mirrored repository's **Settings** tab. For more details, see
> [Disable ELS for a repository](./els.md#disable-els-for-a-repository).
@y
> [!NOTE]
>
> If you only want to stop mirroring ELS versions, you can clear the ELS
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
[Docker CLI](/reference/cli/docker/), [Docker Hub Registry
API](/reference/api/registry/latest/), third-party registry tools, or CI/CD
automation.
@y
You can use any standard workflow to mirror the image, such as the
[Docker CLI](__SUBDIR__/reference/cli/docker/), [Docker Hub Registry
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
### Authenticate to `dhi.io` with an organization access token
@y
### Authenticate to `dhi.io` with an organization access token
@z

@x
You can authenticate to `dhi.io` using an [organization access token
(OAT)](../../enterprise/security/access-tokens.md) instead of a personal access
token (PAT). OATs are owned by the organization rather than an individual user,
which makes them better suited for CI/CD pipelines and automated workflows.
@y
You can authenticate to `dhi.io` using an [organization access token
(OAT)](../../enterprise/security/access-tokens.md) instead of a personal access
token (PAT). OATs are owned by the organization rather than an individual user,
which makes them better suited for CI/CD pipelines and automated workflows.
@z

@x
> [!NOTE]
>
> When using an OAT, use your organization name as the username, not your
> personal Docker ID. OATs are org-scoped and will return a `401 Unauthorized`
> error if presented under an individual user's username.
@y
> [!NOTE]
>
> When using an OAT, use your organization name as the username, not your
> personal Docker ID. OATs are org-scoped and will return a `401 Unauthorized`
> error if presented under an individual user's username.
@z

@x
To authenticate using an OAT:
@y
To authenticate using an OAT:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
2. Select **Admin Console**, then **Access tokens**.
3. Select **Generate access token**.
4. Give the token a descriptive name, for example `dhi-pull-automation`.
5. Expand the **Repository** drop-down and select **Read public repositories**.
6. Select **Generate token**, then copy and save the token. You won't be able
   to retrieve it after closing the screen.
7. Sign in to `dhi.io` using your organization name as the username and the OAT
   as the password:
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
2. Select **Admin Console**, then **Access tokens**.
3. Select **Generate access token**.
4. Give the token a descriptive name, for example `dhi-pull-automation`.
5. Expand the **Repository** drop-down and select **Read public repositories**.
6. Select **Generate token**, then copy and save the token. You won't be able
   to retrieve it after closing the screen.
7. Sign in to `dhi.io` using your organization name as the username and the OAT
   as the password:
@z

% snip command...

@x
   Or non-interactively in a CI/CD pipeline:
@y
   Or non-interactively in a CI/CD pipeline:
@z

% snip command...

@x
8. Verify access by discovering attestations on a DHI image:
@y
8. Verify access by discovering attestations on a DHI image:
@z

% snip command...

@x
   > [!NOTE]
   >
   > The `--platform` flag is required. Without it, `oras discover` resolves to
   > the multi-arch image index, which returns only an index-level signature
   > rather than the full set of per-platform attestations.
@y
   > [!NOTE]
   >
   > The `--platform` flag is required. Without it, `oras discover` resolves to
   > the multi-arch image index, which returns only an index-level signature
   > rather than the full set of per-platform attestations.
@z

@x
   A successful response lists the attestations attached to the image,
   including SBOMs, provenance, vulnerability reports, and changelog metadata.
@y
   A successful response lists the attestations attached to the image,
   including SBOMs, provenance, vulnerability reports, and changelog metadata.
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
same steps to a non-mirrored image by updating the `SRC_ATT_REPO` and
`SRC_REPO` variables accordingly.
@y
The example assumes you have mirrored the DHI repository to your organization's
namespace on Docker Hub as described in the previous section. You can apply the
same steps to a non-mirrored image by updating the `SRC_ATT_REPO` and
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
   with `read only` access. Alternatively, you can use your organization name and
   an [organization access token
   (OAT)](../../enterprise/security/access-tokens.md) to authenticate with `docker.io`.
   Note that OATs are not supported for `registry.scout.docker.com`. If your
   workflow requires authenticating to the Scout registry, use a personal access
   token (PAT) for that step.
@y
   In this example, you use a Docker username to represent a member of the Docker
   Hub organization that the DHI repositories are mirrored in. Prepare a
   [personal access token (PAT)](../../security/access-tokens.md) for the user
   with `read only` access. Alternatively, you can use your organization name and
   an [organization access token
   (OAT)](../../enterprise/security/access-tokens.md) to authenticate with `docker.io`.
   Note that OATs are not supported for `registry.scout.docker.com`. If your
   workflow requires authenticating to the Scout registry, use a personal access
   token (PAT) for that step.
@z

% snip command...

@x
2. Sign in via `regctl` to Docker Hub, the Scout registry that contains
   the attestations, and your destination registry.
@y
2. Sign in via `regctl` to Docker Hub, the Scout registry that contains
   the attestations, and your destination registry.
@z

% snip command...

@x
3. Mirror the image and attestations using `--referrers` and referrer endpoints:
@y
3. Mirror the image and attestations using `--referrers` and referrer endpoints:
@z

% snip command...

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

% snip command...

@x
   List attached artifacts (SBOM, provenance, VEX, vulnerability reports).
@y
   List attached artifacts (SBOM, provenance, VEX, vulnerability reports).
@z

% snip command...

@x
   Or, list attached artifacts with `docker scout`.
@y
   Or, list attached artifacts with `docker scout`.
@z

% snip command...

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

% snip command...

@x
To run the sync with the configuration file:
@y
To run the sync with the configuration file:
@z

% snip command...

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
