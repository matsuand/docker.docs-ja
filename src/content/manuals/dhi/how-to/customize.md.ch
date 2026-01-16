%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: 'Customize a Docker Hardened Image or chart <span class="not-prose bg-blue-500 dark:bg-blue-400 rounded-sm px-1 text-xs text-white whitespace-nowrap">DHI Enterprise</span>'
linkTitle: Customize an image or chart
@y
title: 'Customize a Docker Hardened Image or chart <span class="not-prose bg-blue-500 dark:bg-blue-400 rounded-sm px-1 text-xs text-white whitespace-nowrap">DHI Enterprise</span>'
linkTitle: Customize an image or chart
@z

@x
keywords: hardened images, DHI, customize, certificate, artifact, helm chart
description: Learn how to customize Docker Hardened Images (DHI) and charts.
@y
keywords: hardened images, DHI, customize, certificate, artifact, helm chart
description: Learn how to customize Docker Hardened Images (DHI) and charts.
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
When you have a Docker Hardened Images subscription, you can customize Docker
Hardened Images (DHI) and charts to suit your specific needs using the Docker
Hub web interface. For images, this lets you select a base image, add packages,
add OCI artifacts (such as custom certificates or additional tools), and
configure settings. For charts, this lets you customize the image references.
@y
When you have a Docker Hardened Images subscription, you can customize Docker
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
### Create an image customization
@y
### Create an image customization
@z

@x
To customize a Docker Hardened Image, follow these steps:
@y
To customize a Docker Hardened Image, follow these steps:
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
1. Select the image version you want to customize.
1. Optional. Add packages.
@y
1. Select the image version you want to customize.
1. Optional. Add packages.
@z

@x
   1. In the **Packages** drop-down, select the packages you want to add to the
      image.
@y
   1. In the **Packages** drop-down, select the packages you want to add to the
      image.
@z

@x
      The packages available in the drop-down are OS system packages for the
      selected image variant. For example, if you are customizing the Alpine
      variant of the Python DHI, the list will include all Alpine system
      packages.
@y
      The packages available in the drop-down are OS system packages for the
      selected image variant. For example, if you are customizing the Alpine
      variant of the Python DHI, the list will include all Alpine system
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
      DHI. For example, you can add a custom root CA certificate or a another
      image that contains a tool you need, like adding Python to a Node.js
      image. For more details on how to create an OCI artifact image, see
      [Create an OCI artifact image](#create-an-oci-artifact-image-for-image-customization).
@y
      The OCI artifacts are images that you have previously
      built and pushed to a repository in the same namespace as the mirrored
      DHI. For example, you can add a custom root CA certificate or a another
      image that contains a tool you need, like adding Python to a Node.js
      image. For more details on how to create an OCI artifact image, see
      [Create an OCI artifact image](#create-an-oci-artifact-image-for-image-customization).
@z

@x
      When combining images that contain directories and files with the same
      path, images later in the list will overwrite files from earlier images.
      To manage this, you must select paths to include and optionally exclude
      from each OCI artifact image. This allows you to control which files are
      included in the final customized image.
@y
      When combining images that contain directories and files with the same
      path, images later in the list will overwrite files from earlier images.
      To manage this, you must select paths to include and optionally exclude
      from each OCI artifact image. This allows you to control which files are
      included in the final customized image.
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
   1. Specify the [environment variables](/reference/dockerfile/#env) and their
      values that the image will contain.
   1. Add [labels](/reference/dockerfile/#label) to the image.
   1. Add [annotations](/build/metadata/annotations/) to the image.
   1. Specify the users to add to the image.
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
   1. Select the platforms you want to build the image for. You must select at
      least one platform.
@y
   1. Specify the [environment variables](__SUBDIR__/reference/dockerfile/#env) and their
      values that the image will contain.
   1. Add [labels](__SUBDIR__/reference/dockerfile/#label) to the image.
   1. Add [annotations](__SUBDIR__/build/metadata/annotations/) to the image.
   1. Specify the users to add to the image.
   1. Specify the user groups to add to the image.
   1. Select which [user](__SUBDIR__/reference/dockerfile/#user) to run the images as.
   1. Add [`ENTRYPOINT`](__SUBDIR__/reference/dockerfile/#entrypoint) arguments to the
      image. These arguments are appended to the base image's entrypoint.
   1. Add [`CMD`](__SUBDIR__/reference/dockerfile/#cmd) arguments to the image. These
      arguments are appended to the base image's command.
   1. Override the default (`/`) [working
      directory](/reference/dockerfile/#workdir) for the image.
   1. Specify a suffix for the customization name that is appended to the
      customized image's tag. For example, if you specify `custom` when
      customizing the `dhi-python:3.13` image, the customized image will be
      tagged as `dhi-python:3.13_custom`.
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
### Create an OCI artifact image for image customization
@y
### Create an OCI artifact image for image customization
@z

@x
An OCI artifact image is a Docker image that contains files or directories that
you want to include in your customized Docker Hardened Image (DHI). This can
include additional tools, libraries, or configuration files.
@y
An OCI artifact image is a Docker image that contains files or directories that
you want to include in your customized Docker Hardened Image (DHI). This can
include additional tools, libraries, or configuration files.
@z

@x
When creating an image to use as an OCI artifact, it should ideally be as
minimal as possible and contain only the necessary files.
@y
When creating an image to use as an OCI artifact, it should ideally be as
minimal as possible and contain only the necessary files.
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
#### Best practices for OCI artifacts
@y
#### Best practices for OCI artifacts
@z

@x
Follow these best practices when creating OCI artifacts for DHI customizations:
@y
Follow these best practices when creating OCI artifacts for DHI customizations:
@z

@x
- Use multi-stage builds: Build or install dependencies in a builder stage,
  then copy only the necessary files to a `FROM scratch` final stage. This keeps
  the OCI artifact minimal and free of unnecessary build tools.
@y
- Use multi-stage builds: Build or install dependencies in a builder stage,
  then copy only the necessary files to a `FROM scratch` final stage. This keeps
  the OCI artifact minimal and free of unnecessary build tools.
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
## Edit or delete a customization
@y
## Edit or delete a customization
@z

@x
To edit or delete a DHI or chart customization, follow these steps:
@y
To edit or delete a DHI or chart customization, follow these steps:
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
