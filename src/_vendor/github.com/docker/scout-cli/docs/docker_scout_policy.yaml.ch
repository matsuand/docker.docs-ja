%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout policy
short: |
    Evaluate policies against an image and display the policy evaluation results (experimental)
long: |-
    The `docker scout policy` command evaluates policies against an image.
    The image analysis is uploaded to Docker Scout where policies get evaluated.
@y
command: docker scout policy
short: |
    Evaluate policies against an image and display the policy evaluation results (experimental)
long: |-
    The `docker scout policy` command evaluates policies against an image.
    The image analysis is uploaded to Docker Scout where policies get evaluated.
@z

@x
    The policy evaluation results may take a few minutes to become available.
usage: docker scout policy [IMAGE | REPO]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: env
      value_type: string
      description: Name of the environment to compare to
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: exit-code
      shorthand: e
      value_type: bool
      default_value: "false"
      description: Return exit code '2' if policies are not met, '0' otherwise
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to pull policy results from
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-env
      value_type: string
      description: Name of the environment to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-latest
      value_type: bool
      default_value: "false"
      description: Latest image processed to compare to
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
examples: |-
    ### Evaluate policies against an image and display the results
@y
    The policy evaluation results may take a few minutes to become available.
usage: docker scout policy [IMAGE | REPO]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: env
      value_type: string
      description: Name of the environment to compare to
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: exit-code
      shorthand: e
      value_type: bool
      default_value: "false"
      description: Return exit code '2' if policies are not met, '0' otherwise
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to pull policy results from
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-env
      value_type: string
      description: Name of the environment to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-latest
      value_type: bool
      default_value: "false"
      description: Latest image processed to compare to
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
examples: |-
    ### Evaluate policies against an image and display the results
@z

@x
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1
    ```
@y
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1
    ```
@z

@x
    ### Evaluate policies against an image for a specific organization
@y
    ### Evaluate policies against an image for a specific organization
@z

@x
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --org dockerscoutpolicy
    ```
@y
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --org dockerscoutpolicy
    ```
@z

@x
    ### Evaluate policies against an image with a specific platform
@y
    ### Evaluate policies against an image with a specific platform
@z

@x
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --platform linux/amd64
    ```
@y
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --platform linux/amd64
    ```
@z

@x
    ### Compare policy results for a repository in a specific environment
@y
    ### Compare policy results for a repository in a specific environment
@z

@x
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service --to-env production
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout policy dockerscoutpolicy/customers-api-service --to-env production
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
