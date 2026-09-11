%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose bridge convert
short: |
    Convert compose files to Kubernetes manifests, Helm charts, or another model
long: |
    Convert compose files to Kubernetes manifests, Helm charts, or another model
usage: docker compose bridge convert
@y
command: docker compose bridge convert
short: |
    Convert compose files to Kubernetes manifests, Helm charts, or another model
long: |
    Convert compose files to Kubernetes manifests, Helm charts, or another model
usage: docker compose bridge convert
@z

% options:

@x output
      description: The output directory for the Kubernetes resources
@y
      description: The output directory for the Kubernetes resources
@z

@x templates
      description: Directory containing transformation templates
@y
      description: Directory containing transformation templates
@z

@x transformation
      description: |
        Transformation to apply to compose model (default: docker/compose-bridge-kubernetes)
@y
      description: |
        Transformation to apply to compose model (default: docker/compose-bridge-kubernetes)
@z

@x "yes"
      description: |
        Assume "yes" to the output directory overwrite prompt. For scripts/CI, where no interactive confirmation is possible
@y
      description: |
        Assume "yes" to the output directory overwrite prompt. For scripts/CI, where no interactive confirmation is possible
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z
