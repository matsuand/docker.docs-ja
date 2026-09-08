%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use the Policies page in the Dashboard
linkTitle: Use the Dashboard
description: View policy status, configure policies, and get remediation advice using the Docker Scout Dashboard
keywords: scout, policy, dashboard, configure, remediation, status
@y
title: Use the Policies page in the Dashboard
linkTitle: Use the Dashboard
description: View policy status, configure policies, and get remediation advice using the Docker Scout Dashboard
keywords: scout, policy, dashboard, configure, remediation, status
@z

@x
> [!IMPORTANT]
>
> The Policies page is deprecated and will be retired on September 1, 2026.
> The `docker scout policy` command replaces this with more options for
> evaluating policies. You can run evaluations locally, in CI, against custom
> Rego policies, or using OCI bundles. See
> [Evaluate policies](./local.md).
@y
> [!IMPORTANT]
>
> The Policies page is deprecated and will be retired on September 1, 2026.
> The `docker scout policy` command replaces this with more options for
> evaluating policies. You can run evaluations locally, in CI, against custom
> Rego policies, or using OCI bundles. See
> [Evaluate policies](./local.md).
@z

@x
## View policy status
@y
## View policy status
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
### Policy status per repository
@y
### Policy status per repository
@z

@x
The **Images** tab shows the current policy status, and recent policy trend,
for all images in the selected environment. The **Policy status** column shows:
@y
The **Images** tab shows the current policy status, and recent policy trend,
for all images in the selected environment. The **Policy status** column shows:
@z

@x
- Number of fulfilled policies versus the total number of policies
- Recent policy trends
@y
- Number of fulfilled policies versus the total number of policies
- Recent policy trends
@z

@x
The policy trend, denoted by the directional arrows, indicates whether an image
is better, worse, or unchanged compared to the previous image in the same
environment.
@y
The policy trend, denoted by the directional arrows, indicates whether an image
is better, worse, or unchanged compared to the previous image in the same
environment.
@z

@x
- The green arrow pointing upwards shows the number of policies that improved.
- The red arrow pointing downwards shows the number of policies that worsened.
- The bidirectional gray arrow shows the number of policies that were unchanged.
@y
- The green arrow pointing upwards shows the number of policies that improved.
- The red arrow pointing downwards shows the number of policies that worsened.
- The bidirectional gray arrow shows the number of policies that were unchanged.
@z

@x
### Detailed results
@y
### Detailed results
@z

@x
To view the full evaluation results for an image, navigate to the image tag in
the Docker Scout Dashboard and open the **Policy** tab.
@y
To view the full evaluation results for an image, navigate to the image tag in
the Docker Scout Dashboard and open the **Policy** tab.
@z

@x
For vulnerability-related policies, the details view shows the fix version when
one is available. For licensing-related policies, the list shows all packages
whose license doesn't meet the policy criteria.
@y
For vulnerability-related policies, the details view shows the fix version when
one is available. For licensing-related policies, the list shows all packages
whose license doesn't meet the policy criteria.
@z

@x
## Configure policies
@y
## Configure policies
@z

@x
Some policy types are configurable. You can create customized versions with
your own parameters, disable a policy, or delete it.
@y
Some policy types are configurable. You can create customized versions with
your own parameters, disable a policy, or delete it.
@z

@x
> [!NOTE]
> Historic evaluation results for the default policy configuration are removed
> if you delete or customize a policy.
@y
> [!NOTE]
> Historic evaluation results for the default policy configuration are removed
> if you delete or customize a policy.
@z

@x
### Add a policy
@y
### Add a policy
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select **Add policy**.
3. Locate the policy type you want to configure and select **Configure**.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select **Add policy**.
3. Locate the policy type you want to configure and select **Configure**.
@z

@x
   - If **Configure** is grayed out, the policy has no configurable parameters.
   - If the button reads **Integrate**, setup is required before the policy can be enabled.
@y
   - If **Configure** is grayed out, the policy has no configurable parameters.
   - If the button reads **Integrate**, setup is required before the policy can be enabled.
@z

@x
4. Update the policy parameters.
5. Select **Save policy** to enable, or **Save and disable** to save without enabling.
@y
4. Update the policy parameters.
5. Select **Save policy** to enable, or **Save and disable** to save without enabling.
@z

@x
### Edit a policy
@y
### Edit a policy
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select the policy and then select **Edit**.
3. Update the parameters and save.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select the policy and then select **Edit**.
3. Update the parameters and save.
@z

@x
### Disable a policy
@y
### Disable a policy
@z

