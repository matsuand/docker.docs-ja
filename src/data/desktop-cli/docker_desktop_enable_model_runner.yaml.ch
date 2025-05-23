%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker desktop enable model-runner
short: Manage Docker Model Runner settings
long: Enable and manage Docker Model Runner settings used by 'docker model'
usage: docker desktop enable model-runner [OPTIONS]
pname: docker desktop enable
plink: docker_desktop_enable.yaml
options:
    - option: no-tcp
      value_type: bool
      default_value: "false"
      description: Disable TCP connection. Cannot be used with --tcp.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tcp
      value_type: port
      default_value: "12434"
      description: |
        Enable or change TCP port for connection (1-65535). Cannot be used with --no-tcp.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker desktop enable model-runner
short: Manage Docker Model Runner settings
long: Enable and manage Docker Model Runner settings used by 'docker model'
usage: docker desktop enable model-runner [OPTIONS]
pname: docker desktop enable
plink: docker_desktop_enable.yaml
options:
    - option: no-tcp
      value_type: bool
      default_value: "false"
      description: Disable TCP connection. Cannot be used with --tcp.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tcp
      value_type: port
      default_value: "12434"
      description: |
        Enable or change TCP port for connection (1-65535). Cannot be used with --no-tcp.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
