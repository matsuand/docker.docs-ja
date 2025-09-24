%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Seamless integration
description: Learn how Docker Hardened Images integrate into your existing development and deployment workflows for enhanced security without compromising usability.
description_short: See how Docker Hardened Images integrate with CI/CD pipelines, vulnerability scanners, and container registries across your toolchain
keywords: ci cd containers, vulnerability scanning, slsa build level 3, signed sbom, oci compliant registry
@y
title: Seamless integration
description: Learn how Docker Hardened Images integrate into your existing development and deployment workflows for enhanced security without compromising usability.
description_short: See how Docker Hardened Images integrate with CI/CD pipelines, vulnerability scanners, and container registries across your toolchain
keywords: ci cd containers, vulnerability scanning, slsa build level 3, signed sbom, oci compliant registry
@z

@x
Docker Hardened Images (DHI) are designed to integrate effortlessly into your
existing development and deployment workflows, ensuring that enhanced security
does not come at the cost of usability.
@y
Docker Hardened Images (DHI) are designed to integrate effortlessly into your
existing development and deployment workflows, ensuring that enhanced security
does not come at the cost of usability.
@z

@x
## Explore images in Docker Hub
@y
## Explore images in Docker Hub
@z

@x
After your organization [signs
up](https://www.docker.com/products/hardened-images/#getstarted), teams can
explore the full DHI catalog directly on Docker Hub. There, developers and
security teams can:
@y
After your organization [signs
up](https://www.docker.com/products/hardened-images/#getstarted), teams can
explore the full DHI catalog directly on Docker Hub. There, developers and
security teams can:
@z

@x
- Review available images and language/framework variants
- Understand supported distros
- Compare development vs. runtime variants
@y
- Review available images and language/framework variants
- Understand supported distros
- Compare development vs. runtime variants
@z

@x
Each repository includes metadata like supported tags, base image
configurations, and image-specific documentation, helping you choose the right variant
for your project.
@y
Each repository includes metadata like supported tags, base image
configurations, and image-specific documentation, helping you choose the right variant
for your project.
@z

@x
## Use DHIs in CI/CD workflows
@y
## Use DHIs in CI/CD workflows
@z

@x
You can use DHIs as the same base image in any CI/CD pipeline that is built
using a Dockerfile. They integrate easily into platforms like GitHub Actions,
GitLab CI/CD, Jenkins, CircleCI, and other automation systems your team already
uses.
@y
You can use DHIs as the same base image in any CI/CD pipeline that is built
using a Dockerfile. They integrate easily into platforms like GitHub Actions,
GitLab CI/CD, Jenkins, CircleCI, and other automation systems your team already
uses.
@z

@x
## Built to fit your DevSecOps stack
@y
## Built to fit your DevSecOps stack
@z

@x
Docker Hardened Images are designed to work seamlessly with your existing
DevSecOps toolchain. They integrate with scanning tools, registries, CI/CD
systems, and policy engines that teams already use.
@y
Docker Hardened Images are designed to work seamlessly with your existing
DevSecOps toolchain. They integrate with scanning tools, registries, CI/CD
systems, and policy engines that teams already use.
@z

@x
Docker has partnered with a broad range of ecosystem providers in order to
ensure that DHIs work out of the box with your existing workflows and tools.
These partners help deliver enhanced scanning, metadata validation, and
compliance insights directly into your pipelines.
@y
Docker has partnered with a broad range of ecosystem providers in order to
ensure that DHIs work out of the box with your existing workflows and tools.
These partners help deliver enhanced scanning, metadata validation, and
compliance insights directly into your pipelines.
@z

@x
All DHIs include:
@y
All DHIs include:
@z

@x
- Signed Software Bill of Materials (SBOMs)
- CVE data
- Vulnerability Exploitability eXchange (VEX) documents
- SLSA Build Level 3 provenance
@y
- Signed Software Bill of Materials (SBOMs)
- CVE data
- Vulnerability Exploitability eXchange (VEX) documents
- SLSA Build Level 3 provenance
@z

@x
Because the metadata is signed and structured, you can feed it into policy
engines and dashboards for auditing or compliance workflows.
@y
Because the metadata is signed and structured, you can feed it into policy
engines and dashboards for auditing or compliance workflows.
@z

@x
## Distribute through your preferred registry
@y
## Distribute through your preferred registry
@z

@x
DHIs are mirrored to your organization's namespace on Docker Hub. From there,
you can optionally push them to any OCI-compliant registry, such as:
@y
DHIs are mirrored to your organization's namespace on Docker Hub. From there,
you can optionally push them to any OCI-compliant registry, such as:
@z

@x
- Amazon ECR
- Google Artifact Registry
- GitHub Container Registry
- Azure Container Registry
- Harbor
- JFrog Artifactory
- Other OCI-compliant on-premises or cloud registries
@y
- Amazon ECR
- Google Artifact Registry
- GitHub Container Registry
- Azure Container Registry
- Harbor
- JFrog Artifactory
- Other OCI-compliant on-premises or cloud registries
@z

@x
Mirroring ensures teams can pull images from their preferred location without
breaking policies or build systems.
@y
Mirroring ensures teams can pull images from their preferred location without
breaking policies or build systems.
@z

@x
## Summary
@y
## Summary
@z

@x
Docker Hardened Images integrate with the tools you already use, from development
and CI to scanning and deployment. They:
@y
Docker Hardened Images integrate with the tools you already use, from development
and CI to scanning and deployment. They:
@z

@x
- Work with standard Docker tooling and pipelines
- Support popular scanners and registries
- Include security metadata that plugs into your existing compliance systems
@y
- Work with standard Docker tooling and pipelines
- Support popular scanners and registries
- Include security metadata that plugs into your existing compliance systems
@z

@x
This means you can adopt stronger security controls without disrupting your
engineering workflows.
@y
This means you can adopt stronger security controls without disrupting your
engineering workflows.
@z
