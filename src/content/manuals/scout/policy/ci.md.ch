%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Evaluate policy compliance in CI
description: |
  Configure your continuous integration pipelines to fail
  when Policy Evaluation for an image is worse compared to baseline
keywords: scout, supply chain, policy, ci
---
@y
---
title: Evaluate policy compliance in CI
description: |
  Configure your continuous integration pipelines to fail
  when Policy Evaluation for an image is worse compared to baseline
keywords: scout, supply chain, policy, ci
---
@z

@x
Adding Policy Evaluation to your continuous integration pipelines helps you
detect and prevent cases where code changes would cause policy compliance to
become worse compared to your baseline.
@y
Adding Policy Evaluation to your continuous integration pipelines helps you
detect and prevent cases where code changes would cause policy compliance to
become worse compared to your baseline.
@z

@x
The recommended strategy for Policy Evaluation in a CI setting involves
evaluating a local image and comparing the results to a baseline. If the policy
compliance for the local image is worse than the specified baseline, the CI run
fails with an error. If policy compliance is better or unchanged, the CI run
succeeds.
@y
The recommended strategy for Policy Evaluation in a CI setting involves
evaluating a local image and comparing the results to a baseline. If the policy
compliance for the local image is worse than the specified baseline, the CI run
fails with an error. If policy compliance is better or unchanged, the CI run
succeeds.
@z

@x
This comparison is relative, meaning that it's only concerned with whether your
CI image is better or worse than your baseline. It's not an absolute check to
pass or fail all policies. By measuring relative to a baseline that you define,
you can quickly see if a change has a positive or negative impact on policy
compliance.
@y
This comparison is relative, meaning that it's only concerned with whether your
CI image is better or worse than your baseline. It's not an absolute check to
pass or fail all policies. By measuring relative to a baseline that you define,
you can quickly see if a change has a positive or negative impact on policy
compliance.
@z

@x
## How it works
@y
## How it works
@z

@x
When you do Policy Evaluation in CI, you run a local policy evaluation on the
image you build in your CI pipeline. To run a local evaluation, the image that
you evaluate must exist in the image store where your CI workflow is being run.
Either build or pull the image, and then run the evaluation.
@y
When you do Policy Evaluation in CI, you run a local policy evaluation on the
image you build in your CI pipeline. To run a local evaluation, the image that
you evaluate must exist in the image store where your CI workflow is being run.
Either build or pull the image, and then run the evaluation.
@z

@x
To run policy evaluation and trigger failure if compliance for your local image
is worse than your comparison baseline, you need to specify the image version
to use as a baseline. You can hard-code a specific image reference, but a
better solution is to use [environments](../integrations/environment/_index.md)
to automatically infer the image version from an environment. The example that
follows uses environments to compare the CI image with the image in the
`production` environment.
@y
To run policy evaluation and trigger failure if compliance for your local image
is worse than your comparison baseline, you need to specify the image version
to use as a baseline. You can hard-code a specific image reference, but a
better solution is to use [environments](../integrations/environment/_index.md)
to automatically infer the image version from an environment. The example that
follows uses environments to compare the CI image with the image in the
`production` environment.
@z

@x
## Example
@y
## Example
@z

@x
The following example on how to run policy evaluation in CI uses the [Docker
Scout GitHub Action](https://github.com/marketplace/actions/docker-scout) to
execute the `compare` command on an image built in CI. The compare command has
a `to-env` input, which will run the comparison against an environment called
`production`. The `exit-on` input is set to `policy`, meaning that the
comparison fails only if policy compliance has worsened.
@y
The following example on how to run policy evaluation in CI uses the [Docker
Scout GitHub Action](https://github.com/marketplace/actions/docker-scout) to
execute the `compare` command on an image built in CI. The compare command has
a `to-env` input, which will run the comparison against an environment called
`production`. The `exit-on` input is set to `policy`, meaning that the
comparison fails only if policy compliance has worsened.
@z

@x
This example doesn't assume that you're using Docker Hub as your container
registry. As a result, this workflow uses the `docker/login-action` twice:
@y
This example doesn't assume that you're using Docker Hub as your container
registry. As a result, this workflow uses the `docker/login-action` twice:
@z

@x
- Once for authenticating to your container registry.
- Once more for authenticating to Docker to pull the analysis results of your
  `production` image.
@y
- Once for authenticating to your container registry.
- Once more for authenticating to Docker to pull the analysis results of your
  `production` image.
@z

@x
If you use Docker Hub as your container registry, you only need to authenticate
once.
@y
If you use Docker Hub as your container registry, you only need to authenticate
once.
@z

@x
> [!NOTE]
>
> Due to a limitation in the Docker Engine, loading multi-platform images or
> images with attestations to the image store isn't supported.
>
> For the policy evaluation to work, you must load the image to the local image
> store of the runner. Ensure that you're building a single-platform image
> without attestations, and that you're loading the build results. Otherwise,
> the policy evaluation fails.
@y
> [!NOTE]
>
> Due to a limitation in the Docker Engine, loading multi-platform images or
> images with attestations to the image store isn't supported.
>
> For the policy evaluation to work, you must load the image to the local image
> store of the runner. Ensure that you're building a single-platform image
> without attestations, and that you're loading the build results. Otherwise,
> the policy evaluation fails.
@z

@x
Also note the `pull-requests: write` permission for the job. The Docker Scout
GitHub Action adds a pull request comment with the evaluation results by
default, which requires this permission. For details, see
[Pull Request Comments](https://github.com/docker/scout-action#pull-request-comments).
@y
Also note the `pull-requests: write` permission for the job. The Docker Scout
GitHub Action adds a pull request comment with the evaluation results by
default, which requires this permission. For details, see
[Pull Request Comments](https://github.com/docker/scout-action#pull-request-comments).
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
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ secrets.REGISTRY_USER }}
          password: ${{ secrets.REGISTRY_TOKEN }}
@y
    runs-on: ubuntu-latest
    steps:
      - name: Log into registry ${{ env.REGISTRY }}
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ secrets.REGISTRY_USER }}
          password: ${{ secrets.REGISTRY_TOKEN }}
@z

@x
      - name: Setup Docker buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Setup Docker buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.IMAGE_NAME }}
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Build image
        id: build-and-push
        uses: docker/build-push-action@v4
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
        uses: docker/build-push-action@v4
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
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
@y
      - name: Authenticate with Docker
        uses: docker/login-action@v3
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
The following screenshot shows what the GitHub PR comment looks like when a
policy evaluation check fails because policy has become worse in the PR image
compared to baseline.
@y
The following screenshot shows what the GitHub PR comment looks like when a
policy evaluation check fails because policy has become worse in the PR image
compared to baseline.
@z

@x
![Policy evaluation comment in GitHub PR](../images/scout-policy-eval-ci.webp)
@y
![Policy evaluation comment in GitHub PR](../images/scout-policy-eval-ci.webp)
@z

@x
This example has demonstrated how to run policy evaluation in CI with GitHub
Actions. Docker Scout also supports other CI platforms. For more information,
see [Docker Scout CI
integrations](../integrations/_index.md#continuous-integration).
@y
This example has demonstrated how to run policy evaluation in CI with GitHub
Actions. Docker Scout also supports other CI platforms. For more information,
see [Docker Scout CI
integrations](../integrations/_index.md#continuous-integration).
@z
