%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker secret create
short: Create a secret from a file or STDIN as content
long: |-
    Creates a secret using standard input or from a file for the secret content.

    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@y
command: docker secret create
short: Create a secret from a file or STDIN as content
long: |-
    Creates a secret using standard input or from a file for the secret content.

    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](__SUBDIR__/engine/swarm/secrets/).
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
@z

@x
usage: docker secret create [OPTIONS] SECRET [file|-]
@y
usage: docker secret create [OPTIONS] SECRET [file|-]
@z

% options:

@x driver
      description: Secret driver
@y
      description: Secret driver
@z

@x label
      description: Secret labels
@y
      description: Secret labels
@z

@x template-driver
      description: Template driver
@y
      description: Template driver
@z

%inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Create a secret
@y
examples: |-
    ### Create a secret
@z

% snip command...

@x
    ### Create a secret with a file
@y
    ### Create a secret with a file
@z

% snip command...

@x
    ### Create a secret with labels (--label) {#label}
@y
    ### Create a secret with labels (--label) {#label}
@z

% snip command...
% snip directives...
