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
Organization owners, editors, and members with a [custom role](../../security/roles-and-permissions/custom-roles/_index.md)
that includes the DHI mirroring permission can create, view, and manage mirrors.
When using the CLI or Terraform, you can also mirror using an [organization
access token (OAT)](../../security/access-tokens/organization-access-tokens.md) with the
appropriate permission scopes, without requiring role-based access.
@y
Organization owners, editors, and members with a [custom role](../../security/roles-and-permissions/custom-roles/_index.md)
that includes the DHI mirroring permission can create, view, and manage mirrors.
When using the CLI or Terraform, you can also mirror using an [organization
access token (OAT)](../../security/access-tokens/organization-access-tokens.md) with the
appropriate permission scopes, without requiring role-based access.
@z

@x
When a member with a custom role that includes the DHI mirroring permission
creates a mirror, Docker automatically creates and manages the
`dhi-mirroring-admins` team in your organization, adds that member to it, and
grants the team access to the new mirror. This lets the member manage mirrors
they create without organization owner or editor access. Mirrors created by
organization owners or editors don't use this team. Removing members from this
team may affect their ability to view and manage mirrors.
@y
When a member with a custom role that includes the DHI mirroring permission
creates a mirror, Docker automatically creates and manages the
`dhi-mirroring-admins` team in your organization, adds that member to it, and
grants the team access to the new mirror. This lets the member manage mirrors
they create without organization owner or editor access. Mirrors created by
organization owners or editors don't use this team. Removing members from this
team may affect their ability to view and manage mirrors.
@z

@x
You can mirror image and chart repositories to your organization's namespace on
Docker Hub. Mirroring makes the repositories available within your organization
and lets you customize them for your environment:
@y
You can mirror image and chart repositories to your organization's namespace on
Docker Hub. Mirroring makes the repositories available within your organization
and lets you customize them for your environment:
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
access token (PAT)](../../security/access-tokens/personal-access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../security/access-tokens/organization-access-tokens.md). When using an OAT, the
available operations depend on the token's permission scope:
@y
Authenticate with `docker login` using your Docker credentials, a [personal
access token (PAT)](../../security/access-tokens/personal-access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../security/access-tokens/organization-access-tokens.md). When using an OAT, the
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
provider](/dhi/tools/terraform/).
@y
You can manage DHI mirrors as infrastructure-as-code using the [DHI Terraform
provider](__SUBDIR__/dhi/tools/terraform/).
@z

