%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout policy publish
short: |
    Package local Rego policies into an OCI bundle and push it to a registry (experimental)
long: |-
    The docker scout policy publish command packages Rego policies into an OCI policy bundle and pushes it to a registry. The published bundle can then be evaluated with docker scout policy --policy-bundle REFERENCE.
@y
command: docker scout policy publish
short: |
    Package local Rego policies into an OCI bundle and push it to a registry (experimental)
long: |-
    The docker scout policy publish command packages Rego policies into an OCI policy bundle and pushes it to a registry. The published bundle can then be evaluated with docker scout policy --policy-bundle REFERENCE.
@z

@x
    When no --policy-file or --policy-dir is given, the built-in default policy set is published. Authentication uses your existing registry credentials (run "docker login" first).
@y
    When no --policy-file or --policy-dir is given, the built-in default policy set is published. Authentication uses your existing registry credentials (run "docker login" first).
@z

@x
usage: docker scout policy publish [OPTIONS] REFERENCE
@y
usage: docker scout policy publish [OPTIONS] REFERENCE
@z

% options:

@x policy-dir
      description: |
        Path to a directory of local .rego policy files to include (repeatable)
@y
      description: |
        Path to a directory of local .rego policy files to include (repeatable)
@z

@x policy-file
      description: Path or http(s) URL to a .rego policy file to include (repeatable)
@y
      description: Path or http(s) URL to a .rego policy file to include (repeatable)
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
examples: "  Publish the built-in default policies:\n  $ docker scout policy publish registry.example.com/policies:latest\e[0m\n\n  Publish a directory of local policies:\n  $ docker scout policy publish --policy-dir ./rego registry.example.com/policies:latest\e[0m\n\n  Publish specific policy files:\n  $ docker scout policy publish --policy-file fixable.rego --policy-file licenses.rego registry.example.com/policies:latest\e[0m"
@y
examples: "  Publish the built-in default policies:\n  $ docker scout policy publish registry.example.com/policies:latest\e[0m\n\n  Publish a directory of local policies:\n  $ docker scout policy publish --policy-dir ./rego registry.example.com/policies:latest\e[0m\n\n  Publish specific policy files:\n  $ docker scout policy publish --policy-file fixable.rego --policy-file licenses.rego registry.example.com/policies:latest\e[0m"
@z

% snip directives...
