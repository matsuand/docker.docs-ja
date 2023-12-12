%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: The Docker Scout Dashboard helps review and share the analysis of images.
keywords: scanning, analysis, vulnerabilities, Hub, supply chain, security, report,
  reports, dashboard
title: Dashboard
aliases:
- /scout/reports/
- /scout/web-app/
---
@y
---
description: The Docker Scout Dashboard helps review and share the analysis of images.
keywords: scanning, analysis, vulnerabilities, Hub, supply chain, security, report,
  reports, dashboard
title: Dashboard
aliases:
- /scout/reports/
- /scout/web-app/
---
@z

@x
The [Docker Scout Dashboard](https://scout.docker.com/) helps you share the
analysis of images in an organization with your team. Developers can now see an
overview of their security status across all their images from both Docker Hub
and Artifactory, and get remediation advice at their fingertips. It helps team
members in roles such as security, compliance, and operations to know what
vulnerabilities and issues they need to focus on.
@y
The [Docker Scout Dashboard](https://scout.docker.com/) helps you share the
analysis of images in an organization with your team. Developers can now see an
overview of their security status across all their images from both Docker Hub
and Artifactory, and get remediation advice at their fingertips. It helps team
members in roles such as security, compliance, and operations to know what
vulnerabilities and issues they need to focus on.
@z

@x
## Overview
@y
## Overview
@z

@x
![A screenshot of the Docker Scout Dashboard overview](./images/dashboard-overview.webp?border=true)
@y
![A screenshot of the Docker Scout Dashboard overview](./images/dashboard-overview.webp?border=true)
@z

@x
The **Overview** tab provides a summary for the repositories in the selected
organization.
@y
The **Overview** tab provides a summary for the repositories in the selected
organization.
@z

@x
At the top of this page, you can select which **Environment** to view.
By default, the most recently pushed images are shown. To learn more about
environments, see [Environment monitoring](./integrations/environment/_index.md).
@y
At the top of this page, you can select which **Environment** to view.
By default, the most recently pushed images are shown. To learn more about
environments, see [Environment monitoring](./integrations/environment/_index.md).
@z

@x
The **Policy** boxes show your current compliance rating for each policy, and a
trend indication for the selected environment. The trend describes the policy
delta for the most recent images compared to the previous version.
For more information about policies, see [Policy Evaluation](./policy/_index.md).
@y
The **Policy** boxes show your current compliance rating for each policy, and a
trend indication for the selected environment. The trend describes the policy
delta for the most recent images compared to the previous version.
For more information about policies, see [Policy Evaluation](./policy/_index.md).
@z

@x
The vulnerability chart shows the total number of vulnerabilities for images in
the selected environment over time. You can configure the timescale for the
chart using the drop-down menu.
@y
The vulnerability chart shows the total number of vulnerabilities for images in
the selected environment over time. You can configure the timescale for the
chart using the drop-down menu.
@z

@x
Use the header menu at the top of the website to access the different main
sections of the Docker Scout Dashboard:
@y
Use the header menu at the top of the website to access the different main
sections of the Docker Scout Dashboard:
@z

@x
- [Images](#images)
- [Policies](#policies)
- [Vulnerabilities](#vulnerabilities)
- [Base images](#base-images)
- [Packages](#packages)
@y
- [Images](#images)
- [Policies](#policies)
- [Vulnerabilities](#vulnerabilities)
- [Base images](#base-images)
- [Packages](#packages)
@z

@x
## Images
@y
## Images
@z

@x
The **Images** view shows a list of images in an organization. You can search
for specific repositories using the search box.
@y
The **Images** view shows a list of images in an organization. You can search
for specific repositories using the search box.
@z

@x
Each entry in the list shows the following details:
@y
Each entry in the list shows the following details:
@z

@x
- The repository name for the image. Selecting the link for the repository opens [the list of tags for the repository](#repository-tag-list).
- The most recent tag of the image in the selected environment. Selecting the link for the base image opens [the image details view](#image-details-view).
- The operating system and architecture of the image.
- The date of the last push for the image.
- The vulnerabilities for the most recent image version.
- Policy status, including the change for the most recent version, and a link to more details for non-compliant images.
@y
- The repository name for the image. Selecting the link for the repository opens [the list of tags for the repository](#repository-tag-list).
- The most recent tag of the image in the selected environment. Selecting the link for the base image opens [the image details view](#image-details-view).
- The operating system and architecture of the image.
- The date of the last push for the image.
- The vulnerabilities for the most recent image version.
- Policy status, including the change for the most recent version, and a link to more details for non-compliant images.
@z

@x
### Repository tag list
@y
### Repository tag list
@z

@x
![Screenshot of tags for a repository](./images/dashboard-repo-tags.webp?border=true)
@y
![Screenshot of tags for a repository](./images/dashboard-repo-tags.webp?border=true)
@z

@x
There are two tabs on this page:
@y
There are two tabs on this page:
@z

@x
- The **Policy** tab displays the policy delta for the latest version of the
  image.
- The **Tags** tab contains the repository tag list, and shows all tags for the
  repository. 
@y
- The **Policy** tab displays the policy delta for the latest version of the
  image.
- The **Tags** tab contains the repository tag list, and shows all tags for the
  repository. 
@z

@x
In the **Tags** tab, you can filter the list by environment, or by tag or
digest using the search box.
@y
In the **Tags** tab, you can filter the list by environment, or by tag or
digest using the search box.
@z

@x
Each entry in the list shows the following details:
@y
Each entry in the list shows the following details:
@z

@x
- A checkbox to mark the tag for comparison to one other.
@y
- A checkbox to mark the tag for comparison to one other.
@z

@x
  > **Tip**
  >
  > Compare two image tags by selecting the checkboxes next to them and selecting the **Compare images** button at the top of the list.
  { .tip }
@y
  > **Tip**
  >
  > Compare two image tags by selecting the checkboxes next to them and selecting the **Compare images** button at the top of the list.
  { .tip }
@z

@x
- The tag version or image digest. Clicking the link for version opens [the image layer view](#image-details-view).
- The [environments](./integrations/environment/_index.md) that the image is assigned to.
- The operating system and architecture of the image.
- The vulnerabilities for the tag version.
- The last push for the tag version.
- The base image and version used by the repository and the vulnerabilities for that version.
@y
- The tag version or image digest. Clicking the link for version opens [the image layer view](#image-details-view).
- The [environments](./integrations/environment/_index.md) that the image is assigned to.
- The operating system and architecture of the image.
- The vulnerabilities for the tag version.
- The last push for the tag version.
- The base image and version used by the repository and the vulnerabilities for that version.
@z

@x
#### Compare images
@y
#### Compare images
@z

@x
You can compare two or more images in the list. Mark the image versions that
you want to compare, and select **Compare images**.
@y
You can compare two or more images in the list. Mark the image versions that
you want to compare, and select **Compare images**.
@z

@x
The top section of the comparison view shows an overview of the two selected
image tags. The tabs section of the view shows the following:
@y
The top section of the comparison view shows an overview of the two selected
image tags. The tabs section of the view shows the following:
@z

@x
- Select the **Packages** tab to see packages added, removed, or changed in each image. Each entry in the table shows the differences between the versions and vulnerabilities in each image. Select the disclosure triangle next to a package to see more detail on the vulnerabilities changed.
- Select the **Vulnerabilities** tab to see changes to the vulnerabilities present in each image.
@y
- Select the **Packages** tab to see packages added, removed, or changed in each image. Each entry in the table shows the differences between the versions and vulnerabilities in each image. Select the disclosure triangle next to a package to see more detail on the vulnerabilities changed.
- Select the **Vulnerabilities** tab to see changes to the vulnerabilities present in each image.
@z

@x
### Image details view
@y
### Image details view
@z

@x
Selecting an image tag takes you to the image details view. This view contains
two tabs that let you drill down into the details of the composition and
policy compliance for the image: **Policy status** and **Image layers**.
@y
Selecting an image tag takes you to the image details view. This view contains
two tabs that let you drill down into the details of the composition and
policy compliance for the image: **Policy status** and **Image layers**.
@z

@x
{{< tabs >}}
{{< tab name="Policy status" >}}
@y
{{< tabs >}}
{{< tab name="Policy status" >}}
@z

@x
![Screenshot of the policy tab in the image details view](./images/dashboard-image-policies.webp?border=true)
@y
![Screenshot of the policy tab in the image details view](./images/dashboard-image-policies.webp?border=true)
@z

@x
The policy tab shows you the policy evaluation results for the image. Use the
**View details** and **View fixes** links to the right to view the full
evaluation results, and learn how to improve compliance score for non-compliant
images.
@y
The policy tab shows you the policy evaluation results for the image. Use the
**View details** and **View fixes** links to the right to view the full
evaluation results, and learn how to improve compliance score for non-compliant
images.
@z

@x
For more information about policy, see [Policy Evaluation](./policy/_index.md).
@y
For more information about policy, see [Policy Evaluation](./policy/_index.md).
@z

@x
{{< /tab >}}
{{< tab name="Image layers" >}}
@y
{{< /tab >}}
{{< tab name="Image layers" >}}
@z

@x
![Screenshot showing Docker Scout image layers](./images/dashboard-image-layers.webp?border=true)
@y
![Screenshot showing Docker Scout image layers](./images/dashboard-image-layers.webp?border=true)
@z

@x
The layer view shows a breakdown of the Docker Scout analysis, including
an overview of the digest Secure Hash Algorithms (SHA), version, the image hierarchy (base images), image
layers, packages, and vulnerabilities.
@y
The layer view shows a breakdown of the Docker Scout analysis, including
an overview of the digest Secure Hash Algorithms (SHA), version, the image hierarchy (base images), image
layers, packages, and vulnerabilities.
@z

@x
> **Note**
>
> You can find more details on the elements in the image layer view in [the image details view docs](./image-details-view.md).
@y
> **Note**
>
> You can find more details on the elements in the image layer view in [the image details view docs](./image-details-view.md).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Policies
@y
## Policies
@z

@x
![A screenshot of the Docker Scout policies view](./images/dashboard-policies-view.webp?border=true)
@y
![A screenshot of the Docker Scout policies view](./images/dashboard-policies-view.webp?border=true)
@z

@x
The **Policies** view shows a breakdown of policy compliance for all of the
images in the selected organization and environment. You can use the **Image**
drop-down menu to view a policy breakdown for a specific environment.
@y
The **Policies** view shows a breakdown of policy compliance for all of the
images in the selected organization and environment. You can use the **Image**
drop-down menu to view a policy breakdown for a specific environment.
@z

@x
For more information about policies, see [Policy Evaluation](./policy/_index.md).
@y
For more information about policies, see [Policy Evaluation](./policy/_index.md).
@z

@x
## Base images
@y
## Base images
@z

@x
![A screenshot of the Docker Scout view showing base images used](./images/dashboard-base-images.webp?border=true)
@y
![A screenshot of the Docker Scout view showing base images used](./images/dashboard-base-images.webp?border=true)
@z

@x
The **Base images** view shows all base images used by repositories in an organization.
@y
The **Base images** view shows all base images used by repositories in an organization.
@z

@x
Each entry in the list shows the following details:
@y
Each entry in the list shows the following details:
@z

@x
- The base image name.
- The versions of the base image used by images in the organization.
- The number of images that use the base image. Selecting the link opens [the list of images that use the base image view](#images-using-base-image).
- The number of packages in the base image.
@y
- The base image name.
- The versions of the base image used by images in the organization.
- The number of images that use the base image. Selecting the link opens [the list of images that use the base image view](#images-using-base-image).
- The number of packages in the base image.
@z

@x
### Images using base image
@y
### Images using base image
@z

@x
The **Images** tab shows all images in an organization that use a specific base image.
@y
The **Images** tab shows all images in an organization that use a specific base image.
@z

@x
Each entry in the list shows the following details:
@y
Each entry in the list shows the following details:
@z

@x
- The repository name. Selecting the link opens [the list of tags for the repository](#repository-tag-list).
- The most recent tag of the image and its vulnerabilities. Selecting the link for the tag opens [the Image layer detail view](#image-details-view) for the repository.
- The operating system and architecture of the image.
- The base image tag used by the repository. Selecting the link opens [the image layer detail view](#image-details-view) for that version.
- The current base image digest for the repository.
- The date of the last push for the repository.
@y
- The repository name. Selecting the link opens [the list of tags for the repository](#repository-tag-list).
- The most recent tag of the image and its vulnerabilities. Selecting the link for the tag opens [the Image layer detail view](#image-details-view) for the repository.
- The operating system and architecture of the image.
- The base image tag used by the repository. Selecting the link opens [the image layer detail view](#image-details-view) for that version.
- The current base image digest for the repository.
- The date of the last push for the repository.
@z

@x
## Packages
@y
## Packages
@z

@x
The **Packages** view shows all packages across repositories in an organization.
@y
The **Packages** view shows all packages across repositories in an organization.
@z

@x
Each entry in the list shows the following details:
@y
Each entry in the list shows the following details:
@z

@x
- The package name.
- The package type.
- The versions of the package used by images in the organization.
- The number of images that use the package.
@y
- The package name.
- The package type.
- The versions of the package used by images in the organization.
- The number of images that use the package.
@z

@x
## Vulnerabilities
@y
## Vulnerabilities
@z

@x
The **Vulnerabilities** view shows a list of all vulnerabilities from images in
the organization. You can sort and filter the list by severity and search for
Common Vulnerabilities and Exposures (CVE) ID using the search box.
@y
The **Vulnerabilities** view shows a list of all vulnerabilities from images in
the organization. You can sort and filter the list by severity and search for
Common Vulnerabilities and Exposures (CVE) ID using the search box.
@z

@x
Each entry in the list shows the following details:
@y
Each entry in the list shows the following details:
@z

@x
- Severity of the vulnerability.
@y
- Severity of the vulnerability.
@z

@x
  > **Note**
  >
  > Docker Scout bases the calculation behind this severity level on a variety
  > of sources.
@y
  > **Note**
  >
  > Docker Scout bases the calculation behind this severity level on a variety
  > of sources.
@z

@x
- The severity of the vulnerability.
- The vulnerability CVE ID. Selecting the link for the CVE ID opens [the vulnerability details page](#vulnerability-details-page).
- The package name and version affected by this CVE.
- The Common Vulnerability Scoring System (CVSS) score for the vulnerability. Docker Scout shows the highest CVSS score from multiple sources.
- The number of images in the organization that use the package affected by this CVE. Selecting this link opens the [vulnerability details page](#vulnerability-details-page).
- If Docker Scout knows of a fix for the vulnerability, and if so, the package version of the fix.
@y
- The severity of the vulnerability.
- The vulnerability CVE ID. Selecting the link for the CVE ID opens [the vulnerability details page](#vulnerability-details-page).
- The package name and version affected by this CVE.
- The Common Vulnerability Scoring System (CVSS) score for the vulnerability. Docker Scout shows the highest CVSS score from multiple sources.
- The number of images in the organization that use the package affected by this CVE. Selecting this link opens the [vulnerability details page](#vulnerability-details-page).
- If Docker Scout knows of a fix for the vulnerability, and if so, the package version of the fix.
@z

@x
### Vulnerability details page
@y
### Vulnerability details page
@z

@x
The vulnerability details page shows detailed information about a particular
CVE. This page is a publicly open page. You can share the link to a particular
CVE description with other people even if they're not a member of your Docker
organization.
@y
The vulnerability details page shows detailed information about a particular
CVE. This page is a publicly open page. You can share the link to a particular
CVE description with other people even if they're not a member of your Docker
organization.
@z

@x
The page shows the following information:
@y
The page shows the following information:
@z

@x
- The CVE ID and severity.
- A description of the vulnerability.
- The number of packages affected by the vulnerability.
- The vulnerability publish date.
@y
- The CVE ID and severity.
- A description of the vulnerability.
- The number of packages affected by the vulnerability.
- The vulnerability publish date.
@z

@x
Following this information is a list of all repositories affected by the
vulnerability, searchable by image name. Each entry in the list shows the
following details:
@y
Following this information is a list of all repositories affected by the
vulnerability, searchable by image name. Each entry in the list shows the
following details:
@z

@x
- The repository name. Selecting the link for the repository name opens [the repository tag list view](#repository-tag-list).
- The current tag version of the image. Selecting the link for the tag name opens [the repository tag list layer view](#image-details-view).
- The date the image was last pushed.
- The registry where the image is stored.
- The affected package name and version in the image.
@y
- The repository name. Selecting the link for the repository name opens [the repository tag list view](#repository-tag-list).
- The current tag version of the image. Selecting the link for the tag name opens [the repository tag list layer view](#image-details-view).
- The date the image was last pushed.
- The registry where the image is stored.
- The affected package name and version in the image.
@z

@x
## Settings
@y
## Settings
@z

@x
The settings menu under the drop-down in the website header contains link to go
to the [Integrations](#integrations) page and [Repository
settings](#repository-settings).
@y
The settings menu under the drop-down in the website header contains link to go
to the [Integrations](#integrations) page and [Repository
settings](#repository-settings).
@z

@x
### Integrations
@y
### Integrations
@z

@x
The **Integrations** page lets you create and manage your Docker Scout
integrations, such as environment integrations and registry integrations. For
more information on how to get started with integrations, see [Integrating
Docker Scout with other systems](./integrations/_index.md).
@y
The **Integrations** page lets you create and manage your Docker Scout
integrations, such as environment integrations and registry integrations. For
more information on how to get started with integrations, see [Integrating
Docker Scout with other systems](./integrations/_index.md).
@z

@x
### Repository settings
@y
### Repository settings
@z

@x
The **Repository settings** is where you enable and disable Docker Scout for
repositories in your organization.
@y
The **Repository settings** is where you enable and disable Docker Scout for
repositories in your organization.
@z

@x
To enable repositories, select the checkboxes for the repositories on which you
want to enable Docker Scout analysis and select **Enable image analysis**.
@y
To enable repositories, select the checkboxes for the repositories on which you
want to enable Docker Scout analysis and select **Enable image analysis**.
@z

@x
When you enable image analysis for a repository, Docker Scout analyzes new tags
automatically when you push to that repository.
@y
When you enable image analysis for a repository, Docker Scout analyzes new tags
automatically when you push to that repository.
@z

@x
Disable Docker Scout analysis on selected repositories by selecting **Disable
image analysis**.
@y
Disable Docker Scout analysis on selected repositories by selecting **Disable
image analysis**.
@z
