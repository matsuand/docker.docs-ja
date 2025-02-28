%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Supply-chain security for C++ Docker images
linkTitle: Supply-chain security
@y
title: Supply-chain security for C++ Docker images
linkTitle: Supply-chain security
@z

@x
keywords: C++, security, multi-stage
description: Learn how to extract SBOMs from C++ Docker images.
@y
keywords: C++, security, multi-stage
description: Learn how to extract SBOMs from C++ Docker images.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
- You have a Docker Desktop installed, with containerd enabled for pulling and storing images (it's a checkbox in **Settings** > **General**). Otherwise, if you use Docker Engine:
  - You have the [Docker SBOM CLI plugin](https://github.com/docker/sbom-cli-plugin) installed. To install it on Docker Engine, use the following command:
@y
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
- You have a Docker Desktop installed, with containerd enabled for pulling and storing images (it's a checkbox in **Settings** > **General**). Otherwise, if you use Docker Engine:
  - You have the [Docker SBOM CLI plugin](https://github.com/docker/sbom-cli-plugin) installed. To install it on Docker Engine, use the following command:
@z

% snip command...

@x
  - You have the [Docker Scout CLI plugin](https://docs.docker.com/scout/install/) installed. To install it on Docker Engine, use the following command:
@y
  - You have the [Docker Scout CLI plugin](https://docs.docker.com/scout/install/) installed. To install it on Docker Engine, use the following command:
@z

% snip command...

@x
  - You have [containerd enabled](https://docs.docker.com/engine/storage/containerd/) for Docker Engine.
@y
  - You have [containerd enabled](https://docs.docker.com/engine/storage/containerd/) for Docker Engine.
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through extracting Software Bill of Materials (SBOMs) from a C++ Docker image using the Docker SBOM CLI plugin. SBOMs provide a detailed list of all the components in a software package, including their versions and licenses. You can use SBOMs to track the provenance of your software and ensure that it complies with your organization's security and licensing policies.
@y
This section walks you through extracting Software Bill of Materials (SBOMs) from a C++ Docker image using the Docker SBOM CLI plugin. SBOMs provide a detailed list of all the components in a software package, including their versions and licenses. You can use SBOMs to track the provenance of your software and ensure that it complies with your organization's security and licensing policies.
@z

@x
## Generate an SBOM
@y
## Generate an SBOM
@z

@x
Here we will use the Docker image that we built in the [Create a multi-stage build for your C++ application](/guides/language/cpp/multistage/) guide. If you haven't already built the image, follow the steps in that guide to build the image.
The image is named `hello`. To generate an SBOM for the `hello` image, run the following command:
@y
Here we will use the Docker image that we built in the [Create a multi-stage build for your C++ application](__SUBDIR__/guides/language/cpp/multistage/) guide. If you haven't already built the image, follow the steps in that guide to build the image.
The image is named `hello`. To generate an SBOM for the `hello` image, run the following command:
@z

% snip command...

@x
The command will say "No packages discovered". This is because the final image is a scratch image and doesn't have any packages.
Let's try again with Docker Scout:
@y
The command will say "No packages discovered". This is because the final image is a scratch image and doesn't have any packages.
Let's try again with Docker Scout:
@z

% snip command...

@x
This command will tell you the same thing.
@y
This command will tell you the same thing.
@z

@x
## Generate an SBOM attestation
@y
## Generate an SBOM attestation
@z

@x
The SBOM can be generated during the build process and "attached" to the image. This is called an SBOM attestation.
To generate an SBOM attestation for the `hello` image, first let's change the Dockerfile:
@y
The SBOM can be generated during the build process and "attached" to the image. This is called an SBOM attestation.
To generate an SBOM attestation for the `hello` image, first let's change the Dockerfile:
@z

% snip code...

@x
The first line `ARG BUILDKIT_SBOM_SCAN_STAGE=true` enables SBOM scanning in the build stage.
Now, build the image with the following command:
@y
The first line `ARG BUILDKIT_SBOM_SCAN_STAGE=true` enables SBOM scanning in the build stage.
Now, build the image with the following command:
@z

% snip command...

@x
This command will build the image and generate an SBOM attestation. You can verify that the SBOM is attached to the image by running the following command:
@y
This command will build the image and generate an SBOM attestation. You can verify that the SBOM is attached to the image by running the following command:
@z

% snip command...

@x
Note that the normal `docker sbom` command will not load the SBOM attestation.
@y
Note that the normal `docker sbom` command will not load the SBOM attestation.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to generate SBOM attestation for a C++ Docker image during the build process.
The normal image scanners will not be able to generate SBOMs from scratch images.
@y
In this section, you learned how to generate SBOM attestation for a C++ Docker image during the build process.
The normal image scanners will not be able to generate SBOMs from scratch images.
@z
