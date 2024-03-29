%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker secret
short: Manage Swarm secrets
long: Manage secrets.
usage: docker secret
pname: docker
plink: docker.yaml
cname:
    - docker secret create
    - docker secret inspect
    - docker secret ls
    - docker secret rm
clink:
    - docker_secret_create.yaml
    - docker_secret_inspect.yaml
    - docker_secret_ls.yaml
    - docker_secret_rm.yaml
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
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
command: docker secret
short: Manage Swarm secrets
long: Manage secrets.
usage: docker secret
pname: docker
plink: docker.yaml
cname:
    - docker secret create
    - docker secret inspect
    - docker secret ls
    - docker secret rm
clink:
    - docker_secret_create.yaml
    - docker_secret_inspect.yaml
    - docker_secret_ls.yaml
    - docker_secret_rm.yaml
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
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
