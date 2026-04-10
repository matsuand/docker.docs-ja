%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Lab: Migrating a Node App to Docker Hardened Images"
linkTitle: "Lab: Migrating to DHI (Node)"
description: |
  Migrate a Node.js application from a standard base image to Docker Hardened
  Images. Use Docker Scout to analyze CVEs, compare images, and inspect
  supply chain attestations.
summary: |
  Hands-on lab: Replace a Node.js base image with a Docker Hardened Image.
  Analyze CVEs with Docker Scout, rewrite the Dockerfile to use multi-stage
  builds with DHI, and explore SBOMs, VEX, and compliance attestations.
keywords: Docker, Hardened Images, DHI, Node.js, Docker Scout, CVE, security, SBOM, lab, labspace
@y
title: "Lab: Migrating a Node App to Docker Hardened Images"
linkTitle: "Lab: Migrating to DHI (Node)"
description: |
  Migrate a Node.js application from a standard base image to Docker Hardened
  Images. Use Docker Scout to analyze CVEs, compare images, and inspect
  supply chain attestations.
summary: |
  Hands-on lab: Replace a Node.js base image with a Docker Hardened Image.
  Analyze CVEs with Docker Scout, rewrite the Dockerfile to use multi-stage
  builds with DHI, and explore SBOMs, VEX, and compliance attestations.
keywords: Docker, Hardened Images, DHI, Node.js, Docker Scout, CVE, security, SBOM, lab, labspace
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
    - title: Docker Hardened Images
      url: /dhi/
    - title: Docker Scout docs
      url: /scout/
    - title: Build attestations
      url: /build/metadata/attestations/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-dhi-node
@y
    - title: Docker Hardened Images
      url: __SUBDIR__/dhi/
    - title: Docker Scout docs
      url: __SUBDIR__/scout/
    - title: Build attestations
      url: __SUBDIR__/build/metadata/attestations/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-dhi-node
@z

@x
Migrate a Node.js application from a standard `node:24-trixie-slim` base image
to a Docker Hardened Image. You'll measure the before-and-after impact on CVE
count, image size, and policy compliance using Docker Scout, then explore the
supply chain attestations DHI ships with every image.
@y
Migrate a Node.js application from a standard `node:24-trixie-slim` base image
to a Docker Hardened Image. You'll measure the before-and-after impact on CVE
count, image size, and policy compliance using Docker Scout, then explore the
supply chain attestations DHI ships with every image.
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
{{< labspace-launch image="dockersamples/labspace-dhi-node" >}}
@y
{{< labspace-launch image="dockersamples/labspace-dhi-node" >}}
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
By the end of this Labspace, you will have completed the following:
@y
By the end of this Labspace, you will have completed the following:
@z

@x
- Analyze a Node.js container image with Docker Scout to identify CVE and policy failures
- Rewrite a Dockerfile to use a multi-stage build with DHI dev and runtime variants
- Compare image size and vulnerability counts before and after the migration
- Inspect supply chain attestations included with Docker Hardened Images (SBOMs, SLSA, VEX)
- Export VEX documents for integration with external scanners such as Grype or Trivy
@y
- Analyze a Node.js container image with Docker Scout to identify CVE and policy failures
- Rewrite a Dockerfile to use a multi-stage build with DHI dev and runtime variants
- Compare image size and vulnerability counts before and after the migration
- Inspect supply chain attestations included with Docker Hardened Images (SBOMs, SLSA, VEX)
- Export VEX documents for integration with external scanners such as Grype or Trivy
@z

@x
## Modules
@y
## Modules
@z

@x
| #   | Module                                   | Description                                                                     |
| --- | ---------------------------------------- | ------------------------------------------------------------------------------- |
| 1   | Introduction                             | Overview of Docker Hardened Images and their security benefits                  |
| 2   | Setup                                    | Perform setup tasks required for the lab.                                       |
| 3   | Analyzing the Starting Image             | Build the app, scan it with Docker Scout, and review failing policies           |
| 4   | Migrating to DHI                         | Rewrite the Dockerfile with multi-stage DHI build and compare results           |
| 5   | DHI Attestations and Scanner Integration | Inspect SBOMs, FIPS attestations, STIG scans, and export VEX for external tools |
@y
| #   | Module                                   | Description                                                                     |
| --- | ---------------------------------------- | ------------------------------------------------------------------------------- |
| 1   | Introduction                             | Overview of Docker Hardened Images and their security benefits                  |
| 2   | Setup                                    | Perform setup tasks required for the lab.                                       |
| 3   | Analyzing the Starting Image             | Build the app, scan it with Docker Scout, and review failing policies           |
| 4   | Migrating to DHI                         | Rewrite the Dockerfile with multi-stage DHI build and compare results           |
| 5   | DHI Attestations and Scanner Integration | Inspect SBOMs, FIPS attestations, STIG scans, and export VEX for external tools |
@z
