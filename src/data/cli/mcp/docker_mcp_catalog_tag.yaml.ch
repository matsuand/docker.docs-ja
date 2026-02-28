%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog tag
short: Create a tagged copy of a catalog
long: |-
    Create a new catalog by tagging an existing catalog with a new name or version.
    This creates a copy of the source catalog with a new reference, similar to Docker image tagging.
usage: docker mcp catalog tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
pname: docker mcp catalog
plink: docker_mcp_catalog.yaml
examples: |4-
      # Tag a catalog with a new version
      docker mcp catalog tag mcp/my-catalog:v1 mcp/my-catalog:v2
@y
command: docker mcp catalog tag
short: Create a tagged copy of a catalog
long: |-
    Create a new catalog by tagging an existing catalog with a new name or version.
    This creates a copy of the source catalog with a new reference, similar to Docker image tagging.
usage: docker mcp catalog tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
pname: docker mcp catalog
plink: docker_mcp_catalog.yaml
examples: |4-
      # Tag a catalog with a new version
      docker mcp catalog tag mcp/my-catalog:v1 mcp/my-catalog:v2
@z

@x
      # Create a tagged copy with a different name
      docker mcp catalog tag mcp/team-catalog:latest mcp/prod-catalog:v1.0
@y
      # Create a tagged copy with a different name
      docker mcp catalog tag mcp/team-catalog:latest mcp/prod-catalog:v1.0
@z

@x
      # Tag without explicit version (uses latest)
      docker mcp catalog tag mcp/my-catalog mcp/my-catalog:backup
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      # Tag without explicit version (uses latest)
      docker mcp catalog tag mcp/my-catalog mcp/my-catalog:backup
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
