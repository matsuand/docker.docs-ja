%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Customize a Docker Hardened Image or chart
linkTitle: Customize an image or chart
@y
title: Customize a Docker Hardened Image or chart
linkTitle: Customize an image or chart
@z

@x
keywords: hardened images, DHI, customize, certificate, artifact, helm chart, terraform, infrastructure as code
description: Learn how to customize Docker Hardened Images (DHI) and charts.
@y
keywords: hardened images, DHI, customize, certificate, artifact, helm chart, terraform, infrastructure as code
description: Learn how to customize Docker Hardened Images (DHI) and charts.
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
When you have a DHI Select or DHI Enterprise subscription, you can customize Docker
Hardened Images (DHI) and charts to suit your specific needs using the Docker
Hub web interface. For images, this lets you select a base image, add packages,
add OCI artifacts (such as custom certificates or additional tools), and
configure settings. For charts, this lets you customize the image references.
@y
When you have a DHI Select or DHI Enterprise subscription, you can customize Docker
Hardened Images (DHI) and charts to suit your specific needs using the Docker
Hub web interface. For images, this lets you select a base image, add packages,
add OCI artifacts (such as custom certificates or additional tools), and
configure settings. For charts, this lets you customize the image references.
@z

@x
Your customizations stay secure automatically. When the base Docker Hardened
Image or chart receives a security patch or your OCI artifacts are updated,
Docker automatically rebuilds your customizations in the background. This
ensures continuous compliance and protection by default, with no manual work
required. The rebuilt artifacts are signed and attested to the same SLSA Build
Level 3 standard as the base images and charts, ensuring a secure and verifiable
supply chain.
@y
Your customizations stay secure automatically. When the base Docker Hardened
Image or chart receives a security patch or your OCI artifacts are updated,
Docker automatically rebuilds your customizations in the background. This
ensures continuous compliance and protection by default, with no manual work
required. The rebuilt artifacts are signed and attested to the same SLSA Build
Level 3 standard as the base images and charts, ensuring a secure and verifiable
supply chain.
@z

@x
## Customize a Docker Hardened Image
@y
## Customize a Docker Hardened Image
@z

@x
To add a customized Docker Hardened Image to your organization, an organization
owner must first [mirror](./mirror.md) the DHI repository to your organization
on Docker Hub. Once the repository is mirrored, any user with access to the
mirrored DHI repository can create a customized image.
@y
To add a customized Docker Hardened Image to your organization, an organization
owner must first [mirror](./mirror.md) the DHI repository to your organization
on Docker Hub. Once the repository is mirrored, any user with access to the
mirrored DHI repository can create a customized image.
@z

@x
You can create customizations using either the DHI CLI or the Docker Hub web interface.
@y
You can create customizations using either the DHI CLI or the Docker Hub web interface.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub**.
1. In the namespace drop-down, select your organization that has a mirrored DHI
   repository.
1. Select **Hardened Images** > **Manage** > **Mirrored Images**.
1. For the mirrored DHI repository you want to customize, select the menu icon in the far right column.
1. Select **Customize**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub**.
1. In the namespace drop-down, select your organization that has a mirrored DHI
   repository.
1. Select **Hardened Images** > **Manage** > **Mirrored Images**.
1. For the mirrored DHI repository you want to customize, select the menu icon in the far right column.
1. Select **Customize**.
@z

@x
   At this point, the on-screen instructions will guide you through the
   customization process. You can continue with the following steps for more
   details.
@y
   At this point, the on-screen instructions will guide you through the
   customization process. You can continue with the following steps for more
   details.
@z

@x
1. Select one or more images or Helm charts and versions you want to customize.
@y
1. Select one or more images or Helm charts and versions you want to customize.
@z

@x
   When selecting multiple images and versions, all selections must share the
   same distribution and distribution version. For example, you can select
   `dhi-node:22_alpine3.23` and `dhi-python:3.13_alpine3.23` together (both
   Alpine 3.23), but you cannot mix `dhi-node:22_debian` with Alpine images, or
   mix different Alpine versions like `alpine3.23` and `alpine3.22`.
@y
   When selecting multiple images and versions, all selections must share the
   same distribution and distribution version. For example, you can select
   `dhi-node:22_alpine3.23` and `dhi-python:3.13_alpine3.23` together (both
   Alpine 3.23), but you cannot mix `dhi-node:22_debian` with Alpine images, or
   mix different Alpine versions like `alpine3.23` and `alpine3.22`.
@z

@x
   Alternatively, you can select multiple Helm chart versions to apply the same
   customization to all of them. You cannot mix images and Helm charts in the
   same customization.
@y
   Alternatively, you can select multiple Helm chart versions to apply the same
   customization to all of them. You cannot mix images and Helm charts in the
   same customization.
@z

@x
1. Select **Next**.
1. Optional. Add packages.
@y
1. Select **Next**.
1. Optional. Add packages.
@z

@x
   1. In the packages drop-down, select the packages you want to add to the
      image.
@y
   1. In the packages drop-down, select the packages you want to add to the
      image.
@z

