%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Securing your software supply chain with Docker Scout
linkTitle: Docker Scout
summary: |
  Enhance container security by automating vulnerability detection and
  remediation.
description: |
  Learn how to use Docker Scout to enhance container security by automating
  vulnerability detection and remediation, ensuring compliance, and protecting
  your development workflow.
keywords: docker scout, container security, vulnerability scanning, sbom, supply chain, remediation
@y
title: Securing your software supply chain with Docker Scout
linkTitle: Docker Scout
summary: |
  Enhance container security by automating vulnerability detection and
  remediation.
description: |
  Learn how to use Docker Scout to enhance container security by automating
  vulnerability detection and remediation, ensuring compliance, and protecting
  your development workflow.
keywords: docker scout, container security, vulnerability scanning, sbom, supply chain, remediation
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
When container images are insecure, significant risks can arise. Around 60% of
organizations have reported experiencing at least one security breach or
vulnerability incident within a year, [resulting in operational
disruption][CSA]. These incidents often result in considerable downtime, with
44% of affected companies experiencing over an hour of downtime per event. The
financial impact is substantial, with [the average data breach cost reaching
$4.45 million][IBM]. This highlights the critical importance of maintaining
robust container security measures.
@y
When container images are insecure, significant risks can arise. Around 60% of
organizations have reported experiencing at least one security breach or
vulnerability incident within a year, [resulting in operational
disruption][CSA]. These incidents often result in considerable downtime, with
44% of affected companies experiencing over an hour of downtime per event. The
financial impact is substantial, with [the average data breach cost reaching
$4.45 million][IBM]. This highlights the critical importance of maintaining
robust container security measures.
@z

@x
Docker Scout enhances container security by providing automated vulnerability
detection and remediation, addressing insecure container images, and ensuring
compliance with security standards.
@y
Docker Scout enhances container security by providing automated vulnerability
detection and remediation, addressing insecure container images, and ensuring
compliance with security standards.
@z

@x
[CSA]: https://cloudsecurityalliance.org/blog/2023/09/21/2023-global-cloud-threat-report-cloud-attacks-are-lightning-fast
[IBM]: https://www.ibm.com/reports/data-breach
@y
[CSA]: https://cloudsecurityalliance.org/blog/2023/09/21/2023-global-cloud-threat-report-cloud-attacks-are-lightning-fast
[IBM]: https://www.ibm.com/reports/data-breach
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- Define Secure Software Supply Chain (SSSC)
- Review SBOMs and how to use them
- Detect and monitor vulnerabilities
@y
- Define Secure Software Supply Chain (SSSC)
- Review SBOMs and how to use them
- Detect and monitor vulnerabilities
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
Works well with Docker Desktop, GitHub Actions, Jenkins, Kubernetes, and
other CI solutions.
@y
Works well with Docker Desktop, GitHub Actions, Jenkins, Kubernetes, and
other CI solutions.
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
- DevOps engineers who need to integrate automated security checks into CI/CD
  pipelines to enhance the security and efficiency of their workflows.
- Developers who want to use Docker Scout to identify and remediate
  vulnerabilities early in the development process, ensuring the production of
  secure container images.
- Security professionals who must enforce security compliance, conduct
  vulnerability assessments, and ensure the overall security of containerized
  applications.
@y
- DevOps engineers who need to integrate automated security checks into CI/CD
  pipelines to enhance the security and efficiency of their workflows.
- Developers who want to use Docker Scout to identify and remediate
  vulnerabilities early in the development process, ensuring the production of
  secure container images.
- Security professionals who must enforce security compliance, conduct
  vulnerability assessments, and ensure the overall security of containerized
  applications.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Why Docker Scout?
@y
## Why Docker Scout?
@z

@x
{{< youtube-embed "-omsQ7Uqyc4" >}}
@y
{{< youtube-embed "-omsQ7Uqyc4" >}}
@z

