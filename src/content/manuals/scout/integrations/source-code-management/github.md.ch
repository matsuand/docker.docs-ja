%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Integrate Docker Scout with GitHub
linkTitle: GitHub
description: Integrate Docker Scout using the GitHub app to get remediation advice directly in your repositories
keywords: scout, github, integration, image analysis, supply chain, remediation, source code
@y
title: Integrate Docker Scout with GitHub
linkTitle: GitHub
description: Integrate Docker Scout using the GitHub app to get remediation advice directly in your repositories
keywords: scout, github, integration, image analysis, supply chain, remediation, source code
@z

@x
{{< summary-bar feature_name="Docker Scout GitHub" >}}
@y
{{< summary-bar feature_name="Docker Scout GitHub" >}}
@z

@x
The GitHub app integration for Docker Scout grants Docker Scout access to your
source code repository on GitHub. This improved visibility into how your image
gets created means Docker Scout can give you automated and contextual
remediation advice.
@y
The GitHub app integration for Docker Scout grants Docker Scout access to your
source code repository on GitHub. This improved visibility into how your image
gets created means Docker Scout can give you automated and contextual
remediation advice.
@z

@x
## How it works
@y
## How it works
@z

@x
When you enable the GitHub integration, Docker Scout can make a direct link
between the image analysis results and the source.
@y
When you enable the GitHub integration, Docker Scout can make a direct link
between the image analysis results and the source.
@z

@x
When analyzing your image, Docker Scout checks for [provenance
attestations](/manuals/build/metadata/attestations/slsa-provenance.md) to detect the
location of the source code repository for the image. If the source location is
found, and you've enabled the GitHub app, Docker Scout parses the Dockerfile
used to create the image.
@y
When analyzing your image, Docker Scout checks for [provenance
attestations](manuals/build/metadata/attestations/slsa-provenance.md) to detect the
location of the source code repository for the image. If the source location is
found, and you've enabled the GitHub app, Docker Scout parses the Dockerfile
used to create the image.
@z

@x
Parsing the Dockerfile reveals the base image tag used to build the image. By
knowing the base image tags used, Docker Scout can detect whether the tag is
outdated, meaning it's been changed to a different image digest. For example,
say you're using `alpine:3.18` as your base image, and at a later point in
time, the image maintainers release a patch version for version `3.18`,
containing security fixes. The `alpine:3.18` tag you've been using becomes
out-of-date; the `alpine:3.18` you're using is no longer the latest.
@y
Parsing the Dockerfile reveals the base image tag used to build the image. By
knowing the base image tags used, Docker Scout can detect whether the tag is
outdated, meaning it's been changed to a different image digest. For example,
say you're using `alpine:3.18` as your base image, and at a later point in
time, the image maintainers release a patch version for version `3.18`,
containing security fixes. The `alpine:3.18` tag you've been using becomes
out-of-date; the `alpine:3.18` you're using is no longer the latest.
@z

@x
When this happens, Docker Scout detects the discrepancy and surfaces it through
the [Up-to-Date Base Images policy](/manuals/scout/policy/_index.md#up-to-date-base-images-policy).
When the GitHub integration's enabled, you'll also get automated suggestions on
how to update your base image. For more information about how Docker Scout can
help you automatically improve your supply chain conduct and security posture,
see [Remediation](../../policy/remediation.md).
@y
When this happens, Docker Scout detects the discrepancy and surfaces it through
the [Up-to-Date Base Images policy](manuals/scout/policy/_index.md#up-to-date-base-images-policy).
When the GitHub integration's enabled, you'll also get automated suggestions on
how to update your base image. For more information about how Docker Scout can
help you automatically improve your supply chain conduct and security posture,
see [Remediation](../../policy/remediation.md).
@z

@x
## Setup
@y
## Setup
@z

@x
To integrate Docker Scout with your GitHub organization:
@y
To integrate Docker Scout with your GitHub organization:
@z

@x
1. Go to [GitHub integration](https://scout.docker.com/settings/integrations/github/)
   on the Docker Scout Dashboard.
2. Select the **Integrate GitHub app** button to open GitHub.
3. Select the organization that you want to integrate.
4. Select whether you want to integrate all repositories in the GitHub
   organization or a manual selection of repositories.
5. Select **Install & Authorize** to add the Docker Scout app to the
   organization.
@y
1. Go to [GitHub integration](https://scout.docker.com/settings/integrations/github/)
   on the Docker Scout Dashboard.
2. Select the **Integrate GitHub app** button to open GitHub.
3. Select the organization that you want to integrate.
4. Select whether you want to integrate all repositories in the GitHub
   organization or a manual selection of repositories.
5. Select **Install & Authorize** to add the Docker Scout app to the
   organization.
@z

@x
   This redirects you back to the Docker Scout Dashboard, which lists your
   active GitHub integrations.
@y
   This redirects you back to the Docker Scout Dashboard, which lists your
   active GitHub integrations.
@z

@x
The GitHub integration is now active.
@y
The GitHub integration is now active.
@z