@x
      The packages available in the drop-down are OS system packages for the
      selected image variant. For version 3.23 and later Alpine-based images,
      these are hardened packages that have been built from source by Docker with
      cryptographic signatures and full supply chain security. For version 3.22
      Alpine-based images and Debian-based images, these are standard system
      packages.
@y
      The packages available in the drop-down are OS system packages for the
      selected image variant. For version 3.23 and later Alpine-based images,
      these are hardened packages that have been built from source by Docker with
      cryptographic signatures and full supply chain security. For version 3.22
      Alpine-based images and Debian-based images, these are standard system
      packages.
@z

@x
   1. In the **OCI artifacts** drop-down, first, select the repository that
      contains the OCI artifact image. Then, select the tag you want to use from
      that repository. Finally, specify the specific paths you want to include
      from the OCI artifact image.
@y
   1. In the **OCI artifacts** drop-down, first, select the repository that
      contains the OCI artifact image. Then, select the tag you want to use from
      that repository. Finally, specify the specific paths you want to include
      from the OCI artifact image.
@z

@x
      The OCI artifacts are images that you have previously
      built and pushed to a repository in the same namespace as the mirrored
      DHI. For example, you can add a custom root CA certificate or another
      image that contains a tool you need, like adding Python to a Node.js
      image.
@y
      The OCI artifacts are images that you have previously
      built and pushed to a repository in the same namespace as the mirrored
      DHI. For example, you can add a custom root CA certificate or another
      image that contains a tool you need, like adding Python to a Node.js
      image.
@z

@x
      You can add multiple OCI artifact images to a single customization. When
      you add more than one, they're applied in the order you add them in the
      **OCI artifacts** drop-down. If multiple images contain directories or
      files with the same path, images added later overwrite files from images
      added earlier. To manage this, you must select paths to include and
      optionally exclude from each OCI artifact image. This allows you to
      control which files are included in the final customized image.
@y
      You can add multiple OCI artifact images to a single customization. When
      you add more than one, they're applied in the order you add them in the
      **OCI artifacts** drop-down. If multiple images contain directories or
      files with the same path, images added later overwrite files from images
      added earlier. To manage this, you must select paths to include and
      optionally exclude from each OCI artifact image. This allows you to
      control which files are included in the final customized image.
@z

@x
      By default, no files are included from the OCI artifact image. You must
      explicitly include the paths you want. After including a path, you can
      then explicitly exclude files or directories underneath it.
@y
      By default, no files are included from the OCI artifact image. You must
      explicitly include the paths you want. After including a path, you can
      then explicitly exclude files or directories underneath it.
@z

@x
      > [!NOTE]
      >
      > When files necessary for runtime are overwritten by OCI artifacts, the
      > image build still succeeds, but you may have issues when running the
      > image.
@y
      > [!NOTE]
      >
      > When files necessary for runtime are overwritten by OCI artifacts, the
      > image build still succeeds, but you may have issues when running the
      > image.
@z