@x
Organizations face significant challenges from data breaches,
including financial losses, operational disruptions, and long-term damage to
brand reputation and customer trust. Docker Scout addresses critical problems
such as identifying insecure container images, preventing security breaches,
and reducing the risk of operational downtime due to vulnerabilities.
@y
Organizations face significant challenges from data breaches,
including financial losses, operational disruptions, and long-term damage to
brand reputation and customer trust. Docker Scout addresses critical problems
such as identifying insecure container images, preventing security breaches,
and reducing the risk of operational downtime due to vulnerabilities.
@z

@x
Docker Scout provides several benefits:
@y
Docker Scout provides several benefits:
@z

@x
- Secure and trusted content
- A system of record for your Software Development Lifecycle (SDLC)
- Continuous security posture improvement
@y
- Secure and trusted content
- A system of record for your Software Development Lifecycle (SDLC)
- Continuous security posture improvement
@z

@x
Docker Scout offers automated vulnerability detection and remediation, helping
organizations identify and fix security issues in container images early in the
development process. It also integrates with popular development tools like
Docker Desktop and GitHub Actions, providing seamless security management and
compliance checks within existing workflows.
@y
Docker Scout offers automated vulnerability detection and remediation, helping
organizations identify and fix security issues in container images early in the
development process. It also integrates with popular development tools like
Docker Desktop and GitHub Actions, providing seamless security management and
compliance checks within existing workflows.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Docker Scout demo
@y
## Docker Scout demo
@z

@x
{{< youtube-embed "TkLwJ0p46W8" >}}
@y
{{< youtube-embed "TkLwJ0p46W8" >}}
@z

@x
Docker Scout has powerful features for enhancing containerized application
security and ensuring a robust software supply chain.
@y
Docker Scout has powerful features for enhancing containerized application
security and ensuring a robust software supply chain.
@z

@x
- Define vulnerability remediation
- Discuss why remediation is essential to maintain the security and integrity
  of containerized applications
- Discuss common vulnerabilities
- Implement remediation techniques: updating base images, applying patches,
  removing unnecessary packages
- Verify and validate remediation efforts using Docker Scout
@y
- Define vulnerability remediation
- Discuss why remediation is essential to maintain the security and integrity
  of containerized applications
- Discuss common vulnerabilities
- Implement remediation techniques: updating base images, applying patches,
  removing unnecessary packages
- Verify and validate remediation efforts using Docker Scout
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Software supply chain security
@y
## Software supply chain security
@z

@x
{{< youtube-embed YzNK6E7APv0 >}}
@y
{{< youtube-embed YzNK6E7APv0 >}}
@z

@x
The term "software supply chain" refers to the end-to-end process of developing
and delivering software, from the development to deployment and maintenance.
Software supply chain security, or "S3C" for short, is the practice for
protecting the components and processes of the supply chain.
@y
The term "software supply chain" refers to the end-to-end process of developing
and delivering software, from the development to deployment and maintenance.
Software supply chain security, or "S3C" for short, is the practice for
protecting the components and processes of the supply chain.
@z

@x
S3C is a fundamental change in how organizations approach software security.
Traditionally in the software industry, security and compliance has been mostly
an afterthought, left to the software delivery or release phase. With S3C,
security is integrated into the entire software development lifecycle, from the
inner loop of development and testing, to the outer loop of shipping and
monitoring.
@y
S3C is a fundamental change in how organizations approach software security.
Traditionally in the software industry, security and compliance has been mostly
an afterthought, left to the software delivery or release phase. With S3C,
security is integrated into the entire software development lifecycle, from the
inner loop of development and testing, to the outer loop of shipping and
monitoring.
@z

@x
Following industry best practices for software supply chain conduct is
important because it helps organizations protect their software from security
threats, compliance risks, and other vulnerabilities. Implementing a software
supply chain security framework improves visibility, collaboration, and
traceability of a project across stakeholders. This helps organizations detect,
respond to, and remediate threats more effectively.
@y
Following industry best practices for software supply chain conduct is
important because it helps organizations protect their software from security
threats, compliance risks, and other vulnerabilities. Implementing a software
supply chain security framework improves visibility, collaboration, and
traceability of a project across stakeholders. This helps organizations detect,
respond to, and remediate threats more effectively.
@z

