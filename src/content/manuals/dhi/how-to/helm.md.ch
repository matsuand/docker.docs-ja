%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Use a Docker Hardened Image chart
linktitle: Use a Helm chart
description: Learn how to use a Docker Hardened Image chart.
keywords: use hardened image, helm, k8s, kubernetes, dhi chart, chart
@y
title: Use a Docker Hardened Image chart
linktitle: Use a Helm chart
description: Learn how to use a Docker Hardened Image chart.
keywords: use hardened image, helm, k8s, kubernetes, dhi chart, chart
@z

@x
      text: Early Access
@y
      text: 早期アクセス
@z

@x
{{< summary-bar feature_name="Docker Hardened Image charts" >}}
@y
{{< summary-bar feature_name="Docker Hardened Image charts" >}}
@z

@x
Docker Hardened Image (DHI) charts are Docker-provided [Helm charts](https://helm.sh/docs/) built from upstream and
community-maintained sources, designed for compatibility with Docker Hardened Images. These charts are available as OCI
artifacts within the DHI catalog on Docker Hub. For more details, see [Docker Hardened Image
charts](/dhi/features/helm/).
@y
Docker Hardened Image (DHI) charts are Docker-provided [Helm charts](https://helm.sh/docs/) built from upstream and
community-maintained sources, designed for compatibility with Docker Hardened Images. These charts are available as OCI
artifacts within the DHI catalog on Docker Hub. For more details, see [Docker Hardened Image
charts](__SUBDIR__/dhi/features/helm/).
@z

@x
DHI charts incorporate multiple layers of supply chain security that aren't present in upstream charts:
@y
DHI charts incorporate multiple layers of supply chain security that aren't present in upstream charts:
@z

@x
- SLSA Level 3 compliance: Each chart is built with SLSA Build Level 3 standards, including detailed build provenance
- Software Bill of Materials (SBOMs): Comprehensive SBOMs detail all components referenced within the chart
- Cryptographic signing: All associated metadata is cryptographically signed by Docker for integrity and authenticity
- Hardened configuration: Charts automatically reference Docker Hardened Images for secure deployments
- Tested compatibility: Charts are robustly tested to work out-of-the-box with Docker Hardened Images
@y
- SLSA Level 3 compliance: Each chart is built with SLSA Build Level 3 standards, including detailed build provenance
- Software Bill of Materials (SBOMs): Comprehensive SBOMs detail all components referenced within the chart
- Cryptographic signing: All associated metadata is cryptographically signed by Docker for integrity and authenticity
- Hardened configuration: Charts automatically reference Docker Hardened Images for secure deployments
- Tested compatibility: Charts are robustly tested to work out-of-the-box with Docker Hardened Images
@z

@x
This guide walks you through how to use the DHI Redis chart. You can adapt the steps to other DHI charts and your own
Kubernetes workflows. DHI charts work like any other Helm chart, but you must mirror them to your own repository before
using them.
@y
This guide walks you through how to use the DHI Redis chart. You can adapt the steps to other DHI charts and your own
Kubernetes workflows. DHI charts work like any other Helm chart, but you must mirror them to your own repository before
using them.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To follow along with this guide, you need:
@y
To follow along with this guide, you need:
@z

@x
- A Kubernetes cluster set up and [`kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed. To
  test locally, you can use Docker Desktop with Kubernetes enabled. For more information, see [Install Docker
  Desktop](/desktop/install/windows-install/) and [Enable Kubernetes](/desktop/features/kubernetes/).
- Helm installed. For more information, see the [Helm installation guide](https://helm.sh/docs/intro/install/).
- Access to DHI. For more information about starting a free trial, see [Get started with Docker Hardened
  Images](/dhi/get-started/).
@y
- A Kubernetes cluster set up and [`kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed. To
  test locally, you can use Docker Desktop with Kubernetes enabled. For more information, see [Install Docker
  Desktop](__SUBDIR__/desktop/install/windows-install/) and [Enable Kubernetes](__SUBDIR__/desktop/features/kubernetes/).
- Helm installed. For more information, see the [Helm installation guide](https://helm.sh/docs/intro/install/).
- Access to DHI. For more information about starting a free trial, see [Get started with Docker Hardened
  Images](__SUBDIR__/dhi/get-started/).
@z

@x
## Step 1: Find a Docker Helm chart and request access
@y
## Step 1: Find a Docker Helm chart and request access
@z

@x
To find a Docker Helm chart for DHI:
@y
To find a Docker Helm chart for DHI:
@z

@x
1. Go to the Hardened Images catalog in [Docker Hub](https://hub.docker.com/hardened-images/catalog) and sign in.
2. In the left sidebar, select your organization that has DHI access.
3. In the left sidebar, select **Hardened Images** > **Catalog**.
4. In the search bar, search for a Helm chart. For this guide, search for `redis chart`.
5. Select the Helm chart to view its details. For this guide, select the **Redis HA Helm Chart**.
@y
1. Go to the Hardened Images catalog in [Docker Hub](https://hub.docker.com/hardened-images/catalog) and sign in.
2. In the left sidebar, select your organization that has DHI access.
3. In the left sidebar, select **Hardened Images** > **Catalog**.
4. In the search bar, search for a Helm chart. For this guide, search for `redis chart`.
5. Select the Helm chart to view its details. For this guide, select the **Redis HA Helm Chart**.
@z

@x
   You will see the **Overview** page with details about the chart.
@y
   You will see the **Overview** page with details about the chart.
@z

@x
6. If visible, select **Request access to Helm charts**.
@y
6. If visible, select **Request access to Helm charts**.
@z

@x
   Before you can mirror the chart, you may need to request access for the Early Access program. If **Request access to
   Helm charts** is visible on the Helm chart repository details page, select it and wait for an email notifying you
   that the access has been granted by Docker.
@y
   Before you can mirror the chart, you may need to request access for the Early Access program. If **Request access to
   Helm charts** is visible on the Helm chart repository details page, select it and wait for an email notifying you
   that the access has been granted by Docker.
@z

@x
## Step 2: Mirror the Docker Helm chart
@y
## Step 2: Mirror the Docker Helm chart
@z

@x
You must mirror the Docker Helm chart to your own repository before using it.
@y
You must mirror the Docker Helm chart to your own repository before using it.
@z

@x
To mirror the Docker Helm chart to your organization, in the Helm chart repository details page you opened in [step
1](#step-1-find-a-docker-helm-chart-and-request-access):
@y
To mirror the Docker Helm chart to your organization, in the Helm chart repository details page you opened in [step
1](#step-1-find-a-docker-helm-chart-and-request-access):
@z

@x
1. Select **Mirror Helm chart**.
2. Follow the on-screen instructions to mirror the Helm chart. For this guide, name the destination repository
   `dhi-redis-ha-chart`.
@y
1. Select **Mirror Helm chart**.
2. Follow the on-screen instructions to mirror the Helm chart. For this guide, name the destination repository
   `dhi-redis-ha-chart`.
@z

@x
   When complete, you will see the details page for the mirrored Helm chart in your organization's namespace. On this
   page, you can verify that the necessary dependencies have also been mirrored.
@y
   When complete, you will see the details page for the mirrored Helm chart in your organization's namespace. On this
   page, you can verify that the necessary dependencies have also been mirrored.
@z

@x
3. If any dependencies are not mirrored, mirror them now. For this guide, select **Mirror image** if necessary for the
   Redis image, then follow the on-screen instructions.
@y
3. If any dependencies are not mirrored, mirror them now. For this guide, select **Mirror image** if necessary for the
   Redis image, then follow the on-screen instructions.
@z

@x
You only need to mirror the Helm chart and its dependencies once. After they are mirrored, you can use them in any
Kubernetes cluster that can access your organization's namespace.
@y
You only need to mirror the Helm chart and its dependencies once. After they are mirrored, you can use them in any
Kubernetes cluster that can access your organization's namespace.
@z

@x
## Step 3: Optional. Mirror the Helm chart and/or its images to your own registry
@y
## Step 3: Optional. Mirror the Helm chart and/or its images to your own registry
@z

@x
By default, when you mirror a chart or image from the Docker Hardened Images catalog, the chart or image is mirrored to
your namespace in Docker Hub. If you want to then mirror to your own third-party registry, you can follow the
instructions in [How to mirror an image](/dhi/how-to/mirror/) for either the chart, the image, or both.
@y
By default, when you mirror a chart or image from the Docker Hardened Images catalog, the chart or image is mirrored to
your namespace in Docker Hub. If you want to then mirror to your own third-party registry, you can follow the
instructions in [How to mirror an image](__SUBDIR__/dhi/how-to/mirror/) for either the chart, the image, or both.
@z

@x
The same `regctl` tool that is used for mirroring container images can also be used for mirroring Helm charts, as Helm
charts are OCI artifacts.
@y
The same `regctl` tool that is used for mirroring container images can also be used for mirroring Helm charts, as Helm
charts are OCI artifacts.
@z

@x
For example:
@y
For example:
@z

% snip command...

@x
## Step 4: Create a Kubernetes secret for pulling images
@y
## Step 4: Create a Kubernetes secret for pulling images
@z

@x
You need to create a Kubernetes secret for pulling images from Docker Hub or your own registry. This is necessary
because Docker Hardened Images are in private repositories. If you mirror the images to your own registry, you still
need to create this secret if the registry requires authentication.
@y
You need to create a Kubernetes secret for pulling images from Docker Hub or your own registry. This is necessary
because Docker Hardened Images are in private repositories. If you mirror the images to your own registry, you still
need to create this secret if the registry requires authentication.
@z

@x
1. For Docker Hub, create a [personal access token (PAT)](/security/access-tokens/) using your Docker account or an
   [organization access token (OAT)](/enterprise/security/access-tokens/). Ensure the token has at least read-only
   access to the Docker Hardened Image repositories.
2. Create a secret in Kubernetes using the following command. Replace `<your-secret-name>`, `<your-username>`,
   `<your-personal-access-token>`, and `<your-email>` with your own values.
@y
1. For Docker Hub, create a [personal access token (PAT)](__SUBDIR__/security/access-tokens/) using your Docker account or an
   [organization access token (OAT)](__SUBDIR__/enterprise/security/access-tokens/). Ensure the token has at least read-only
   access to the Docker Hardened Image repositories.
2. Create a secret in Kubernetes using the following command. Replace `<your-secret-name>`, `<your-username>`,
   `<your-personal-access-token>`, and `<your-email>` with your own values.
@z

@x
   > [!NOTE]
   >
   > You need to create this secret in each Kubernetes namespace that uses a DHI. If you've mirror your DHIs to another
   > registry, replace `docker.io` with your registry's hostname. Replace `<your-username>`, `<your-access-token>`, and
   > `<your-email>` with your own values. `<your-username>` is Docker ID if using a PAT or your organization name if
   > using an OAT. `<your-secret-name>` is a name you choose for the secret.
@y
   > [!NOTE]
   >
   > You need to create this secret in each Kubernetes namespace that uses a DHI. If you've mirror your DHIs to another
   > registry, replace `docker.io` with your registry's hostname. Replace `<your-username>`, `<your-access-token>`, and
   > `<your-email>` with your own values. `<your-username>` is Docker ID if using a PAT or your organization name if
   > using an OAT. `<your-secret-name>` is a name you choose for the secret.
@z

% snip command...

@x
   For example:
@y
   For example:
@z

% snip command...

@x
## Step 5: Update the image references in the Helm chart
@y
## Step 5: Update the image references in the Helm chart
@z

@x
DHI charts reference images stored in private repositories. While many standard Helm charts use default image locations
that are accessible to everyone, DHI images must first be mirrored to your own Docker Hub namespace or private registry.
Since each organization will have their own unique repository location, the Helm chart must be updated to point to the
correct image locations specific to your organization's Docker Hub namespace or registry.
@y
DHI charts reference images stored in private repositories. While many standard Helm charts use default image locations
that are accessible to everyone, DHI images must first be mirrored to your own Docker Hub namespace or private registry.
Since each organization will have their own unique repository location, the Helm chart must be updated to point to the
correct image locations specific to your organization's Docker Hub namespace or registry.
@z

@x
To do this, you can use one of the following approaches:
@y
To do this, you can use one of the following approaches:
@z

@x
- Pre-rendering: Uses a values override file to set the image references before Helm renders the chart templates.
- Post-rendering: Uses a script that automatically rewrites image references after Helm renders the templates but
  before deploying to Kubernetes. The script is invoked by Helm during the `helm install` command using the
  `--post-renderer` flag, where you pass it the new image prefix as an argument.
@y
- Pre-rendering: Uses a values override file to set the image references before Helm renders the chart templates.
- Post-rendering: Uses a script that automatically rewrites image references after Helm renders the templates but
  before deploying to Kubernetes. The script is invoked by Helm during the `helm install` command using the
  `--post-renderer` flag, where you pass it the new image prefix as an argument.
@z

@x
{{< tabs group="rendering" >}} {{< tab name="Pre-rendering" >}}
@y
{{< tabs group="rendering" >}} {{< tab name="Pre-rendering" >}}
@z

@x
Create a file named `dhi-images.yaml` file with the following:
@y
Create a file named `dhi-images.yaml` file with the following:
@z

% snip code...

@x
Replace `<your-namespace>` with your Docker Hub namespace or with your own namespace in your own registry.
@y
Replace `<your-namespace>` with your Docker Hub namespace or with your own namespace in your own registry.
@z

@x
For example, for the Redis chart:
@y
For example, for the Redis chart:
@z

% snip code...

@x
{{< /tab >}} {{< tab name="Post-rendering" >}}
@y
{{< /tab >}} {{< tab name="Post-rendering" >}}
@z

@x
Create a script named `post-renderer.sh` using the following command:
@y
Create a script named `post-renderer.sh` using the following command:
@z

@x within code
# Replaces dhi/ or docker.io/dhi with the specified PREFIX
@y
# Replaces dhi/ or docker.io/dhi with the specified PREFIX
@z

@x
This script will replace all references to `dhi/` or `docker.io/dhi/` with the prefix you provide when running `helm
install`.
@y
This script will replace all references to `dhi/` or `docker.io/dhi/` with the prefix you provide when running `helm
install`.
@z

@x
{{< /tab >}} {{< /tabs >}}
@y
{{< /tab >}} {{< /tabs >}}
@z

@x
## Step 6: Install the Helm chart
@y
## Step 6: Install the Helm chart
@z

@x
1. If the chart is in a private repository, sign in to the registry using Helm:
@y
1. If the chart is in a private repository, sign in to the registry using Helm:
@z

% snip command...

@x
   For example:
@y
   For example:
@z

% snip command...

@x
2. Install the chart using `helm install`. The command differs slightly depending on whether you are using
   post-rendering or pre-rendering. Optionally, you can also use the `--dry-run` flag to test the installation without
   actually installing anything.
@y
2. Install the chart using `helm install`. The command differs slightly depending on whether you are using
   post-rendering or pre-rendering. Optionally, you can also use the `--dry-run` flag to test the installation without
   actually installing anything.
@z

@x
   {{< tabs group="rendering" >}} {{< tab name="Pre-rendering" >}}
@y
   {{< tabs group="rendering" >}} {{< tab name="Pre-rendering" >}}
@z

% snip command...

@x
   Replace `<your-namespace>` and `<chart-version>` accordingly. If the chart is in your own registry, replace
   `registry-1.docker.io/<your-namespace>` with your own registry and namespace. Replace `<your-secret-name>` with the
   name of the image pull secret you created earlier.
@y
   Replace `<your-namespace>` and `<chart-version>` accordingly. If the chart is in your own registry, replace
   `registry-1.docker.io/<your-namespace>` with your own registry and namespace. Replace `<your-secret-name>` with the
   name of the image pull secret you created earlier.
@z

@x
   For example, for the Redis chart:
@y
   For example, for the Redis chart:
@z

% snip command...

@x
   {{< /tab >}} {{< tab name="Post-rendering" >}}
@y
   {{< /tab >}} {{< tab name="Post-rendering" >}}
@z

% snip command...

@x
   Replace `<your-namespace>` and `<chart-version>` accordingly. If the chart is in your own registry, replace
   `registry-1.docker.io/<your-namespace>` with your own registry and namespace. Replace
   `<your-registry-and-repository>` with the registry and repository prefix you want to use for the images, for example,
   `gcr.io/my-project/dhi-`, or `your-namespace/` if you are using Docker Hub. Replace `<your-secret-name>` with the
   name of the image pull secret you created earlier.
@y
   Replace `<your-namespace>` and `<chart-version>` accordingly. If the chart is in your own registry, replace
   `registry-1.docker.io/<your-namespace>` with your own registry and namespace. Replace
   `<your-registry-and-repository>` with the registry and repository prefix you want to use for the images, for example,
   `gcr.io/my-project/dhi-`, or `your-namespace/` if you are using Docker Hub. Replace `<your-secret-name>` with the
   name of the image pull secret you created earlier.
@z

@x
   For example, for the Redis chart:
@y
   For example, for the Redis chart:
@z

% snip command...

@x
   {{< /tab >}} {{< /tabs >}}
@y
   {{< /tab >}} {{< /tabs >}}
@z

@x
## Step 7: Verify the installation
@y
## Step 7: Verify the installation
@z

@x
After a few seconds all the pods should be up and running.
@y
After a few seconds all the pods should be up and running.
@z

% snip command...

@x
For example, for the Redis chart:
@y
For example, for the Redis chart:
@z

% snip command...

@x
## Step 8: Uninstall the Helm chart
@y
## Step 8: Uninstall the Helm chart
@z

@x
To uninstall the Helm chart, run:
@y
To uninstall the Helm chart, run:
@z

% snip command...

@x
For example, for the Redis chart:
@y
For example, for the Redis chart:
@z

% snip command...
