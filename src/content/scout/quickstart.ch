%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Scout quickstart
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description: Learn how to get started with Docker Scout to analyze images and fix vulnerabilities
aliases:
  - /atomist/get-started/
---
@y
---
title: Docker Scout quickstart
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description: Learn how to get started with Docker Scout to analyze images and fix vulnerabilities
aliases:
  - /atomist/get-started/
---
@z

@x
Docker Scout analyzes image contents and generates a detailed report of packages
and vulnerabilities that it detects. It can provide you with
suggestions for how to remediate issues discovered by image analysis.
@y
Docker Scout analyzes image contents and generates a detailed report of packages
and vulnerabilities that it detects. It can provide you with
suggestions for how to remediate issues discovered by image analysis.
@z

@x
This guide takes a vulnerable container image and shows you how to use Docker
Scout to identify and fix the vulnerabilities, compare image versions over time,
and share the results with your team.
@y
This guide takes a vulnerable container image and shows you how to use Docker
Scout to identify and fix the vulnerabilities, compare image versions over time,
and share the results with your team.
@z

@x
The following video shows an end-to-end workflow of using Docker Scout to remediate a reported vulnerability.
@y
The following video shows an end-to-end workflow of using Docker Scout to remediate a reported vulnerability.
@z

@x
<iframe class="border-0 w-full aspect-video mb-8" allow="fullscreen" src="https://www.loom.com/embed/e066986569924555a2546139f5f61349?sid=6e29be62-78ba-4aa7-a1f6-15f96c37d916"></iframe>
@y
<iframe class="border-0 w-full aspect-video mb-8" allow="fullscreen" src="https://www.loom.com/embed/e066986569924555a2546139f5f61349?sid=6e29be62-78ba-4aa7-a1f6-15f96c37d916"></iframe>
@z

@x
## Step 1: Setup
@y
## Step 1: Setup
@z

