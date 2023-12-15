%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How Docker Scout handles image metadata
keywords: scanning, supply chain, security, data, metadata
title: Data collection and storage in Docker Scout
---
@y
---
description: How Docker Scout handles image metadata
keywords: scanning, supply chain, security, data, metadata
title: Data collection and storage in Docker Scout
---
@z

@x
Docker Scout image analysis works by collecting metadata from the container
images that you analyze. This metadata is stored on the Docker Scout platform.
@y
Docker Scout image analysis works by collecting metadata from the container
images that you analyze. This metadata is stored on the Docker Scout platform.
@z

@x
## Data transmission
@y
## Data transmission
@z

@x
This section describes the data that Docker Scout collects and sends to the
platform.
@y
This section describes the data that Docker Scout collects and sends to the
platform.
@z

@x
### Image metadata
@y
### Image metadata
@z

@x
Docker Scout collects the following image metadata:
@y
Docker Scout collects the following image metadata:
@z

@x
- Image creation timestamp
- Image digest
- Ports exposed by the image
- Environment variable names and values
- Name and value of image labels
- Order of image layers
- Hardware architecture
- Operating system type and version
- Registry URL and type
@y
- Image creation timestamp
- Image digest
- Ports exposed by the image
- Environment variable names and values
- Name and value of image labels
- Order of image layers
- Hardware architecture
- Operating system type and version
- Registry URL and type
@z

@x
Image digests are created for each layer of an image when the image is built
and pushed to a registry. They are SHA256 digests of the contents of a layer.
Docker Scout doesn't create the digests; they're read from the image manifest.
@y
Image digests are created for each layer of an image when the image is built
and pushed to a registry. They are SHA256 digests of the contents of a layer.
Docker Scout doesn't create the digests; they're read from the image manifest.
@z

@x
The digests are matched against your own private images and Docker's database
of public images to identify images that share the same layers. The image that
shares most of the layers is considered a base image match for the image that's
currently being analyzed.
@y
The digests are matched against your own private images and Docker's database
of public images to identify images that share the same layers. The image that
shares most of the layers is considered a base image match for the image that's
currently being analyzed.
@z

@x
### SBOM metadata
@y
### SBOM metadata
@z

@x
SBOM metadata is used to match package types and versions with public
vulnerability data to infer whether a package is considered vulnerable.
When the Docker Scout platform receives information from its advisory database
about new CVEs (and other risks, such as leaked secrets), it "overlays" this
information on the SBOM. If there's a match, the results of the match are
displayed in the user interfaces where Docker Scout data is surfaced, such as
the Docker Scout Dashboard and in Docker Desktop.
@y
SBOM metadata is used to match package types and versions with public
vulnerability data to infer whether a package is considered vulnerable.
When the Docker Scout platform receives information from its advisory database
about new CVEs (and other risks, such as leaked secrets), it "overlays" this
information on the SBOM. If there's a match, the results of the match are
displayed in the user interfaces where Docker Scout data is surfaced, such as
the Docker Scout Dashboard and in Docker Desktop.
@z

@x
Docker Scout collects the SBOM metadata:
@y
Docker Scout collects the SBOM metadata:
@z

@x
- Package URLs (PURL)
- Package author and description
- License IDs
- Package name and namespace
- Package scheme and size
- Package type and version
- Filepath within the image
- The type of direct dependency
- Total package count
@y
- Package URLs (PURL)
- Package author and description
- License IDs
- Package name and namespace
- Package scheme and size
- Package type and version
- Filepath within the image
- The type of direct dependency
- Total package count
@z

@x
The PURLs in Docker Scout follow the
[purl-spec](https://github.com/package-url/purl-spec) specification. Package
information is derived from the contents of image, including OS-level programs
and packages, and application-level packages such as maven, npm, and so on.
@y
The PURLs in Docker Scout follow the
[purl-spec](https://github.com/package-url/purl-spec) specification. Package
information is derived from the contents of image, including OS-level programs
and packages, and application-level packages such as maven, npm, and so on.
@z

@x
### Environment metadata
@y
### Environment metadata
@z

@x
If you integrate Docker Scout with your runtime environment via the [Sysdig
integration](./integrations/environment/sysdig.md), the Docker Scout data plane
collects the following data points:
@y
If you integrate Docker Scout with your runtime environment via the [Sysdig
integration](./integrations/environment/sysdig.md), the Docker Scout data plane
collects the following data points:
@z

@x
- Kubernetes namespace
- Workload name
- Workload type (for example, DaemonSet)
@y
- Kubernetes namespace
- Workload name
- Workload type (for example, DaemonSet)
@z

@x
### Local analysis
@y
### Local analysis
@z

@x
For images analyzed locally on a developer's machine, Docker Scout only
transmits PURLs and layer digests. This data isn't persistently stored on the
Docker Scout platform; it's only used to run the analysis.
@y
For images analyzed locally on a developer's machine, Docker Scout only
transmits PURLs and layer digests. This data isn't persistently stored on the
Docker Scout platform; it's only used to run the analysis.
@z

@x
## Data storage
@y
## Data storage
@z

@x
For the purposes of providing the Docker Scout service, data is stored using:
@y
For the purposes of providing the Docker Scout service, data is stored using:
@z

@x
- Amazon Web Services (AWS) on servers located in US East
- Google Cloud Platform (GCP) on servers located in US East
@y
- Amazon Web Services (AWS) on servers located in US East
- Google Cloud Platform (GCP) on servers located in US East
@z

@x
Data is used according to the processes described at
[docker.com/legal](https://www.docker.com/legal/) to provide the key
capabilities of Docker Scout.
@y
Data is used according to the processes described at
[docker.com/legal](https://www.docker.com/legal/) to provide the key
capabilities of Docker Scout.
@z
