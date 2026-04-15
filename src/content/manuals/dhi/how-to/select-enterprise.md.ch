%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Get started with DHI Select and Enterprise
linkTitle: Use DHI Select & Enterprise
description: Mirror a repository and start using Docker Hardened Images for Select and Enterprise subscriptions.
keywords: docker hardened images, enterprise, select, mirror, quickstart
@y
title: Get started with DHI Select and Enterprise
linkTitle: Use DHI Select & Enterprise
description: Mirror a repository and start using Docker Hardened Images for Select and Enterprise subscriptions.
keywords: docker hardened images, enterprise, select, mirror, quickstart
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
This guide shows you how to get started with DHI Select and Enterprise
subscriptions. Unlike DHI Community, this workflow lets you mirror repositories
to your organization namespace on Docker Hub, access compliance variants (FIPS),
customize images, and get SLA-backed updates.
@y
This guide shows you how to get started with DHI Select and Enterprise
subscriptions. Unlike DHI Community, this workflow lets you mirror repositories
to your organization namespace on Docker Hub, access compliance variants (FIPS),
customize images, and get SLA-backed updates.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To use this workflow, you need:
@y
To use this workflow, you need:
@z

@x
- Organization owner access in your Docker Hub namespace.
- One of the following:
  - A DHI Select or Enterprise subscription. [Contact Docker
    sales](https://www.docker.com/products/hardened-images/#compare) to purchase
    or learn more about these subscriptions.
  - An active DHI trial. [Start a free DHI
    trial](https://hub.docker.com/hardened-images/start-free-trial).
- [Docker Desktop](../../desktop/release-notes.md) 4.65 or later to use the
  `docker dhi` CLI.
@y
- Organization owner access in your Docker Hub namespace.
- One of the following:
  - A DHI Select or Enterprise subscription. [Contact Docker
    sales](https://www.docker.com/products/hardened-images/#compare) to purchase
    or learn more about these subscriptions.
  - An active DHI trial. [Start a free DHI
    trial](https://hub.docker.com/hardened-images/start-free-trial).
- [Docker Desktop](../../desktop/release-notes.md) 4.65 or later to use the
  `docker dhi` CLI.
@z

@x
Each step, when applicable, shows Docker Hub and command line instructions. You
can use either interface.
@y
Each step, when applicable, shows Docker Hub and command line instructions. You
can use either interface.
@z

@x
## Step 1: Find an image to use
@y
## Step 1: Find an image to use
@z

@x
{{< tabs group="interface" >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs group="interface" >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Go to [Docker Hub](https://hub.docker.com/) and sign in.
2. Select your organization in the left sidebar.
3. Navigate to **Hardened Images** > **Catalog**.
4. Use the search bar or filters to find an image (for example, `python`,
   `node`, or `golang`). For this example, search for `python`.
@y
1. Go to [Docker Hub](https://hub.docker.com/) and sign in.
2. Select your organization in the left sidebar.
3. Navigate to **Hardened Images** > **Catalog**.
4. Use the search bar or filters to find an image (for example, `python`,
   `node`, or `golang`). For this example, search for `python`.
@z

@x
   To search for an image with a compliance variant (FIPS or STIG), select
   **Filter by** and select the relevant compliance option.
@y
   To search for an image with a compliance variant (FIPS or STIG), select
   **Filter by** and select the relevant compliance option.
@z

@x
5. Select the Python repository to view its details.
@y
5. Select the Python repository to view its details.
@z

@x
6. Select **Images** to view available image variants.
@y
6. Select **Images** to view available image variants.
@z

@x
{{< /tab >}}
{{< tab name="Command line" >}}
@y
{{< /tab >}}
{{< tab name="Command line" >}}
@z

@x
1. List available image repositories:
@y
1. List available image repositories:
@z

@x
   ```console
   $ docker dhi catalog list --type image
   ```
@y
   ```console
   $ docker dhi catalog list --type image
   ```
@z

@x
2. To filter by name and FIPS compliance, use the `--filter` and `--fips` flags:
@y
2. To filter by name and FIPS compliance, use the `--filter` and `--fips` flags:
@z

@x
   ```console
   $ docker dhi catalog list --filter python --fips
   ```
@y
   ```console
   $ docker dhi catalog list --filter python --fips
   ```
@z

@x
3. Get image details for the repository:
@y
3. Get image details for the repository:
@z

@x
   ```console
   $ docker dhi catalog get python
   ```
@y
   ```console
   $ docker dhi catalog get python
   ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Continue to the next step to mirror the image. To dive deeper into exploring
images see [Search and evaluate Docker Hardened Images](explore.md).
@y
Continue to the next step to mirror the image. To dive deeper into exploring
images see [Search and evaluate Docker Hardened Images](explore.md).
@z

@x
## Step 2: Mirror the repository
@y
## Step 2: Mirror the repository
@z

@x
Mirroring copies a DHI repository into your organization namespace on Docker
Hub. This lets you receive SLA-backed Docker security patches for your images
and use customization as well as compliance variants. Only organization owners
can mirror repositories.
@y
Mirroring copies a DHI repository into your organization namespace on Docker
Hub. This lets you receive SLA-backed Docker security patches for your images
and use customization as well as compliance variants. Only organization owners
can mirror repositories.
@z

@x
{{< tabs group="interface" >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs group="interface" >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. In the image repository details page you found in the previous step, select
   **Use this image** > **Mirror repository**. Note that you must be signed in
   to Docker Hub to perform this action.
2. Select **Mirror**.
3. Wait for images to finish mirroring. This can take a few minutes.
4. Verify the mirrored repository appears in your organization namespace with a
   `dhi-` prefix (for example, `dhi-python`).
@y
1. In the image repository details page you found in the previous step, select
   **Use this image** > **Mirror repository**. Note that you must be signed in
   to Docker Hub to perform this action.
2. Select **Mirror**.
3. Wait for images to finish mirroring. This can take a few minutes.
4. Verify the mirrored repository appears in your organization namespace with a
   `dhi-` prefix (for example, `dhi-python`).
@z

@x
{{< /tab >}}
{{< tab name="Command line" >}}
@y
{{< /tab >}}
{{< tab name="Command line" >}}
@z

@x
To use the following commands, you must authenticate or configure DHI CLI
authentication using your Docker token. For details, see [Use the DHI
CLI](cli.md#configuration).
@y
To use the following commands, you must authenticate or configure DHI CLI
authentication using your Docker token. For details, see [Use the DHI
CLI](cli.md#configuration).
@z

@x
1. Start mirroring the repository to your organization namespace. Replace
   `<your-org>` with your organization name.
@y
1. Start mirroring the repository to your organization namespace. Replace
   `<your-org>` with your organization name.
@z

@x
   ```console
   $ docker dhi mirror start --org <your-org> \
       -r dhi/python,<your-org>/dhi-python
   ```
@y
   ```console
   $ docker dhi mirror start --org <your-org> \
       -r dhi/python,<your-org>/dhi-python
   ```
@z

@x
2. Wait for images to finish mirroring. This can take a few minutes.
@y
2. Wait for images to finish mirroring. This can take a few minutes.
@z

@x
3. Verify the mirrored repository. Replace `<your-org>` with your organization
   name.
@y
3. Verify the mirrored repository. Replace `<your-org>` with your organization
   name.
@z

@x
   ```console
   $ docker dhi mirror list --org <your-org>
   ```
@y
   ```console
   $ docker dhi mirror list --org <your-org>
   ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Continue to the next step to customize the image. To dive deeper into mirroring
images see [Mirror a repository](mirror.md).
@y
Continue to the next step to customize the image. To dive deeper into mirroring
images see [Mirror a repository](mirror.md).
@z

@x
## Step 3: Customize the image
@y
## Step 3: Customize the image
@z

@x
One of the key benefits of DHI Select and Enterprise is the ability to customize
your mirrored images. You can add system packages, configure settings, or make other
modifications to meet your organization's specific requirements.
@y
One of the key benefits of DHI Select and Enterprise is the ability to customize
your mirrored images. You can add system packages, configure settings, or make other
modifications to meet your organization's specific requirements.
@z

@x
This example shows how to add the `curl` system package to your mirrored Python image.
@y
This example shows how to add the `curl` system package to your mirrored Python image.
@z

@x
{{< tabs group="interface" >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs group="interface" >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Go to your organization namespace on Docker Hub.
2. Navigate to your mirrored repository (for example, `dhi-python`).
3. Select **Customizations**.
4. Select **Create customization**.
5. Search for `3-alpine3.23` and select any one of the images.
6. In **Add packages**, select **curl**.
7. Select **Next: Configure**.
8. In **Customization name**, enter a name for your customization (for example, `curl`).
9. Select **Next: Review customization**.
10. Select **Create customization** to start the build.
@y
1. Go to your organization namespace on Docker Hub.
2. Navigate to your mirrored repository (for example, `dhi-python`).
3. Select **Customizations**.
4. Select **Create customization**.
5. Search for `3-alpine3.23` and select any one of the images.
6. In **Add packages**, select **curl**.
7. Select **Next: Configure**.
8. In **Customization name**, enter a name for your customization (for example, `curl`).
9. Select **Next: Review customization**.
10. Select **Create customization** to start the build.
@z

@x
It can take a few minutes for the customization to build. Go to the
**Customizations** tab of your mirrored repository and view the **Last build**
column to monitor the build status.
@y
It can take a few minutes for the customization to build. Go to the
**Customizations** tab of your mirrored repository and view the **Last build**
column to monitor the build status.
@z

@x
{{< /tab >}}
{{< tab name="Command line" >}}
@y
{{< /tab >}}
{{< tab name="Command line" >}}
@z

@x
To use the following commands, you must authenticate or configure DHI CLI
authentication using your Docker token. For details, see [Use the DHI
CLI](cli.md#configuration).
@y
To use the following commands, you must authenticate or configure DHI CLI
authentication using your Docker token. For details, see [Use the DHI
CLI](cli.md#configuration).
@z

@x
1. Create a customization. Replace `<your-org>` with your organization name.
   This creates a file called `my-customization.yaml` with the customization
   details.
@y
1. Create a customization. Replace `<your-org>` with your organization name.
   This creates a file called `my-customization.yaml` with the customization
   details.
@z

@x
   ```console
   $ docker dhi customization prepare --org <your-org> python 3-alpine3.23 \
       --destination <your-org>/dhi-python \
       --name "python with curl" \
       --output my-customization.yaml
   ```
@y
   ```console
   $ docker dhi customization prepare --org <your-org> python 3-alpine3.23 \
       --destination <your-org>/dhi-python \
       --name "python with curl" \
       --output my-customization.yaml
   ```
@z

@x
2. Add the `curl` package to the customization. You can edit the file with any
   text or code editor. The following commands use `echo` to add the necessary
   lines to the YAML file:
@y
2. Add the `curl` package to the customization. You can edit the file with any
   text or code editor. The following commands use `echo` to add the necessary
   lines to the YAML file:
@z

@x
   ```console
   $ echo "contents:" >> my-customization.yaml
   $ echo "  packages:" >> my-customization.yaml
   $ echo "    - curl" >> my-customization.yaml
   ```
@y
   ```console
   $ echo "contents:" >> my-customization.yaml
   $ echo "  packages:" >> my-customization.yaml
   $ echo "    - curl" >> my-customization.yaml
   ```
@z

@x
3. Apply the customization:
@y
3. Apply the customization:
@z

@x
   ```console
   $ docker dhi customization create --org <your-org> my-customization.yaml
   ```
@y
   ```console
   $ docker dhi customization create --org <your-org> my-customization.yaml
   ```
@z

@x
4. Verify the customization was created:
@y
4. Verify the customization was created:
@z

@x
   ```console
   $ docker dhi customization list --org <your-org>
   ```
@y
   ```console
   $ docker dhi customization list --org <your-org>
   ```
@z

@x
It can take a few minutes for the customization to build. To check the build status:
@y
It can take a few minutes for the customization to build. To check the build status:
@z

@x
1. Go to your organization namespace on Docker Hub.
2. Navigate to your mirrored repository (for example, `dhi-python`).
3. Select **Customizations**.
4. View the **Last build** column to monitor the build status.
@y
1. Go to your organization namespace on Docker Hub.
2. Navigate to your mirrored repository (for example, `dhi-python`).
3. Select **Customizations**.
4. View the **Last build** column to monitor the build status.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
To dive deeper into customization, see [Customize a Docker Hardened
Image](customize.md).
@y
To dive deeper into customization, see [Customize a Docker Hardened
Image](customize.md).
@z

@x
## Step 4: Pull and run your customized image
@y
## Step 4: Pull and run your customized image
@z

@x
After the customization build completes, you can pull and run the customized
image from your organization namespace on Docker Hub.
@y
After the customization build completes, you can pull and run the customized
image from your organization namespace on Docker Hub.
@z

@x
1. Sign in to Docker Hub:
@y
1. Sign in to Docker Hub:
@z

@x
   ```console
   $ docker login
   ```
@y
   ```console
   $ docker login
   ```
@z

@x
2. Pull the customized image from your organization. Replace `<your-org>` with
   your organization name. The customized tag includes the suffix based on your
   customization name.
@y
2. Pull the customized image from your organization. Replace `<your-org>` with
   your organization name. The customized tag includes the suffix based on your
   customization name.
@z

@x
   ```console
   $ docker pull <your-org>/dhi-python:3-alpine3.23_python-with-curl
   ```
@y
   ```console
   $ docker pull <your-org>/dhi-python:3-alpine3.23_python-with-curl
   ```
@z

@x
3. Run the image and test that `curl` is installed:
@y
3. Run the image and test that `curl` is installed:
@z

@x
   ```console
   $ docker run --rm <your-org>/dhi-python:3-alpine3.23_python-with-curl curl --version
   ```
@y
   ```console
   $ docker run --rm <your-org>/dhi-python:3-alpine3.23_python-with-curl curl --version
   ```
@z

@x
   This confirms that the `curl` package was successfully added to the image.
@y
   This confirms that the `curl` package was successfully added to the image.
@z

@x
To dive deeper into using images, see:
@y
To dive deeper into using images, see:
@z

@x
- [Use a Docker Hardened Image](use.md) for general usage
- [Use a Helm chart](helm.md) for deploying with Helm
@y
- [Use a Docker Hardened Image](use.md) for general usage
- [Use a Helm chart](helm.md) for deploying with Helm
@z

@x
## Step 5: Remove customization and stop mirroring
@y
## Step 5: Remove customization and stop mirroring
@z

@x
To remove the customization and stop mirroring the repository:
@y
To remove the customization and stop mirroring the repository:
@z

@x
1. Go to your organization namespace on Docker Hub.
2. Navigate to your mirrored repository (for example, `dhi-python`).
3. Select **Customizations**.
4. Find the customization you want to delete (for example, `python with curl`).
5. Select the trash can icon.
6. Select **Delete customization** to confirm the deletion.
7. To stop mirroring, go back to your organization's repositories list.
8. Find the mirrored repository (for example, `dhi-python`).
9. Select **Settings**.
10. Select **Stop mirroring**.
11. Select **Stop mirroring** to confirm.
@y
1. Go to your organization namespace on Docker Hub.
2. Navigate to your mirrored repository (for example, `dhi-python`).
3. Select **Customizations**.
4. Find the customization you want to delete (for example, `python with curl`).
5. Select the trash can icon.
6. Select **Delete customization** to confirm the deletion.
7. To stop mirroring, go back to your organization's repositories list.
8. Find the mirrored repository (for example, `dhi-python`).
9. Select **Settings**.
10. Select **Stop mirroring**.
11. Select **Stop mirroring** to confirm.
@z

@x
## What's next
@y
## What's next
@z

@x
You've mirrored, customized, and run a Docker Hardened Image. Here are a few ways to keep going:
@y
You've mirrored, customized, and run a Docker Hardened Image. Here are a few ways to keep going:
@z

@x
- [Migrate existing applications to DHIs](../migration/migrate-with-ai.md): Use
  Gordon to update your Dockerfiles to use Docker Hardened Images as the base.
@y
- [Migrate existing applications to DHIs](../migration/migrate-with-ai.md): Use
  Gordon to update your Dockerfiles to use Docker Hardened Images as the base.
@z

@x
- [Verify DHIs](verify.md): Use tools like [Docker Scout](/scout/) or Cosign to
  inspect and verify signed attestations, like SBOMs and provenance.
@y
- [Verify DHIs](verify.md): Use tools like [Docker Scout](__SUBDIR__/scout/) or Cosign to
  inspect and verify signed attestations, like SBOMs and provenance.
@z

@x
- [Scan DHIs](scan.md): Analyze the image with Docker Scout or other scanners
  to identify known CVEs.
@y
- [Scan DHIs](scan.md): Analyze the image with Docker Scout or other scanners
  to identify known CVEs.
@z
