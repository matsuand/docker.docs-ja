%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization prepare
short: Prepare a new customization YAML file from a DHI base image tag
long: |-
    Prepare a new single or bulk customization YAML file by fetching tag details from Docker Hardened Images.
    This creates a scaffold YAML file that can be used with the create command.
@y
command: docker dhi customization prepare
short: Prepare a new customization YAML file from a DHI base image tag
long: |-
    Prepare a new single or bulk customization YAML file by fetching tag details from Docker Hardened Images.
    This creates a scaffold YAML file that can be used with the create command.
@z

@x
    Single customization — provide the DHI source repository and tag as positional arguments:
      docker dhi customization prepare golang 1.24-dev --destination myorg/dhi-golang
@y
    Single customization — provide the DHI source repository and tag as positional arguments:
      docker dhi customization prepare golang 1.24-dev --destination myorg/dhi-golang
@z

@x
    Bulk customization — pipe a JSON array of {destination, tag-definition-id} objects via stdin:
      echo '[{"destination":"myorg/dhi-golang","tag-definition-id":"golang/alpine-3.23/1.24-dev"}]' \
        | docker dhi customization prepare --name my-custo
@y
    Bulk customization — pipe a JSON array of {destination, tag-definition-id} objects via stdin:
      echo '[{"destination":"myorg/dhi-golang","tag-definition-id":"golang/alpine-3.23/1.24-dev"}]' \
        | docker dhi customization prepare --name my-custo
@z

@x
    The scaffold is written to stdout; redirect to a file if needed:
      docker dhi customization prepare golang 1.24-dev > customization.yaml
@y
    The scaffold is written to stdout; redirect to a file if needed:
      docker dhi customization prepare golang 1.24-dev > customization.yaml
@z

@x
    Run 'docker dhi customization list' to see available source repositories,
    or use shell completion to discover repository names and tags.
@y
    Run 'docker dhi customization list' to see available source repositories,
    or use shell completion to discover repository names and tags.
@z

@x
usage: docker dhi customization prepare <dhi-repository> <tag>
@y
usage: docker dhi customization prepare <dhi-repository> <tag>
@z

%options:

@x destination
      description: Destination repository (e.g. myorg/dhi-golang)
@y
      description: Destination repository (e.g. myorg/dhi-golang)
@z

@x name
      description: Name for the customization
@y
      description: Name for the customization
@z

%inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
