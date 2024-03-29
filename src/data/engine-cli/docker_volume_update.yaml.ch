%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume update
short: Update a volume (cluster volumes only)
long: Update a volume (cluster volumes only)
usage: docker volume update [OPTIONS] [VOLUME]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: availability
      value_type: string
      default_value: active
      description: Cluster Volume availability (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
min_api_version: "1.42"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
command: docker volume update
short: Update a volume (cluster volumes only)
long: Update a volume (cluster volumes only)
usage: docker volume update [OPTIONS] [VOLUME]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: availability
      value_type: string
      default_value: active
      description: Cluster Volume availability (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
min_api_version: "1.42"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
