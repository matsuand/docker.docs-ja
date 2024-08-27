%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Docker Scout health scores
description: |
  Docker Scout health scores provide a supply chain assessment for Docker Hub
  images, grading them from A to F based on various security policies.
keywords: scout, health scores, evaluation, checks, grades, docker hub
@y
title: Docker Scout health scores
description: |
  Docker Scout health scores provide a supply chain assessment for Docker Hub
  images, grading them from A to F based on various security policies.
keywords: scout, health scores, evaluation, checks, grades, docker hub
@z

@x
{{% restricted title="Beta" %}}
Health scores is a [Beta](/release-lifecycle/#beta) feature of Docker Scout.
The feature is only available to organizations selected to participate in the
early access program.
{{% /restricted %}}
@y
{{% restricted title="Beta" %}}
Health scores is a [Beta](__SUBDIR__/release-lifecycle/#beta) feature of Docker Scout.
The feature is only available to organizations selected to participate in the
early access program.
{{% /restricted %}}
@z

@x
Docker Scout health scores provide a security assessment, and overall supply
chain health, of images on Docker Hub, helping you determine whether an image
meets established security best practices. The scores range from A to F, where
A represents the highest level of security and F the lowest, offering an
at-a-glance view of the security posture of your images.
@y
Docker Scout health scores provide a security assessment, and overall supply
chain health, of images on Docker Hub, helping you determine whether an image
meets established security best practices. The scores range from A to F, where
A represents the highest level of security and F the lowest, offering an
at-a-glance view of the security posture of your images.
@z

@x
Only users who are members of the organization that owns the repository, and
have at least “read” access to the repository, can view the health score. The
score is not visible to users outside the organization or members without
"read" access.
@y
Only users who are members of the organization that owns the repository, and
have at least “read” access to the repository, can view the health score. The
score is not visible to users outside the organization or members without
"read" access.
@z

@x
## Scoring system
@y
## Scoring system
@z

@x
Health scores are determined by evaluating images against a set of Docker Scout
[policies](./_index.md). These policies align with best practices for
the software supply chain and are recommended by Docker as foundational
standards for images.
@y
Health scores are determined by evaluating images against a set of Docker Scout
[policies](./_index.md). These policies align with best practices for
the software supply chain and are recommended by Docker as foundational
standards for images.
@z

@x
Each policy is assigned a points value. If the image is compliant with a
policy, it is awarded the points value for that policy. The health score of an
image is calculated based on the percentage of points achieved relative to the
total possible points.
@y
Each policy is assigned a points value. If the image is compliant with a
policy, it is awarded the points value for that policy. The health score of an
image is calculated based on the percentage of points achieved relative to the
total possible points.
@z

@x
### Scoring process
@y
### Scoring process
@z

@x
1. Policy compliance is evaluated for the image.
2. Points are awarded based on adherence to these policies.
3. The points achieved percentage is calculated:
@y
1. Policy compliance is evaluated for the image.
2. Points are awarded based on adherence to these policies.
3. The points achieved percentage is calculated:
@z

% snip text...

@x
4. The final score is assigned based on the percentage of points achieved, as
   shown in the following table:
@y
4. The final score is assigned based on the percentage of points achieved, as
   shown in the following table:
@z

@x
   | Points percentage (awarded out of total) | Score |
   | ---------------------------------------- | ----- |
   | More than 90%                            | A     |
   | 71% to 90%                               | B     |
   | 51% to 70%                               | C     |
   | 31% to 50%                               | D     |
   | 11% to 30%                               | E     |
   | Less than 10%                            | F     |
@y
   | Points percentage (awarded out of total) | Score |
   | ---------------------------------------- | ----- |
   | More than 90%                            | A     |
   | 71% to 90%                               | B     |
   | 51% to 70%                               | C     |
   | 31% to 50%                               | D     |
   | 11% to 30%                               | E     |
   | Less than 10%                            | F     |
@z

@x
### Policy weights
@y
### Policy weights
@z

@x
The policies that influence the score, and their respective weights, are as follows:
@y
The policies that influence the score, and their respective weights, are as follows:
@z

@x
| Policy                                                                                                     | Points |
| ---------------------------------------------------------------------------------------------------------- | ------ |
| [No fixable critical or high vulnerabilities](/scout/policy#no-fixable-critical-or-high-vulnerabilities)   | 20     |
| [No high-profile vulnerabilities](/scout/policy#no-high-profile-vulnerabilities)                           | 20     |
| [Supply chain attestations](/scout/policy#supply-chain-attestations)                                       | 15     |
| [No unapproved base images](/scout/policy/#no-unapproved-base-images)                                      | 15     |
| [No outdated base images](/scout/policy#no-outdated-base-images)                                           | 10     |
| [Default non-root user](/scout/policy#default-non-root-user)                                               | 5      |
| [No AGPL v3 licenses](/scout/policy/_index.md#no-agpl-v3-licenses)                                         | 5      |
@y
| Policy                                                                                                     | Points |
| ---------------------------------------------------------------------------------------------------------- | ------ |
| [No fixable critical or high vulnerabilities](__SUBDIR__/scout/policy#no-fixable-critical-or-high-vulnerabilities)   | 20     |
| [No high-profile vulnerabilities](__SUBDIR__/scout/policy#no-high-profile-vulnerabilities)                           | 20     |
| [Supply chain attestations](__SUBDIR__/scout/policy#supply-chain-attestations)                                       | 15     |
| [No unapproved base images](__SUBDIR__/scout/policy/#no-unapproved-base-images)                                      | 15     |
| [No outdated base images](__SUBDIR__/scout/policy#no-outdated-base-images)                                           | 10     |
| [Default non-root user](__SUBDIR__/scout/policy#default-non-root-user)                                               | 5      |
| [No AGPL v3 licenses](scout/policy/_index.md#no-agpl-v3-licenses)                                         | 5      |
@z

@x
### Evaluation
@y
### Evaluation
@z

@x
Health scores are calculated for new images pushed to Docker Hub after the
feature is enabled. The health scores help you maintain high security standards
and ensure your applications are built on secure and reliable images.
@y
Health scores are calculated for new images pushed to Docker Hub after the
feature is enabled. The health scores help you maintain high security standards
and ensure your applications are built on secure and reliable images.
@z

@x
### Repository scores
@y
### Repository scores
@z

@x
In addition to individual image scores (per tag or digest), each repository
receives a health score based on the latest pushed tag, providing an overall
view of the repository's security status.
@y
In addition to individual image scores (per tag or digest), each repository
receives a health score based on the latest pushed tag, providing an overall
view of the repository's security status.
@z

@x
### Example
@y
### Example
@z

@x
For an image with a total possible score of 90 points:
@y
For an image with a total possible score of 90 points:
@z

@x
- If the image only deviates from one policy (for example, the Copyleft
  Licenses policy), it might score 85 out of 90, resulting in a score of A.
- If the image has fixable CVEs and other issues, it might score 65 out of 90,
  resulting in a score of B.
@y
- If the image only deviates from one policy (for example, the Copyleft
  Licenses policy), it might score 85 out of 90, resulting in a score of A.
- If the image has fixable CVEs and other issues, it might score 65 out of 90,
  resulting in a score of B.
@z

@x
## Improving your health score
@y
## Improving your health score
@z

@x
To improve the health score of an image, take steps to ensure that the image is
compliant with the Docker Scout recommended [policies](./_index.md).
@y
To improve the health score of an image, take steps to ensure that the image is
compliant with the Docker Scout recommended [policies](./_index.md).
@z

@x
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/).
2. Sign in using your Docker ID.
3. Go to [Repository settings](https://scout.docker.com/settings/repos) and
   enable Docker Scout for your Docker Hub image repositories.
4. Analyze the [policy compliance](./_index.md) for your repositories,
   and take actions to ensure your images are policy-compliant.
@y
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/).
2. Sign in using your Docker ID.
3. Go to [Repository settings](https://scout.docker.com/settings/repos) and
   enable Docker Scout for your Docker Hub image repositories.
4. Analyze the [policy compliance](./_index.md) for your repositories,
   and take actions to ensure your images are policy-compliant.
@z

@x
Since policies are weighted differently, prioritize the policies with the
highest scores for a greater impact on your image's overall score.
@y
Since policies are weighted differently, prioritize the policies with the
highest scores for a greater impact on your image's overall score.
@z
