%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Continuous patching and secure maintenance
linktitle: Continuous patching
description: Learn how Docker Hardened Images are automatically rebuilt, tested, and updated to stay in sync with upstream security patches.
keywords: docker hardened images, secure base image, automatic patching, CVE updates, compatibility, dev containers, runtime containers, image maintenance
@y
title: Continuous patching and secure maintenance
linktitle: Continuous patching
description: Learn how Docker Hardened Images are automatically rebuilt, tested, and updated to stay in sync with upstream security patches.
keywords: docker hardened images, secure base image, automatic patching, CVE updates, compatibility, dev containers, runtime containers, image maintenance
@z

@x
Docker Hardened Images (DHI) offer a secure and enterprise-ready foundation for
containerized applications, backed by a robust, automated patching process that
helps maintain compliance and reduce vulnerability exposure.
@y
Docker Hardened Images (DHI) offer a secure and enterprise-ready foundation for
containerized applications, backed by a robust, automated patching process that
helps maintain compliance and reduce vulnerability exposure.
@z

@x
## Secure base images with strong compatibility
@y
## Secure base images with strong compatibility
@z

@x
DHI includes a curated set of minimal base images designed to work across a
broad range of environments and language ecosystems. These images provide secure
building blocks with high compatibility, making it easier to integrate into your
existing infrastructure and development workflows without sacrificing security.
@y
DHI includes a curated set of minimal base images designed to work across a
broad range of environments and language ecosystems. These images provide secure
building blocks with high compatibility, making it easier to integrate into your
existing infrastructure and development workflows without sacrificing security.
@z

@x
## Development and runtime variants
@y
## Development and runtime variants
@z

@x
To support different stages of the software lifecycle, DHI provides two key
variants:
@y
To support different stages of the software lifecycle, DHI provides two key
variants:
@z

@x
- Development images: Include essential tools and libraries required to build
  and test applications securely.
- Runtime images: Contain only the core components needed to run applications,
  offering a smaller attack surface and improved runtime efficiency.
@y
- Development images: Include essential tools and libraries required to build
  and test applications securely.
- Runtime images: Contain only the core components needed to run applications,
  offering a smaller attack surface and improved runtime efficiency.
@z

@x
This variant structure supports multi-stage builds, enabling developers to
compile code in secure development containers and deploy with lean runtime
images in production.
@y
This variant structure supports multi-stage builds, enabling developers to
compile code in secure development containers and deploy with lean runtime
images in production.
@z

@x
## Automated patching and secure updates
@y
## Automated patching and secure updates
@z

@x
Docker monitors upstream open-source packages and security advisories for
vulnerabilities (CVEs) and other updates. When changes are detected, affected
Docker Hardened Images are automatically rebuilt and tested.
@y
Docker monitors upstream open-source packages and security advisories for
vulnerabilities (CVEs) and other updates. When changes are detected, affected
Docker Hardened Images are automatically rebuilt and tested.
@z

@x
Updated images are published with cryptographic provenance attestations to
support verification and compliance workflows. This automated process reduces
the operational burden of manual patching and helps teams stay aligned with
secure software development practices.
@y
Updated images are published with cryptographic provenance attestations to
support verification and compliance workflows. This automated process reduces
the operational burden of manual patching and helps teams stay aligned with
secure software development practices.
@z
