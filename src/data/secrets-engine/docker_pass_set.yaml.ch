%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass set
short: Set a secret
usage: docker pass set NAME=VALUE
long: |-
  Secrets can also be created from STDIN:
@y
command: docker pass set
short: Set a secret
usage: docker pass set NAME=VALUE
long: |-
  Secrets can also be created from STDIN:
@z

@x
  ```console
  <some command> | docker pass set <name>
  ```
pname: docker pass
plink: docker_pass.yaml
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
@y
  ```console
  <some command> | docker pass set <name>
  ```
pname: docker pass
plink: docker_pass.yaml
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
@z
