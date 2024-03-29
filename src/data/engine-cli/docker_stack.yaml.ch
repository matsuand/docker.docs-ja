%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker stack
short: Manage Swarm stacks
long: Manage stacks.
usage: docker stack [OPTIONS]
pname: docker
plink: docker.yaml
cname:
    - docker stack config
    - docker stack deploy
    - docker stack ls
    - docker stack ps
    - docker stack rm
    - docker stack services
clink:
    - docker_stack_config.yaml
    - docker_stack_deploy.yaml
    - docker_stack_ls.yaml
    - docker_stack_ps.yaml
    - docker_stack_rm.yaml
    - docker_stack_services.yaml
options:
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
command: docker stack
short: Manage Swarm stacks
long: Manage stacks.
usage: docker stack [OPTIONS]
pname: docker
plink: docker.yaml
cname:
    - docker stack config
    - docker stack deploy
    - docker stack ls
    - docker stack ps
    - docker stack rm
    - docker stack services
clink:
    - docker_stack_config.yaml
    - docker_stack_deploy.yaml
    - docker_stack_ls.yaml
    - docker_stack_ps.yaml
    - docker_stack_rm.yaml
    - docker_stack_services.yaml
options:
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
