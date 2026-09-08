%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Apply Docker Hardened Image policies to your images
linktitle: Apply image policies
description: Learn how to hold your own images to Docker Hardened Image security and compliance standards using the Docker Scout CLI.
@y
title: Apply Docker Hardened Image policies to your images
linktitle: Apply image policies
description: Learn how to hold your own images to Docker Hardened Image security and compliance standards using the Docker Scout CLI.
@z

@x
keywords: docker scout policies, image security policy, container compliance, dhi policies, vulnerability policy check
@y
keywords: docker scout policies, image security policy, container compliance, dhi policies, vulnerability policy check
@z

@x
Docker publishes the set of security and compliance policies that Docker
Hardened Images (DHIs) are built to meet, so you can hold your own images to the
same standards. You evaluate images against these policies with the
[`docker scout policy`](../../scout/policy/local.md) command.
@y
Docker publishes the set of security and compliance policies that Docker
Hardened Images (DHIs) are built to meet, so you can hold your own images to the
same standards. You evaluate images against these policies with the
[`docker scout policy`](../../scout/policy/local.md) command.
@z

@x
These policies encode requirements such as running as a non-root user, being
free of fixable critical and high vulnerabilities, containing no embedded
malware or secrets, and shipping signed supply chain attestations. They don't
verify whether an image is a DHI or built on a DHI base image; they check
whether an image meets the same bar that DHIs are held to.
@y
These policies encode requirements such as running as a non-root user, being
free of fixable critical and high vulnerabilities, containing no embedded
malware or secrets, and shipping signed supply chain attestations. They don't
verify whether an image is a DHI or built on a DHI base image; they check
whether an image meets the same bar that DHIs are held to.
@z