@x
### Securing the software supply chain
@y
### Securing the software supply chain
@z

@x
Building a secure software supply chain involves several key steps, such as:
@y
Building a secure software supply chain involves several key steps, such as:
@z

@x
- Identify the software components and dependencies you use to build and run
  your applications.
- Automate security testing throughout the software development lifecycle.
- Monitor your software supply chain for security threats.
- Implement security policies that govern how software is built, and the
  components it contains.
@y
- Identify the software components and dependencies you use to build and run
  your applications.
- Automate security testing throughout the software development lifecycle.
- Monitor your software supply chain for security threats.
- Implement security policies that govern how software is built, and the
  components it contains.
@z

@x
Managing the software supply chain is a complex task, especially in the modern
day where software is built using multiple components from different sources.
Organizations need to have a clear understanding of the software components
they use, and the security risks associated with them.
@y
Managing the software supply chain is a complex task, especially in the modern
day where software is built using multiple components from different sources.
Organizations need to have a clear understanding of the software components
they use, and the security risks associated with them.
@z

@x
### How Docker Scout is different
@y
### How Docker Scout is different
@z

@x
Docker Scout is a platform designed to help organizations secure their software
supply chain. It provides tools and services for identifying and managing
software assets and policies, and automated remediation of security threats.
@y
Docker Scout is a platform designed to help organizations secure their software
supply chain. It provides tools and services for identifying and managing
software assets and policies, and automated remediation of security threats.
@z

@x
Unlike traditional security tools that focus on scheduled, point-in-time scans
at specific stages in the software development lifecycle, Docker Scout uses a
modern event-driven model that spans the entire software supply chain. This
means that when a new vulnerability affecting your images is disclosed, your
updated risk assessment is available within seconds, and earlier in the
development process.
@y
Unlike traditional security tools that focus on scheduled, point-in-time scans
at specific stages in the software development lifecycle, Docker Scout uses a
modern event-driven model that spans the entire software supply chain. This
means that when a new vulnerability affecting your images is disclosed, your
updated risk assessment is available within seconds, and earlier in the
development process.
@z

@x
Docker Scout works by analyzing the composition of your images to create a
Software Bill of Materials (SBOM). The SBOM is cross-referenced against the
security advisories to identify CVEs that affect your images. Docker Scout
integrates with [over 20 different security
advisories](/manuals/scout/deep-dive/advisory-db-sources.md), and updates its
vulnerability database in real-time. This ensures that your security posture is
represented using the latest available information.
@y
Docker Scout works by analyzing the composition of your images to create a
Software Bill of Materials (SBOM). The SBOM is cross-referenced against the
security advisories to identify CVEs that affect your images. Docker Scout
integrates with [over 20 different security
advisories](manuals/scout/deep-dive/advisory-db-sources.md), and updates its
vulnerability database in real-time. This ensures that your security posture is
represented using the latest available information.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Software Bill of Materials
@y
## Software Bill of Materials
@z

@x
{{< youtube-embed PbS4y7C7h4A >}}
@y
{{< youtube-embed PbS4y7C7h4A >}}
@z

@x
A Bill of Materials (BOM) is a list of materials, parts, and the quantities of
each needed to manufacture a product. For example, a BOM for a computer might
list the motherboard, CPU, RAM, power supply, storage devices, case, and other
components, along with the quantities of each that are needed to build the
computer.
@y
A Bill of Materials (BOM) is a list of materials, parts, and the quantities of
each needed to manufacture a product. For example, a BOM for a computer might
list the motherboard, CPU, RAM, power supply, storage devices, case, and other
components, along with the quantities of each that are needed to build the
computer.
@z

