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
    Values the customization inherits from the tag definition (environment variables, entrypoint, cmd,
    accounts and working directory) are listed commented out. Fields left out or commented out are inherited;
    uncommenting a field overrides the inherited value:
      - environment, labels and annotations override per key; keys you leave out are still inherited.
      - entrypoint and cmd are replaced entirely by the list you provide.
      - accounts override per sub-key; a users or groups list replaces the whole inherited list.
    A bulk customization inherits the same way, with each target merged with its own tag definition.
@y
    Values the customization inherits from the tag definition (environment variables, entrypoint, cmd,
    accounts and working directory) are listed commented out. Fields left out or commented out are inherited;
    uncommenting a field overrides the inherited value:
      - environment, labels and annotations override per key; keys you leave out are still inherited.
      - entrypoint and cmd are replaced entirely by the list you provide.
      - accounts override per sub-key; a users or groups list replaces the whole inherited list.
    A bulk customization inherits the same way, with each target merged with its own tag definition.
@z

@x
    For a Helm chart, every reference of the chart is listed under variable_mappings, pointing at dhi.io.
    To point a reference elsewhere, uncomment its repository and either tag_definition_id (another tag
    definition of a mirrored image) or customization_id (a customization). Sub-charts can only point at a
    customization or dhi.io. Do not change the variable names.
@y
    For a Helm chart, every reference of the chart is listed under variable_mappings, pointing at dhi.io.
    To point a reference elsewhere, uncomment its repository and either tag_definition_id (another tag
    definition of a mirrored image) or customization_id (a customization). Sub-charts can only point at a
    customization or dhi.io. Do not change the variable names.
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
