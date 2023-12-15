%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: View Docker Scout policy status
description: |
  The Docker Scout Dashboard and the `docker scout policy` command lets you
  view policy status of images.
keywords: scout, policy, status, vulnerabilities, supply chain, cves, licenses
---
@y
---
title: View Docker Scout policy status
description: |
  The Docker Scout Dashboard and the `docker scout policy` command lets you
  view policy status of images.
keywords: scout, policy, status, vulnerabilities, supply chain, cves, licenses
---
@z

@x
> **Early Access**
>
> Policy Evaluation is an [Early Access](/release-lifecycle/#early-access-ea)
> feature of Docker Scout.
{ .restricted }
@y
> **Early Access**
>
> Policy Evaluation is an [Early Access](/release-lifecycle/#early-access-ea)
> feature of Docker Scout.
{ .restricted }
@z

@x
You can track policy status for your artifacts from the [Docker Scout
Dashboard](#dashboard), or using the [CLI](#cli).
@y
You can track policy status for your artifacts from the [Docker Scout
Dashboard](#dashboard), or using the [CLI](#cli).
@z

@x
## Dashboard
@y
## Dashboard
@z

@x
The **Overview** tab of the [Docker Scout Dashboard](https://scout.docker.com/)
displays a summary of recent changes in policy for your repositories.
This summary shows images that have seen the most change in their policy
evaluation between the most recent image and the previous image.
@y
The **Overview** tab of the [Docker Scout Dashboard](https://scout.docker.com/)
displays a summary of recent changes in policy for your repositories.
This summary shows images that have seen the most change in their policy
evaluation between the most recent image and the previous image.
@z

@x
![Policy overview](../images/policy-overview.webp)
@y
![Policy overview](../images/policy-overview.webp)
@z

@x
### Policy status per repository
@y
### Policy status per repository
@z

@x
The **Images** tab shows the current policy status, and recent policy trend,
for all images in the selected environment. The **Policy status** column in the
list shows:
@y
The **Images** tab shows the current policy status, and recent policy trend,
for all images in the selected environment. The **Policy status** column in the
list shows:
@z

@x
- Number of fulfilled policies versus the total number of policies
- Recent policy trends
@y
- Number of fulfilled policies versus the total number of policies
- Recent policy trends
@z

@x
![Policy status in the image list](../images/policy-image-list.webp)
@y
![Policy status in the image list](../images/policy-image-list.webp)
@z

@x
The policy trend, denoted by the directional arrows, indicates whether an image
is better, worse, or unchanged in terms of policy, compared to the previous
image in the same environment.
@y
The policy trend, denoted by the directional arrows, indicates whether an image
is better, worse, or unchanged in terms of policy, compared to the previous
image in the same environment.
@z

@x
- The green arrow pointing upwards shows the number of policies that got better
  in the latest pushed image.
- The red arrow pointing downwards shows the number of policies that got worse
  in the latest pushed image.
- The bidirectional gray arrow shows the number of policies that were unchanged
  in the latest version of this image.
@y
- The green arrow pointing upwards shows the number of policies that got better
  in the latest pushed image.
- The red arrow pointing downwards shows the number of policies that got worse
  in the latest pushed image.
- The bidirectional gray arrow shows the number of policies that were unchanged
  in the latest version of this image.
@z

@x
If you select a repository, you can open the **Policy** tab for a detailed
description of the policy delta for the most recently analyzed image and its
predecessor.
@y
If you select a repository, you can open the **Policy** tab for a detailed
description of the policy delta for the most recently analyzed image and its
predecessor.
@z

@x
### Detailed results and remediation
@y
### Detailed results and remediation
@z

@x
To view the full evaluation results for an image, navigate to the image tag in
the Docker Scout Dashboard and open the **Policy** tab. This shows a breakdown
for all policy violations for the current image.
@y
To view the full evaluation results for an image, navigate to the image tag in
the Docker Scout Dashboard and open the **Policy** tab. This shows a breakdown
for all policy violations for the current image.
@z

@x
![Detailed Policy Evaluation results](../images/policy-detailed-results.webp)
@y
![Detailed Policy Evaluation results](../images/policy-detailed-results.webp)
@z

@x
This view also provides recommendations on how to improve improve policy status
for violated policies.
@y
This view also provides recommendations on how to improve improve policy status
for violated policies.
@z

@x
![Policy details in the tag view](../images/policy-tag-view.webp)
@y
![Policy details in the tag view](../images/policy-tag-view.webp)
@z

@x
For vulnerability-related policies, the policy details view displays the fix
version that removes the vulnerability, when a fix version is available. To fix
the issue, upgrade the package version to the fix version.
@y
For vulnerability-related policies, the policy details view displays the fix
version that removes the vulnerability, when a fix version is available. To fix
the issue, upgrade the package version to the fix version.
@z

@x
For licensing-related policies, the list shows all packages whose license
doesn't meet the policy criteria. To fix the issue, find a way to remove the
dependency to the violating package, for example by looking for an alternative
package distributed under a more appropriate license.
@y
For licensing-related policies, the list shows all packages whose license
doesn't meet the policy criteria. To fix the issue, find a way to remove the
dependency to the violating package, for example by looking for an alternative
package distributed under a more appropriate license.
@z

@x
## CLI
@y
## CLI
@z

@x
To view policy status for an image from the CLI, use the `docker scout policy`
command.
@y
To view policy status for an image from the CLI, use the `docker scout policy`
command.
@z

@x
```console
$ docker scout policy \
  --org dockerscoutpolicy \
  --platform linux/amd64 \
  dockerscoutpolicy/email-api-service:0.0.2
@y
```console
$ docker scout policy \
  --org dockerscoutpolicy \
  --platform linux/amd64 \
  dockerscoutpolicy/email-api-service:0.0.2
@z

@x
Image reference: dockerscoutpolicy/email-api-service:0.0.2
Digest: sha256:17b1fde0329c71af302b6391fc73a08f56cb8c33e7eea7a33b61a24cedbf2b69
Platform: linux/amd64
@y
Image reference: dockerscoutpolicy/email-api-service:0.0.2
Digest: sha256:17b1fde0329c71af302b6391fc73a08f56cb8c33e7eea7a33b61a24cedbf2b69
Platform: linux/amd64
@z

@x
## Overview
@y
## Overview
@z

@x
Policy status:  FAILED  (1/3 policies violated)
@y
Policy status:  FAILED  (1/3 policies violated)
@z

@x
                      Policy                     │      Results       
─────────────────────────────────────────────────┼────────────────────
  ✓ Critical and high vulnerabilities with fixes │ 0 vulnerabilities  
  ✗ Critical vulnerabilities                     │    1C              
  ✓ Packages with GPL3+ licenses                 │ 0 packages         
@y
                      Policy                     │      Results       
─────────────────────────────────────────────────┼────────────────────
  ✓ Critical and high vulnerabilities with fixes │ 0 vulnerabilities  
  ✗ Critical vulnerabilities                     │    1C              
  ✓ Packages with GPL3+ licenses                 │ 0 packages         
@z

@x
## "Critical vulnerabilities" policy evaluation results
@y
## "Critical vulnerabilities" policy evaluation results
@z

@x
  Vulnerability  │  Severity  │                     Current package version                     │ Fix version  
─────────────────┼────────────┼─────────────────────────────────────────────────────────────────┼──────────────
  CVE-2022-48174 │  CRITICAL  │ pkg:apk/alpine/busybox@1.36.1-r0?os_name=alpine&os_version=3.18 │ 1.36.1-r1
```
@y
  Vulnerability  │  Severity  │                     Current package version                     │ Fix version  
─────────────────┼────────────┼─────────────────────────────────────────────────────────────────┼──────────────
  CVE-2022-48174 │  CRITICAL  │ pkg:apk/alpine/busybox@1.36.1-r0?os_name=alpine&os_version=3.18 │ 1.36.1-r1
```
@z

@x
For more information about the command, refer to the [CLI
reference](../../engine/reference/commandline/scout_policy.md).
@y
For more information about the command, refer to the [CLI
reference](../../engine/reference/commandline/scout_policy.md).
@z