@x
A Software Bill of Materials (SBOM) is a list of all the components that make
up a piece of software. This includes open source and third-party components,
as well as any custom code that has been written for the software. An SBOM is
similar to a BOM for a physical product, but for software.
@y
A Software Bill of Materials (SBOM) is a list of all the components that make
up a piece of software. This includes open source and third-party components,
as well as any custom code that has been written for the software. An SBOM is
similar to a BOM for a physical product, but for software.
@z

@x
In the context of software supply chain security, SBOMs can help with
identifying and mitigating security and compliance risks in software. By
knowing exactly what components are used in a piece of software, you can
quickly identify and patch vulnerabilities in your components, or determine if
a component is licensed in a way that is incompatible with your project.
@y
In the context of software supply chain security, SBOMs can help with
identifying and mitigating security and compliance risks in software. By
knowing exactly what components are used in a piece of software, you can
quickly identify and patch vulnerabilities in your components, or determine if
a component is licensed in a way that is incompatible with your project.
@z

@x
### Contents of an SBOM
@y
### Contents of an SBOM
@z

@x
An SBOM typically includes the following information:
@y
An SBOM typically includes the following information:
@z

@x
- The name of the software, such as the name of a library or framework, that
  the SBOM describes.
- The version of the software.
- The license under which the software is distributed.
- A list of other components that the software depends on.
@y
- The name of the software, such as the name of a library or framework, that
  the SBOM describes.
- The version of the software.
- The license under which the software is distributed.
- A list of other components that the software depends on.
@z

@x
### How Docker Scout uses SBOMs
@y
### How Docker Scout uses SBOMs
@z

@x
Docker Scout uses SBOMs to determine the components that are used in a Docker
image. When you analyze an image, Docker Scout will either use the SBOM that is
attached to the image as an attestation, or it will generate an SBOM on the fly
by analyzing the contents of the image.
@y
Docker Scout uses SBOMs to determine the components that are used in a Docker
image. When you analyze an image, Docker Scout will either use the SBOM that is
attached to the image as an attestation, or it will generate an SBOM on the fly
by analyzing the contents of the image.
@z

@x
The SBOM is cross-referenced with the [advisory database](/manuals/scout/deep-dive/advisory-db-sources.md)
to determine if any of the components in the image have known vulnerabilities.
@y
The SBOM is cross-referenced with the [advisory database](manuals/scout/deep-dive/advisory-db-sources.md)
to determine if any of the components in the image have known vulnerabilities.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Attestations
@y
## Attestations
@z

@x
{{< youtube-embed qOzcycbTs4o >}}
@y
{{< youtube-embed qOzcycbTs4o >}}
@z

@x
[Build attestations](/manuals/build/metadata/attestations/_index.md) give you
detailed information about how an image was built and what it contains. These
attestations, generated by BuildKit during build-time, attach to the final
image as metadata, allowing you to inspect an image to see its origin, creator,
and contents. This information helps you make informed decisions about the
security and impact of the image on your supply chain.
@y
[Build attestations](manuals/build/metadata/attestations/_index.md) give you
detailed information about how an image was built and what it contains. These
attestations, generated by BuildKit during build-time, attach to the final
image as metadata, allowing you to inspect an image to see its origin, creator,
and contents. This information helps you make informed decisions about the
security and impact of the image on your supply chain.
@z

@x
Docker Scout uses these attestations to evaluate the image's security and
supply chain posture, and to provide remediation recommendations for issues. If
issues are detected, such as missing or outdated attestations, Docker Scout can
guide you on how to add or update them, ensuring compliance and improving
visibility into the image's security status.
@y
Docker Scout uses these attestations to evaluate the image's security and
supply chain posture, and to provide remediation recommendations for issues. If
issues are detected, such as missing or outdated attestations, Docker Scout can
guide you on how to add or update them, ensuring compliance and improving
visibility into the image's security status.
@z

@x
There are two key types of attestations:
@y
There are two key types of attestations:
@z