@x
Disabling a policy hides its results but doesn't delete historic data.
@y
Disabling a policy hides its results but doesn't delete historic data.
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select the policy and then select **Disable**.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select the policy and then select **Disable**.
@z

@x
### Delete a policy
@y
### Delete a policy
@z

@x
Deleting a policy removes its evaluation results.
@y
Deleting a policy removes its evaluation results.
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select the policy and then select **Delete**.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select the policy and then select **Delete**.
@z

@x
To recreate a deleted policy, follow [Add a policy](#add-a-policy) and select
**Configure** on the deleted policy type.
@y
To recreate a deleted policy, follow [Add a policy](#add-a-policy) and select
**Configure** on the deleted policy type.
@z

@x
## Remediation
@y
## Remediation
@z

@x
Docker Scout provides remediation recommendations based on policy evaluation
results. Recommendations are available for the following policy types:
@y
Docker Scout provides remediation recommendations based on policy evaluation
results. Recommendations are available for the following policy types:
@z

@x
- [Up-to-Date Base Images](#up-to-date-base-images)
- [Supply Chain Attestations](#supply-chain-attestations)
@y
- [Up-to-Date Base Images](#up-to-date-base-images)
- [Supply Chain Attestations](#supply-chain-attestations)
@z

@x
To view recommendations:
@y
To view recommendations:
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select a policy.
3. Hover over an image in the list and select **View fixes**.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy).
2. Select a policy.
3. Hover over an image in the list and select **View fixes**.
@z

@x
If more than one recommendation is available, the primary recommendation
displays as the **Recommended fix**. Additional recommendations are listed as
**Quick fixes**.
@y
If more than one recommendation is available, the primary recommendation
displays as the **Recommended fix**. Additional recommendations are listed as
**Quick fixes**.
@z

@x
### Up-to-Date Base Images
@y
### Up-to-Date Base Images
@z

@x
Without provenance attestations, compliance is undeterminable. Add
[provenance attestations](/manuals/build/metadata/attestations/slsa-provenance.md)
so Docker Scout can detect the base image version you're using.
@y
Without provenance attestations, compliance is undeterminable. Add
[provenance attestations](manuals/build/metadata/attestations/slsa-provenance.md)
so Docker Scout can detect the base image version you're using.
@z

@x
With provenance attestations, the recommended action shows how to update your
base image to the latest version and pin it to a specific digest. See
[Pin base image versions](/manuals/build/building/best-practices.md#pin-base-image-versions).
@y
With provenance attestations, the recommended action shows how to update your
base image to the latest version and pin it to a specific digest. See
[Pin base image versions](manuals/build/building/best-practices.md#pin-base-image-versions).
@z

@x
With the GitHub integration enabled, you can raise a pull request directly from
the remediation panel to update the base image version in your Dockerfile.
@y
With the GitHub integration enabled, you can raise a pull request directly from
the remediation panel to update the base image version in your Dockerfile.
@z

@x
### Supply Chain Attestations
@y
### Supply Chain Attestations
@z

@x
The **Supply Chain Attestations** policy requires SBOM and provenance
attestations. The remediation panel shows what's missing. For example, if your
image has a provenance attestation without enough information, rebuild with
[`mode=max`](/manuals/build/metadata/attestations/slsa-provenance.md#max) provenance.
@y
The **Supply Chain Attestations** policy requires SBOM and provenance
attestations. The remediation panel shows what's missing. For example, if your
image has a provenance attestation without enough information, rebuild with
[`mode=max`](manuals/build/metadata/attestations/slsa-provenance.md#max) provenance.
@z

@x
## Evaluate policy compliance in CI
@y
## Evaluate policy compliance in CI
@z

@x
Adding policy evaluation to your CI pipelines helps you detect and prevent
cases where a change would cause policy compliance to worsen compared to your
baseline.
@y
Adding policy evaluation to your CI pipelines helps you detect and prevent
cases where a change would cause policy compliance to worsen compared to your
baseline.
@z

@x
The recommended strategy involves evaluating a local image and comparing the
results to a baseline using an [environment](../integrations/environment/_index.md).
If policy compliance for the new image is worse than the baseline, the CI run
fails. If compliance is better or unchanged, the run succeeds.
@y
The recommended strategy involves evaluating a local image and comparing the
results to a baseline using an [environment](../integrations/environment/_index.md).
If policy compliance for the new image is worse than the baseline, the CI run
fails. If compliance is better or unchanged, the run succeeds.
@z

@x
The following GitHub Actions example uses the [Docker Scout GitHub Action](https://github.com/marketplace/actions/docker-scout)
to compare a pull request image against the `production` environment. The
`exit-on` input is set to `policy`, so the step fails only if policy compliance
has worsened.
@y
The following GitHub Actions example uses the [Docker Scout GitHub Action](https://github.com/marketplace/actions/docker-scout)
to compare a pull request image against the `production` environment. The
`exit-on` input is set to `policy`, so the step fails only if policy compliance
has worsened.
@z

@x
> [!NOTE]
>
> Due to a limitation in Docker Engine, loading multi-platform images or images
> with attestations to the image store isn't supported. Build a single-platform
> image without attestations and load it for the policy evaluation to work.
@y
> [!NOTE]
>
> Due to a limitation in Docker Engine, loading multi-platform images or images
> with attestations to the image store isn't supported. Build a single-platform
> image without attestations and load it for the policy evaluation to work.
@z

@x
```yaml
name: Docker
@y
```yaml
name: Docker
@z

@x
on:
  push:
    tags: ["*"]
    branches:
      - "main"
  pull_request:
    branches: ["**"]
@y
on:
  push:
    tags: ["*"]
    branches:
      - "main"
  pull_request:
    branches: ["**"]
@z

@x
env:
  REGISTRY: docker.io
  IMAGE_NAME: <IMAGE_NAME>
  DOCKER_ORG: <ORG>
@y
env:
  REGISTRY: docker.io
  IMAGE_NAME: <IMAGE_NAME>
  DOCKER_ORG: <ORG>
@z

@x
jobs:
  build:
    permissions:
      pull-requests: write
@y
jobs:
  build:
    permissions:
      pull-requests: write
@z

@x
    runs-on: ubuntu-latest
    steps:
      - name: Log into registry ${{ env.REGISTRY }}
        uses: docker/login-action@{{% param "login_action_version" %}}
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ secrets.REGISTRY_USER }}
          password: ${{ secrets.REGISTRY_TOKEN }}
@y
    runs-on: ubuntu-latest
    steps:
      - name: Log into registry ${{ env.REGISTRY }}
        uses: docker/login-action@{{% param "login_action_version" %}}
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ secrets.REGISTRY_USER }}
          password: ${{ secrets.REGISTRY_TOKEN }}
@z

@x
      - name: Setup Docker buildx
        uses: docker/setup-buildx-action@{{% param "setup_buildx_action_version" %}}
@y
      - name: Setup Docker buildx
        uses: docker/setup-buildx-action@{{% param "setup_buildx_action_version" %}}
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@{{% param "metadata_action_version" %}}
        with:
          images: ${{ env.IMAGE_NAME }}
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@{{% param "metadata_action_version" %}}
        with:
          images: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Build image
        id: build-and-push
        uses: docker/build-push-action@{{% param "build_push_action_version" %}}
        with:
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          sbom: ${{ github.event_name != 'pull_request' }}
          provenance: ${{ github.event_name != 'pull_request' }}
          push: ${{ github.event_name != 'pull_request' }}
          load: ${{ github.event_name == 'pull_request' }}
@y
      - name: Build image
        id: build-and-push
        uses: docker/build-push-action@{{% param "build_push_action_version" %}}
        with:
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          sbom: ${{ github.event_name != 'pull_request' }}
          provenance: ${{ github.event_name != 'pull_request' }}
          push: ${{ github.event_name != 'pull_request' }}
          load: ${{ github.event_name == 'pull_request' }}
@z

@x
      - name: Authenticate with Docker
        uses: docker/login-action@{{% param "login_action_version" %}}
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
@y
      - name: Authenticate with Docker
        uses: docker/login-action@{{% param "login_action_version" %}}
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
@z

@x
      - name: Compare
        if: ${{ github.event_name == 'pull_request' }}
        uses: docker/scout-action@v1
        with:
          command: compare
          image: ${{ steps.meta.outputs.tags }}
          to-env: production
          platform: "linux/amd64"
          ignore-unchanged: true
          only-severities: critical,high
          organization: ${{ env.DOCKER_ORG }}
          exit-on: policy
```
@y
      - name: Compare
        if: ${{ github.event_name == 'pull_request' }}
        uses: docker/scout-action@v1
        with:
          command: compare
          image: ${{ steps.meta.outputs.tags }}
          to-env: production
          platform: "linux/amd64"
          ignore-unchanged: true
          only-severities: critical,high
          organization: ${{ env.DOCKER_ORG }}
          exit-on: policy
```
@z

@x
For other CI platforms, see
[Docker Scout CI integrations](../integrations/_index.md#continuous-integration).
@y
For other CI platforms, see
[Docker Scout CI integrations](../integrations/_index.md#continuous-integration).
@z
