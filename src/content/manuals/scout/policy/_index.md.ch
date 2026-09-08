%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Policy Evaluation
linkTitle: Policy Evaluation
@y
title: Policy Evaluation
linkTitle: Policy Evaluation
@z

@x
keywords: scout, supply chain, vulnerabilities, packages, cves, policy
description: |
  Policy Evaluation in Docker Scout lets you define supply chain rules for your
  artifacts and evaluate image compliance
@y
keywords: scout, supply chain, vulnerabilities, packages, cves, policy
description: |
  Policy Evaluation in Docker Scout lets you define supply chain rules for your
  artifacts and evaluate image compliance
@z

@x
Policy Evaluation in Docker Scout lets you define supply chain rules for your
artifacts and evaluate compliance using the `docker scout policy` command. Run
evaluations locally, in CI pipelines, with custom Rego policies, or using OCI
bundles. See [Evaluate policies](./local.md).
@y
Policy Evaluation in Docker Scout lets you define supply chain rules for your
artifacts and evaluate compliance using the `docker scout policy` command. Run
evaluations locally, in CI pipelines, with custom Rego policies, or using OCI
bundles. See [Evaluate policies](./local.md).
@z

@x
## How Policy Evaluation works
@y
## How Policy Evaluation works
@z

@x
When you run `docker scout policy`, the CLI indexes the image into an SBOM and
enriches it with CVE and VEX data. It then evaluates each configured policy
in-process against that data. No data is sent to the Scout service, and an
organization is not required for most use cases.
@y
When you run `docker scout policy`, the CLI indexes the image into an SBOM and
enriches it with CVE and VEX data. It then evaluates each configured policy
in-process against that data. No data is sent to the Scout service, and an
organization is not required for most use cases.
@z

@x
A policy defines image quality criteria your artifacts should meet. For
example, the **No copyleft licenses** policy flags any image containing
packages distributed under a copyleft license. If an image contains such a
package, it's non-compliant with that policy.
@y
A policy defines image quality criteria your artifacts should meet. For
example, the **No copyleft licenses** policy flags any image containing
packages distributed under a copyleft license. If an image contains such a
package, it's non-compliant with that policy.
@z

@x
## Policy types
@y
## Policy types
@z

@x
Docker Scout includes the following built-in policy types:
@y
Docker Scout includes the following built-in policy types:
@z