@x
- SBOM, which lists the software artifacts within the image.
- Provenance, which details how the image was built.
@y
- SBOM, which lists the software artifacts within the image.
- Provenance, which details how the image was built.
@z

@x
You can create attestations by using `docker buildx build` with the
`--provenance` and `--sbom` flags. Attestations attach to the image index,
allowing you to inspect them without pulling the entire image. Docker Scout
leverages this metadata to give you more precise recommendations and better
control over your image's security.
@y
You can create attestations by using `docker buildx build` with the
`--provenance` and `--sbom` flags. Attestations attach to the image index,
allowing you to inspect them without pulling the entire image. Docker Scout
leverages this metadata to give you more precise recommendations and better
control over your image's security.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Remediation
@y
## Remediation
@z

@x
{{< youtube-embed jM9zLBf8M-8 >}}
@y
{{< youtube-embed jM9zLBf8M-8 >}}
@z

@x
Docker Scout's [remediation feature](/manuals/scout/policy/dashboard.md)
helps you address supply chain and security issues by offering tailored
recommendations based on policy evaluations. These recommendations guide you in
improving policy compliance or enhancing image metadata, allowing Docker Scout
to perform more accurate evaluations in the future.
@y
Docker Scout's [remediation feature](manuals/scout/policy/dashboard.md)
helps you address supply chain and security issues by offering tailored
recommendations based on policy evaluations. These recommendations guide you in
improving policy compliance or enhancing image metadata, allowing Docker Scout
to perform more accurate evaluations in the future.
@z

@x
You can use this feature to ensure that your base images are up-to-date and
that your supply chain attestations are complete. When a violation occurs,
Docker Scout provides recommended fixes, such as updating your base image or
adding missing attestations. If there isn’t enough information to determine
compliance, Docker Scout suggests actions to help resolve the issue.
@y
You can use this feature to ensure that your base images are up-to-date and
that your supply chain attestations are complete. When a violation occurs,
Docker Scout provides recommended fixes, such as updating your base image or
adding missing attestations. If there isn’t enough information to determine
compliance, Docker Scout suggests actions to help resolve the issue.
@z

@x
In the Docker Scout Dashboard, you can view and act on these recommendations by
reviewing violations or compliance uncertainties. With integrations like
GitHub, you can even automate updates, directly fixing issues from the
dashboard.
@y
In the Docker Scout Dashboard, you can view and act on these recommendations by
reviewing violations or compliance uncertainties. With integrations like
GitHub, you can even automate updates, directly fixing issues from the
dashboard.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z

@x
## Common challenges and questions
@y
## Common challenges and questions
@z

@x
<!-- vale Docker.HeadingLength = NO -->
@y
<!-- vale Docker.HeadingLength = NO -->
@z

@x
#### How is Docker Scout different from other security tools?
@y
#### How is Docker Scout different from other security tools?
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
#### Can I use Docker Scout with external registries other than Docker Hub?
@y
#### Can I use Docker Scout with external registries other than Docker Hub?
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
#### Does Docker Scout CLI come by default with Docker Desktop?
@y
#### Does Docker Scout CLI come by default with Docker Desktop?
@z

@x
Yes, the Docker Scout CLI plugin comes pre-installed with Docker Desktop.
@y
Yes, the Docker Scout CLI plugin comes pre-installed with Docker Desktop.
@z

@x
#### Is it possible to run `docker scout` commands on a Linux system without Docker Desktop?
@y
#### Is it possible to run `docker scout` commands on a Linux system without Docker Desktop?
@z

@x
If you run Docker Engine without Docker Desktop, Docker Scout doesn't come
pre-installed, but you can [install it as a standalone binary](/scout/install/).
@y
If you run Docker Engine without Docker Desktop, Docker Scout doesn't come
pre-installed, but you can [install it as a standalone binary](__SUBDIR__/scout/install/).
@z

@x
#### How is Docker Scout using an SBOM?
@y
#### How is Docker Scout using an SBOM?
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
