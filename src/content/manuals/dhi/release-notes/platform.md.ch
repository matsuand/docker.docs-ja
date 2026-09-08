%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Hardened Images release notes
linkTitle: Platform release notes
description: Learn about the latest features and changes in Docker Hardened Images
keywords: docker hardened images, dhi, release notes, changelog, features, changes, new, releases
@y
title: Docker Hardened Images release notes
linkTitle: Platform release notes
description: Learn about the latest features and changes in Docker Hardened Images
keywords: docker hardened images, dhi, release notes, changelog, features, changes, new, releases
@z

@x
This page contains information about the new features, improvements, and changes
in the Docker Hardened Images (DHI) platform. Release notes are aggregated by
quarter and include only notable product changes.
@y
This page contains information about the new features, improvements, and changes
in the Docker Hardened Images (DHI) platform. Release notes are aggregated by
quarter and include only notable product changes.
@z

@x
## Q3 2026
@y
## Q3 2026
@z

@x
New features and enhancements released in the third quarter of 2026.
@y
New features and enhancements released in the third quarter of 2026.
@z

@x
- DHI MCP server: The DHI catalog is now accessible via a remote MCP server at
  `https://dhi.io/mcp`. Connect any MCP-capable AI assistant to search
  repositories, inspect image metadata, retrieve SBOMs, check CVEs, and manage
  mirrors using plain language. For more information, see [Use the DHI MCP
  server](/dhi/tools/mcp/).
- DHI API: VEX statements and suppressed CVEs for a Docker Hardened Image are
  now available to query by digest through the DHI GraphQL API. For more
  information, see [Use the DHI API](../tools/api.md).
@y
- DHI MCP server: The DHI catalog is now accessible via a remote MCP server at
  `https://dhi.io/mcp`. Connect any MCP-capable AI assistant to search
  repositories, inspect image metadata, retrieve SBOMs, check CVEs, and manage
  mirrors using plain language. For more information, see [Use the DHI MCP
  server](__SUBDIR__/dhi/tools/mcp/).
- DHI API: VEX statements and suppressed CVEs for a Docker Hardened Image are
  now available to query by digest through the DHI GraphQL API. For more
  information, see [Use the DHI API](../tools/api.md).
@z

@x
## Q2 2026
@y
## Q2 2026
@z

@x
New features and enhancements released in the second quarter of 2026.
@y
New features and enhancements released in the second quarter of 2026.
@z

@x
- Debian Hardened System Packages: Added support for Debian-based Docker
  Hardened System Packages (HSP), including new CLI workflows for authenticating
  to the Debian HSP repository.
- Mend.io scanner integration: Mend.io is now a supported scanner for consuming
  DHI VEX data.
- Black Duck scanner integration: Black Duck is now a supported scanner for
  consuming DHI VEX data.
- DHI Select self-serve purchase: DHI Select is now available for self-serve
  purchase directly through the Docker website.
- Bulk customization: Apply customizations to multiple images in a single
  operation through the Docker Hub UI and the CLI.
- Terraform provider: Manage DHI resources, including customizations and
  mirrors, using the official Terraform provider.
@y
- Debian Hardened System Packages: Added support for Debian-based Docker
  Hardened System Packages (HSP), including new CLI workflows for authenticating
  to the Debian HSP repository.
- Mend.io scanner integration: Mend.io is now a supported scanner for consuming
  DHI VEX data.
- Black Duck scanner integration: Black Duck is now a supported scanner for
  consuming DHI VEX data.
- DHI Select self-serve purchase: DHI Select is now available for self-serve
  purchase directly through the Docker website.
- Bulk customization: Apply customizations to multiple images in a single
  operation through the Docker Hub UI and the CLI.
- Terraform provider: Manage DHI resources, including customizations and
  mirrors, using the official Terraform provider.
@z

@x
## Q1 2026
@y
## Q1 2026
@z

@x
New features and enhancements released in the first quarter of 2026.
@y
New features and enhancements released in the first quarter of 2026.
@z

