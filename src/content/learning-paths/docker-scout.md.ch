%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Securing your software supply chain with Docker Scout
summary: |
  Enhance container security by automating vulnerability detection and
  remediation, ensuring compliance, and protecting your development workflow.
description: |
  Learn how to use Docker Scout to enhance container security by automating
  vulnerability detection and remediation, ensuring compliance, and protecting
  your development workflow.
@y
title: Securing your software supply chain with Docker Scout
summary: |
  Enhance container security by automating vulnerability detection and
  remediation, ensuring compliance, and protecting your development workflow.
description: |
  Learn how to use Docker Scout to enhance container security by automating
  vulnerability detection and remediation, ensuring compliance, and protecting
  your development workflow.
@z

@x
{{< columns >}}
@y
{{< columns >}}
@z

@x
When container images are insecure, significant risks can arise. Around 60% of
organizations have reported experiencing at least one security breach or
vulnerability incident within a year, resulting in operational
disruption.[^CSA] These incidents often result in considerable downtime, with
44% of affected companies experiencing over an hour of downtime per event. The
financial impact is substantial, with the average data breach cost reaching
$4.45 million.[^IBM] This highlights the critical importance of maintaining
robust container security measures.
@y
When container images are insecure, significant risks can arise. Around 60% of
organizations have reported experiencing at least one security breach or
vulnerability incident within a year, resulting in operational
disruption.[^CSA] These incidents often result in considerable downtime, with
44% of affected companies experiencing over an hour of downtime per event. The
financial impact is substantial, with the average data breach cost reaching
$4.45 million.[^IBM] This highlights the critical importance of maintaining
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
[^CSA]: https://cloudsecurityalliance.org/blog/2023/09/21/2023-global-cloud-threat-report-cloud-attacks-are-lightning-fast
[^IBM]: https://www.ibm.com/reports/data-breach
@y
[^CSA]: https://cloudsecurityalliance.org/blog/2023/09/21/2023-global-cloud-threat-report-cloud-attacks-are-lightning-fast
[^IBM]: https://www.ibm.com/reports/data-breach
@z

@x
<!-- break -->
@y
<!-- break -->
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- Define secure software supply chain (SSSC)
- Review SBOMs and how to use them
- Detect and monitor vulnerabilities
@y
- Define secure software supply chain (SSSC)
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
{{< /columns >}}
@y
{{< /columns >}}
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
DevOps engineers who need to integrate automated security checks into CI/CD
pipelines to enhance the security and efficiency of their workflows. Developers
who want to use Docker Scout to identify and remediate vulnerabilities early in
the development process, ensuring the production of secure container images.
Security professionals who must enforce security compliance, conduct
vulnerability assessments, and ensure the overall security of containerized
applications.
@y
DevOps engineers who need to integrate automated security checks into CI/CD
pipelines to enhance the security and efficiency of their workflows. Developers
who want to use Docker Scout to identify and remediate vulnerabilities early in
the development process, ensuring the production of secure container images.
Security professionals who must enforce security compliance, conduct
vulnerability assessments, and ensure the overall security of containerized
applications.
@z

@x
## Modules
@y
## Modules
@z

@x
{{< accordion large=true title=`Why Docker Scout?` icon=`play_circle` >}}
@y
{{< accordion large=true title=`Why Docker Scout?` icon=`play_circle` >}}
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
- A system of record for your SDLC
- Continuous security posture improvement
@y
- Secure and trusted content
- A system of record for your SDLC
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
{{< youtube-embed "-omsQ7Uqyc4" >}}
@y
{{< youtube-embed "-omsQ7Uqyc4" >}}
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion large=true title=`Docker Scout Demo` icon=`play_circle` >}}
@y
{{< accordion large=true title=`Docker Scout Demo` icon=`play_circle` >}}
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
- A system of record for your SDLC
- Continuous security posture improvement
@y
- Secure and trusted content
- A system of record for your SDLC
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
{{< youtube-embed "TkLwJ0p46W8" >}}
@y
{{< youtube-embed "TkLwJ0p46W8" >}}
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion large=true title=`Common challenges and questions` icon=`quiz` >}}
@y
{{< accordion large=true title=`Common challenges and questions` icon=`quiz` >}}
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
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion large=true title=`Resources` icon=`link` >}}
@y
{{< accordion large=true title=`Resources` icon=`link` >}}
@z

@x
- [Docker Scout overview](/scout/)
- [Docker Scout quickstart](/scout/quickstart/)
- [Install Docker Scout](/scout/install/)
- [Software Bill of Materials](/scout/concepts/sbom/)
@y
- [Docker Scout overview](__SUBDIR__/scout/)
- [Docker Scout quickstart](__SUBDIR__/scout/quickstart/)
- [Install Docker Scout](__SUBDIR__/scout/install/)
- [Software Bill of Materials](__SUBDIR__/scout/concepts/sbom/)
@z

@x
<!-- vale Docker.HeadingLength = YES -->
@y
<!-- vale Docker.HeadingLength = YES -->
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z
