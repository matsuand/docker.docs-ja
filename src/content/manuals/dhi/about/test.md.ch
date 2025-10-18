%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: How Docker Hardened Images are tested
linktitle: Image testing
description: See how Docker Hardened Images are automatically tested for standards compliance, functionality, and security.
keywords: docker scout, test attestation, cosign verify, image testing, vulnerability scan
@y
title: How Docker Hardened Images are tested
linktitle: Image testing
description: See how Docker Hardened Images are automatically tested for standards compliance, functionality, and security.
keywords: docker scout, test attestation, cosign verify, image testing, vulnerability scan
@z

@x
Docker Hardened Images (DHIs) are designed to be secure, minimal, and
production-ready. To ensure their reliability and security, Docker employs a
comprehensive testing strategy, which you can independently verify using signed
attestations and open tooling.
@y
Docker Hardened Images (DHIs) are designed to be secure, minimal, and
production-ready. To ensure their reliability and security, Docker employs a
comprehensive testing strategy, which you can independently verify using signed
attestations and open tooling.
@z

@x
Every image is tested for standards compliance, functionality, and security. The
results of this testing are embedded as signed attestations, which can be
[inspected and verified](#view-and-verify-the-test-attestation) programmatically
using the Docker Scout CLI.
@y
Every image is tested for standards compliance, functionality, and security. The
results of this testing are embedded as signed attestations, which can be
[inspected and verified](#view-and-verify-the-test-attestation) programmatically
using the Docker Scout CLI.
@z

@x
## Testing strategy overview
@y
## Testing strategy overview
@z

@x
The testing process for DHIs focuses on two main areas:
@y
The testing process for DHIs focuses on two main areas:
@z

@x
- Image standards compliance: Ensuring that each image adheres to strict size,
  security, and compatibility standards.
- Application functionality: Verifying that applications within the images
  function correctly.
@y
- Image standards compliance: Ensuring that each image adheres to strict size,
  security, and compatibility standards.
- Application functionality: Verifying that applications within the images
  function correctly.
@z

@x
## Image standards compliance
@y
## Image standards compliance
@z

@x
Each DHI undergoes rigorous checks to meet the following standards:
@y
Each DHI undergoes rigorous checks to meet the following standards:
@z

@x
- Minimal attack surface: Images are built to be as small as possible, removing
  unnecessary components to reduce potential vulnerabilities.
- Near-zero known CVEs: Images are scanned using tools like Docker Scout to
  ensure they are free from known Common Vulnerabilities and Exposures (CVEs).
- Multi-architecture support: DHIs are built for multiple architectures
  (`linux/amd64` and `linux/arm64`) to ensure broad compatibility.
- Kubernetes compatibility: Images are tested to run seamlessly within
  Kubernetes clusters, ensuring they meet the requirements for container
  orchestration environments.
@y
- Minimal attack surface: Images are built to be as small as possible, removing
  unnecessary components to reduce potential vulnerabilities.
- Near-zero known CVEs: Images are scanned using tools like Docker Scout to
  ensure they are free from known Common Vulnerabilities and Exposures (CVEs).
- Multi-architecture support: DHIs are built for multiple architectures
  (`linux/amd64` and `linux/arm64`) to ensure broad compatibility.
- Kubernetes compatibility: Images are tested to run seamlessly within
  Kubernetes clusters, ensuring they meet the requirements for container
  orchestration environments.
@z

@x
## Application functionality testing
@y
## Application functionality testing
@z

@x
Docker tests Docker Hardened Images to ensure they behave as expected in typical
usage scenarios. This includes verifying that:
@y
Docker tests Docker Hardened Images to ensure they behave as expected in typical
usage scenarios. This includes verifying that:
@z

@x
- Applications start and run successfully in containerized environments.
- Runtime behavior aligns with upstream expectations.
- Build variants (like `-dev` images) support common development and build tasks.
@y
- Applications start and run successfully in containerized environments.
- Runtime behavior aligns with upstream expectations.
- Build variants (like `-dev` images) support common development and build tasks.
@z

@x
The goal is to ensure that DHIs work out of the box for the most common use
cases while maintaining the hardened, minimal design.
@y
The goal is to ensure that DHIs work out of the box for the most common use
cases while maintaining the hardened, minimal design.
@z

@x
## Automated testing and CI/CD integration
@y
## Automated testing and CI/CD integration
@z

@x
Docker integrates automated testing into its Continuous Integration/Continuous
Deployment (CI/CD) pipelines:
@y
Docker integrates automated testing into its Continuous Integration/Continuous
Deployment (CI/CD) pipelines:
@z

@x
- Automated scans: Each image build triggers automated scans for vulnerabilities
  and compliance checks.
- Reproducible builds: Build processes are designed to be reproducible, ensuring
  consistency across different environments.
- Continuous monitoring: Docker continuously monitors for new vulnerabilities
  and updates images accordingly to maintain security standards.
@y
- Automated scans: Each image build triggers automated scans for vulnerabilities
  and compliance checks.
- Reproducible builds: Build processes are designed to be reproducible, ensuring
  consistency across different environments.
- Continuous monitoring: Docker continuously monitors for new vulnerabilities
  and updates images accordingly to maintain security standards.
@z

@x
## Testing attestation
@y
## Testing attestation
@z

@x
Docker provides a test attestation that details the testing and validation
processes each DHI has undergone.
@y
Docker provides a test attestation that details the testing and validation
processes each DHI has undergone.
@z

@x
### View and verify the test attestation
@y
### View and verify the test attestation
@z

@x
You can view and verify this attestation using the Docker Scout CLI.
@y
You can view and verify this attestation using the Docker Scout CLI.
@z

@x
1. Use the `docker scout attest get` command with the test predicate type:
@y
1. Use the `docker scout attest get` command with the test predicate type:
@z

% snip code...

@x
   For example:
@y
   For example:
@z

% snip code...

@x
   This contains a list of tests and their results.
@y
   This contains a list of tests and their results.
@z

@x
   Example output:
@y
   Example output:
@z

% snip code...

@x
2. Verify the test attestation signature. To ensure the attestation is authentic
   and signed by Docker, run:
@y
2. Verify the test attestation signature. To ensure the attestation is authentic
   and signed by Docker, run:
@z

% snip code...

@x
   Example output:
@y
   Example output:
@z

% snip code...

@x
If the attestation is valid, Docker Scout will confirm the signature and show
the matching `cosign verify` command.
@y
If the attestation is valid, Docker Scout will confirm the signature and show
the matching `cosign verify` command.
@z

@x
To view other attestations, such as SBOMs or vulnerability reports, see [Verify
an image](../how-to/verify.md).
@y
To view other attestations, such as SBOMs or vulnerability reports, see [Verify
an image](../how-to/verify.md).
@z
