%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container commit
aliases: docker container commit, docker commit
short: Create a new image from a container's changes
long: See [docker commit](commit.md) for more information.
usage: docker container commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
pname: docker container
plink: docker_container.yaml
options:
    - option: author
      shorthand: a
      value_type: string
      description: Author (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Commit message
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pause
      shorthand: p
      value_type: bool
      default_value: "true"
      description: Pause container during commit
      deprecated: false
      hidden: false
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
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker container commit
aliases: docker container commit, docker commit
short: Create a new image from a container's changes
long: See [docker commit](commit.md) for more information.
usage: docker container commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
pname: docker container
plink: docker_container.yaml
options:
    - option: author
      shorthand: a
      value_type: string
      description: Author (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Commit message
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pause
      shorthand: p
      value_type: bool
      default_value: "true"
      description: Pause container during commit
      deprecated: false
      hidden: false
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
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