@x
- Docker Hardened System Packages (HSP): Announced Docker Hardened System
  Packages, a new offering that provides individually hardened packages for use
  in your own base images. For more information, see the [announcement blog
  post](https://www.docker.com/blog/announcing-docker-hardened-system-packages/).
- Wiz scanner integration: Wiz is now a supported scanner for consuming DHI VEX
  data.
@y
- Docker Hardened System Packages (HSP): Announced Docker Hardened System
  Packages, a new offering that provides individually hardened packages for use
  in your own base images. For more information, see the [announcement blog
  post](https://www.docker.com/blog/announcing-docker-hardened-system-packages/).
- Wiz scanner integration: Wiz is now a supported scanner for consuming DHI VEX
  data.
@z

@x
## Q4 2025
@y
## Q4 2025
@z

@x
New features and enhancements released in the fourth quarter of 2025.
@y
New features and enhancements released in the fourth quarter of 2025.
@z

@x
- Docker Hardened Images Community (Free): Docker Hardened Images are now
  available for every developer through a Community subscription tier. The
  subscription tiers are now Community, Select, and Enterprise. For more
  information, see the [announcement blog
  post](https://www.docker.com/blog/docker-hardened-images-for-every-developer/).
- Independent security validation by SRLabs: SRLabs published an independent
  security validation of Docker Hardened Images. See the
  [validation announcement](https://www.docker.com/blog/docker-hardened-images-security-independently-validated-by-srlabs/).
- Docker Scout scoring for DHI: Docker Scout image scoring now accounts for the
  security improvements provided by DHI.
- Trivy VEX repository: VEX data for DHI is published in a Trivy-compatible OCI
  VEX repository, making it easier for Trivy and other scanners to consume.
- Docker Scout DHI policy: New Docker Scout policy that evaluates whether images
  use Docker Hardened Images.
- Hardened Helm charts (Beta): Beta release of Docker Hardened Helm Charts. For
  more information, see the [announcement blog
  post](https://www.docker.com/blog/docker-hardened-images-helm-charts-beta/).
- Mirroring UX: Updated the mirroring experience in Docker Hub with a refreshed
  UI and clearer flows.
@y
- Docker Hardened Images Community (Free): Docker Hardened Images are now
  available for every developer through a Community subscription tier. The
  subscription tiers are now Community, Select, and Enterprise. For more
  information, see the [announcement blog
  post](https://www.docker.com/blog/docker-hardened-images-for-every-developer/).
- Independent security validation by SRLabs: SRLabs published an independent
  security validation of Docker Hardened Images. See the
  [validation announcement](https://www.docker.com/blog/docker-hardened-images-security-independently-validated-by-srlabs/).
- Docker Scout scoring for DHI: Docker Scout image scoring now accounts for the
  security improvements provided by DHI.
- Trivy VEX repository: VEX data for DHI is published in a Trivy-compatible OCI
  VEX repository, making it easier for Trivy and other scanners to consume.
- Docker Scout DHI policy: New Docker Scout policy that evaluates whether images
  use Docker Hardened Images.
- Hardened Helm charts (Beta): Beta release of Docker Hardened Helm Charts. For
  more information, see the [announcement blog
  post](https://www.docker.com/blog/docker-hardened-images-helm-charts-beta/).
- Mirroring UX: Updated the mirroring experience in Docker Hub with a refreshed
  UI and clearer flows.
@z

@x
## Q3 2025
@y
## Q3 2025
@z

@x
New features and enhancements released in the third quarter of 2025.
@y
New features and enhancements released in the third quarter of 2025.
@z

@x
- Next evolution release: A major release that introduced customizations,
  FedRAMP-ready images, the AI Migration Agent, and deeper scanner integrations.
  See the [announcement blog
  post](https://www.docker.com/blog/the-next-evolution-of-docker-hardened-images/)
  and the [FedRAMP compliance blog
  post](https://www.docker.com/blog/fedramp-compliance-with-hardened-images/).
- DHI customizations: Customize DHI images directly from the Docker Hub UI,
  with options for adding packages, files, and configuration on top of a base
  hardened image.
- AI Migration Agent: AI-assisted Dockerfile migration to help convert existing
  Dockerfiles to use Docker Hardened Images.
- CIS compliance attestations: CIS benchmark compliance attestations are now
  included with DHI images.
- STIG variants: STIG-hardened image variants for U.S. Department of Defense
  compliance use cases.
@y
- Next evolution release: A major release that introduced customizations,
  FedRAMP-ready images, the AI Migration Agent, and deeper scanner integrations.
  See the [announcement blog
  post](https://www.docker.com/blog/the-next-evolution-of-docker-hardened-images/)
  and the [FedRAMP compliance blog
  post](https://www.docker.com/blog/fedramp-compliance-with-hardened-images/).
- DHI customizations: Customize DHI images directly from the Docker Hub UI,
  with options for adding packages, files, and configuration on top of a base
  hardened image.
- AI Migration Agent: AI-assisted Dockerfile migration to help convert existing
  Dockerfiles to use Docker Hardened Images.
- CIS compliance attestations: CIS benchmark compliance attestations are now
  included with DHI images.
- STIG variants: STIG-hardened image variants for U.S. Department of Defense
  compliance use cases.
@z

@x
## Q2 2025
@y
## Q2 2025
@z

@x
New features and enhancements released in the second quarter of 2025.
@y
New features and enhancements released in the second quarter of 2025.
@z

@x
- Docker Hardened Images launch: Docker announced Docker Hardened Images, a new
  family of secure, minimal, and production-ready container images maintained by
  Docker. For more information, see the [launch blog
  post](https://www.docker.com/blog/introducing-docker-hardened-images/).
- FIPS variants: FIPS-validated image variants for Docker Hardened Images.
@y
- Docker Hardened Images launch: Docker announced Docker Hardened Images, a new
  family of secure, minimal, and production-ready container images maintained by
  Docker. For more information, see the [launch blog
  post](https://www.docker.com/blog/introducing-docker-hardened-images/).
- FIPS variants: FIPS-validated image variants for Docker Hardened Images.
@z