@x
- [Severity-Based Vulnerability](#severity-based-vulnerability)
- [Compliant Licenses](#compliant-licenses)
- [Up-to-Date Base Images](#up-to-date-base-images)
- [High-Profile Vulnerabilities](#high-profile-vulnerabilities)
- [Supply Chain Attestations](#supply-chain-attestations)
- [Default Non-Root User](#default-non-root-user)
- [Approved Base Images](#approved-base-images)
@y
- [Severity-Based Vulnerability](#severity-based-vulnerability)
- [Compliant Licenses](#compliant-licenses)
- [Up-to-Date Base Images](#up-to-date-base-images)
- [High-Profile Vulnerabilities](#high-profile-vulnerabilities)
- [Supply Chain Attestations](#supply-chain-attestations)
- [Default Non-Root User](#default-non-root-user)
- [Approved Base Images](#approved-base-images)
@z

@x
For configuration options for each policy type, see
[Evaluate policies](./local.md#configure-built-in-policies).
@y
For configuration options for each policy type, see
[Evaluate policies](./local.md#configure-built-in-policies).
@z

@x
<!-- vale Docker.HeadingSentenceCase = NO -->
@y
<!-- vale Docker.HeadingSentenceCase = NO -->
@z

@x
### Severity-Based Vulnerability
@y
### Severity-Based Vulnerability
@z

@x
The **Severity-Based Vulnerability** policy type checks whether your artifacts
are exposed to known vulnerabilities. By default, it flags critical and high
severity vulnerabilities where a fix version is available.
@y
The **Severity-Based Vulnerability** policy type checks whether your artifacts
are exposed to known vulnerabilities. By default, it flags critical and high
severity vulnerabilities where a fix version is available.
@z

@x
Configurable parameters include severity levels, a grace period for newly
disclosed CVEs, fixable-only filtering, and package type filtering.
@y
Configurable parameters include severity levels, a grace period for newly
disclosed CVEs, fixable-only filtering, and package type filtering.
@z

@x
### Compliant Licenses
@y
### Compliant Licenses
@z

@x
The **Compliant Licenses** policy type checks whether your images contain
packages distributed under an inappropriate license. You can configure the
list of licenses to flag and add package-level exceptions.
@y
The **Compliant Licenses** policy type checks whether your images contain
packages distributed under an inappropriate license. You can configure the
list of licenses to flag and add package-level exceptions.
@z

@x
### Up-to-Date Base Images
@y
### Up-to-Date Base Images
@z

@x
The **Up-to-Date Base Images** policy type checks whether the base images you
use are current. Images are non-compliant if the tag you built from points to
a different digest than what you're using.
@y
The **Up-to-Date Base Images** policy type checks whether the base images you
use are current. Images are non-compliant if the tag you built from points to
a different digest than what you're using.
@z

@x
Your images need provenance attestations for this policy to evaluate
successfully. For more information, see [No base image data](#no-base-image-data).
@y
Your images need provenance attestations for this policy to evaluate
successfully. For more information, see [No base image data](#no-base-image-data).
@z

@x
### High-Profile Vulnerabilities
@y
### High-Profile Vulnerabilities
@z

@x
The **High-Profile Vulnerabilities** policy type checks whether your images
contain vulnerabilities from a [curated list of widely recognized, high-impact
CVEs](./local.md#default-high-profile-cves), including Log4Shell, Spring4Shell,
and XZ backdoor. The list is updated as new high-profile vulnerabilities are
disclosed.
@y
The **High-Profile Vulnerabilities** policy type checks whether your images
contain vulnerabilities from a [curated list of widely recognized, high-impact
CVEs](./local.md#default-high-profile-cves), including Log4Shell, Spring4Shell,
and XZ backdoor. The list is updated as new high-profile vulnerabilities are
disclosed.
@z

@x
You can configure which CVEs are considered high-profile and enable tracking
of CISA's Known Exploited Vulnerabilities catalog.
@y
You can configure which CVEs are considered high-profile and enable tracking
of CISA's Known Exploited Vulnerabilities catalog.
@z

@x
### Supply Chain Attestations
@y
### Supply Chain Attestations
@z

@x
The **Supply Chain Attestations** policy type checks whether your images have
[SBOM](/manuals/build/metadata/attestations/sbom.md) and
[provenance](/manuals/build/metadata/attestations/slsa-provenance.md)
attestations. Images are non-compliant if they lack either attestation type.
@y
The **Supply Chain Attestations** policy type checks whether your images have
[SBOM](manuals/build/metadata/attestations/sbom.md) and
[provenance](manuals/build/metadata/attestations/slsa-provenance.md)
attestations. Images are non-compliant if they lack either attestation type.
@z

@x
To ensure compliance, build with attestations:
@y
To ensure compliance, build with attestations:
@z

% snip command...

@x
### Default Non-Root User
@y
### Default Non-Root User
@z

@x
The **Default Non-Root User** policy type detects images configured to run as
the `root` user. Use the
[`USER`](/reference/dockerfile.md#user) Dockerfile instruction to set a
non-root default user for the runtime stage.
@y
The **Default Non-Root User** policy type detects images configured to run as
the `root` user. Use the
[`USER`](reference/dockerfile.md#user) Dockerfile instruction to set a
non-root default user for the runtime stage.
@z

@x
### Approved Base Images
@y
### Approved Base Images
@z

@x
The **Approved Base Images** policy type ensures the base images you use match
a configurable allowlist of glob patterns. Images are non-compliant if the
base image reference doesn't match any of the allowed patterns.
@y
The **Approved Base Images** policy type ensures the base images you use match
a configurable allowlist of glob patterns. Images are non-compliant if the
base image reference doesn't match any of the allowed patterns.
@z

@x
Your images need provenance attestations for this policy to evaluate
successfully. For more information, see [No base image data](#no-base-image-data).
@y
Your images need provenance attestations for this policy to evaluate
successfully. For more information, see [No base image data](#no-base-image-data).
@z

@x
<!-- vale Docker.HeadingSentenceCase = YES -->
@y
<!-- vale Docker.HeadingSentenceCase = YES -->
@z

@x
## No base image data
@y
## No base image data
@z

@x
The **Up-to-Date Base Images** and **Approved Base Images** policies require
provenance attestations to determine the base image used in your build. Without
them, these policies report **No data**.
@y
The **Up-to-Date Base Images** and **Approved Base Images** policies require
provenance attestations to determine the base image used in your build. Without
them, these policies report **No data**.
@z

@x
To ensure Docker Scout always has base image information, attach provenance
attestations at build time:
@y
To ensure Docker Scout always has base image information, attach provenance
attestations at build time:
@z

% snip command...

@x
## Policies page in the Dashboard
@y
## Policies page in the Dashboard
@z

@x
> [!IMPORTANT]
>
> The `docker scout policy` command brings policy evaluation directly to your
> CLI so you can evaluate any image locally, in CI, or with custom policies
> without needing the Dashboard. The Policies page in the Dashboard is
> deprecated and will be retired on September 1, 2026. See
> [Evaluate policies](./local.md).
@y
> [!IMPORTANT]
>
> The `docker scout policy` command brings policy evaluation directly to your
> CLI so you can evaluate any image locally, in CI, or with custom policies
> without needing the Dashboard. The Policies page in the Dashboard is
> deprecated and will be retired on September 1, 2026. See
> [Evaluate policies](./local.md).
@z

@x
The Docker Scout Dashboard previously provided a visual interface for tracking
policy compliance across your organization's images. See
[Use the Policies page in the Dashboard](./dashboard.md).
@y
The Docker Scout Dashboard previously provided a visual interface for tracking
policy compliance across your organization's images. See
[Use the Policies page in the Dashboard](./dashboard.md).
@z
