%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: How-tos
description: Step-by-step guidance for working with Docker Hardened Images, from discovery to governance.
@y
title: How-tos
description: Step-by-step guidance for working with Docker Hardened Images, from discovery to governance.
@z

@x
    - title: Search and evaluate Docker Hardened Images
      description: Learn how to find and compare image repositories, variants, and metadata in the DHI catalog.
      icon: globe-alt
      link: /dhi/how-to/search-evaluate/
@y
    - title: Search and evaluate Docker Hardened Images
      description: Learn how to find and compare image repositories, variants, and metadata in the DHI catalog.
      icon: globe-alt
      link: __SUBDIR__/dhi/how-to/search-evaluate/
@z

@x
    - title: Get started with DHI Select and Enterprise
      description: Learn how to mirror repositories, customize images, and access compliance variants with DHI Select and Enterprise subscriptions.
      icon: rocket-launch
      link: /dhi/how-to/select-enterprise/
@y
    - title: Get started with DHI Select and Enterprise
      description: Learn how to mirror repositories, customize images, and access compliance variants with DHI Select and Enterprise subscriptions.
      icon: rocket-launch
      link: __SUBDIR__/dhi/how-to/select-enterprise/
@z

@x
    - title: Mirror a Docker Hardened Image repository
      description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
      icon: arrows-right-left
      link: /dhi/how-to/mirror/
@y
    - title: Mirror a Docker Hardened Image repository
      description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
      icon: arrows-right-left
      link: __SUBDIR__/dhi/how-to/mirror/
@z

@x
    - title: Customize a Docker Hardened Image or chart
      description: Learn how to customize Docker Hardened Images and charts.
      icon: cog-6-tooth
      link: /dhi/how-to/customize/
@y
    - title: Customize a Docker Hardened Image or chart
      description: Learn how to customize Docker Hardened Images and charts.
      icon: cog-6-tooth
      link: __SUBDIR__/dhi/how-to/customize/
@z

@x
    - title: Use hardened system packages
      description: Learn how to use Docker's hardened system packages in your images.
      icon: archive-box
      link: /dhi/how-to/hardened-packages/
@y
    - title: Use hardened system packages
      description: Learn how to use Docker's hardened system packages in your images.
      icon: archive-box
      link: __SUBDIR__/dhi/how-to/hardened-packages/
@z

@x
    - title: Use a Docker Hardened Image
      description: Learn how to pull, run, and reference Docker Hardened Images in Dockerfiles, CI pipelines, and standard development workflows.
      icon: play
      link: /dhi/how-to/use/
@y
    - title: Use a Docker Hardened Image
      description: Learn how to pull, run, and reference Docker Hardened Images in Dockerfiles, CI pipelines, and standard development workflows.
      icon: play
      link: __SUBDIR__/dhi/how-to/use/
@z

@x
    - title: Use a Docker Hardened Image chart
      description: Learn how to use a Docker Hardened Image chart.
      icon: chart-bar
      link: /dhi/how-to/helm/
@y
    - title: Use a Docker Hardened Image chart
      description: Learn how to use a Docker Hardened Image chart.
      icon: chart-bar
      link: __SUBDIR__/dhi/how-to/helm/
@z

@x
    - title: Verify a Docker Hardened Image or chart
      description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images and charts.
      icon: check-circle
      link: /dhi/how-to/verify/
@y
    - title: Verify a Docker Hardened Image or chart
      description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images and charts.
      icon: check-circle
      link: __SUBDIR__/dhi/how-to/verify/
@z

@x
    - title: Scan Docker Hardened Images
      description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, or Trivy.
      icon: bug-ant
      link: /dhi/how-to/scan/
@y
    - title: Scan Docker Hardened Images
      description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, or Trivy.
      icon: bug-ant
      link: __SUBDIR__/dhi/how-to/scan/
@z

@x
    - title: Query VEX for a Docker Hardened Image
      description: Use the DHI GraphQL API to fetch VEX statements and suppressed CVEs for a Docker Hardened Image by digest, at scale.
      icon: bug-ant
      link: /dhi/how-to/vex-api/
@y
    - title: Query VEX for a Docker Hardened Image
      description: Use the DHI GraphQL API to fetch VEX statements and suppressed CVEs for a Docker Hardened Image by digest, at scale.
      icon: bug-ant
      link: __SUBDIR__/dhi/how-to/vex-api/
@z

@x
    - title: Apply Docker Hardened Image policies to your images
      description: Learn how to hold your own images to Docker Hardened Image security and compliance standards using the Docker Scout CLI.
      icon: shield-check
      link: /dhi/how-to/policies/
@y
    - title: Apply Docker Hardened Image policies to your images
      description: Learn how to hold your own images to Docker Hardened Image security and compliance standards using the Docker Scout CLI.
      icon: shield-check
      link: __SUBDIR__/dhi/how-to/policies/
@z

@x
    - title: Troubleshoot
      description: Resolve common issues when building, running, or debugging Docker Hardened Images, such as non-root behavior, missing shells, and port access.
      icon: question-mark-circle
      link: /dhi/how-to/troubleshoot/
@y
    - title: Troubleshoot
      description: Resolve common issues when building, running, or debugging Docker Hardened Images, such as non-root behavior, missing shells, and port access.
      icon: question-mark-circle
      link: __SUBDIR__/dhi/how-to/troubleshoot/
@z

@x
This section provides practical, task-based guidance for working with Docker
Hardened Images (DHIs). Whether you're evaluating DHIs for the first time or
integrating them into a production CI/CD pipeline, these topics cover the key
tasks across the adoption journey: discover, adopt, verify, and govern.
@y
This section provides practical, task-based guidance for working with Docker
Hardened Images (DHIs). Whether you're evaluating DHIs for the first time or
integrating them into a production CI/CD pipeline, these topics cover the key
tasks across the adoption journey: discover, adopt, verify, and govern.
@z

@x
The topics are organized around the typical lifecycle of working with DHIs, but
you can use them as needed based on your specific workflow.
@y
The topics are organized around the typical lifecycle of working with DHIs, but
you can use them as needed based on your specific workflow.
@z

@x
Explore the topics below that match your current needs.
@y
Explore the topics below that match your current needs.
@z

@x
## Discover
@y
## Discover
@z

@x
Explore available images and metadata in the DHI catalog.
@y
Explore available images and metadata in the DHI catalog.
@z

@x
{{< grid
  items="grid_discover"
>}}
@y
{{< grid
  items="grid_discover"
>}}
@z

@x
## Adopt
@y
## Adopt
@z

@x
Mirror trusted images, customize as needed, and integrate into your workflows.
@y
Mirror trusted images, customize as needed, and integrate into your workflows.
@z

@x
{{< grid
  items="grid_adopt"
>}}
@y
{{< grid
  items="grid_adopt"
>}}
@z

@x
## Verify
@y
## Verify
@z

@x
Check signatures, SBOMs, and provenance, and scan for vulnerabilities.
@y
Check signatures, SBOMs, and provenance, and scan for vulnerabilities.
@z

@x
{{< grid
  items="grid_verify"
>}}
@y
{{< grid
  items="grid_verify"
>}}
@z

@x
## Govern
@y
## Govern
@z

@x
Enforce policies to maintain security and compliance.
@y
Enforce policies to maintain security and compliance.
@z

@x
{{< grid
  items="grid_govern"
>}}
@y
{{< grid
  items="grid_govern"
>}}
@z

@x
## Troubleshoot
@y
## Troubleshoot
@z

@x
{{< grid
  items="grid_troubleshoot"
>}}
@y
{{< grid
  items="grid_troubleshoot"
>}}
@z
