%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Scout.
@y
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Scout.
@z

@x
<!-- vale Docker.HeadingLength = NO -->
@y
<!-- vale Docker.HeadingLength = NO -->
@z

@x
### How is Docker Scout different from other security tools?
@y
### How is Docker Scout different from other security tools?
@z

@x
Docker Scout takes a broader approach to container security compared to
third-party security tools. Third-party security tools, if they offer
remediation guidance at all, miss the mark on their limited scope of
application security posture within the software supply chain, and often
limited guidance when it comes to suggested fixes. Such tools have either
limitations on runtime monitoring or no runtime protection at all. When they do
offer runtime monitoring, it’s limited in its adherence to key policies.
Third-party security tools offer a limited scope of policy evaluation for
Docker-specific builds. By focusing on the entire software supply chain,
providing actionable guidance, and offering comprehensive runtime protection
with strong policy enforcement, Docker Scout goes beyond just identifying
vulnerabilities in your containers. It helps you build secure applications from
the ground up.
@y
Docker Scout takes a broader approach to container security compared to
third-party security tools. Third-party security tools, if they offer
remediation guidance at all, miss the mark on their limited scope of
application security posture within the software supply chain, and often
limited guidance when it comes to suggested fixes. Such tools have either
limitations on runtime monitoring or no runtime protection at all. When they do
offer runtime monitoring, it’s limited in its adherence to key policies.
Third-party security tools offer a limited scope of policy evaluation for
Docker-specific builds. By focusing on the entire software supply chain,
providing actionable guidance, and offering comprehensive runtime protection
with strong policy enforcement, Docker Scout goes beyond just identifying
vulnerabilities in your containers. It helps you build secure applications from
the ground up.
@z

@x
### Can I use Docker Scout with external registries other than Docker Hub?
@y
### Can I use Docker Scout with external registries other than Docker Hub?
@z

@x
You can use Scout with registries other than Docker Hub. Integrating Docker Scout
with third-party container registries enables Docker Scout to run image
analysis on those repositories so that you can get insights into the
composition of those images even if they aren't hosted on Docker Hub.
@y
You can use Scout with registries other than Docker Hub. Integrating Docker Scout
with third-party container registries enables Docker Scout to run image
analysis on those repositories so that you can get insights into the
composition of those images even if they aren't hosted on Docker Hub.
@z

@x
The following container registry integrations are available:
@y
The following container registry integrations are available:
@z

@x
- Artifactory
- Amazon Elastic Container Registry
- Azure Container Registry
@y
- Artifactory
- Amazon Elastic Container Registry
- Azure Container Registry
@z

@x
Learn more about configuring Scout with your registries in [Integrating Docker Scout with third-party registries](/scout/integrations/#container-registries).
@y
Learn more about configuring Scout with your registries in [Integrating Docker Scout with third-party registries](__SUBDIR__/scout/integrations/#container-registries).
@z

@x
### Does Docker Scout CLI come by default with Docker Desktop?
@y
### Does Docker Scout CLI come by default with Docker Desktop?
@z

@x
Yes, the Docker Scout CLI plugin comes pre-installed with Docker Desktop.
@y
Yes, the Docker Scout CLI plugin comes pre-installed with Docker Desktop.
@z

@x
### Is it possible to run `docker scout` commands on a Linux system without Docker Desktop?
@y
### Is it possible to run `docker scout` commands on a Linux system without Docker Desktop?
@z

@x
If you run Docker Engine without Docker Desktop, Docker Scout doesn't come
pre-installed, but you can [install it as a standalone binary](/scout/install/).
@y
If you run Docker Engine without Docker Desktop, Docker Scout doesn't come
pre-installed, but you can [install it as a standalone binary](__SUBDIR__/scout/install/).
@z

@x
### How is Docker Scout using an SBOM?
@y
### How is Docker Scout using an SBOM?
@z

@x
An SBOM, or software bill of materials, is a list of ingredients that make up
software components. [Docker Scout uses SBOMs](/scout/concepts/sbom/) to
determine the components that are used in a Docker image. When you analyze an
image, Docker Scout will either use the SBOM that is attached to the image (as
an attestation), or generate an SBOM on the fly by analyzing the contents of
the image.
@y
An SBOM, or software bill of materials, is a list of ingredients that make up
software components. [Docker Scout uses SBOMs](__SUBDIR__/scout/concepts/sbom/) to
determine the components that are used in a Docker image. When you analyze an
image, Docker Scout will either use the SBOM that is attached to the image (as
an attestation), or generate an SBOM on the fly by analyzing the contents of
the image.
@z

@x
The SBOM is cross-referenced with the advisory database to determine if any of
the components in the image have known vulnerabilities.
@y
The SBOM is cross-referenced with the advisory database to determine if any of
the components in the image have known vulnerabilities.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z
