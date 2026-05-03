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
    Repository mappings are specified as arguments. The following formats are supported:
@y
    Repository mappings are specified as arguments. The following formats are supported:
@z

@x
      source                  Only the source repository; destination is auto-generated as
                              <org>/dhi-<source-name>
      source,destination      Source and destination; the destination namespace is filled from config if omitted
      ns/source,ns/dest       Fully qualified source and destination
@y
      source                  Only the source repository; destination is auto-generated as
                              <org>/dhi-<source-name>
      source,destination      Source and destination; the destination namespace is filled from config if omitted
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
      docker dhi mirror start --org myorg dhi/golang,myorg/dhi-golang dhi/node,myorg/dhi-node
      docker dhi mirror start --org myorg golang,dhi-golang node,dhi-node
      docker dhi mirror start --org myorg golang node
@y
    Examples:
      docker dhi mirror start --org myorg dhi/golang,myorg/dhi-golang dhi/node,myorg/dhi-node
      docker dhi mirror start --org myorg golang,dhi-golang node,dhi-node
      docker dhi mirror start --org myorg golang node
@z

@x
usage: docker dhi mirror start
@y
usage: docker dhi mirror start
@z

%options:

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

%inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
