%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Migration
description: Learn how to migrate your existing applications to Docker Hardened Images
@y
title: Migration
description: Learn how to migrate your existing applications to Docker Hardened Images
@z

@x
keywords: migrate, docker hardened images, dhi, migration guide
@y
keywords: migrate, docker hardened images, dhi, migration guide
@z

% grid_migration_paths:

@x
    - title: Migrate with Docker's AI assistant
      description: Use Docker's AI assistant to automatically migrate your Dockerfile to Docker Hardened Images with guidance and recommendations.
      icon: smart_toy
      link: /dhi/migration/migrate-with-ai/
@y
    - title: Migrate with Docker's AI assistant
      description: Use Docker's AI assistant to automatically migrate your Dockerfile to Docker Hardened Images with guidance and recommendations.
      icon: smart_toy
      link: __SUBDIR__/dhi/migration/migrate-with-ai/
@z

@x
    - title: Migrate from Alpine or Debian images
      description: Manual migration guide for moving from Docker Official Images (Alpine or Debian-based) to Docker Hardened Images.
      icon: code
      link: /dhi/migration/migrate-from-doi/
@y
    - title: Migrate from Alpine or Debian images
      description: Manual migration guide for moving from Docker Official Images (Alpine or Debian-based) to Docker Hardened Images.
      icon: code
      link: __SUBDIR__/dhi/migration/migrate-from-doi/
@z

@x
    - title: Migrate from Wolfi
      description: Manual migration guide for transitioning from Wolfi-based images to Docker Hardened Images.
      icon: transform
      link: /dhi/migration/migrate-from-wolfi/
@y
    - title: Migrate from Wolfi
      description: Manual migration guide for transitioning from Wolfi-based images to Docker Hardened Images.
      icon: transform
      link: __SUBDIR__/dhi/migration/migrate-from-wolfi/
@z

% grid_migration_resources:

@x
    - title: Migration checklist
      description: A comprehensive checklist of migration considerations to ensure successful transition to Docker Hardened Images.
      icon: checklist
      link: /dhi/migration/checklist/
@y
    - title: Migration checklist
      description: A comprehensive checklist of migration considerations to ensure successful transition to Docker Hardened Images.
      icon: checklist
      link: __SUBDIR__/dhi/migration/checklist/
@z

@x
    - title: Examples
      description: Example Dockerfile migrations for different programming languages and frameworks to guide your migration process.
      icon: preview
      link: /dhi/migration/examples/
@y
    - title: Examples
      description: Example Dockerfile migrations for different programming languages and frameworks to guide your migration process.
      icon: preview
      link: __SUBDIR__/dhi/migration/examples/
@z

@x
This section provides guidance for migrating your applications to Docker
Hardened Images (DHI). Migrating to DHI enhances the security posture of your
containerized applications by leveraging hardened base images with built-in
security features.
@y
This section provides guidance for migrating your applications to Docker
Hardened Images (DHI). Migrating to DHI enhances the security posture of your
containerized applications by leveraging hardened base images with built-in
security features.
@z

@x
## Migration paths
@y
## Migration paths
@z

@x
Choose the migration approach that best fits your needs:
@y
Choose the migration approach that best fits your needs:
@z

@x
{{< grid items="grid_migration_paths" >}}
@y
{{< grid items="grid_migration_paths" >}}
@z

@x
## Resources
@y
## Resources
@z

@x
{{< grid items="grid_migration_resources" >}}
@y
{{< grid items="grid_migration_resources" >}}
@z
