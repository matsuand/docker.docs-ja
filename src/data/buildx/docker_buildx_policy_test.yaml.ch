%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx policy test
short: Run policy tests
long: Run policy tests
usage: docker buildx policy test <path>
@y
command: docker buildx policy test
short: Run policy tests
long: Run policy tests
usage: docker buildx policy test <path>
@z

% pname
% plink
% options:

@x filename
      description: Name of the Dockerfile to validate
@y
      description: Name of the Dockerfile to validate
@z

@x run
      description: Run only tests with name containing this substring
@y
      description: Run only tests with name containing this substring
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

% snip directives...
