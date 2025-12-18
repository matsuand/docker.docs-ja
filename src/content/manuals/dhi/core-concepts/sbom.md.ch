%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Software Bill of Materials (SBOMs)
linktitle: SBOMs
description: Learn what SBOMs are, why they matter, and how Docker Hardened Images include signed SBOMs to support transparency and compliance.
keywords: sbom docker image, software bill of materials, signed sbom, container sbom verification, sbom compliance
@y
title: Software Bill of Materials (SBOMs)
linktitle: SBOMs
description: Learn what SBOMs are, why they matter, and how Docker Hardened Images include signed SBOMs to support transparency and compliance.
keywords: sbom docker image, software bill of materials, signed sbom, container sbom verification, sbom compliance
@z

@x
## What is an SBOM?
@y
## What is an SBOM?
@z

@x
An SBOM is a detailed inventory that lists all components, libraries, and
dependencies used in building a software application. It provides transparency
into the software supply chain by documenting each component's version, origin,
and relationship to other components. Think of it as a "recipe" for your
software, detailing every ingredient and how they come together.
@y
An SBOM is a detailed inventory that lists all components, libraries, and
dependencies used in building a software application. It provides transparency
into the software supply chain by documenting each component's version, origin,
and relationship to other components. Think of it as a "recipe" for your
software, detailing every ingredient and how they come together.
@z

@x
Metadata included in an SBOM for describing software artifacts may include:
@y
Metadata included in an SBOM for describing software artifacts may include:
@z

@x
- Name of the artifact
- Version
- License type
- Authors
- Unique package identifier
@y
- Name of the artifact
- Version
- License type
- Authors
- Unique package identifier
@z

@x
## Why are SBOMs important?
@y
## Why are SBOMs important?
@z

@x
In today's software landscape, applications often comprise numerous components
from various sources, including open-source libraries, third-party services, and
proprietary code. This complexity can obscure visibility into potential
vulnerabilities and complicate compliance efforts. SBOMs address these
challenges by providing a detailed inventory of all components within an
application.
@y
In today's software landscape, applications often comprise numerous components
from various sources, including open-source libraries, third-party services, and
proprietary code. This complexity can obscure visibility into potential
vulnerabilities and complicate compliance efforts. SBOMs address these
challenges by providing a detailed inventory of all components within an
application.
@z

@x
The significance of SBOMs is underscored by several key factors:
@y
The significance of SBOMs is underscored by several key factors:
@z

@x
- Enhanced transparency: SBOMs offer a comprehensive view of all components that
  constitute an application, enabling organizations to identify and assess risks
  associated with third-party libraries and dependencies.
@y
- Enhanced transparency: SBOMs offer a comprehensive view of all components that
  constitute an application, enabling organizations to identify and assess risks
  associated with third-party libraries and dependencies.
@z

@x
- Proactive vulnerability management: By maintaining an up-to-date SBOM,
  organizations can swiftly identify and address vulnerabilities in software
  components, reducing the window of exposure to potential exploits.
@y
- Proactive vulnerability management: By maintaining an up-to-date SBOM,
  organizations can swiftly identify and address vulnerabilities in software
  components, reducing the window of exposure to potential exploits.
@z

@x
- Regulatory compliance: Many regulations and industry standards now require
  organizations to maintain control over the software components they use. An
  SBOM facilitates compliance by providing a clear and accessible record.
@y
- Regulatory compliance: Many regulations and industry standards now require
  organizations to maintain control over the software components they use. An
  SBOM facilitates compliance by providing a clear and accessible record.
@z

@x
- Improved incident response: In the event of a security breach, an SBOM
  enables organizations to quickly identify affected components and take
  appropriate action, minimizing potential damage.
@y
- Improved incident response: In the event of a security breach, an SBOM
  enables organizations to quickly identify affected components and take
  appropriate action, minimizing potential damage.
@z

@x
## Docker Hardened Image SBOMs
@y
## Docker Hardened Image SBOMs
@z

@x
Docker Hardened Images come with built-in SBOMs, ensuring that every component
in the image is documented and verifiable. These SBOMs are cryptographically
signed, providing a tamper-evident record of the image's contents. This
integration simplifies audits and enhances trust in the software supply chain.
@y
Docker Hardened Images come with built-in SBOMs, ensuring that every component
in the image is documented and verifiable. These SBOMs are cryptographically
signed, providing a tamper-evident record of the image's contents. This
integration simplifies audits and enhances trust in the software supply chain.
@z

@x
## View SBOMs in Docker Hardened Images
@y
## View SBOMs in Docker Hardened Images
@z

@x
To view the SBOM of a Docker Hardened Image, you can use the `docker scout sbom`
command. Replace `<image-name>:<tag>` with the image name and tag.
@y
To view the SBOM of a Docker Hardened Image, you can use the `docker scout sbom`
command. Replace `<image-name>:<tag>` with the image name and tag.
@z

@x
```console
$ docker scout sbom dhi.io/<image-name>:<tag>
```
@y
```console
$ docker scout sbom dhi.io/<image-name>:<tag>
```
@z

@x
## Verify the SBOM of a Docker Hardened Image
@y
## Verify the SBOM of a Docker Hardened Image
@z

@x
Since Docker Hardened Images come with signed SBOMs, you can use Docker Scout to
verify the authenticity and integrity of the SBOM attached to the image. This
ensures that the SBOM has not been tampered with and that the image's contents
are trustworthy.
@y
Since Docker Hardened Images come with signed SBOMs, you can use Docker Scout to
verify the authenticity and integrity of the SBOM attached to the image. This
ensures that the SBOM has not been tampered with and that the image's contents
are trustworthy.
@z

@x
To verify the SBOM of a Docker Hardened Image using Docker Scout, use the following command:
@y
To verify the SBOM of a Docker Hardened Image using Docker Scout, use the following command:
@z

@x
```console
$ docker scout attest get dhi.io/<image-name>:<tag> \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify --platform <platform>
```
@y
```console
$ docker scout attest get dhi.io/<image-name>:<tag> \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify --platform <platform>
```
@z

@x
For example, to verify the SBOM attestation for the `node:20.19-debian12` image:
@y
For example, to verify the SBOM attestation for the `node:20.19-debian12` image:
@z

@x
```console
$ docker scout attest get dhi.io/node:20.19-debian12 \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify --platform linux/amd64
```
@y
```console
$ docker scout attest get dhi.io/node:20.19-debian12 \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify --platform linux/amd64
```
@z

@x
## Resources
@y
## Resources
@z

@x
For more details about SBOM attestations and Docker Build, see [SBOM
attestations](/build/metadata/attestations/sbom/).
@y
For more details about SBOM attestations and Docker Build, see [SBOM
attestations](__SUBDIR__/build/metadata/attestations/sbom/).
@z

@x
To learn more about Docker Scout and working with SBOMs, see [Docker Scout SBOMs](../../scout/how-tos/view-create-sboms.md).
@y
To learn more about Docker Scout and working with SBOMs, see [Docker Scout SBOMs](../../scout/how-tos/view-create-sboms.md).
@z
