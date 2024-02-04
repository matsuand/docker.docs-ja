%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout attestation add
short: Add attestation to image
long: The docker scout attestation add command adds attestations to images.
usage: docker scout attestation add OPTIONS IMAGE [IMAGE...]
pname: docker scout attestation
plink: docker_scout_attestation.yaml
options:
    - option: file
      value_type: stringSlice
      default_value: '[]'
      description: File location of attestations to attach
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: predicate-type
      value_type: string
      description: Predicate-type for attestations
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
command: docker scout attestation add
short: Add attestation to image
long: The docker scout attestation add command adds attestations to images.
usage: docker scout attestation add OPTIONS IMAGE [IMAGE...]
pname: docker scout attestation
plink: docker_scout_attestation.yaml
options:
    - option: file
      value_type: stringSlice
      default_value: '[]'
      description: File location of attestations to attach
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: predicate-type
      value_type: string
      description: Predicate-type for attestations
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
