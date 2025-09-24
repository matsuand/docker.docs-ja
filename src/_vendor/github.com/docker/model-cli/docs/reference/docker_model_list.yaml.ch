%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model list
aliases: docker model list, docker model ls
short: List the models pulled to your local environment
long: List the models pulled to your local environment
usage: docker model list [OPTIONS]
pname: docker model
plink: docker_model.yaml
options:
    - option: backend
      value_type: string
      description: Specify the backend to use (llama.cpp, openai)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: json
      value_type: bool
      default_value: "false"
      description: List models in a JSON format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: openai
      value_type: bool
      default_value: "false"
      description: List models in an OpenAI format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only show model IDs
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
command: docker model list
aliases: docker model list, docker model ls
short: List the models pulled to your local environment
long: List the models pulled to your local environment
usage: docker model list [OPTIONS]
pname: docker model
plink: docker_model.yaml
options:
    - option: backend
      value_type: string
      description: Specify the backend to use (llama.cpp, openai)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: json
      value_type: bool
      default_value: "false"
      description: List models in a JSON format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: openai
      value_type: bool
      default_value: "false"
      description: List models in an OpenAI format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only show model IDs
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
