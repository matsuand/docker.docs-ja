%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi catalog list
short: List available Docker Hardened Images
long: List all available Docker Hardened Images and Helm charts in the catalog
usage: docker dhi catalog list
@y
command: docker dhi catalog list
short: List available Docker Hardened Images
long: List all available Docker Hardened Images and Helm charts in the catalog
usage: docker dhi catalog list
@z

% options:

@x filter
      description: Filter by name (case-insensitive substring match)
@y
      description: Filter by name (case-insensitive substring match)
@z

@x fips
      description: Filter to FIPS compliant images (use --fips=false to exclude)
@y
      description: Filter to FIPS compliant images (use --fips=false to exclude)
@z

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x stig
      description: Filter to STIG certified images (use --stig=false to exclude)
@y
      description: Filter to STIG certified images (use --stig=false to exclude)
@z

@x type
      description: Filter by type (image, helm, chart, or helm-chart)
@y
      description: Filter by type (image, helm, chart, or helm-chart)
@z

% inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
