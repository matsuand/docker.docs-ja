%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Remediation with Docker Scout
description: Learn how Docker Scout can help you improve your software quality automatically, using remediation
keywords: scout, supply chain, security, remediation, automation
@y
title: Remediation with Docker Scout
description: Learn how Docker Scout can help you improve your software quality automatically, using remediation
keywords: scout, supply chain, security, remediation, automation
@z

@x
{{% experimental title="Beta feature" %}}
Remediation with Docker Scout is currently in [Beta](../../release-lifecycle.md#Beta).
{{% /experimental %}}
@y
{{% experimental title="Beta feature" %}}
Remediation with Docker Scout is currently in [Beta](../../release-lifecycle.md#Beta).
{{% /experimental %}}
@z

@x
Docker Scout helps you remediate supply chain or security issues by providing
recommendations based on policy evaluation results. Recommendations are
suggested actions you can take that improve policy compliance, or that add
metadata to images which enables Docker Scout to provide better evaluation
results and recommendations.
@y
Docker Scout helps you remediate supply chain or security issues by providing
recommendations based on policy evaluation results. Recommendations are
suggested actions you can take that improve policy compliance, or that add
metadata to images which enables Docker Scout to provide better evaluation
results and recommendations.
@z

@x
Docker Scout provides remediation advice for the following policies:
@y
Docker Scout provides remediation advice for the following policies:
@z

@x
- [No outdated base images](#no-outdated-base-image-remediation)
- [Supply chain attestations](#supply-chain-attestations-remediation)
@y
- [No outdated base images](#no-outdated-base-image-remediation)
- [Supply chain attestations](#supply-chain-attestations-remediation)
@z

@x
For images that violate policy, the recommendations focus on addressing
compliance issues and fixing violations. For images where Docker Scout is
unable to determine compliance, recommendations show you how to meet the
prerequisites that ensure Docker Scout can successfully evaluate the policy.
@y
For images that violate policy, the recommendations focus on addressing
compliance issues and fixing violations. For images where Docker Scout is
unable to determine compliance, recommendations show you how to meet the
prerequisites that ensure Docker Scout can successfully evaluate the policy.
@z

@x
## View recommendations
@y
## View recommendations
@z

@x
Recommendations appear on the policy details pages of the Docker Scout
Dashboard. To get to this page:
@y
Recommendations appear on the policy details pages of the Docker Scout
Dashboard. To get to this page:
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select a policy in the list.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select a policy in the list.
@z

@x
The policy details page groups evaluation results into two different tabs
depending on the policy status:
@y
The policy details page groups evaluation results into two different tabs
depending on the policy status:
@z

@x
- Violations
- Compliance unknown
@y
- Violations
- Compliance unknown
@z

@x
The **Violations** tab lists images that don't comply with the selected policy.
The **Compliance unknown** tab lists images that Docker Scout is unable to
determine the compliance status for. When compliance is unknown, Docker Scout
needs more information about the image.
@y
The **Violations** tab lists images that don't comply with the selected policy.
The **Compliance unknown** tab lists images that Docker Scout is unable to
determine the compliance status for. When compliance is unknown, Docker Scout
needs more information about the image.
@z

@x
To view recommended actions for an image, hover over one of the images in the
list to reveal a **View fixes** button.
@y
To view recommended actions for an image, hover over one of the images in the
list to reveal a **View fixes** button.
@z

@x
![Remediation for policy violations](../images/remediation.png)
@y
![Remediation for policy violations](../images/remediation.png)
@z

@x
Select the **View fixes** button to opens the remediation side panel containing
recommended actions for your image.
@y
Select the **View fixes** button to opens the remediation side panel containing
recommended actions for your image.
@z

@x
If there are more than one recommendations available, the primary
recommendation displays as the **Recommended fix**. Additional recommendations
are listed as **Quick fixes**. Quick fixes are usually actions that provide a
temporary solution.
@y
If there are more than one recommendations available, the primary
recommendation displays as the **Recommended fix**. Additional recommendations
are listed as **Quick fixes**. Quick fixes are usually actions that provide a
temporary solution.
@z

@x
The side panel may also contain one or more help sections related to the
available recommendations.
@y
The side panel may also contain one or more help sections related to the
available recommendations.
@z

@x
## No outdated base image remediation
@y
## No outdated base image remediation
@z

@x
The **No outdated base images** policy checks whether the base image you use is
up-to-date. The recommended actions displayed in the remediation side panel
depend on how much information Docker Scout has about your image. The more
information that's available, the better the recommendations.
@y
The **No outdated base images** policy checks whether the base image you use is
up-to-date. The recommended actions displayed in the remediation side panel
depend on how much information Docker Scout has about your image. The more
information that's available, the better the recommendations.
@z

@x
The following scenarios outline the different recommendations depending on the
information available about the image.
@y
The following scenarios outline the different recommendations depending on the
information available about the image.
@z

@x
### No provenance attestations
@y
### No provenance attestations
@z

@x
For Docker Scout to be able to evaluate this policy, you must add [provenance
attestations](/manuals/build/metadata/attestations/slsa-provenance.md) to your image. If
your image doesn't have provenance attestations, compliance is undeterminable.
@y
For Docker Scout to be able to evaluate this policy, you must add [provenance
attestations](manuals/build/metadata/attestations/slsa-provenance.md) to your image. If
your image doesn't have provenance attestations, compliance is undeterminable.
@z

@x
<!--
  TODO(dvdksn): no support for the following, yet
@y
<!--
  TODO(dvdksn): no support for the following, yet
@z

@x
  When provenance attestations are unavailable, Docker Scout provides generic,
  best-effort recommendations in the remediation side panel. These
  recommendations estimate your base using information from image analysis
  results. The base image version is unknown, but you can manually select the
  version you use in the remediation side panel. This lets Docker Scout evaluate
  whether the base image detected in the image analysis is up-to-date with the
  version you selected.
@y
  When provenance attestations are unavailable, Docker Scout provides generic,
  best-effort recommendations in the remediation side panel. These
  recommendations estimate your base using information from image analysis
  results. The base image version is unknown, but you can manually select the
  version you use in the remediation side panel. This lets Docker Scout evaluate
  whether the base image detected in the image analysis is up-to-date with the
  version you selected.
@z

@x
  https://github.com/docker/docs/pull/18961#discussion_r1447186845
-->
@y
  https://github.com/docker/docs/pull/18961#discussion_r1447186845
-->
@z

@x
### Provenance attestations available
@y
### Provenance attestations available
@z

@x
With provenance attestations added, Docker Scout can correctly detect the base
image version that you're using. The version found in the attestations is
cross-referenced against the current version of the corresponding tag to
determine if it's up-to-date.
@y
With provenance attestations added, Docker Scout can correctly detect the base
image version that you're using. The version found in the attestations is
cross-referenced against the current version of the corresponding tag to
determine if it's up-to-date.
@z

@x
If there's a policy violation, the recommended actions show how to update your
base image version to the latest version, while also pinning the base image
version to a specific digest. For more information, see [Pin base image
versions](/manuals/build/building/best-practices.md#pin-base-image-versions).
@y
If there's a policy violation, the recommended actions show how to update your
base image version to the latest version, while also pinning the base image
version to a specific digest. For more information, see [Pin base image
versions](manuals/build/building/best-practices.md#pin-base-image-versions).
@z

@x
### GitHub integration enabled
@y
### GitHub integration enabled
@z

@x
If you're hosting the source code for your image on GitHub, you can enable the
[GitHub integration](../integrations/source-code-management/github.md). This
integration enables Docker Scout to provide even more useful remediation
advice, and lets you initiate remediation for violations directly from the
Docker Scout Dashboard.
@y
If you're hosting the source code for your image on GitHub, you can enable the
[GitHub integration](../integrations/source-code-management/github.md). This
integration enables Docker Scout to provide even more useful remediation
advice, and lets you initiate remediation for violations directly from the
Docker Scout Dashboard.
@z

@x
With the GitHub integration enabled, you can use the remediation side panel to
raise a pull request on the GitHub repository of the image. The pull request
automatically updates the base image version in your Dockerfile to the
up-to-date version.
@y
With the GitHub integration enabled, you can use the remediation side panel to
raise a pull request on the GitHub repository of the image. The pull request
automatically updates the base image version in your Dockerfile to the
up-to-date version.
@z

@x
This automated remediation pins your base image to a specific digest, while
helping you stay up-to-date as new versions become available. Pinning the base
image to a digest is important for reproducibility, and helps avoid unwanted
changes from making their way into your supply chain.
@y
This automated remediation pins your base image to a specific digest, while
helping you stay up-to-date as new versions become available. Pinning the base
image to a digest is important for reproducibility, and helps avoid unwanted
changes from making their way into your supply chain.
@z

@x
For more information about base image pinning, see [Pin base image
versions](/manuals/build/building/best-practices.md#pin-base-image-versions).
@y
For more information about base image pinning, see [Pin base image
versions](manuals/build/building/best-practices.md#pin-base-image-versions).
@z

@x
<!--
  TODO(dvdksn): no support for the following, yet
@y
<!--
  TODO(dvdksn): no support for the following, yet
@z

@x
  Enabling the GitHub integration also allows Docker Scout to visualize the
  remediation workflow in the Docker Scout Dashboard. Each step, from the pull
  request being raised to the image being deployed to an environment, is
  displayed in the remediation sidebar when inspecting the image.
@y
  Enabling the GitHub integration also allows Docker Scout to visualize the
  remediation workflow in the Docker Scout Dashboard. Each step, from the pull
  request being raised to the image being deployed to an environment, is
  displayed in the remediation sidebar when inspecting the image.
@z

@x
  https://github.com/docker/docs/pull/18961#discussion_r1447189475
-->
@y
  https://github.com/docker/docs/pull/18961#discussion_r1447189475
-->
@z

@x
## Supply chain attestations remediation
@y
## Supply chain attestations remediation
@z

@x
The **Supply chain attestations** policy requires full provenance and SBOM
attestations on images. If your image is missing an attestation, or if an
attestation doesn't contain enough information, the policy is violated.
@y
The **Supply chain attestations** policy requires full provenance and SBOM
attestations on images. If your image is missing an attestation, or if an
attestation doesn't contain enough information, the policy is violated.
@z

@x
The recommendations available in the remediation side panel helps guide you to
what action you need to take to address the issues. For example, if your image
has a provenance attestation, but the attestation doesn't contain enough
information, you're recommended to re-build your image with
[`mode=max`](/manuals/build/metadata/attestations/slsa-provenance.md#max) provenance.
@y
The recommendations available in the remediation side panel helps guide you to
what action you need to take to address the issues. For example, if your image
has a provenance attestation, but the attestation doesn't contain enough
information, you're recommended to re-build your image with
[`mode=max`](manuals/build/metadata/attestations/slsa-provenance.md#max) provenance.
@z
