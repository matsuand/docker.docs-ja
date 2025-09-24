%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Secure Software Development Lifecycle
linktitle: SSDLC
description: See how Docker Hardened Images support a secure SDLC by integrating with scanning, signing, and debugging tools.
keywords: secure software development, ssdlc containers, slsa compliance, docker scout integration, secure container debugging
@y
title: Secure Software Development Lifecycle
linktitle: SSDLC
description: See how Docker Hardened Images support a secure SDLC by integrating with scanning, signing, and debugging tools.
keywords: secure software development, ssdlc containers, slsa compliance, docker scout integration, secure container debugging
@z

@x
## What is a Secure Software Development Lifecycle?
@y
## What is a Secure Software Development Lifecycle?
@z

@x
A Secure Software Development Lifecycle (SSDLC) integrates security practices
into every phase of software delivery, from design and development to deployment
and monitoring. It’s not just about writing secure code, but about embedding
security throughout the tools, environments, and workflows used to build and
ship software.
@y
A Secure Software Development Lifecycle (SSDLC) integrates security practices
into every phase of software delivery, from design and development to deployment
and monitoring. It’s not just about writing secure code, but about embedding
security throughout the tools, environments, and workflows used to build and
ship software.
@z

@x
SSDLC practices are often guided by compliance frameworks, organizational
policies, and supply chain security standards such as SLSA (Supply-chain Levels
for Software Artifacts) or NIST SSDF.
@y
SSDLC practices are often guided by compliance frameworks, organizational
policies, and supply chain security standards such as SLSA (Supply-chain Levels
for Software Artifacts) or NIST SSDF.
@z

@x
## Why SSDLC matters
@y
## Why SSDLC matters
@z

@x
Modern applications depend on fast, iterative development, but rapid delivery
often introduces security risks if protections aren’t built in early. An SSDLC
helps:
@y
Modern applications depend on fast, iterative development, but rapid delivery
often introduces security risks if protections aren’t built in early. An SSDLC
helps:
@z

@x
- Prevent vulnerabilities before they reach production
- Ensure compliance through traceable and auditable workflows
- Reduce operational risk by maintaining consistent security standards
- Enable secure automation in CI/CD pipelines and cloud-native environments
@y
- Prevent vulnerabilities before they reach production
- Ensure compliance through traceable and auditable workflows
- Reduce operational risk by maintaining consistent security standards
- Enable secure automation in CI/CD pipelines and cloud-native environments
@z

@x
By making security a first-class citizen in each stage of software delivery,
organizations can shift left and reduce both cost and complexity.
@y
By making security a first-class citizen in each stage of software delivery,
organizations can shift left and reduce both cost and complexity.
@z

@x
## How Docker supports a secure SDLC
@y
## How Docker supports a secure SDLC
@z

@x
Docker provides tools and secure content that make SSDLC practices easier to
adopt across the container lifecycle. With [Docker Hardened
Images](../_index.md) (DHIs), [Docker
Debug](../../../reference/cli/docker/debug.md), and [Docker
Scout](../../../manuals/scout/_index.md), teams can add security without losing
velocity.
@y
Docker provides tools and secure content that make SSDLC practices easier to
adopt across the container lifecycle. With [Docker Hardened
Images](../_index.md) (DHIs), [Docker
Debug](../../../reference/cli/docker/debug.md), and [Docker
Scout](../../../manuals/scout/_index.md), teams can add security without losing
velocity.
@z

@x
### Plan and design
@y
### Plan and design
@z

@x
During planning, teams define architectural constraints, compliance goals, and
threat models. Docker Hardened Images help at this stage by providing:
@y
During planning, teams define architectural constraints, compliance goals, and
threat models. Docker Hardened Images help at this stage by providing:
@z

@x
- Secure-by-default base images for common languages and runtimes
- Verified metadata including SBOMs, provenance, and VEX documents
- Support for both glibc and musl across multiple Linux distributions
@y
- Secure-by-default base images for common languages and runtimes
- Verified metadata including SBOMs, provenance, and VEX documents
- Support for both glibc and musl across multiple Linux distributions
@z

@x
You can use DHI metadata and attestations to support design reviews, threat
modeling, or architecture sign-offs.
@y
You can use DHI metadata and attestations to support design reviews, threat
modeling, or architecture sign-offs.
@z

