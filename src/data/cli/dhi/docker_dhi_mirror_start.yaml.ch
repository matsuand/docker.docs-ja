%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi mirror start
short: Start mirroring Docker Hardened Images
long: |-
    Start mirroring one or more Docker Hardened Images to your organization's registry.
@y
command: docker dhi mirror start
short: Start mirroring Docker Hardened Images
long: |-
    Start mirroring one or more Docker Hardened Images to your organization's registry.
@z

@x
    Repository mappings are specified using the -r flag. The following formats are supported:
@y
    Repository mappings are specified using the -r flag. The following formats are supported:
@z

@x
      source                  Only the source repository; destination is auto-generated as
                              <org>/dhi-<source-name>
      source,destination      Source and destination; namespaces are filled from config if omitted
      ns/source,ns/dest       Fully qualified source and destination
@y
      source                  Only the source repository; destination is auto-generated as
                              <org>/dhi-<source-name>
      source,destination      Source and destination; namespaces are filled from config if omitted
      ns/source,ns/dest       Fully qualified source and destination
@z

@x
    The source namespace defaults to "dhi" when not specified.
    The destination namespace defaults to the configured organization (--org or config).
@y
    The source namespace defaults to "dhi" when not specified.
    The destination namespace defaults to the configured organization (--org or config).
@z

@x
    Examples:
      # These are all equivalent (assuming --org myorg):
      dhictl mirror start --org myorg -r dhi/golang,myorg/dhi-golang
      dhictl mirror start --org myorg -r golang,dhi-golang
      dhictl mirror start --org myorg -r golang
@y
    Examples:
      # These are all equivalent (assuming --org myorg):
      dhictl mirror start --org myorg -r dhi/golang,myorg/dhi-golang
      dhictl mirror start --org myorg -r golang,dhi-golang
      dhictl mirror start --org myorg -r golang
@z

@x
      # Mirror multiple repositories
      dhictl mirror start --org myorg -r golang -r python
@y
      # Mirror multiple repositories
      dhictl mirror start --org myorg -r golang -r python
@z

@x
usage: docker dhi mirror start
@y
usage: docker dhi mirror start
@z

% options

@x dependencies
      description: Mirrors any existing dependencies
@y
      description: Mirrors any existing dependencies
@z

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x repo
      description: |
        Repository mapping in format source,destination (can be specified multiple times)
@y
      description: |
        Repository mapping in format source,destination (can be specified multiple times)
@z

% inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