@x
      For more details, see [OCI artifacts](#oci-artifacts).
@y
      For more details, see [OCI artifacts](#oci-artifacts).
@z

@x
   1. In the **Scripts** section, you can add, edit, or remove scripts.
@y
   1. In the **Scripts** section, you can add, edit, or remove scripts.
@z

@x
      Scripts let you add files to the container image that you can access at runtime. They are not executed during
      the build process. This is useful for services that require pre-start initialization, such as setup scripts or
      file writes to directories like `/var/lock` or `/out`.
@y
      Scripts let you add files to the container image that you can access at runtime. They are not executed during
      the build process. This is useful for services that require pre-start initialization, such as setup scripts or
      file writes to directories like `/var/lock` or `/out`.
@z

@x
      You must specify the following:
@y
      You must specify the following:
@z

@x
      - The path where the script will be placed
      - The script content
      - The UID and GID ownership of the script
      - The octal file permissions of the script
@y
      - The path where the script will be placed
      - The script content
      - The UID and GID ownership of the script
      - The octal file permissions of the script
@z

@x
1. Select **Next: Configure** to configure the following image settings:
@y
1. Select **Next: Configure** to configure the following image settings:
@z

@x
   > [!NOTE]
   >
   > When customizing multiple images at once, many of these configuration
   > options are limited by default and may not be available.
@y
   > [!NOTE]
   >
   > When customizing multiple images at once, many of these configuration
   > options are limited by default and may not be available.
@z

@x
   1. Specify the [environment variables](/reference/dockerfile/#env) and their
      values that the image will contain.
   1. Add [labels](/reference/dockerfile/#label) to the image.
   1. Add [annotations](/build/metadata/annotations/) to the image.
   1. Specify the users to add to the image. When you add a user, a home
      directory is automatically created for that user with 0755 permissions.
   1. Specify the user groups to add to the image.
   1. Select which [user](/reference/dockerfile/#user) to run the images as.
   1. Add [`ENTRYPOINT`](/reference/dockerfile/#entrypoint) arguments to the
      image. These arguments are appended to the base image's entrypoint.
   1. Add [`CMD`](/reference/dockerfile/#cmd) arguments to the image. These
      arguments are appended to the base image's command.
   1. Override the default (`/`) [working
      directory](/reference/dockerfile/#workdir) for the image.
   1. Specify a suffix for the customization name that is appended to the
      customized image's tag. For example, if you specify `custom` when
      customizing the `dhi-python:3.13` image, the customized image will be
      tagged as `dhi-python:3.13_custom`.
   1. Select the compression format for the image layers. You can choose between
      **ZSTD** (default) or **GZIP** compression. **ZSTD** typically provides
      faster image pulls and better compression ratios, but may have
      compatibility issues with older software. If you need compatibility with
      older Docker versions, use **GZIP**.
   1. Select the platforms you want to build the image for. You must select at
      least one platform.
@y
   1. Specify the [environment variables](__SUBDIR__/reference/dockerfile/#env) and their
      values that the image will contain.
   1. Add [labels](__SUBDIR__/reference/dockerfile/#label) to the image.
   1. Add [annotations](__SUBDIR__/build/metadata/annotations/) to the image.
   1. Specify the users to add to the image. When you add a user, a home
      directory is automatically created for that user with 0755 permissions.
   1. Specify the user groups to add to the image.
   1. Select which [user](__SUBDIR__/reference/dockerfile/#user) to run the images as.
   1. Add [`ENTRYPOINT`](__SUBDIR__/reference/dockerfile/#entrypoint) arguments to the
      image. These arguments are appended to the base image's entrypoint.
   1. Add [`CMD`](__SUBDIR__/reference/dockerfile/#cmd) arguments to the image. These
      arguments are appended to the base image's command.
   1. Override the default (`/`) [working
      directory](__SUBDIR__/reference/dockerfile/#workdir) for the image.
   1. Specify a suffix for the customization name that is appended to the
      customized image's tag. For example, if you specify `custom` when
      customizing the `dhi-python:3.13` image, the customized image will be
      tagged as `dhi-python:3.13_custom`.
   1. Select the compression format for the image layers. You can choose between
      **ZSTD** (default) or **GZIP** compression. **ZSTD** typically provides
      faster image pulls and better compression ratios, but may have
      compatibility issues with older software. If you need compatibility with
      older Docker versions, use **GZIP**.
   1. Select the platforms you want to build the image for. You must select at
      least one platform.
@z

@x
1. Select **Next: Review customization**.
@y
1. Select **Next: Review customization**.
@z

@x
1. Select **Create Customization**.
@y
1. Select **Create Customization**.
@z

@x
   A summary of the customization appears. It may take some time for the image
   to build. Once built, it will appear in the **Tags** tab of the repository,
   and your team members can pull it like any other image.
@y
   A summary of the customization appears. It may take some time for the image
   to build. Once built, it will appear in the **Tags** tab of the repository,
   and your team members can pull it like any other image.
@z

@x
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
Authenticate with `docker login` using your Docker credentials or a [personal
access token (PAT)](../../security/access-tokens/personal-access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../security/access-tokens/organization-access-tokens.md). When using an OAT, the
available operations depend on the token's permission scope:
@y
Authenticate with `docker login` using your Docker credentials or a [personal
access token (PAT)](../../security/access-tokens/personal-access-tokens.md) with **Read & Write**
permissions, or an [organization access token
(OAT)](../../security/access-tokens/organization-access-tokens.md). When using an OAT, the
available operations depend on the token's permission scope:
@z

@x
- To list or get customizations, or to view build logs, the OAT must have read
  (pull) access to the destination repository. Results are scoped to
  repositories the OAT can access.
- To create, update, or delete a customization, the OAT must have push access to
  the destination repository. Bulk operations require push access to every
  referenced destination repository.
@y
- To list or get customizations, or to view build logs, the OAT must have read
  (pull) access to the destination repository. Results are scoped to
  repositories the OAT can access.
- To create, update, or delete a customization, the OAT must have push access to
  the destination repository. Bulk operations require push access to every
  referenced destination repository.
@z

@x
Use the [`docker dhi customization`](/reference/cli/docker/dhi/customization/) command:
@y
Use the [`docker dhi customization`](__SUBDIR__/reference/cli/docker/dhi/customization/) command:
@z

@x within code
# Prepare a single customization scaffold
@y
# Prepare a single customization scaffold
@z
@x
# Prepare a bulk customization scaffold (pipe JSON array via stdin)
@y
# Prepare a bulk customization scaffold (pipe JSON array via stdin)
@z
@x
# Create a customization
@y
# Create a customization
@z
@x
# List customizations
@y
# List customizations
@z
@x
# Filter customizations by name, repository, or source
@y
# Filter customizations by name, repository, or source
@z
@x
# Get a customization by ID
@y
# Get a customization by ID
@z
@x
# Update a customization
@y
# Update a customization
@z
@x
# Delete a customization by ID
@y
# Delete a customization by ID
@z
@x
# Delete without confirmation prompt
@y
# Delete without confirmation prompt
@z

@x
For a complete reference of all YAML fields, see
[Image customization YAML file](#image-customization-yaml-file).
@y
For a complete reference of all YAML fields, see
[Image customization YAML file](#image-customization-yaml-file).
@z

@x
{{< /tab >}}
{{< tab name="Terraform" >}}
@y
{{< /tab >}}
{{< tab name="Terraform" >}}
@z

@x
You can manage DHI customizations as infrastructure-as-code using the [DHI
Terraform provider](/dhi/tools/terraform/). If you haven't configured the
provider yet, see [DHI Terraform provider](/dhi/tools/terraform/) for setup
instructions.
@y
You can manage DHI customizations as infrastructure-as-code using the [DHI
Terraform provider](__SUBDIR__/dhi/tools/terraform/). If you haven't configured the
provider yet, see [DHI Terraform provider](__SUBDIR__/dhi/tools/terraform/) for setup
instructions.
@z

@x
Define a `dhi_customization` resource for each customization:
@y
Define a `dhi_customization` resource for each customization:
@z

% snip command...

@x
The `dhi_customization` resource also supports optional configuration blocks
for `accounts`, `files`, `labels`, `annotations`, `environment`, `entrypoint`,
`cmd`, `user`, `workdir`, and `stop_signal`.
@y
The `dhi_customization` resource also supports optional configuration blocks
for `accounts`, `files`, `labels`, `annotations`, `environment`, `entrypoint`,
`cmd`, `user`, `workdir`, and `stop_signal`.
@z

@x
Run `terraform apply` to create the customization.
@y
Run `terraform apply` to create the customization.
@z

@x
To edit a customization, update the resource configuration and run `terraform
apply`. To delete a customization, remove the resource and run `terraform apply`.
@y
To edit a customization, update the resource configuration and run `terraform
apply`. To delete a customization, remove the resource and run `terraform apply`.
@z

@x
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/customization).
@y
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/customization).
@z

@x
> [!NOTE]
>
> Monitoring customization builds is not available through the Terraform
> provider. Use the Docker Hub web interface or the DHI CLI to monitor builds.
@y
> [!NOTE]
>
> Monitoring customization builds is not available through the Terraform
> provider. Use the Docker Hub web interface or the DHI CLI to monitor builds.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Image customization YAML file
@y
### Image customization YAML file
@z

@x
When using the CLI, customizations are defined in a YAML file. Use
`docker dhi customization prepare` to generate a scaffold with all available
fields and commented-out examples. Edit the file to describe what you want,
then pass it to `docker dhi customization create`.
@y
When using the CLI, customizations are defined in a YAML file. Use
`docker dhi customization prepare` to generate a scaffold with all available
fields and commented-out examples. Edit the file to describe what you want,
then pass it to `docker dhi customization create`.
@z

@x
The file has two parts: a preamble that identifies the customization and
its targets, and a configuration section that specifies what to change.
@y
The file has two parts: a preamble that identifies the customization and
its targets, and a configuration section that specifies what to change.
@z

@x
#### About the `id` field
@y
#### About the `id` field
@z

@x
The `id` field is assigned automatically by Docker Hub when you run
`docker dhi customization create`. When creating a new customization, omit
`id` entirely. It is read-only.
@y
The `id` field is assigned automatically by Docker Hub when you run
`docker dhi customization create`. When creating a new customization, omit
`id` entirely. It is read-only.
@z

@x
To find the ID of an existing customization, run:
@y
To find the ID of an existing customization, run:
@z

% snip command...

@x
The `id` appears in the output and in files retrieved with
`docker dhi customization get <id> --org my-org`. It lets
`docker dhi customization edit` identify which customization to update.
Scaffolds from `docker dhi customization prepare` do not include `id`, and
that is expected.
@y
The `id` appears in the output and in files retrieved with
`docker dhi customization get <id> --org my-org`. It lets
`docker dhi customization edit` identify which customization to update.
Scaffolds from `docker dhi customization prepare` do not include `id`, and
that is expected.
@z

@x
#### Set targets
@y
#### Set targets
@z

@x
The `name` and `targets` fields are required in every customization file. The
`targets` array specifies which image versions the customization applies to.
Use a single entry for a single-image customization, or multiple entries for a
bulk customization that applies the same configuration to several images at
once.
@y
The `name` and `targets` fields are required in every customization file. The
`targets` array specifies which image versions the customization applies to.
Use a single entry for a single-image customization, or multiple entries for a
bulk customization that applies the same configuration to several images at
once.
@z

% snip code...

@x
| Field | Description |
|:---|:---|
| `name` | Human-readable name. Converted to lowercase and hyphenated, it becomes the image tag suffix. For example, `golang with git` produces tags ending in `_golang-with-git`. |
| `targets[].destination` | Destination repository in Docker Hub, such as `my-org/dhi-golang`. |
| `targets[].tag_definition_id` | Tag definition to customize, such as `golang/alpine-3.23/1.25`. Use `docker dhi customization prepare` with tab completion to find valid values. |
@y
| Field | Description |
|:---|:---|
| `name` | Human-readable name. Converted to lowercase and hyphenated, it becomes the image tag suffix. For example, `golang with git` produces tags ending in `_golang-with-git`. |
| `targets[].destination` | Destination repository in Docker Hub, such as `my-org/dhi-golang`. |
| `targets[].tag_definition_id` | Tag definition to customize, such as `golang/alpine-3.23/1.25`. Use `docker dhi customization prepare` with tab completion to find valid values. |
@z

@x
> [!NOTE]
>
> When `targets` has more than one entry, the fields `accounts`, `entrypoint`,
> and `cmd` are not supported. Including them causes `docker dhi customization
> create` to return an error.
@y
> [!NOTE]
>
> When `targets` has more than one entry, the fields `accounts`, `entrypoint`,
> and `cmd` are not supported. Including them causes `docker dhi customization
> create` to return an error.
@z

@x
#### Add packages
@y
#### Add packages
@z

@x
To install additional OS packages in your customized image, list them under
`contents.packages`. Available packages depend on the base image variant.
@y
To install additional OS packages in your customized image, list them under
`contents.packages`. Available packages depend on the base image variant.
@z

% snip code...

@x
#### Add OCI artifacts
@y
#### Add OCI artifacts
@z

@x
To layer additional files into your customized image, such as custom
certificates, internal tools, or configuration files, list OCI artifact
images under `contents.artifacts`.
@y
To layer additional files into your customized image, such as custom
certificates, internal tools, or configuration files, list OCI artifact
images under `contents.artifacts`.
@z

% snip code...

@x
| Field | Description |
|:---|:---|
| `name` | Image reference of the OCI artifact. Must be in the same Docker Hub namespace as the mirrored DHI. |
| `includes` | Paths to copy from the artifact. No files are included by default. You must list at least one path. |
| `excludes` | Paths to exclude after applying `includes`. |
@y
| Field | Description |
|:---|:---|
| `name` | Image reference of the OCI artifact. Must be in the same Docker Hub namespace as the mirrored DHI. |
| `includes` | Paths to copy from the artifact. No files are included by default. You must list at least one path. |
| `excludes` | Paths to exclude after applying `includes`. |
@z

@x
To learn more about OCI artifacts, including how to create them, best
practices, and how environment variables behave, see
[OCI artifacts](#oci-artifacts).
@y
To learn more about OCI artifacts, including how to create them, best
practices, and how environment variables behave, see
[OCI artifacts](#oci-artifacts).
@z

@x
#### Inject files into the image
@y
#### Inject files into the image
@z

@x
To add static files at build time, such as configuration files or startup
scripts, use the `paths` field. Files are added as static content and are not
executed during the build.
@y
To add static files at build time, such as configuration files or startup
scripts, use the `paths` field. Files are added as static content and are not
executed during the build.
@z

% snip code...

@x
| Field | Description |
|:---|:---|
| `path` | Absolute path where the file will be placed in the image. |
| `contents` | File content. Use a YAML block scalar (`\|`) for multi-line content. |
| `mode` | Octal file permissions, such as `"0644"`. Quote the value to prevent YAML from treating the leading zero as octal notation. |
| `uid` | User ID of the file owner. |
| `gid` | Group ID of the file owner. |
@y
| Field | Description |
|:---|:---|
| `path` | Absolute path where the file will be placed in the image. |
| `contents` | File content. Use a YAML block scalar (`\|`) for multi-line content. |
| `mode` | Octal file permissions, such as `"0644"`. Quote the value to prevent YAML from treating the leading zero as octal notation. |
| `uid` | User ID of the file owner. |
| `gid` | Group ID of the file owner. |
@z

@x
#### Configure user accounts
@y
#### Configure user accounts
@z

@x
To add users or groups to the image, or to change which user the container
runs as, use the `accounts` field.
@y
To add users or groups to the image, or to change which user the container
runs as, use the `accounts` field.
@z

@x
> [!NOTE]
>
> Not supported for bulk customizations (multiple `targets`).
@y
> [!NOTE]
>
> Not supported for bulk customizations (multiple `targets`).
@z

% snip code...

@x
| Field | Description |
|:---|:---|
| `root` | Whether to enable the root user. Default is `false`. Required if `runs-as` is set to `root`. |
| `runs-as` | The default user the container runs as. |
| `users[].name` | Username. |
| `users[].uid` | User ID. |
| `users[].gid` | Primary group ID. Optional. |
| `groups[].name` | Group name. |
| `groups[].gid` | Group ID. |
| `groups[].members` | Usernames to add to this group. Optional. |
@y
| Field | Description |
|:---|:---|
| `root` | Whether to enable the root user. Default is `false`. Required if `runs-as` is set to `root`. |
| `runs-as` | The default user the container runs as. |
| `users[].name` | Username. |
| `users[].uid` | User ID. |
| `users[].gid` | Primary group ID. Optional. |
| `groups[].name` | Group name. |
| `groups[].gid` | Group ID. |
| `groups[].members` | Usernames to add to this group. Optional. |
@z

@x
#### Set environment variables
@y
#### Set environment variables
@z

@x
To add or override environment variables in the image, use the `environment`
field. These are merged with the base image's existing environment and do not
replace it.
@y
To add or override environment variables in the image, use the `environment`
field. These are merged with the base image's existing environment and do not
replace it.
@z

% snip code...

@x
Quote values that a YAML parser would interpret as non-string types, for
example `"false"`, `"0"`, and `"null"`.
@y
Quote values that a YAML parser would interpret as non-string types, for
example `"false"`, `"0"`, and `"null"`.
@z

@x
#### Set labels and annotations
@y
#### Set labels and annotations
@z

@x
To add OCI metadata to the image, use `labels` and `annotations`. Labels are
stored in the image config; annotations are stored in the image manifest. Use
[OCI standard keys](https://specs.opencontainers.org/image-spec/annotations/)
where applicable.
@y
To add OCI metadata to the image, use `labels` and `annotations`. Labels are
stored in the image config; annotations are stored in the image manifest. Use
[OCI standard keys](https://specs.opencontainers.org/image-spec/annotations/)
where applicable.
@z

% snip code...

@x
#### Override entrypoint and command
@y
#### Override entrypoint and command
@z

@x
To change how the container starts, use `entrypoint` and `cmd`. These arguments
are appended to the base image's existing entrypoint and command.
@y
To change how the container starts, use `entrypoint` and `cmd`. These arguments
are appended to the base image's existing entrypoint and command.
@z

@x
> [!NOTE]
>
> Not supported for bulk customizations (multiple `targets`).
@y
> [!NOTE]
>
> Not supported for bulk customizations (multiple `targets`).
@z

% snip code...

@x
#### Set platforms and compression
@y
#### Set platforms and compression
@z

@x
To build for multiple architectures, list them under `platforms`. At least one
platform is required.
@y
To build for multiple architectures, list them under `platforms`. At least one
platform is required.
@z

% snip code...

@x
To control layer compression, set `compression`. `ZSTD` (the default) offers
better compression and faster pulls. Use `GZIP` for compatibility with older
tooling.
@y
To control layer compression, set `compression`. `ZSTD` (the default) offers
better compression and faster pulls. Use `GZIP` for compatibility with older
tooling.
@z

% snip code...

@x
## OCI artifacts
@y
## OCI artifacts
@z

@x
In DHI customization, OCI artifacts are Docker images containing files you
want to layer into your image, such as custom certificates, internal tools, or
configuration files.
@y
In DHI customization, OCI artifacts are Docker images containing files you
want to layer into your image, such as custom certificates, internal tools, or
configuration files.
@z

@x
### Create an OCI artifact image
@y
### Create an OCI artifact image
@z

@x
Keep artifact images as minimal as possible and include only the necessary
files.
@y
Keep artifact images as minimal as possible and include only the necessary
files.
@z

@x
For example, to distribute a custom root CA certificate as part of a trusted CA
bundle, you can use a multi-stage build. This approach registers your
certificate with the system and outputs an updated CA bundle, which can be
extracted into a minimal final image:
@y
For example, to distribute a custom root CA certificate as part of a trusted CA
bundle, you can use a multi-stage build. This approach registers your
certificate with the system and outputs an updated CA bundle, which can be
extracted into a minimal final image:
@z

% snip code...

@x
You can follow this pattern to create other OCI artifacts, such as images
containing tools or libraries that you want to include in your customized DHI.
Install the necessary tools or libraries in the first stage, and then copy the
relevant files to the final stage that uses `FROM scratch`. This ensures that
your OCI artifact is minimal and contains only the necessary files.
@y
You can follow this pattern to create other OCI artifacts, such as images
containing tools or libraries that you want to include in your customized DHI.
Install the necessary tools or libraries in the first stage, and then copy the
relevant files to the final stage that uses `FROM scratch`. This ensures that
your OCI artifact is minimal and contains only the necessary files.
@z

@x
In order for the OCI artifact to be available in a DHI customization, it must be built and
pushed to a repository in the same namespace as the mirrored DHI repository.
@y
In order for the OCI artifact to be available in a DHI customization, it must be built and
pushed to a repository in the same namespace as the mirrored DHI repository.
@z

@x
If you're customizing a DHI for multiple platforms (such as `linux/amd64` and
`linux/arm64`), build your OCI artifact for all the platforms using the
`--platform` flag:
@y
If you're customizing a DHI for multiple platforms (such as `linux/amd64` and
`linux/arm64`), build your OCI artifact for all the platforms using the
`--platform` flag:
@z

% snip command...

@x
This creates a single image manifest that you can use for each platform. The
customization build system automatically selects the correct platform variant
when building each customized image.
@y
This creates a single image manifest that you can use for each platform. The
customization build system automatically selects the correct platform variant
when building each customized image.
@z

@x
> [!IMPORTANT]
>
> The customization UI will only allow you to select platforms that are
> available in all OCI artifacts you've added. If a platform is missing from
> any OCI artifact, you won't be able to select that platform for your
> customization.
@y
> [!IMPORTANT]
>
> The customization UI will only allow you to select platforms that are
> available in all OCI artifacts you've added. If a platform is missing from
> any OCI artifact, you won't be able to select that platform for your
> customization.
@z

@x
Once pushed to a repository in your organization's namespace, the OCI artifact
automatically appears in the customization workflow when you select OCI
artifacts to add to your customized Docker Hardened Image.
@y
Once pushed to a repository in your organization's namespace, the OCI artifact
automatically appears in the customization workflow when you select OCI
artifacts to add to your customized Docker Hardened Image.
@z

@x
### Environment variables
@y
### Environment variables
@z

@x
When you include OCI artifacts in a customization, the environment variables
defined in those artifacts are merged into the final image. The merge follows
these rules:
@y
When you include OCI artifacts in a customization, the environment variables
defined in those artifacts are merged into the final image. The merge follows
these rules:
@z

@x
- Your customization's environment settings take precedence. An artifact's
  variable is only applied if the corresponding key is absent or empty in your
  customization.
- `PATH` is an exception. Artifact `PATH` entries are added to the front of
  the existing `PATH`, giving them runtime precedence.
@y
- Your customization's environment settings take precedence. An artifact's
  variable is only applied if the corresponding key is absent or empty in your
  customization.
- `PATH` is an exception. Artifact `PATH` entries are added to the front of
  the existing `PATH`, giving them runtime precedence.
@z

@x
This differs from `COPY --from` in a Dockerfile, which copies files without
inheriting environment variables from the source image. To avoid inheriting
environment variables, build the artifact using a `FROM scratch` final stage.
See [Create an OCI artifact image](#create-an-oci-artifact-image).
@y
This differs from `COPY --from` in a Dockerfile, which copies files without
inheriting environment variables from the source image. To avoid inheriting
environment variables, build the artifact using a `FROM scratch` final stage.
See [Create an OCI artifact image](#create-an-oci-artifact-image).
@z

@x
### Best practices
@y
### Best practices
@z

@x
Follow these best practices when creating OCI artifacts for DHI customizations:
@y
Follow these best practices when creating OCI artifacts for DHI customizations:
@z

@x
- Use multi-stage builds: Build or install dependencies in a builder stage,
  then copy only the necessary files to a `FROM scratch` final stage. This keeps
  the OCI artifact minimal and avoids inheriting environment variables from the
  builder image into your customization.
@y
- Use multi-stage builds: Build or install dependencies in a builder stage,
  then copy only the necessary files to a `FROM scratch` final stage. This keeps
  the OCI artifact minimal and avoids inheriting environment variables from the
  builder image into your customization.
@z

@x
- Include only essential files: OCI artifacts should contain only the files
  you need to add to the customized image. Avoid including package managers,
  shells, or other utilities that won't be used in the final image.
@y
- Include only essential files: OCI artifacts should contain only the files
  you need to add to the customized image. Avoid including package managers,
  shells, or other utilities that won't be used in the final image.
@z

@x
- Match target platforms: Build your OCI artifact for all platforms you plan
  to use in your customizations. Use `docker buildx build --platform` to create
  multi-platform images when needed.
@y
- Match target platforms: Build your OCI artifact for all platforms you plan
  to use in your customizations. Use `docker buildx build --platform` to create
  multi-platform images when needed.
@z

@x
- Use specific tags: Tag your OCI artifacts with specific versions or dates
  (like `v1.0` or `20250101`) rather than relying solely on `latest`. This
  ensures reproducible builds and makes it easier to track which artifacts are
  used in which customizations.
@y
- Use specific tags: Tag your OCI artifacts with specific versions or dates
  (like `v1.0` or `20250101`) rather than relying solely on `latest`. This
  ensures reproducible builds and makes it easier to track which artifacts are
  used in which customizations.
@z

@x
- Enable immutable tags: Consider enabling [immutable
  tags](../../docker-hub/repos/manage/hub-images/immutable-tags.md) for your
  OCI artifact repositories. This prevents accidental overwrites and ensures that
  each version of your OCI artifact remains unchanged, improving reproducibility
  and reliability of your customizations.
@y
- Enable immutable tags: Consider enabling [immutable
  tags](../../docker-hub/repos/manage/hub-images/immutable-tags.md) for your
  OCI artifact repositories. This prevents accidental overwrites and ensures that
  each version of your OCI artifact remains unchanged, improving reproducibility
  and reliability of your customizations.
@z

@x
## Customize a DHI Helm chart
@y
## Customize a DHI Helm chart
@z

@x
You can customize DHI Helm charts to meet your organization's specific needs.
Via the Docker Hub web interface, you can modify the image references to
reference mirrored images or customized images you've created. This lets you
create a custom, securely-built chart with references to images stored in Docker
Hub or other private registries. DHI securely packages customized Helm charts
that reference your repositories, wherever they are stored, by default.
@y
You can customize DHI Helm charts to meet your organization's specific needs.
Via the Docker Hub web interface, you can modify the image references to
reference mirrored images or customized images you've created. This lets you
create a custom, securely-built chart with references to images stored in Docker
Hub or other private registries. DHI securely packages customized Helm charts
that reference your repositories, wherever they are stored, by default.
@z

@x
To customize image references, an organization owner must [mirror](./mirror.md)
the DHI chart repository to your organization on Docker Hub.
@y
To customize image references, an organization owner must [mirror](./mirror.md)
the DHI chart repository to your organization on Docker Hub.
@z

@x
You can create one chart customization per Helm chart repository. This is
different from image customizations, where you can create multiple
customizations per repository. If you need to make changes, you can edit your
existing customization. Alternatively, you can mirror the same Helm chart
repository again and add a new customization to the new mirror.
@y
You can create one chart customization per Helm chart repository. This is
different from image customizations, where you can create multiple
customizations per repository. If you need to make changes, you can edit your
existing customization. Alternatively, you can mirror the same Helm chart
repository again and add a new customization to the new mirror.
@z

@x
> [!NOTE]
>
> You can customize Docker Hardened Image charts like any other Helm chart using
> standard Helm tools and practices, such as a `values.yaml` file, outside of
> Docker Hub. The following instructions describe how to customize image
> references for the chart using the Docker Hub web interface.
@y
> [!NOTE]
>
> You can customize Docker Hardened Image charts like any other Helm chart using
> standard Helm tools and practices, such as a `values.yaml` file, outside of
> Docker Hub. The following instructions describe how to customize image
> references for the chart using the Docker Hub web interface.
@z

@x
To customize a Docker Hardened Image Helm chart after it has been mirrored:
@y
To customize a Docker Hardened Image Helm chart after it has been mirrored:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub**.
1. In the namespace drop-down, select your organization that has a mirrored DHI
   repository.
1. Select **Hardened Images** > **Manage** > **Mirrored Helm charts**.
1. For the mirrored DHI repository you want to customize, select the **Name**.
1. Select the **Customizations** tab.
1. Select **Create customization**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub**.
1. In the namespace drop-down, select your organization that has a mirrored DHI
   repository.
1. Select **Hardened Images** > **Manage** > **Mirrored Helm charts**.
1. For the mirrored DHI repository you want to customize, select the **Name**.
1. Select the **Customizations** tab.
1. Select **Create customization**.
@z

@x
   At this point, the on-screen instructions will guide you through the
   customization process.
@y
   At this point, the on-screen instructions will guide you through the
   customization process.
@z

@x
### Helm chart customization YAML file
@y
### Helm chart customization YAML file
@z

@x
When using the CLI, Helm chart customizations use the same `prepare` / `create`
workflow as image customizations, but the configuration section uses
`reference_mappings` instead of image fields.
@y
When using the CLI, Helm chart customizations use the same `prepare` / `create`
workflow as image customizations, but the configuration section uses
`reference_mappings` instead of image fields.
@z

@x
Use `reference_mappings` to substitute image references within the chart, for
example to point a chart's image references at your mirrored DHIs.
@y
Use `reference_mappings` to substitute image references within the chart, for
example to point a chart's image references at your mirrored DHIs.
@z

% snip code...

@x
| Field | Description |
|:---|:---|
| `reference_mappings[].from` | The image reference in the chart to replace. |
| `reference_mappings[].to` | The replacement image reference, typically a mirrored DHI in your organization. |
@y
| Field | Description |
|:---|:---|
| `reference_mappings[].from` | The image reference in the chart to replace. |
| `reference_mappings[].to` | The replacement image reference, typically a mirrored DHI in your organization. |
@z

@x
## Monitor customization builds
@y
## Monitor customization builds
@z

@x
After creating a customization, you can track build status and view logs
through Docker Hub or the DHI CLI.
@y
After creating a customization, you can track build status and view logs
through Docker Hub or the DHI CLI.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Manage**.
5. Select the **Customizations** tab.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization.
4. Select **Hardened Images** > **Manage**.
5. Select the **Customizations** tab.
@z

@x
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
List builds for a customization:
@y
List builds for a customization:
@z

% snip command...

@x
Get details of a specific build:
@y
Get details of a specific build:
@z

% snip command...

@x
View build logs:
@y
View build logs:
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Edit or delete a customization
@y
## Edit or delete a customization
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has a mirrored repository.
4. Select **Hardened Images** > **Manage**.
5. Select **Customizations**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has a mirrored repository.
4. Select **Hardened Images** > **Manage**.
5. Select **Customizations**.
@z

@x
6. For the customized DHI repository you want to manage, select the menu icon in the far right column.
   From here, you can:
@y
6. For the customized DHI repository you want to manage, select the menu icon in the far right column.
   From here, you can:
@z

@x
   - **Edit**: Edit the customization.
   - **Create new**: Create a new customization based on the source repository.
   - **Delete**: Delete the customization.
@y
   - **Edit**: Edit the customization.
   - **Create new**: Create a new customization based on the source repository.
   - **Delete**: Delete the customization.
@z

@x
7. Follow the on-screen instructions to complete the edit or deletion.
@y
7. Follow the on-screen instructions to complete the edit or deletion.
@z

@x
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
To edit a customization, update your YAML file and run:
@y
To edit a customization, update your YAML file and run:
@z

% snip command...

@x
The YAML file must include the `id` field to identify which customization to
update. To find the ID, run `docker dhi customization list --org my-org`.
@y
The YAML file must include the `id` field to identify which customization to
update. To find the ID, run `docker dhi customization list --org my-org`.
@z

@x
To delete a customization by ID:
@y
To delete a customization by ID:
@z

% snip command...

@x
The `--force` flag skips the confirmation prompt.
@y
The `--force` flag skips the confirmation prompt.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
