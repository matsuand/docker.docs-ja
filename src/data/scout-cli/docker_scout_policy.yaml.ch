%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout policy
short: |
    Evaluate policies against an image and display the policy evaluation results (experimental)
long: |-
    The `docker scout policy` command evaluates policies against an image.
    The image analysis is uploaded to Docker Scout where policies get evaluated.

    The policy evaluation results may take a few minutes to become available.
@y
command: docker scout policy
short: |
    Evaluate policies against an image and display the policy evaluation results (experimental)
long: |-
    The `docker scout policy` command evaluates policies against an image.
    The image analysis is uploaded to Docker Scout where policies get evaluated.

    The policy evaluation results may take a few minutes to become available.
@z

@x
usage: docker scout policy [IMAGE | REPO]
@y
usage: docker scout policy [IMAGE | REPO]
@z

% options:

@x env
      description: Name of the environment to compare to
@y
      description: Name of the environment to compare to
@z

@x exit-code
      description: Return exit code '2' if policies are not met, '0' otherwise
@y
      description: Return exit code '2' if policies are not met, '0' otherwise
@z

@x only-policy
      description: Comma separated list of policies to evaluate
@y
      description: Comma separated list of policies to evaluate
@z

@x org
      description: Namespace of the Docker organization
@y
      description: Namespace of the Docker organization
@z

@x output
      description: Write the report to a file
@y
      description: Write the report to a file
@z

@x platform
      description: Platform of image to pull policy results from
@y
      description: Platform of image to pull policy results from
@z

@x to-env
      description: Name of the environment to compare to
@y
      description: Name of the environment to compare to
@z

@x to-latest
      description: Latest image processed to compare to
@y
      description: Latest image processed to compare to
@z

% inherited_options:

@x debug
      description: Debug messages
@y
      description: Debug messages
@z

@x verbose-debug
      description: Verbose debug
@y
      description: Verbose debug
@z

@x
examples: |-
    ### Evaluate policies against an image and display the results
@y
examples: |-
    ### Evaluate policies against an image and display the results
@z

% snip command...

@x
    ### Evaluate policies against an image for a specific organization
@y
    ### Evaluate policies against an image for a specific organization
@z

% snip command...

@x
    ### Evaluate policies against an image with a specific platform
@y
    ### Evaluate policies against an image with a specific platform
@z

% snip command...

@x
    ### Compare policy results for a repository in a specific environment
@y
    ### Compare policy results for a repository in a specific environment
@z

% snip command...

@x
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
