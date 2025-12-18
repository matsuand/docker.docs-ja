%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: How-tos
description: Step-by-step guidance for working with Docker Hardened Images, from discovery to debugging.
@y
title: How-tos
description: Step-by-step guidance for working with Docker Hardened Images, from discovery to debugging.
@z

% grid_discover:

@x
    - title: Explore Docker Hardened Images
      description: Learn how to find and evaluate image repositories, variants, metadata, and attestations in the DHI catalog on Docker Hub.
      icon: travel_explore
      link: /dhi/how-to/explore/
@y
    - title: Explore Docker Hardened Images
      description: Learn how to find and evaluate image repositories, variants, metadata, and attestations in the DHI catalog on Docker Hub.
      icon: travel_explore
      link: __SUBDIR__/dhi/how-to/explore/
@z

% grid_adopt:

@x
    - title: Mirror a Docker Hardened Image repository
      description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
      icon: compare_arrows
      link: /dhi/how-to/mirror/
@y
    - title: Mirror a Docker Hardened Image repository
      description: Learn how to mirror an image into your organization's namespace and optionally push it to another private registry.
      icon: compare_arrows
      link: __SUBDIR__/dhi/how-to/mirror/
@z

@x
    - title: Customize a Docker Hardened Image or chart
      description: Learn how to customize Docker Hardened Images and charts.
      icon: settings
      link: /dhi/how-to/customize/
@y
    - title: Customize a Docker Hardened Image or chart
      description: Learn how to customize Docker Hardened Images and charts.
      icon: settings
      link: __SUBDIR__/dhi/how-to/customize/
@z

@x
    - title: Use a Docker Hardened Image
      description: Learn how to pull, run, and reference Docker Hardened Images in Dockerfiles, CI pipelines, and standard development workflows.
      icon: play_arrow
      link: /dhi/how-to/use/
@y
    - title: Use a Docker Hardened Image
      description: Learn how to pull, run, and reference Docker Hardened Images in Dockerfiles, CI pipelines, and standard development workflows.
      icon: play_arrow
      link: __SUBDIR__/dhi/how-to/use/
@z

@x
    - title: Use a Docker Hardened Image in Kubernetes
      description: Learn how to use Docker Hardened Images in Kubernetes deployments.
      icon: play_arrow
      link: /dhi/how-to/k8s/
@y
    - title: Use a Docker Hardened Image in Kubernetes
      description: Learn how to use Docker Hardened Images in Kubernetes deployments.
      icon: play_arrow
      link: __SUBDIR__/dhi/how-to/k8s/
@z

@x
    - title: Use a Docker Hardened Image chart
      description: Learn how to use a Docker Hardened Image chart.
      icon: leaderboard
      link: /dhi/how-to/helm/
@y
    - title: Use a Docker Hardened Image chart
      description: Learn how to use a Docker Hardened Image chart.
      icon: leaderboard
      link: __SUBDIR__/dhi/how-to/helm/
@z

@x
    - title: Use Extended Lifecycle Support for Docker Hardened Images
      description: Learn how to use Extended Lifecycle Support with Docker Hardened Images.
      icon: update
      link: /dhi/how-to/els/
@y
    - title: Use Extended Lifecycle Support for Docker Hardened Images
      description: Learn how to use Extended Lifecycle Support with Docker Hardened Images.
      icon: update
      link: /dhi/how-to/els/
@z

@x
    - title: Manage Docker Hardened Images and charts
      description: Learn how to manage your mirrored and customized Docker Hardened Images in your organization.
      icon: reorder
      link: /dhi/how-to/manage/
@y
    - title: Manage Docker Hardened Images and charts
      description: Learn how to manage your mirrored and customized Docker Hardened Images in your organization.
      icon: reorder
      link: __SUBDIR__/dhi/how-to/manage/
@z

% grid_evaluate:

@x
    - title: Compare Docker Hardened Images
      description: Learn how to compare Docker Hardened Images with other container images to evaluate security improvements and differences.
      icon: compare
      link: /dhi/how-to/compare/
@y
    - title: Compare Docker Hardened Images
      description: Learn how to compare Docker Hardened Images with other container images to evaluate security improvements and differences.
      icon: compare
      link: __SUBDIR__/dhi/how-to/compare/
@z

% grid_verify:

@x
    - title: Verify a Docker Hardened Image or chart
      description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images and charts.
      icon: check_circle
      link: /dhi/how-to/verify/
@y
    - title: Verify a Docker Hardened Image or chart
      description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images and charts.
      icon: check_circle
      link: __SUBDIR__/dhi/how-to/verify/
@z

@x
    - title: Scan Docker Hardened Images
      description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, or Trivy.
      icon: bug_report
      link: /dhi/how-to/scan/
@y
    - title: Scan Docker Hardened Images
      description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, or Trivy.
      icon: bug_report
      link: __SUBDIR__/dhi/how-to/scan/
@z

% grid_govern:

@x
    - title: Enforce Docker Hardened Image usage with policies
      description: Learn how to use image policies with Docker Scout for Docker Hardened Images.
      icon: policy
      link: /dhi/how-to/policies/
@y
    - title: Enforce Docker Hardened Image usage with policies
      description: Learn how to use image policies with Docker Scout for Docker Hardened Images.
      icon: policy
      link: __SUBDIR__/dhi/how-to/policies/
@z

% grid_troubleshoot:

@x
    - title: Debug a Docker Hardened Image
      description: Use Docker Debug to inspect a running container based on a hardened image without modifying it.
      icon: terminal
      link: /dhi/how-to/debug/
@y
    - title: Debug a Docker Hardened Image
      description: Use Docker Debug to inspect a running container based on a hardened image without modifying it.
      icon: terminal
      link: __SUBDIR__/dhi/how-to/debug/
@z

@x
This section provides practical, task-based guidance for working with Docker
Hardened Images (DHIs). Whether you're evaluating DHIs for the first time or
integrating them into a production CI/CD pipeline, these topics cover the key
tasks across the adoption journey, from discovery to debugging.
@y
This section provides practical, task-based guidance for working with Docker
Hardened Images (DHIs). Whether you're evaluating DHIs for the first time or
integrating them into a production CI/CD pipeline, these topics cover the key
tasks across the adoption journey, from discovery to debugging.
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
## Evaluate
@y
## Evaluate
@z

@x
Compare with other images to understand security improvements.
@y
Compare with other images to understand security improvements.
@z

@x
{{< grid
  items="grid_evaluate"
>}}
@y
{{< grid
  items="grid_evaluate"
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
Debug containers based on DHIs without modifying the image.
@y
Debug containers based on DHIs without modifying the image.
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
