%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Immutable infrastructure
linktitle: Immutability
description: Understand how image digests, read-only containers, and signed metadata ensure Docker Hardened Images are tamper-resistant and immutable.
keywords: immutable container image, read-only docker image, configuration drift prevention, secure redeployment, image digest verification
@y
title: Immutable infrastructure
linktitle: Immutability
description: Understand how image digests, read-only containers, and signed metadata ensure Docker Hardened Images are tamper-resistant and immutable.
keywords: immutable container image, read-only docker image, configuration drift prevention, secure redeployment, image digest verification
@z

@x
Immutable infrastructure is a security and operations model where components
such as servers, containers, and images are never modified after deployment.
Instead of patching or reconfiguring live systems, you replace them entirely
with new versions.
@y
Immutable infrastructure is a security and operations model where components
such as servers, containers, and images are never modified after deployment.
Instead of patching or reconfiguring live systems, you replace them entirely
with new versions.
@z

@x
When using Docker Hardened Images, immutability is a best practice that
reinforces the security posture of your software supply chain.
@y
When using Docker Hardened Images, immutability is a best practice that
reinforces the security posture of your software supply chain.
@z

@x
## Why immutability matters
@y
## Why immutability matters
@z

@x
Mutable systems are harder to secure and audit. Live patching or manual updates
introduce risks such as:
@y
Mutable systems are harder to secure and audit. Live patching or manual updates
introduce risks such as:
@z

@x
- Configuration drift
- Untracked changes
- Inconsistent environments
- Increased attack surface
@y
- Configuration drift
- Untracked changes
- Inconsistent environments
- Increased attack surface
@z

@x
Immutable infrastructure solves this by making changes only through controlled,
repeatable builds and deployments.
@y
Immutable infrastructure solves this by making changes only through controlled,
repeatable builds and deployments.
@z

@x
## How Docker Hardened Images support immutability
@y
## How Docker Hardened Images support immutability
@z

@x
Docker Hardened Images are built to be minimal, locked-down, and
non-interactive, which discourages in-place modification. For example:
@y
Docker Hardened Images are built to be minimal, locked-down, and
non-interactive, which discourages in-place modification. For example:
@z

@x
- Many DHI images exclude shells, package managers, and debugging tools
- DHI images are designed to be scanned and signed before deployment
- DHI users are encouraged to rebuild and redeploy images rather than patch running containers
@y
- Many DHI images exclude shells, package managers, and debugging tools
- DHI images are designed to be scanned and signed before deployment
- DHI users are encouraged to rebuild and redeploy images rather than patch running containers
@z

@x
This design aligns with immutable practices and ensures that:
@y
This design aligns with immutable practices and ensures that:
@z

@x
- Updates go through the CI/CD pipeline
- All changes are versioned and auditable
- Systems can be rolled back or reproduced consistently
@y
- Updates go through the CI/CD pipeline
- All changes are versioned and auditable
- Systems can be rolled back or reproduced consistently
@z

@x
## Immutable patterns in practice
@y
## Immutable patterns in practice
@z

@x
Some common patterns that leverage immutability include:
@y
Some common patterns that leverage immutability include:
@z

@x
- Container replacement: Instead of logging into a container to fix a bug or
  apply a patch, rebuild the image and redeploy it.
- Infrastructure as Code (IaC): Define your infrastructure and image
  configurations in version-controlled files.
- Blue/Green or Canary deployments: Roll out new images alongside old ones and
  gradually shift traffic to the new version.
@y
- Container replacement: Instead of logging into a container to fix a bug or
  apply a patch, rebuild the image and redeploy it.
- Infrastructure as Code (IaC): Define your infrastructure and image
  configurations in version-controlled files.
- Blue/Green or Canary deployments: Roll out new images alongside old ones and
  gradually shift traffic to the new version.
@z

@x
By combining immutable infrastructure principles with hardened images, you
create a predictable and secure deployment workflow that resists tampering and
minimizes long-term risk.
@y
By combining immutable infrastructure principles with hardened images, you
create a predictable and secure deployment workflow that resists tampering and
minimizes long-term risk.
@z
