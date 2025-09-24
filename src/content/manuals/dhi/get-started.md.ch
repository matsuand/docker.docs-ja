%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
linktitle: Quickstart
title: Docker Hardened Images quickstart
description: Follow a quickstart guide to explore, mirror, and run a Docker Hardened Image.
@y
linktitle: Quickstart
title: Docker Hardened Images quickstart
description: Follow a quickstart guide to explore, mirror, and run a Docker Hardened Image.
@z

@x
keywords: docker hardened images quickstart, mirror container image, run secure image
@y
keywords: docker hardened images quickstart, mirror container image, run secure image
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
This guide shows you how to go from zero to running a Docker Hardened Image
(DHI) using a real example. While the steps use a specific image as an
example, they can be applied to any DHI.
@y
This guide shows you how to go from zero to running a Docker Hardened Image
(DHI) using a real example. While the steps use a specific image as an
example, they can be applied to any DHI.
@z

@x
> [!TIP]
>
> You can keep using the same tools and workflows you already know when moving
> to DHI from other images on Docker Hub, such as Bitnami public catalog images.
> Note that [Bitnami announced](https://github.com/bitnami/charts/issues/35164)
> that its public catalog images will no longer be available after September 29,
> 2025.
>
> In most cases, migrating is as simple as updating the image reference in your
> configuration or commands. Start with this guide, then see the [migration
> guide](./how-to/migrate.md) for more details and examples.
@y
> [!TIP]
>
> You can keep using the same tools and workflows you already know when moving
> to DHI from other images on Docker Hub, such as Bitnami public catalog images.
> Note that [Bitnami announced](https://github.com/bitnami/charts/issues/35164)
> that its public catalog images will no longer be available after September 29,
> 2025.
>
> In most cases, migrating is as simple as updating the image reference in your
> configuration or commands. Start with this guide, then see the [migration
> guide](./how-to/migrate.md) for more details and examples.
@z

@x
## Step 1: Sign up and subscribe to DHI for access
@y
## Step 1: Sign up and subscribe to DHI for access
@z

@x
To access Docker Hardened Images, your organization must [sign
up](https://www.docker.com/products/hardened-images/#getstarted) and subscribe.
@y
To access Docker Hardened Images, your organization must [sign
up](https://www.docker.com/products/hardened-images/#getstarted) and subscribe.
@z

@x
## Step 2: Find an image to use
@y
## Step 2: Find an image to use
@z

@x
Once subscribed, Docker Hardened Images will appear under your organization's
namespace on Docker Hub.
@y
Once subscribed, Docker Hardened Images will appear under your organization's
namespace on Docker Hub.
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub** in the top navigation.
3. In the left sidebar, choose your organization that has DHI access.
4. In the left sidebar, select **Hardened Images** > **Catalog**.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
2. Select **My Hub** in the top navigation.
3. In the left sidebar, choose your organization that has DHI access.
4. In the left sidebar, select **Hardened Images** > **Catalog**.
@z

@x
   ![Docker Hub sidebar showing DHI catalog](./images/dhi-catalog.png)
@y
   ![Docker Hub sidebar showing DHI catalog](./images/dhi-catalog.png)
@z

@x
5. Use the search bar or filters to find an image (e.g., `python`, `node`,
   `golang`). For this guide, use the Python image as an example.
@y
5. Use the search bar or filters to find an image (e.g., `python`, `node`,
   `golang`). For this guide, use the Python image as an example.
@z

@x
    ![DHI catalog with Python repository shown](./images/dhi-python-search.png)
@y
    ![DHI catalog with Python repository shown](./images/dhi-python-search.png)
@z

@x
6. Select the Python repository to view its details.
@y
6. Select the Python repository to view its details.
@z

@x
Continue to the next step to mirror the image. To dive deeper into exploring
images see [Explore Docker Hardened Images](./how-to/explore.md).
@y
Continue to the next step to mirror the image. To dive deeper into exploring
images see [Explore Docker Hardened Images](./how-to/explore.md).
@z

@x
## Step 3: Mirror the image
@y
## Step 3: Mirror the image
@z

@x
To use a Docker Hardened Image, you must mirror it to your organization. Only
organization owners can perform this action. Mirroring creates a copy of the
image in your organization's namespace, allowing team members to pull and use
it.
@y
To use a Docker Hardened Image, you must mirror it to your organization. Only
organization owners can perform this action. Mirroring creates a copy of the
image in your organization's namespace, allowing team members to pull and use
it.
@z

@x
1. In the image repository page, select **Mirror to repository**.
@y
1. In the image repository page, select **Mirror to repository**.
@z

@x
   ![An image of the Python page with the Mirror to repository button showing](./images/dhi-mirror-button.png)
@y
   ![An image of the Python page with the Mirror to repository button showing](./images/dhi-mirror-button.png)
@z

@x
   > [!NOTE]
   >
   > If you don't see the **Mirror to repository** button, the repository may
   > already be mirrored to your organization. In this case, you can select
   > **View in repository** to see the mirrored image's location or mirror it to
   > another repository.
@y
   > [!NOTE]
   >
   > If you don't see the **Mirror to repository** button, the repository may
   > already be mirrored to your organization. In this case, you can select
   > **View in repository** to see the mirrored image's location or mirror it to
   > another repository.
@z

@x
2. Follow the on-screen instructions to choose a name. For this guide, the
   example uses the name `dhi-python`. Note that the name must start with
   `dhi-`.
@y
2. Follow the on-screen instructions to choose a name. For this guide, the
   example uses the name `dhi-python`. Note that the name must start with
   `dhi-`.
@z

@x
   ![Mirror a repository page](./images/dhi-mirror-screen.png)
@y
   ![Mirror a repository page](./images/dhi-mirror-screen.png)
@z

@x
3. Select **Create repository** to start the mirroring process.
@y
3. Select **Create repository** to start the mirroring process.
@z

@x
It may take a few minutes for all the tags to finish mirroring. Once
mirrored, the image repository appears in your organization's namespace. For
example, in [Docker Hub](https://hub.docker.com), go to **My Hub** > ***YOUR_ORG*** > **Repositories**,
and you should see `dhi-python` listed. You can now pull it
like any other image.
@y
It may take a few minutes for all the tags to finish mirroring. Once
mirrored, the image repository appears in your organization's namespace. For
example, in [Docker Hub](https://hub.docker.com), go to **My Hub** > ***YOUR_ORG*** > **Repositories**,
and you should see `dhi-python` listed. You can now pull it
like any other image.
@z

@x
![Repository list with mirrored repository showing](./images/dhi-python-mirror.png)
@y
![Repository list with mirrored repository showing](./images/dhi-python-mirror.png)
@z

@x
Continue to the next step to pull and run the image. To dive deeper into
mirroring images see [Mirror a Docker Hardened Image
repository](./how-to/mirror.md).
@y
Continue to the next step to pull and run the image. To dive deeper into
mirroring images see [Mirror a Docker Hardened Image
repository](./how-to/mirror.md).
@z

@x
## Step 4: Pull and run the image
@y
## Step 4: Pull and run the image
@z

@x
Once you've mirrored the image to your organization, you can pull and run it
like any other Docker image. Note that Docker Hardened Images are designed to be
minimal and secure, so they may not include all the tools or libraries you
expect in a typical image. You can view the typical differences in
[Considerations when adopting
DHIs](./how-to/use.md#considerations-when-adopting-dhis).
@y
Once you've mirrored the image to your organization, you can pull and run it
like any other Docker image. Note that Docker Hardened Images are designed to be
minimal and secure, so they may not include all the tools or libraries you
expect in a typical image. You can view the typical differences in
[Considerations when adopting
DHIs](./how-to/use.md#considerations-when-adopting-dhis).
@z

@x
The following example demonstrates that you can run the Python image and execute
a simple Python command just like you would with any other Docker image:
@y
The following example demonstrates that you can run the Python image and execute
a simple Python command just like you would with any other Docker image:
@z

@x
1. Pull the mirrored image. Open a terminal and run the following command,
   replacing `<your-namespace>` with your organization's namespace:
@y
1. Pull the mirrored image. Open a terminal and run the following command,
   replacing `<your-namespace>` with your organization's namespace:
@z

@x
   ```console
   $ docker pull <your-namespace>/dhi-python:3.13
   ```
@y
   ```console
   $ docker pull <your-namespace>/dhi-python:3.13
   ```
@z

@x
2. Run the image to confirm everything works:
@y
2. Run the image to confirm everything works:
@z

@x
    ```console
    $ docker run --rm <your-namespace>/dhi-python:3.13 python -c "print('Hello from DHI')"
    ```
@y
    ```console
    $ docker run --rm <your-namespace>/dhi-python:3.13 python -c "print('Hello from DHI')"
    ```
@z

@x
    This starts a container from the `dhi-python:3.13` image and runs a simple
    Python script that prints `Hello from DHI`.
@y
    This starts a container from the `dhi-python:3.13` image and runs a simple
    Python script that prints `Hello from DHI`.
@z

@x
To dive deeper into using images see [Use a Docker Hardened Image](./how-to/use.md).
@y
To dive deeper into using images see [Use a Docker Hardened Image](./how-to/use.md).
@z

@x
## What's next
@y
## What's next
@z

@x
You've pulled and run your first Docker Hardened Image. Here are a few ways to keep going:
@y
You've pulled and run your first Docker Hardened Image. Here are a few ways to keep going:
@z

@x
- [Migrate existing applications to DHIs](./how-to/migrate.md): Learn how to
  update your Dockerfiles to use Docker Hardened Images as the base.
@y
- [Migrate existing applications to DHIs](./how-to/migrate.md): Learn how to
  update your Dockerfiles to use Docker Hardened Images as the base.
@z

@x
- [Verify DHIs](./how-to/verify.md): Use tools like [Docker Scout](/scout/) or
  Cosign to inspect and verify signed attestations, like SBOMs and provenance.
@y
- [Verify DHIs](./how-to/verify.md): Use tools like [Docker Scout](__SUBDIR__/scout/) or
  Cosign to inspect and verify signed attestations, like SBOMs and provenance.
@z

@x
- [Scan DHIs](./how-to/scan.md): Analyze the image with Docker
  Scout or other scanners to identify known CVEs.
@y
- [Scan DHIs](./how-to/scan.md): Analyze the image with Docker
  Scout or other scanners to identify known CVEs.
@z
