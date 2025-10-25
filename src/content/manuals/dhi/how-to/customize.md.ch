%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Customize a Docker Hardened Image
linkTitle: Customize an image
@y
title: Customize a Docker Hardened Image
linkTitle: Customize an image
@z

@x
keywords: debug, hardened images, DHI, customize, certificate, artifact
description: Learn how to customize a Docker Hardened Images (DHI).
@y
keywords: debug, hardened images, DHI, customize, certificate, artifact
description: Learn how to customize a Docker Hardened Images (DHI).
@z

@x
You can customize a Docker Hardened Image (DHI) to suit your specific needs
using the Docker Hub UI. This allows you to select a base image, add packages,
add artifacts, and configure settings. In addition, the build pipeline ensures that
your customized image is built securely and includes attestations.
@y
You can customize a Docker Hardened Image (DHI) to suit your specific needs
using the Docker Hub UI. This allows you to select a base image, add packages,
add artifacts, and configure settings. In addition, the build pipeline ensures that
your customized image is built securely and includes attestations.
@z

@x
To add a customized Docker Hardened Image to your organization, an organization
owner must first [mirror](./mirror.md) the DHI repository to your organization.
Once the repository is mirrored, any user with access to the mirrored DHI
repository can create a customized image.
@y
To add a customized Docker Hardened Image to your organization, an organization
owner must first [mirror](./mirror.md) the DHI repository to your organization.
Once the repository is mirrored, any user with access to the mirrored DHI
repository can create a customized image.
@z

@x
## Customize a Docker Hardened Image
@y
## Customize a Docker Hardened Image
@z

@x
To customize a Docker Hardened Image, follow these steps:
@y
To customize a Docker Hardened Image, follow these steps:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has a mirrored DHI
   repository.
4. Select **Hardened Images** > **Management**.
5. For the mirrored DHI repository you want to customize, select the menu icon in the far right column.
6. Select **Customize**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has a mirrored DHI
   repository.
4. Select **Hardened Images** > **Management**.
5. For the mirrored DHI repository you want to customize, select the menu icon in the far right column.
6. Select **Customize**.
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
7. Select the image version you want to customize.
8. Optional. Add packages.
@y
7. Select the image version you want to customize.
8. Optional. Add packages.
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
   2. In the **OCI artifacts** drop-down, first, select the repository that
      contains the OCI artifact image. Then, select the tag you want to use from
      that repository. Finally, specify the specific paths you want to include
      from the OCI artifact image.
@y
   2. In the **OCI artifacts** drop-down, first, select the repository that
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
      [Create an OCI artifact image](#create-an-oci-artifact-image).
@y
      The OCI artifacts are images that you have previously
      built and pushed to a repository in the same namespace as the mirrored
      DHI. For example, you can add a custom root CA certificate or a another
      image that contains a tool you need, like adding Python to a Node.js
      image. For more details on how to create an OCI artifact image, see
      [Create an OCI artifact image](#create-an-oci-artifact-image).
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
   3. In the **Scripts** section, you can add, edit, or remove scripts.
@y
   3. In the **Scripts** section, you can add, edit, or remove scripts.
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
        - The path where the script will be placed
        - The script content
        - The UID and GID ownership of the script
        - The octal file permissions of the script
@y
      You must specify the following:
        - The path where the script will be placed
        - The script content
        - The UID and GID ownership of the script
        - The octal file permissions of the script
@z

@x
10. Select **Next: Configure** and then configure the following options.
@y
10. Select **Next: Configure** and then configure the following options.
@z

@x
   1. Specify a suffix that is appended to the customized image's tag. For
      example, if you specify `custom` when customizing the `dhi-python:3.13`
      image, the customized image will be tagged as `dhi-python:3.13_custom`.
   2. Select the platforms you want to build the image for.
   3. Add [`ENTRYPOINT`](/reference/dockerfile/#entrypoint) and
      [`CMD`](/reference/dockerfile/#cmd) arguments to the image. These
      arguments are appended to the base image's entrypoint and command.
   4. Specify the users to add to the image.
   5. Specify the user groups to add to the image.
   6. Select which [user](/reference/dockerfile/#user) to run the images as.
   7. Specify the [environment variables](/reference/dockerfile/#env) and their
      values that the image will contain.
   8. Add [annotations](/build/metadata/annotations/) to the image.
   9. Add [labels](/reference/dockerfile/#label) to the image.
11. Select **Create Customization**.
@y
   1. Specify a suffix that is appended to the customized image's tag. For
      example, if you specify `custom` when customizing the `dhi-python:3.13`
      image, the customized image will be tagged as `dhi-python:3.13_custom`.
   2. Select the platforms you want to build the image for.
   3. Add [`ENTRYPOINT`](__SUBDIR__/reference/dockerfile/#entrypoint) and
      [`CMD`](__SUBDIR__/reference/dockerfile/#cmd) arguments to the image. These
      arguments are appended to the base image's entrypoint and command.
   4. Specify the users to add to the image.
   5. Specify the user groups to add to the image.
   6. Select which [user](__SUBDIR__/reference/dockerfile/#user) to run the images as.
   7. Specify the [environment variables](__SUBDIR__/reference/dockerfile/#env) and their
      values that the image will contain.
   8. Add [annotations](__SUBDIR__/build/metadata/annotations/) to the image.
   9. Add [labels](__SUBDIR__/reference/dockerfile/#label) to the image.
11. Select **Create Customization**.
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
## Edit or delete a Docker Hardened Image customization
@y
## Edit or delete a Docker Hardened Image customization
@z

@x
To edit or delete a Docker Hardened Image customization, follow these steps:
@y
To edit or delete a Docker Hardened Image customization, follow these steps:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has a mirrored DHI.
4. Select **Hardened Images** > **Management**.
5. Select **Customizations**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub**.
3. In the namespace drop-down, select your organization that has a mirrored DHI.
4. Select **Hardened Images** > **Management**.
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
   - **Edit**: Edit the customized image.
   - **Create new**: Create a new customized image based on the source repository.
   - **Delete**: Delete the customized image.
@y
   - **Edit**: Edit the customized image.
   - **Create new**: Create a new customized image based on the source repository.
   - **Delete**: Delete the customized image.
@z

@x
7. Follow the on-screen instructions to complete the edit or deletion.
@y
7. Follow the on-screen instructions to complete the edit or deletion.
@z

@x
## Create an OCI artifact image
@y
## Create an OCI artifact image
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
Build and push the OCI artifact image to a repository in your organization's
namespace and it automatically appears in the customization workflow when you
select the OCI artifacts to add to your customized Docker Hardened Image.
@y
Build and push the OCI artifact image to a repository in your organization's
namespace and it automatically appears in the customization workflow when you
select the OCI artifacts to add to your customized Docker Hardened Image.
@z
