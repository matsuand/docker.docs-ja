%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Mirror a Docker Hardened Image repository
linktitle: Mirror a repository
description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
@y
title: Mirror a Docker Hardened Image repository
linktitle: Mirror a repository
description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
@z

@x
keywords: mirror docker image, private container registry, docker hub automation, webhook image sync, secure image distribution, internal registry, jfrog artifactory, harbor registry, amazon ecr, google artifact registry, github container registry, terraform, infrastructure as code
@y
keywords: mirror docker image, private container registry, docker hub automation, webhook image sync, secure image distribution, internal registry, jfrog artifactory, harbor registry, amazon ecr, google artifact registry, github container registry, terraform, infrastructure as code
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
Mirroring requires a DHI Select or Enterprise subscription. Without a
subscription, you can pull Docker Hardened Images directly from `dhi.io` without
mirroring. With a DHI Select or Enterprise subscription, you must mirror to your
organization to get:
@y
Mirroring requires a DHI Select or Enterprise subscription. Without a
subscription, you can pull Docker Hardened Images directly from `dhi.io` without
mirroring. With a DHI Select or Enterprise subscription, you must mirror to your
organization to get:
@z

@x
- Compliance variants (FIPS-enabled or STIG-ready images)
- Extended Lifecycle Support (ELS) variants (requires add-on)
- Image or Helm chart customization
- Air-gapped or restricted network environments
- [SLA-backed security updates](https://docs.docker.com/go/dhi-sla/)
@y
- Compliance variants (FIPS-enabled or STIG-ready images)
- Extended Lifecycle Support (ELS) variants (requires add-on)
- Image or Helm chart customization
- Air-gapped or restricted network environments
- [SLA-backed security updates](https://docs.docker.com/go/dhi-sla/)
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
- [Mirror to your organization](#mirror-a-dhi-repository-to-your-organization):
  Mirror a DHI repository to your organization's namespace on Docker Hub.
@y
- [Mirror to your organization](#mirror-a-dhi-repository-to-your-organization):
  Mirror a DHI repository to your organization's namespace on Docker Hub.
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
## Mirror a DHI repository to your organization
@y
## Mirror a DHI repository to your organization
@z

@x
To mirror repositories, you must be an organization owner or editor, or use a
personal access token (PAT) or organization access token (OAT). See the CLI and
Terraform tabs in the following sections for required permission scopes.
@y
To mirror repositories, you must be an organization owner or editor, or use a
personal access token (PAT) or organization access token (OAT). See the CLI and
Terraform tabs in the following sections for required permission scopes.
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
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
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
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
Authenticate with `docker login` using your Docker credentials, a [personal
access token (PAT)](../../security/access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../enterprise/security/access-tokens.md). When using an OAT, the
available operations depend on the token's permission scope:
@y
Authenticate with `docker login` using your Docker credentials, a [personal
access token (PAT)](../../security/access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../enterprise/security/access-tokens.md). When using an OAT, the
available operations depend on the token's permission scope:
@z

@x
- To list mirrored repositories, the OAT must have read (pull) access to the
  relevant repositories. Results are scoped to repositories the OAT can access.
- To create a mirror to an existing destination repository, the OAT must have
  push access to that repository. To create a mirror to a new destination
  repository that doesn't yet exist, the OAT must have org-wide repository
  access (for example, `<org>/*` with pull or push). Repository-scoped access to
  the future repository name is not sufficient.
- To stop mirroring, the OAT must have push access to the relevant repository.
- OATs with public repository read-only access cannot list or manage mirrored
  repositories.
@y
- To list mirrored repositories, the OAT must have read (pull) access to the
  relevant repositories. Results are scoped to repositories the OAT can access.
- To create a mirror to an existing destination repository, the OAT must have
  push access to that repository. To create a mirror to a new destination
  repository that doesn't yet exist, the OAT must have org-wide repository
  access (for example, `<org>/*` with pull or push). Repository-scoped access to
  the future repository name is not sufficient.
- To stop mirroring, the OAT must have push access to the relevant repository.
- OATs with public repository read-only access cannot list or manage mirrored
  repositories.
@z

@x
Use the [`docker dhi mirror`](/reference/cli/docker/dhi/mirror/) command:
@y
Use the [`docker dhi mirror`](__SUBDIR__/reference/cli/docker/dhi/mirror/) command:
@z

% snip command...

@x
Mirror with dependencies:
@y
Mirror with dependencies:
@z

% snip command...

@x
List mirrored images in your organization:
@y
List mirrored images in your organization:
@z

% snip command...

@x
Filter mirrored images by name or type:
@y
Filter mirrored images by name or type:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Terraform" >}}
@y
{{< /tab >}}
{{< tab name="Terraform" >}}
@z

@x
You can manage DHI mirrors as infrastructure-as-code using the [DHI Terraform
provider](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs).
@y
You can manage DHI mirrors as infrastructure-as-code using the [DHI Terraform
provider](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs).
@z

@x
First, install and configure the provider:
@y
First, install and configure the provider:
@z

% snip code...

@x
> [!NOTE]
>
> Instead of specifying credentials in the provider block, you can set the
> `DOCKER_USERNAME`, `DOCKER_PASSWORD`, and `DHI_ORG` environment variables. You
> can also authenticate using an organization access token (OAT) in place of a
> password. Set `DOCKER_USERNAME` to your organization namespace and
> `DOCKER_PASSWORD` to the OAT. When using an OAT, the same permission scopes
> apply as with the CLI: read (pull) access is required to list mirrors, and
> push access is required to create or delete them.
@y
> [!NOTE]
>
> Instead of specifying credentials in the provider block, you can set the
> `DOCKER_USERNAME`, `DOCKER_PASSWORD`, and `DHI_ORG` environment variables. You
> can also authenticate using an organization access token (OAT) in place of a
> password. Set `DOCKER_USERNAME` to your organization namespace and
> `DOCKER_PASSWORD` to the OAT. When using an OAT, the same permission scopes
> apply as with the CLI: read (pull) access is required to list mirrors, and
> push access is required to create or delete them.
@z

@x
Then, define a `dhi_mirror` resource for each repository you want to mirror:
@y
Then, define a `dhi_mirror` resource for each repository you want to mirror:
@z

% snip code...

@x
To enable Extended Lifecycle Support (ELS) variants, set the `els` attribute:
@y
To enable Extended Lifecycle Support (ELS) variants, set the `els` attribute:
@z

% snip code...

@x
Run `terraform apply` to create the mirrors.
@y
Run `terraform apply` to create the mirrors.
@z

@x
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/mirror).
@y
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/mirror).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
After mirroring, the repository appears in your organization's repository list,
prefixed by `dhi-`, and continues to receive updated images. It behaves like any
other Docker Hub repository, so you can manage access and permissions, configure
webhooks, and use other standard Hub features. See [Docker Hub
repositories](/manuals/docker-hub/repos/_index.md) for details.
@y
After mirroring, the repository appears in your organization's repository list,
prefixed by `dhi-`, and continues to receive updated images. It behaves like any
other Docker Hub repository, so you can manage access and permissions, configure
webhooks, and use other standard Hub features. See [Docker Hub
repositories](manuals/docker-hub/repos/_index.md) for details.
@z

@x
### Stop mirroring a repository
@y
### Stop mirroring a repository
@z

@x
After you stop mirroring, the repository remains, but it no longer receives
updates. You can still use the last images or charts that were mirrored.
@y
After you stop mirroring, the repository remains, but it no longer receives
updates. You can still use the last images or charts that were mirrored.
@z

@x
> [!NOTE]
>
> If you only want to stop mirroring ELS versions, you can clear the ELS
> option in the mirrored repository's **Settings** tab.
@y
> [!NOTE]
>
> If you only want to stop mirroring ELS versions, you can clear the ELS
> option in the mirrored repository's **Settings** tab.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
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
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
Authenticate with `docker login` using your Docker credentials, a [personal
access token (PAT)](../../security/access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../enterprise/security/access-tokens.md) with push access to the
relevant repository.
@y
Authenticate with `docker login` using your Docker credentials, a [personal
access token (PAT)](../../security/access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../enterprise/security/access-tokens.md) with push access to the
relevant repository.
@z

@x
Use the [`docker dhi mirror`](/reference/cli/docker/dhi/mirror/) command:
@y
Use the [`docker dhi mirror`](__SUBDIR__/reference/cli/docker/dhi/mirror/) command:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Terraform" >}}
@y
{{< /tab >}}
{{< tab name="Terraform" >}}
@z

@x
To stop mirroring, remove the `dhi_mirror` resource from your Terraform
configuration and run `terraform apply`. The repository remains in your
organization but no longer receives updates.
@y
To stop mirroring, remove the `dhi_mirror` resource from your Terraform
configuration and run `terraform apply`. The repository remains in your
organization but no longer receives updates.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Mirror a DHI repository to a third-party registry
@y
## Mirror a DHI repository to a third-party registry
@z

@x
After mirroring a DHI repository to your organization on Docker Hub, you can
optionally mirror it to another container registry, such as Amazon ECR, Google
Artifact Registry, GitHub Container Registry, or a private Harbor instance.
@y
After mirroring a DHI repository to your organization on Docker Hub, you can
optionally mirror it to another container registry, such as Amazon ECR, Google
Artifact Registry, GitHub Container Registry, or a private Harbor instance.
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
### Automate syncing with webhooks
@y
### Automate syncing with webhooks
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

@x
   > [!WARNING]
   >
   > The following examples export credentials directly on the command line for
   > demonstration purposes. This exposes sensitive tokens in your shell history
   > and process list. In production environments, use secure methods such as
   > reading from files with restricted permissions, environment files loaded
   > at runtime, or secret management tools.
@y
   > [!WARNING]
   >
   > The following examples export credentials directly on the command line for
   > demonstration purposes. This exposes sensitive tokens in your shell history
   > and process list. In production environments, use secure methods such as
   > reading from files with restricted permissions, environment files loaded
   > at runtime, or secret management tools.
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

% snip code...

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