@x
[This example project](https://github.com/docker/scout-demo-service) contains
a vulnerable Node.js application that you can use to follow along.
@y
[This example project](https://github.com/docker/scout-demo-service) contains
a vulnerable Node.js application that you can use to follow along.
@z

@x
1. Clone its repository:
@y
1. Clone its repository:
@z

@x
   ```console
   $ git clone https://github.com/docker/scout-demo-service.git
   ```
@y
   ```console
   $ git clone https://github.com/docker/scout-demo-service.git
   ```
@z

@x
2. Move into the directory:
@y
2. Move into the directory:
@z

@x
   ```console
   $ cd scout-demo-service
   ```
@y
   ```console
   $ cd scout-demo-service
   ```
@z

@x
3. Build the image, naming it to match the organization you will push it to,
   and tag it as `v1`:
@y
3. Build the image, naming it to match the organization you will push it to,
   and tag it as `v1`:
@z

@x
   ```console
   $ docker build -t <ORG_NAME>/scout-demo:v1 .
   ```
@y
   ```console
   $ docker build -t <ORG_NAME>/scout-demo:v1 .
   ```
@z

@x
4. Create and push the repository on Docker Hub:
@y
4. Create and push the repository on Docker Hub:
@z

@x
   ```console
   $ docker push <ORG_NAME>/scout-demo:v1
   ```
@y
   ```console
   $ docker push <ORG_NAME>/scout-demo:v1
   ```
@z

@x
   > **Important**
   >
   > Make sure you log in to the Docker CLI or Docker Desktop before pushing.
   { .important }
@y
   > **Important**
   >
   > Make sure you log in to the Docker CLI or Docker Desktop before pushing.
   { .important }
@z

@x
## Step 2: Enable Docker Scout
@y
## Step 2: Enable Docker Scout
@z

@x
Docker Scout analyzes all local images by default. To analyze images in
remote repositories, you need to enable it first.
You can do this from Docker Hub, the Docker Scout Dashboard, and CLI.
[Find out how in the overview guide](/scout).
@y
Docker Scout analyzes all local images by default. To analyze images in
remote repositories, you need to enable it first.
You can do this from Docker Hub, the Docker Scout Dashboard, and CLI.
[Find out how in the overview guide](/scout).
@z

@x
1. Sign in to your Docker account with the `docker login` command or use the
   **Sign in** button in Docker Desktop.
2. Use the Docker CLI [`docker scout repo enable`](/engine/reference/commandline/scout_repo_enable)
   command to enable analysis on an existing repository:
@y
1. Sign in to your Docker account with the `docker login` command or use the
   **Sign in** button in Docker Desktop.
2. Use the Docker CLI [`docker scout repo enable`](/engine/reference/commandline/scout_repo_enable)
   command to enable analysis on an existing repository:
@z

@x
   ```console
   $ docker scout repo enable --org <ORG_NAME> <ORG_NAME>/scout-demo
   ```
@y
   ```console
   $ docker scout repo enable --org <ORG_NAME> <ORG_NAME>/scout-demo
   ```
@z

@x
## Step 3: Analyze image vulnerabilities
@y
## Step 3: Analyze image vulnerabilities
@z

@x
After building, you can use Docker Desktop or the `docker scout` CLI command
to see vulnerabilities detected by Docker Scout.
@y
After building, you can use Docker Desktop or the `docker scout` CLI command
to see vulnerabilities detected by Docker Scout.
@z

@x
1. Using Docker Desktop, select the image name in the **Images** view to see
   the image layer view. In the image hierarchy section, you can see which layers
   introduce vulnerabilities and the details of those.
@y
1. Using Docker Desktop, select the image name in the **Images** view to see
   the image layer view. In the image hierarchy section, you can see which layers
   introduce vulnerabilities and the details of those.
@z

@x
2. Select layer 5 to focus on the vulnerability introduced in that layer.
@y
2. Select layer 5 to focus on the vulnerability introduced in that layer.
@z

@x
3. Toggle the disclosure triangle next to **express 4.17.1** and then the CVE ID (in this case, `CVE-2022-24999`) to see details of the
   vulnerability.
@y
3. Toggle the disclosure triangle next to **express 4.17.1** and then the CVE ID (in this case, `CVE-2022-24999`) to see details of the
   vulnerability.
@z

@x
   You can also use the Docker CLI to see the same results.
@y
   You can also use the Docker CLI to see the same results.
@z

@x
   ```console
   $ docker scout cves <ORG_NAME>/scout-demo:v1
   ```
@y
   ```console
   $ docker scout cves <ORG_NAME>/scout-demo:v1
   ```
@z

@x
![Screenshot showing highlighting a CVE in Docker Desktop](./images/scout-onboarding-dd-v1-cvve-focus.png)
@y
![Screenshot showing highlighting a CVE in Docker Desktop](./images/scout-onboarding-dd-v1-cvve-focus.png)
@z

@x
Docker Scout creates and maintains its vulnerability database by ingesting and
collating vulnerability data from multiple sources continuously. These sources
include many recognizable package repositories and trusted security trackers.
You can find more details in the [advisory database](./advisory-db-sources.md) documentation.
@y
Docker Scout creates and maintains its vulnerability database by ingesting and
collating vulnerability data from multiple sources continuously. These sources
include many recognizable package repositories and trusted security trackers.
You can find more details in the [advisory database](./advisory-db-sources.md) documentation.
@z

@x
> **Tip**
>
> Find out how to filter results using the CLI command [`scout cves`](/engine/reference/commandline/scout_cves).
> { .tip }
@y
> **Tip**
>
> Find out how to filter results using the CLI command [`scout cves`](/engine/reference/commandline/scout_cves).
> { .tip }
@z

@x
## Step 4: Fix application vulnerabilities
@y
## Step 4: Fix application vulnerabilities
@z

@x
The fix suggested by Docker Scout is to update
the underlying vulnerable express version to 4.17.3 or later.
@y
The fix suggested by Docker Scout is to update
the underlying vulnerable express version to 4.17.3 or later.
@z

@x
1. Update the `package.json` file with the new package version.
@y
1. Update the `package.json` file with the new package version.
@z

@x
   ```json
   …
   "dependencies": {
        "express": "4.17.3"
        …
   }
   ```
@y
   ```json
   …
   "dependencies": {
        "express": "4.17.3"
        …
   }
   ```
@z

@x
2. Rebuild the image, giving it a new version tag:
@y
2. Rebuild the image, giving it a new version tag:
@z

@x
   ```console
   $ docker build -t <ORG_NAME>/scout-demo:v2 .
   ```
@y
   ```console
   $ docker build -t <ORG_NAME>/scout-demo:v2 .
   ```
@z

@x
3. Push the image to the same repository on Docker Hub using a new version tag:
@y
3. Push the image to the same repository on Docker Hub using a new version tag:
@z

@x
   ```console
   $ docker push <ORG_NAME>/scout-demo:v2
   ```
@y
   ```console
   $ docker push <ORG_NAME>/scout-demo:v2
   ```
@z

@x
Now, viewing the latest tag of the image in Docker Desktop, the Docker Scout
Dashboard, or CLI, you can see that you have fixed the vulnerability.
@y
Now, viewing the latest tag of the image in Docker Desktop, the Docker Scout
Dashboard, or CLI, you can see that you have fixed the vulnerability.
@z

@x
## Step 5: Fix vulnerabilities in base images
@y
## Step 5: Fix vulnerabilities in base images
@z

@x
In addition to identifying application
vulnerabilities, Docker Scout also helps you identify and fix issues with the
base images your images use.
@y
In addition to identifying application
vulnerabilities, Docker Scout also helps you identify and fix issues with the
base images your images use.
@z

@x
1. On the Docker Scout Dashboard, you can see these suggestions
   by selecting the **Recommended fixes** button in the image layer view.
@y
1. On the Docker Scout Dashboard, you can see these suggestions
   by selecting the **Recommended fixes** button in the image layer view.
@z

@x
2. Select the **Recommendations for base image** option from the button. In the
   dialog that appears, select the **Change base image** tab, the new version of
   the base image you want to use, and copy the suggestion into your `Dockerfile`.
@y
2. Select the **Recommendations for base image** option from the button. In the
   dialog that appears, select the **Change base image** tab, the new version of
   the base image you want to use, and copy the suggestion into your `Dockerfile`.
@z

@x
3. Rebuild the image, again with a new tag:
@y
3. Rebuild the image, again with a new tag:
@z

@x
   ```console
   $ docker build -t <ORG_NAME>/scout-demo:v3 .
   ```
@y
   ```console
   $ docker build -t <ORG_NAME>/scout-demo:v3 .
   ```
@z

@x
4. Push it to Docker Hub using the new version tag:
@y
4. Push it to Docker Hub using the new version tag:
@z

@x
   ```console
   $ docker push <ORG_NAME>/scout-demo:v3
   ```
@y
   ```console
   $ docker push <ORG_NAME>/scout-demo:v3
   ```
@z

@x
5. Select the new image tag in Docker Desktop or the Docker Scout Dashboard and you
   can see that the base image has been updated, removing many vulnerabilities.
@y
5. Select the new image tag in Docker Desktop or the Docker Scout Dashboard and you
   can see that the base image has been updated, removing many vulnerabilities.
@z

@x
   You can see the same using the Docker CLI command:
@y
   You can see the same using the Docker CLI command:
@z

@x
   ```console
   $ docker scout cves <ORG_NAME>/scout-demo:v3
   ```
@y
   ```console
   $ docker scout cves <ORG_NAME>/scout-demo:v3
   ```
@z

@x
## Step 6: Collaborate on vulnerabilities
@y
## Step 6: Collaborate on vulnerabilities
@z

@x
You can see and share the same vulnerability information about an image and
the other images in your organization in the [Docker Scout Dashboard](./dashboard.md).
@y
You can see and share the same vulnerability information about an image and
the other images in your organization in the [Docker Scout Dashboard](./dashboard.md).
@z

@x
All organization members can see an overview of all their images from integrated container registries,
and get remediation advice at their fingertips. This helps team members in
security, compliance, and operations to know what vulnerabilities and issues to focus on.
@y
All organization members can see an overview of all their images from integrated container registries,
and get remediation advice at their fingertips. This helps team members in
security, compliance, and operations to know what vulnerabilities and issues to focus on.
@z

@x
1. Select the **Images** tab on the [Docker Scout Dashboard](https://scout.docker.com).
2. Select any of the tags under
   the **Most Recent Image** column, and you can see the same vulnerability
   information as you saw in Docker Desktop and the Docker CLI and share this link with anyone else in your organization.
@y
1. Select the **Images** tab on the [Docker Scout Dashboard](https://scout.docker.com).
2. Select any of the tags under
   the **Most Recent Image** column, and you can see the same vulnerability
   information as you saw in Docker Desktop and the Docker CLI and share this link with anyone else in your organization.
@z

@x
> **Tip**
>
> If you are a member of multiple organizations, make sure you select the
> correct organization from the drop-down in the top right.
> ![Screenshot showing organization picker in the Docker Scout dashboard](./images/scout-onboarding-org-picker.png)
{ .tip }
@y
> **Tip**
>
> If you are a member of multiple organizations, make sure you select the
> correct organization from the drop-down in the top right.
> ![Screenshot showing organization picker in the Docker Scout dashboard](./images/scout-onboarding-org-picker.png)
{ .tip }
@z

@x
## Step 7: Compare images
@y
## Step 7: Compare images
@z

@x
Over time as you build and push new tags of images, you can use the Docker Scout
CLI and Dashboard to compare the changes to vulnerabilities and packages in
different tags of the same image.
@y
Over time as you build and push new tags of images, you can use the Docker Scout
CLI and Dashboard to compare the changes to vulnerabilities and packages in
different tags of the same image.
@z

@x
{{< tabs >}}
{{< tab name="Dashboard" >}}
@y
{{< tabs >}}
{{< tab name="Dashboard" >}}
@z

@x
On the Docker Scout Dashboard, select the repository to compare from the
**Images** list. In this case, **scout-demo**.
@y
On the Docker Scout Dashboard, select the repository to compare from the
**Images** list. In this case, **scout-demo**.
@z

@x
Choose two of the tags you pushed in the last steps, for example, **v1** and
**v3**, and then select **Compare images**.
@y
Choose two of the tags you pushed in the last steps, for example, **v1** and
**v3**, and then select **Compare images**.
@z

@x
The **Image comparison** view shows you the differences between the two tags.
The page's top part summarizes the two tags, including the differences between
vulnerabilities and base image tags.
@y
The **Image comparison** view shows you the differences between the two tags.
The page's top part summarizes the two tags, including the differences between
vulnerabilities and base image tags.
@z

@x
In the bottom part of the page, you can see the changes in packages and
vulnerabilities between the two tags. In the row for "express", you can see the
version change from 4.17.1 to 4.17.3. Switch to the **Vulnerabilities** tab to
see the changes in vulnerabilities between the two tags. You can see that
`CVE-2022-24999` isn't present under the **v3** tag.
@y
In the bottom part of the page, you can see the changes in packages and
vulnerabilities between the two tags. In the row for "express", you can see the
version change from 4.17.1 to 4.17.3. Switch to the **Vulnerabilities** tab to
see the changes in vulnerabilities between the two tags. You can see that
`CVE-2022-24999` isn't present under the **v3** tag.
@z

@x
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
Use the `docker scout compare` command to see the compare two image versions.
Pass the image that you want to compare as a positional argument to the
command, and specify the base image to compare with using the `--to` flag.
@y
Use the `docker scout compare` command to see the compare two image versions.
Pass the image that you want to compare as a positional argument to the
command, and specify the base image to compare with using the `--to` flag.
@z

@x
```console
$ docker scout compare --to <ORG_NAME>/scout-demo:v1 <ORG_NAME>/scout-demo:v3
```
@y
```console
$ docker scout compare --to <ORG_NAME>/scout-demo:v1 <ORG_NAME>/scout-demo:v3
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
## What's next?
@y
## What's next?
@z

@x
- Explore the [Docker Scout Dashboard](/scout/dashboard) to see how you can
  collaborate with your team on vulnerabilities.
- [Learn how to integrate Docker Scout with other systems](./integrations/index.md).
- [Find out where Docker Scout gets its vulnerability data](/scout/advisory-db-sources).
@y
- Explore the [Docker Scout Dashboard](/scout/dashboard) to see how you can
  collaborate with your team on vulnerabilities.
- [Learn how to integrate Docker Scout with other systems](./integrations/index.md).
- [Find out where Docker Scout gets its vulnerability data](/scout/advisory-db-sources).
@z
