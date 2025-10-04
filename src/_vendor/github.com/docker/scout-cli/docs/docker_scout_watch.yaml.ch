%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout watch
short: |
    Watch repositories in a registry and push images and indexes to Docker Scout (experimental)
long: |
    The docker scout watch command watches repositories in a registry and pushes images or image indexes to Docker Scout.
usage: docker scout watch
@y
command: docker scout watch
short: |
    Watch repositories in a registry and push images and indexes to Docker Scout (experimental)
long: |
    The docker scout watch command watches repositories in a registry and pushes images or image indexes to Docker Scout.
usage: docker scout watch
@z

% options:

@x all-images
      description: |
        Push all images instead of only the ones pushed during the watch command is running
@y
      description: |
        Push all images instead of only the ones pushed during the watch command is running
@z

@x dry-run
      description: Watch images and prepare them, but do not push them
@y
      description: Watch images and prepare them, but do not push them
@z

@x interval
      description: Interval in seconds between checks
@y
      description: Interval in seconds between checks
@z

@x org
      description: Namespace of the Docker organization to which image will be pushed
@y
      description: Namespace of the Docker organization to which image will be pushed
@z

@x refresh-registry
      description: |
        Refresh the list of repositories of a registry at every run. Only with --registry.
@y
      description: |
        Refresh the list of repositories of a registry at every run. Only with --registry.
@z

@x registry
      description: Registry to watch
@y
      description: Registry to watch
@z

@x repository
      description: Repository to watch
@y
      description: Repository to watch
@z

@x sbom
      description: Create and upload SBOMs
@y
      description: Create and upload SBOMs
@z

@x tag
      description: Regular expression to match tags to watch
@y
      description: Regular expression to match tags to watch
@z

@x workers
      description: Number of concurrent workers
@y
      description: Number of concurrent workers
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
examples: "  Watch for new images from two repositories and push them\n  $ docker scout watch --org my-org --repository registry-1.example.com/repo-1 --repository registry-2.example.com/repo-2\e[0m\n\n  Only push images with a specific tag\n  $ docker scout watch --org my-org --repository registry.example.com/my-service --tag latest\e[0m\n\n  Watch all repositories of a registry\n  $ docker scout watch --org my-org --registry registry.example.com\e[0m\n\n  Push all images and not just the new ones\n  $ docker scout watch --org my-org --repository registry.example.com/my-service --all-images\e[0m"
@y
examples: "  Watch for new images from two repositories and push them\n  $ docker scout watch --org my-org --repository registry-1.example.com/repo-1 --repository registry-2.example.com/repo-2\e[0m\n\n  Only push images with a specific tag\n  $ docker scout watch --org my-org --repository registry.example.com/my-service --tag latest\e[0m\n\n  Watch all repositories of a registry\n  $ docker scout watch --org my-org --registry registry.example.com\e[0m\n\n  Push all images and not just the new ones\n  $ docker scout watch --org my-org --repository registry.example.com/my-service --all-images\e[0m"
@z

% snip directives...
