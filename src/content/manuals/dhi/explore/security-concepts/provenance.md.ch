%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ ‘Î‰ž

@x
title: Image provenance
description: Learn how build provenance metadata helps trace the origin of Docker Hardened Images and support compliance with SLSA.
keywords: image provenance, container build traceability, slsa compliance, signed container image, software supply chain trust
@y
title: Image provenance
description: Learn how build provenance metadata helps trace the origin of Docker Hardened Images and support compliance with SLSA.
keywords: image provenance, container build traceability, slsa compliance, signed container image, software supply chain trust
@z

@x
## What is image provenance?
@y
## What is image provenance?
@z

@x
Image provenance refers to metadata that traces the origin, authorship, and
integrity of a container image. It answers critical questions such as:
@y
Image provenance refers to metadata that traces the origin, authorship, and
integrity of a container image. It answers critical questions such as:
@z

@x
- Where did this image come from?
- Who built it?
- Has it been tampered with?
@y
- Where did this image come from?
- Who built it?
- Has it been tampered with?
@z

@x
Provenance establishes a chain of custody, helping you verify that the image
you're using is the result of a trusted and verifiable build process.
@y
Provenance establishes a chain of custody, helping you verify that the image
you're using is the result of a trusted and verifiable build process.
@z

@x
## Why image provenance matters
@y
## Why image provenance matters
@z

@x
Provenance is foundational to securing your software supply chain. Without it, you risk:
@y
Provenance is foundational to securing your software supply chain. Without it, you risk:
@z

@x
- Running unverified or malicious images
- Failing to meet internal or regulatory compliance requirements
- Losing visibility into the components and workflows that produce your containers
@y
- Running unverified or malicious images
- Failing to meet internal or regulatory compliance requirements
- Losing visibility into the components and workflows that produce your containers
@z

@x
With reliable provenance, you gain:
@y
With reliable provenance, you gain:
@z

@x
- Trust: Know that your images are authentic and unchanged.
- Traceability: Understand the full build process and source inputs.
- Auditability: Provide verifiable evidence of compliance and build integrity.
@y
- Trust: Know that your images are authentic and unchanged.
- Traceability: Understand the full build process and source inputs.
- Auditability: Provide verifiable evidence of compliance and build integrity.
@z

@x
Provenance also supports automated policy enforcement and is a key requirement
for frameworks like SLSA (Supply-chain Levels for Software Artifacts).
@y
Provenance also supports automated policy enforcement and is a key requirement
for frameworks like SLSA (Supply-chain Levels for Software Artifacts).
@z

@x
## How Docker Hardened Images support provenance
@y
## How Docker Hardened Images support provenance
@z

@x
Docker Hardened Images (DHIs) are designed with built-in provenance to help you
adopt secure-by-default practices and meet supply chain security standards.
@y
Docker Hardened Images (DHIs) are designed with built-in provenance to help you
adopt secure-by-default practices and meet supply chain security standards.
@z

@x
### Attestations
@y
### Attestations
@z

@x
DHIs include [attestations](./attestations.md)â€”machine-readable metadata that
describe how, when, and where the image was built. These are generated using
industry standards such as [in-toto](https://in-toto.io/) and align with [SLSA
provenance](https://slsa.dev/spec/v1.0/provenance/).
@y
DHIs include [attestations](./attestations.md)â€”machine-readable metadata that
describe how, when, and where the image was built. These are generated using
industry standards such as [in-toto](https://in-toto.io/) and align with [SLSA
provenance](https://slsa.dev/spec/v1.0/provenance/).
@z

@x
Attestations allow you to:
@y
Attestations allow you to:
@z

@x
- Validate that builds followed the expected steps
- Confirm that inputs and environments meet policy
- Trace the build process across systems and stages
@y
- Validate that builds followed the expected steps
- Confirm that inputs and environments meet policy
- Trace the build process across systems and stages
@z

@x
### Code signing
@y
### Code signing
@z

@x
Each Docker Hardened Image is cryptographically [signed](./signatures.md) and
stored in the registry alongside its digest. These signatures are verifiable
proofs of authenticity and are compatible with tools like `cosign`, Docker
Scout, and Kubernetes admission controllers.
@y
Each Docker Hardened Image is cryptographically [signed](./signatures.md) and
stored in the registry alongside its digest. These signatures are verifiable
proofs of authenticity and are compatible with tools like `cosign`, Docker
Scout, and Kubernetes admission controllers.
@z

@x
With image signatures, you can:
@y
With image signatures, you can:
@z

@x
- Confirm that the image was published by Docker
- Detect if an image has been modified or republished
- Enforce signature validation in CI/CD or production deployments
@y
- Confirm that the image was published by Docker
- Detect if an image has been modified or republished
- Enforce signature validation in CI/CD or production deployments
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- [Provenance attestations](/build/metadata/attestations/slsa-provenance/)
- [Image signatures](./signatures.md)
- [Attestations overview](./attestations.md)
@y
- [Provenance attestations](__SUBDIR__/build/metadata/attestations/slsa-provenance/)
- [Image signatures](./signatures.md)
- [Attestations overview](./attestations.md)
@z
