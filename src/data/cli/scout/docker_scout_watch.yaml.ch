%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout watch
short: |
    Watch repositories in a registry and push images and indexes to Docker Scout
long: |
    The docker scout watch command watches repositories in a registry and pushes images or image indexes to Docker Scout.
usage: docker scout watch
@y
command: docker scout watch
short: |
    Watch repositories in a registry and push images and indexes to Docker Scout
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
examples: |-
    ### Watch for new images from two repositories and push them
@y
examples: |-
    ### Watch for new images from two repositories and push them
@z

% snip command...

@x
    ### Only push images with a specific tag
@y
    ### Only push images with a specific tag
@z

% snip command...

@x
    ### Watch all repositories of a registry
@y
    ### Watch all repositories of a registry
@z

% snip command...

@x
    ### Push all images and not just the new ones
@y
    ### Push all images and not just the new ones
@z

% snip command...

@x
    ### Configure Artifactory integration
@y
    ### Configure Artifactory integration
@z

@x
    The following example creates a web hook endpoint for Artifactory to push new
    image events into:
@y
    The following example creates a web hook endpoint for Artifactory to push new
    image events into:
@z

% snip command...

@x
    This will launch an HTTP server on port `9000` that will receive all `component` web
    hook events, optionally validating the HMAC signature.
@y
    This will launch an HTTP server on port `9000` that will receive all `component` web
    hook events, optionally validating the HMAC signature.
@z

@x
    ### Configure Harbor integration
@y
    ### Configure Harbor integration
@z

@x
    The following example creates a web hook endpoint for Harbor to push new image
    events into:
@y
    The following example creates a web hook endpoint for Harbor to push new image
    events into:
@z

% snip command...

@x
    This will launch an HTTP server on port `9000` that will receive all `component` web
    hook events, optionally validating the HMAC signature.
@y
    This will launch an HTTP server on port `9000` that will receive all `component` web
    hook events, optionally validating the HMAC signature.
@z

@x
    ### Configure Nexus integration
@y
    ### Configure Nexus integration
@z

@x
    The following example shows how to configure Sonartype Nexus integration:
@y
    The following example shows how to configure Sonartype Nexus integration:
@z

% snip command...

@x
    This ingests all images and tags in Nexus repositories called `docker-test1`
    and `docker-test2` that match the `*/foo/*` include and `*/bar/*` exclude glob
    pattern.
@y
    This ingests all images and tags in Nexus repositories called `docker-test1`
    and `docker-test2` that match the `*/foo/*` include and `*/bar/*` exclude glob
    pattern.
@z

@x
    You can also create a web hook endpoint for Nexus to push new image events into:
@y
    You can also create a web hook endpoint for Nexus to push new image events into:
@z

% snip command...

@x
    This will launch an HTTP server on port `9000` that will receive all `component` web
    hook events, optionally validating the HMAC signature.
@y
    This will launch an HTTP server on port `9000` that will receive all `component` web
    hook events, optionally validating the HMAC signature.
@z

@x
    ### Configure integration for other OCI registries
@y
    ### Configure integration for other OCI registries
@z

@x
    The following example shows how to integrate an OCI registry that implements the
    `_catalog` endpoint:
@y
    The following example shows how to integrate an OCI registry that implements the
    `_catalog` endpoint:
@z

% snip command...
% snip directives...