@x
Unlike the built-in Docker Scout policies, the DHI policies aren't embedded in
the CLI. They're maintained as Rego source in the
[`docker-hardened-images/policies`](https://github.com/docker-hardened-images/policies)
repository and published as an OCI policy bundle at
[`dhi/policies`](https://hub.docker.com/repository/docker/dhi/policies/general).
You pull the bundle at evaluation time with the `--policy-bundle` flag, so you
can apply DHI standards locally, in CI, or both, without sending any data to the
Docker Scout service.
@y
Unlike the built-in Docker Scout policies, the DHI policies aren't embedded in
the CLI. They're maintained as Rego source in the
[`docker-hardened-images/policies`](https://github.com/docker-hardened-images/policies)
repository and published as an OCI policy bundle at
[`dhi/policies`](https://hub.docker.com/repository/docker/dhi/policies/general).
You pull the bundle at evaluation time with the `--policy-bundle` flag, so you
can apply DHI standards locally, in CI, or both, without sending any data to the
Docker Scout service.
@z

@x
## Policies in the DHI bundle
@y
## Policies in the DHI bundle
@z

@x
The `dhi/policies` bundle includes the following policies:
@y
The `dhi/policies` bundle includes the following policies:
@z

@x
| Policy | Policy name | What it checks |
| --- | --- | --- |
| No default root user for non-dev images | `dhi-default-non-root-user` | The image is configured to run as a non-root user. |
| No fixable vulnerabilities past their remediation SLA | `fixable-vulnerabilities` | No fixable CVEs remain unaddressed past their remediation SLA (7 days for critical and high, 30 days for others). |
| No high-profile vulnerabilities | `high-profile-vulnerabilities` | The image is free of a curated list of well-known CVEs, optionally including the CISA KEV catalog. |
| No embedded malware | `dhi-no-embedded-malware` | A malware scan attestation is present and passing. |
| No embedded secrets | `dhi-no-embedded-secrets` | A secret scan attestation is present and passing. |
| No failing tests | `dhi-no-failing-tests` | A test attestation is present and passing. |
| Signed supply chain attestations | `dhi-signed-supply-chain-attestations` | SBOM and provenance attestations are attached and signed. |
| Unintentional shell or package manager | `dhi-unintentional-shell-or-package-manager` | No undeclared shell or package manager is present in the image. |
| STIG scan | `dhi-stig-scan-score` | For FIPS-compliant images, the STIG scan meets the required score. |
@y
| Policy | Policy name | What it checks |
| --- | --- | --- |
| No default root user for non-dev images | `dhi-default-non-root-user` | The image is configured to run as a non-root user. |
| No fixable vulnerabilities past their remediation SLA | `fixable-vulnerabilities` | No fixable CVEs remain unaddressed past their remediation SLA (7 days for critical and high, 30 days for others). |
| No high-profile vulnerabilities | `high-profile-vulnerabilities` | The image is free of a curated list of well-known CVEs, optionally including the CISA KEV catalog. |
| No embedded malware | `dhi-no-embedded-malware` | A malware scan attestation is present and passing. |
| No embedded secrets | `dhi-no-embedded-secrets` | A secret scan attestation is present and passing. |
| No failing tests | `dhi-no-failing-tests` | A test attestation is present and passing. |
| Signed supply chain attestations | `dhi-signed-supply-chain-attestations` | SBOM and provenance attestations are attached and signed. |
| Unintentional shell or package manager | `dhi-unintentional-shell-or-package-manager` | No undeclared shell or package manager is present in the image. |
| STIG scan | `dhi-stig-scan-score` | For FIPS-compliant images, the STIG scan meets the required score. |
@z

@x
The **Policy name** is the stable ID you reference in a `--policy-config` file to
enable, disable, or tune a policy.
@y
The **Policy name** is the stable ID you reference in a `--policy-config` file to
enable, disable, or tune a policy.
@z

@x
For the authoritative list and the Rego source for each policy, see the
[`docker-hardened-images/policies`](https://github.com/docker-hardened-images/policies)
repository.
@y
For the authoritative list and the Rego source for each policy, see the
[`docker-hardened-images/policies`](https://github.com/docker-hardened-images/policies)
repository.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- The [Docker Scout CLI plugin](/manuals/scout/install.md). It's included with
  Docker Desktop.
- Access to pull the `dhi/policies` bundle from Docker Hub. Authentication uses
  your existing Docker registry credentials, so sign in first:
@y
- The [Docker Scout CLI plugin](manuals/scout/install.md). It's included with
  Docker Desktop.
- Access to pull the `dhi/policies` bundle from Docker Hub. Authentication uses
  your existing Docker registry credentials, so sign in first:
@z

@x
  ```console
  $ docker login
  ```
@y
  ```console
  $ docker login
  ```
@z

@x
## Evaluate an image against the DHI policies
@y
## Evaluate an image against the DHI policies
@z

@x
To evaluate an image against the DHI policy bundle, pass the bundle reference to
`docker scout policy` with the `--policy-bundle` flag:
@y
To evaluate an image against the DHI policy bundle, pass the bundle reference to
`docker scout policy` with the `--policy-bundle` flag:
@z

@x
```console
$ docker scout policy <image> --policy-bundle dhi/policies:latest
```
@y
```console
$ docker scout policy <image> --policy-bundle dhi/policies:latest
```
@z

@x
The CLI pulls the bundle, indexes the image into an SBOM, enriches it with CVE
and VEX data, and evaluates each policy in the bundle against that data. Bundles
are cached by digest, so re-running against the same bundle doesn't re-download
it.
@y
The CLI pulls the bundle, indexes the image into an SBOM, enriches it with CVE
and VEX data, and evaluates each policy in the bundle against that data. Bundles
are cached by digest, so re-running against the same bundle doesn't re-download
it.
@z

@x
### Example: Build and evaluate a DHI-based image
@y
### Example: Build and evaluate a DHI-based image
@z

@x
The following example builds an image from a DHI base image and evaluates it
against the DHI policy bundle.
@y
The following example builds an image from a DHI base image and evaluates it
against the DHI policy bundle.
@z

@x
#### Step 1: Use a DHI base image in your Dockerfile
@y
#### Step 1: Use a DHI base image in your Dockerfile
@z

@x
Create a Dockerfile that uses a Docker Hardened Image from the DHI catalog as
the base. For example:
@y
Create a Dockerfile that uses a Docker Hardened Image from the DHI catalog as
the base. For example:
@z

@x
```dockerfile
# Dockerfile
FROM dhi.io/python:3.13
@y
```dockerfile
# Dockerfile
FROM dhi.io/python:3.13
@z

@x
ENTRYPOINT ["python", "-c", "print('Hello from a DHI-based image')"]
```
@y
ENTRYPOINT ["python", "-c", "print('Hello from a DHI-based image')"]
```
@z

@x
#### Step 2: Build the image
@y
#### Step 2: Build the image
@z

@x
Open a terminal and navigate to the directory containing your Dockerfile. Then,
build the image and load it into your local image store:
@y
Open a terminal and navigate to the directory containing your Dockerfile. Then,
build the image and load it into your local image store:
@z

@x
```console
$ docker build --load -t my-dhi-app:v1 .
```
@y
```console
$ docker build --load -t my-dhi-app:v1 .
```
@z

@x
#### Step 3: Evaluate the image against the DHI policies
@y
#### Step 3: Evaluate the image against the DHI policies
@z

@x
Sign in and evaluate the local image against the DHI policy bundle:
@y
Sign in and evaluate the local image against the DHI policy bundle:
@z

@x
```console
$ docker login
$ docker scout policy my-dhi-app:v1 \
  --policy-bundle dhi/policies:latest
```
@y
```console
$ docker login
$ docker scout policy my-dhi-app:v1 \
  --policy-bundle dhi/policies:latest
```
@z

@x
The command prints a compliance result for each policy in the bundle, along with
the details of any violations.
@y
The command prints a compliance result for each policy in the bundle, along with
the details of any violations.
@z

@x
## Customize the DHI policies
@y
## Customize the DHI policies
@z

@x
You can tune which policies run and their thresholds with a `--policy-config`
file. The
[`docker-hardened-images/policies`](https://github.com/docker-hardened-images/policies)
repository includes an example `config.json` you can start from.
@y
You can tune which policies run and their thresholds with a `--policy-config`
file. The
[`docker-hardened-images/policies`](https://github.com/docker-hardened-images/policies)
repository includes an example `config.json` you can start from.
@z

@x
```console
$ docker scout policy my-dhi-app:v1 \
  --policy-bundle dhi/policies:latest \
  --policy-config ./config.json
```
@y
```console
$ docker scout policy my-dhi-app:v1 \
  --policy-bundle dhi/policies:latest \
  --policy-config ./config.json
```
@z

@x
The config file matches policies by the **Policy name** listed in
[Policies in the DHI bundle](#policies-in-the-dhi-bundle) and lets you disable
individual policies or adjust their settings. For example, the following config
disables the STIG scan policy and opts out of CISA KEV checks in the
high-profile vulnerabilities policy:
@y
The config file matches policies by the **Policy name** listed in
[Policies in the DHI bundle](#policies-in-the-dhi-bundle) and lets you disable
individual policies or adjust their settings. For example, the following config
disables the STIG scan policy and opts out of CISA KEV checks in the
high-profile vulnerabilities policy:
@z

@x
```json
{
  "policies": [
    {
      "name": "dhi-stig-scan-score",
      "enabled": false
    },
    {
      "name": "high-profile-vulnerabilities",
      "config": {
        "include_cisa_kev": false
      }
    }
  ]
}
```
@y
```json
{
  "policies": [
    {
      "name": "dhi-stig-scan-score",
      "enabled": false
    },
    {
      "name": "high-profile-vulnerabilities",
      "config": {
        "include_cisa_kev": false
      }
    }
  ]
}
```
@z

@x
For the full config file format, see
[Configure built-in policies](../../scout/policy/local.md#configure-built-in-policies).
@y
For the full config file format, see
[Configure built-in policies](../../scout/policy/local.md#configure-built-in-policies).
@z

@x
You can also combine the DHI bundle with the built-in Docker Scout policies,
additional bundles, or your own custom Rego files. `--policy-bundle`,
`--policy-file`, and `--policy-dir` are all repeatable:
@y
You can also combine the DHI bundle with the built-in Docker Scout policies,
additional bundles, or your own custom Rego files. `--policy-bundle`,
`--policy-file`, and `--policy-dir` are all repeatable:
@z

@x
```console
$ docker scout policy my-dhi-app:v1 \
  --policy-bundle dhi/policies:latest \
  --policy-file ./custom.rego
```
@y
```console
$ docker scout policy my-dhi-app:v1 \
  --policy-bundle dhi/policies:latest \
  --policy-file ./custom.rego
```
@z

@x
For more on authoring custom policies and combining policy sources, see
[Evaluate policies](../../scout/policy/local.md).
@y
For more on authoring custom policies and combining policy sources, see
[Evaluate policies](../../scout/policy/local.md).
@z

@x
## Enforce policy compliance in CI
@y
## Enforce policy compliance in CI
@z

@x
Use the [Docker Scout GitHub Action](https://github.com/docker/scout-action) to
evaluate the DHI policies on every push and fail the workflow when an image
doesn't meet them. The following workflow builds the image, then evaluates it
against the DHI policy bundle:
@y
Use the [Docker Scout GitHub Action](https://github.com/docker/scout-action) to
evaluate the DHI policies on every push and fail the workflow when an image
doesn't meet them. The following workflow builds the image, then evaluates it
against the DHI policy bundle:
@z

@x
```yaml
name: DHI policy check
@y
```yaml
name: DHI policy check
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
env:
  IMAGE_NAME: my-dhi-app:${{ github.sha }}
@y
env:
  IMAGE_NAME: my-dhi-app:${{ github.sha }}
@z

@x
jobs:
  policy:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository
        uses: actions/checkout@v4
@y
jobs:
  policy:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository
        uses: actions/checkout@v4
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
@y
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
@z

@x
      - name: Build the image
        uses: docker/build-push-action@v6
        with:
          context: .
          load: true
          tags: ${{ env.IMAGE_NAME }}
@y
      - name: Build the image
        uses: docker/build-push-action@v6
        with:
          context: .
          load: true
          tags: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Evaluate DHI policies
        uses: docker/scout-action@v1.23.1
        with:
          command: policy
          image: ${{ env.IMAGE_NAME }}
          policy-bundle: dhi/policies:latest
          exit-code: true
```
@y
      - name: Evaluate DHI policies
        uses: docker/scout-action@v1.23.1
        with:
          command: policy
          image: ${{ env.IMAGE_NAME }}
          policy-bundle: dhi/policies:latest
          exit-code: true
```
@z

@x
The `docker/login-action` step authenticates with Docker Hub so the runner can
pull the DHI base image and the `dhi/policies` bundle. Store your Docker Hub
username and a [personal access token](/manuals/security/access-tokens.md) as the
`DOCKER_USER` and `DOCKER_PAT` repository secrets.
@y
The `docker/login-action` step authenticates with Docker Hub so the runner can
pull the DHI base image and the `dhi/policies` bundle. Store your Docker Hub
username and a [personal access token](manuals/security/access-tokens.md) as the
`DOCKER_USER` and `DOCKER_PAT` repository secrets.
@z

@x
Set `exit-code: true` to fail the step when any policy isn't met. The
`policy-bundle` input accepts a comma-separated list of bundles, and you can
combine it with the `policy-file`, `policy-dir`, and `policy-config` inputs, the
same as the CLI flags.
@y
Set `exit-code: true` to fail the step when any policy isn't met. The
`policy-bundle` input accepts a comma-separated list of bundles, and you can
combine it with the `policy-file`, `policy-dir`, and `policy-config` inputs, the
same as the CLI flags.
@z

@x
For more on running policy evaluation in CI, see
[Evaluate policies](../../scout/policy/local.md#use-in-ci).
@y
For more on running policy evaluation in CI, see
[Evaluate policies](../../scout/policy/local.md#use-in-ci).
@z