@x
Define a `dhi_mirror` resource for each repository you want to mirror:
@y
Define a `dhi_mirror` resource for each repository you want to mirror:
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
access token (PAT)](../../security/access-tokens/personal-access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../security/access-tokens/organization-access-tokens.md) with push access to the
relevant repository.
@y
Authenticate with `docker login` using your Docker credentials, a [personal
access token (PAT)](../../security/access-tokens/personal-access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../security/access-tokens/organization-access-tokens.md) with push access to the
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
When a webhook fires, Docker Hub sends the standard [webhook
payload](/docker-hub/repos/manage/webhooks/#example-webhook-payload). For a
mirrored DHI repository, the payload also includes an additional
`dhi_metadata` object. This object describes what changed between the newly
pushed build and the previous build of the same tag, including vulnerability
fixes, package changes, and configuration changes.
@y
When a webhook fires, Docker Hub sends the standard [webhook
payload](/docker-hub/repos/manage/webhooks/#example-webhook-payload). For a
mirrored DHI repository, the payload also includes an additional
`dhi_metadata` object. This object describes what changed between the newly
pushed build and the previous build of the same tag, including vulnerability
fixes, package changes, and configuration changes.
@z

@x
> [!NOTE]
>
> Docker Hub adds `dhi_metadata` only to pushes on mirrored DHI repositories.
> Webhooks on other repositories deliver the standard payload.
@y
> [!NOTE]
>
> Docker Hub adds `dhi_metadata` only to pushes on mirrored DHI repositories.
> Webhooks on other repositories deliver the standard payload.
@z

@x
Each DHI build produces a signed changelog attestation. At webhook delivery
time, Docker Hub retrieves the changelog for the pushed image and embeds it in
the payload as `dhi_metadata`.
@y
Each DHI build produces a signed changelog attestation. At webhook delivery
time, Docker Hub retrieves the changelog for the pushed image and embeds it in
the payload as `dhi_metadata`.
@z

@x
DHI changelogs are generated per architecture, so `dhi_metadata` is a map
keyed by the architecture-specific manifest digest. A multi-platform image
push contains an entry for each platform that has a changelog. Match the
digest key against the platform you care about instead of assuming a single
entry.
@y
DHI changelogs are generated per architecture, so `dhi_metadata` is a map
keyed by the architecture-specific manifest digest. A multi-platform image
push contains an entry for each platform that has a changelog. Match the
digest key against the platform you care about instead of assuming a single
entry.
@z

@x
#### `dhi_metadata` fields
@y
#### `dhi_metadata` fields
@z

@x
Each platform entry contains the following fields.
@y
Each platform entry contains the following fields.
@z

@x
| Field | Type | Description |
| :---- | :---- | :---- |
| `schema_version` | integer | Version of the `dhi_metadata` schema. |
| `change_categories` | array of strings | High-level summary of what changed in this build. See [Change categories](#change-categories). |
| `previous_version` | object | The prior build this one is compared against. Contains `tag` and `digest`. |
| `changes` | object | Detailed diff versus the previous version. See the following table. |
@y
| Field | Type | Description |
| :---- | :---- | :---- |
| `schema_version` | integer | Version of the `dhi_metadata` schema. |
| `change_categories` | array of strings | High-level summary of what changed in this build. See [Change categories](#change-categories). |
| `previous_version` | object | The prior build this one is compared against. Contains `tag` and `digest`. |
| `changes` | object | Detailed diff versus the previous version. See the following table. |
@z

@x
The `changes` object contains:
@y
The `changes` object contains:
@z

@x
| Field | Type | Description |
| :---- | :---- | :---- |
| `vulnerabilities_fixed` | array | CVEs resolved in this build. Each entry has `cve_id`, `severity`, `package`, and `fixed_in_version`. |
| `packages_updated` | array | Packages whose version changed. Each entry has `name`, `type`, `old_version`, and `new_version`. |
| `packages_added` | array | Packages added in this build. Each entry has `name`, `type`, and `version`. |
| `packages_removed` | array | Packages removed in this build. Each entry has `name`, `type`, and `version`. |
| `environment_variables_changed` | array | Changes to environment variables. Each entry has `change`, `key`, and `from_value` or `to_value` as applicable. |
| `labels_changed` | array | Changes to image labels, in the same shape as environment variable changes. |
| `configuration_changed` | array | Changes to other image configuration. For example, the entrypoint. |
@y
| Field | Type | Description |
| :---- | :---- | :---- |
| `vulnerabilities_fixed` | array | CVEs resolved in this build. Each entry has `cve_id`, `severity`, `package`, and `fixed_in_version`. |
| `packages_updated` | array | Packages whose version changed. Each entry has `name`, `type`, `old_version`, and `new_version`. |
| `packages_added` | array | Packages added in this build. Each entry has `name`, `type`, and `version`. |
| `packages_removed` | array | Packages removed in this build. Each entry has `name`, `type`, and `version`. |
| `environment_variables_changed` | array | Changes to environment variables. Each entry has `change`, `key`, and `from_value` or `to_value` as applicable. |
| `labels_changed` | array | Changes to image labels, in the same shape as environment variable changes. |
| `configuration_changed` | array | Changes to other image configuration. For example, the entrypoint. |
@z

@x
When a change type has no entries, its array is present but empty, shown as `[]`.
@y
When a change type has no entries, its array is present but empty, shown as `[]`.
@z

@x
#### Change categories
@y
#### Change categories
@z

@x
`change_categories` gives a quick, machine-readable summary of the build.
@y
`change_categories` gives a quick, machine-readable summary of the build.
@z

@x
| Value | Meaning |
| :---- | :---- |
| `vulnerability_fix` | The build resolves one or more CVEs. See `changes.vulnerabilities_fixed`. |
| `version_upgrade` | One or more packages changed version. See `changes.packages_updated`. |
| `other` | The build has package, environment variable, label, or configuration changes that don't fall into either category above. |
@y
| Value | Meaning |
| :---- | :---- |
| `vulnerability_fix` | The build resolves one or more CVEs. See `changes.vulnerabilities_fixed`. |
| `version_upgrade` | One or more packages changed version. See `changes.packages_updated`. |
| `other` | The build has package, environment variable, label, or configuration changes that don't fall into either category above. |
@z

@x
A build can have more than one category. For example, a build that fixes a CVE
and also bumps a package version returns both `vulnerability_fix` and
`version_upgrade`. A build with no changes at all returns an empty array.
@y
A build can have more than one category. For example, a build that fixes a CVE
and also bumps a package version returns both `vulnerability_fix` and
`version_upgrade`. A build with no changes at all returns an empty array.
@z

@x
#### Example: vulnerability fix and version upgrade
@y
#### Example: vulnerability fix and version upgrade
@z

@x
The following excerpt shows the `dhi_metadata` object from a webhook payload
for a push to a mirrored DHI repository. The example is trimmed to a single
platform and a subset of changes for readability. A real payload contains one
`dhi_metadata` entry per architecture.
@y
The following excerpt shows the `dhi_metadata` object from a webhook payload
for a push to a mirrored DHI repository. The example is trimmed to a single
platform and a subset of changes for readability. A real payload contains one
`dhi_metadata` entry per architecture.
@z

% snip code...

@x
#### Example: version bump with no CVEs
@y
#### Example: version bump with no CVEs
@z

@x
When a build only bumps package versions, `change_categories` contains
`version_upgrade` and `vulnerabilities_fixed` is empty.
@y
When a build only bumps package versions, `change_categories` contains
`version_upgrade` and `vulnerabilities_fixed` is empty.
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
   In this example, you authenticate as your Docker organization using an
   [organization access token
   (OAT)](../../security/access-tokens/organization-access-tokens.md). The OAT must have at
   least pull access to every DHI repository you want to mirror. Only
   repositories in the token's scope are accessible. Alternatively, you can
   authenticate as a Docker Hub user with a [personal access token
   (PAT)](../../security/access-tokens/personal-access-tokens.md) that has `read only` access.
@y
   In this example, you authenticate as your Docker organization using an
   [organization access token
   (OAT)](../../security/access-tokens/organization-access-tokens.md). The OAT must have at
   least pull access to every DHI repository you want to mirror. Only
   repositories in the token's scope are accessible. Alternatively, you can
   authenticate as a Docker Hub user with a [personal access token
   (PAT)](../../security/access-tokens/personal-access-tokens.md) that has `read only` access.
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

@x within code
# Optional: inline creds if not relying on prior CLI logins
# creds:
#   - registry: docker.io
#     user: <your-docker-org>
#     pass: "{{file \"/run/secrets/docker_oat\"}}"
#   - registry: registry.scout.docker.com
#     user: <your-docker-org>
#     pass: "{{file \"/run/secrets/docker_oat\"}}"
#   - registry: registry.example.com
#     user: <service-user>
#     pass: "{{file \"/run/secrets/dest_token\"}}"
@y
# Optional: inline creds if not relying on prior CLI logins
# creds:
#   - registry: docker.io
#     user: <your-docker-org>
#     pass: "{{file \"/run/secrets/docker_oat\"}}"
#   - registry: registry.scout.docker.com
#     user: <your-docker-org>
#     pass: "{{file \"/run/secrets/docker_oat\"}}"
#   - registry: registry.example.com
#     user: <service-user>
#     pass: "{{file \"/run/secrets/dest_token\"}}"
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