@x
### Develop
@y
### Develop
@z

@x
In development, security should be transparent and easy to apply. Docker
Hardened Images support secure-by-default development:
@y
In development, security should be transparent and easy to apply. Docker
Hardened Images support secure-by-default development:
@z

@x
- Dev variants include shells, package managers, and compilers for convenience
- Minimal runtime variants reduce attack surface in final images
- Multi-stage builds let you separate build-time tools from runtime environments
@y
- Dev variants include shells, package managers, and compilers for convenience
- Minimal runtime variants reduce attack surface in final images
- Multi-stage builds let you separate build-time tools from runtime environments
@z

@x
[Docker Debug](../../../reference/cli/docker/debug.md) helps developers:
@y
[Docker Debug](../../../reference/cli/docker/debug.md) helps developers:
@z

@x
- Temporarily inject debugging tools into minimal containers
- Avoid modifying base images during troubleshooting
- Investigate issues securely, even in production-like environments
@y
- Temporarily inject debugging tools into minimal containers
- Avoid modifying base images during troubleshooting
- Investigate issues securely, even in production-like environments
@z

@x
### Build and test
@y
### Build and test
@z

@x
Build pipelines are an ideal place to catch issues early. Docker Scout
integrates with Docker Hub and the CLI to:
@y
Build pipelines are an ideal place to catch issues early. Docker Scout
integrates with Docker Hub and the CLI to:
@z

@x
- Scan for known CVEs using multiple vulnerability databases
- Trace vulnerabilities to specific layers and dependencies
- Interpret signed VEX data to suppress known-irrelevant issues
- Export JSON scan reports for CI/CD workflows
@y
- Scan for known CVEs using multiple vulnerability databases
- Trace vulnerabilities to specific layers and dependencies
- Interpret signed VEX data to suppress known-irrelevant issues
- Export JSON scan reports for CI/CD workflows
@z

@x
Build pipelines that use Docker Hardened Images benefit from:
@y
Build pipelines that use Docker Hardened Images benefit from:
@z

@x
- Reproducible, signed images
- Minimal build surfaces to reduce exposure
- Built-in compliance with SLSA Build Level 3 standards
@y
- Reproducible, signed images
- Minimal build surfaces to reduce exposure
- Built-in compliance with SLSA Build Level 3 standards
@z

@x
### Release and deploy
@y
### Release and deploy
@z

@x
Security automation is critical as you release software at scale. Docker
supports this phase by enabling:
@y
Security automation is critical as you release software at scale. Docker
supports this phase by enabling:
@z

@x
- Signature verification and provenance validation before deployment
- Policy enforcement gates using Docker Scout
- Safe, non-invasive container inspection using Docker Debug
@y
- Signature verification and provenance validation before deployment
- Policy enforcement gates using Docker Scout
- Safe, non-invasive container inspection using Docker Debug
@z

@x
DHIs ship with the metadata and signatures required to automate image
verification during deployment.
@y
DHIs ship with the metadata and signatures required to automate image
verification during deployment.
@z

@x
### Monitor and improve
@y
### Monitor and improve
@z

@x
Security continues after release. With Docker tools, you can:
@y
Security continues after release. With Docker tools, you can:
@z

@x
- Continuously monitor image vulnerabilities through Docker Hub
- Get CVE remediation guidance and patch visibility using Docker Scout
- Receive updated DHI images with rebuilt and re-signed secure layers
- Debug running workloads with Docker Debug without modifying the image
@y
- Continuously monitor image vulnerabilities through Docker Hub
- Get CVE remediation guidance and patch visibility using Docker Scout
- Receive updated DHI images with rebuilt and re-signed secure layers
- Debug running workloads with Docker Debug without modifying the image
@z

@x
## Summary
@y
## Summary
@z

@x
Docker helps teams embed security throughout the SSDLC by combining secure
content (DHIs) with developer-friendly tooling (Docker Scout and Docker Debug).
These integrations promote secure practices without introducing friction, making
it easier to adopt compliance and supply chain security across your software
delivery lifecycle.
@y
Docker helps teams embed security throughout the SSDLC by combining secure
content (DHIs) with developer-friendly tooling (Docker Scout and Docker Debug).
These integrations promote secure practices without introducing friction, making
it easier to adopt compliance and supply chain security across your software
delivery lifecycle.
@z
