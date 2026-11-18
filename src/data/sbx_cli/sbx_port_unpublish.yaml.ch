%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx port unpublish
synopsis: Unpublish ports
description: |-
    Unpublish sandbox ports from the host.
@y
name: sbx port unpublish
synopsis: Unpublish ports
description: |-
    Unpublish sandbox ports from the host.
@z

@x
    A SPEC is [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL].
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@y
    A SPEC is [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL].
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@z

@x
    When unpublishing without a HOST_PORT, mappings matching HOST_IP and PROTOCOL
    are removed from every host port.
@y
    When unpublishing without a HOST_PORT, mappings matching HOST_IP and PROTOCOL
    are removed from every host port.
@z

@x
    When unpublishing without a PROTOCOL, the mapping is removed whether it was
    published with that same default or as dual-stack tcp. Name the protocol to
    remove a tcp6 or udp mapping; anything left behind is reported.
@y
    When unpublishing without a PROTOCOL, the mapping is removed whether it was
    published with that same default or as dual-stack tcp. Name the protocol to
    remove a tcp6 or udp mapping; anything left behind is reported.
@z

@x
    With --cloud:
    Remove exposed ports from a cloud sandbox given by ID (sbx_*) or name.
@y
    With --cloud:
    Remove exposed ports from a cloud sandbox given by ID (sbx_*) or name.
@z

@x
    A SPEC is the sandbox port number alone or with a /tcp suffix; UDP and host
    bindings are refused.
@y
    A SPEC is the sandbox port number alone or with a /tcp suffix; UDP and host
    bindings are refused.
@z

@x
usage: sbx port unpublish SANDBOX SPEC... [flags]
@y
usage: sbx port unpublish SANDBOX SPEC... [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for unpublish
@y
      usage: help for unpublish
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

@x
example: |4-
      # Unpublish a port
      sbx port unpublish my-sandbox 3000:8080
@y
example: |4-
      # Unpublish a port
      sbx port unpublish my-sandbox 3000:8080
@z

@x
      # Unpublish a sandbox port from every host port
      sbx port unpublish my-sandbox 8080
@y
      # Unpublish a sandbox port from every host port
      sbx port unpublish my-sandbox 8080
@z

@x
      # Remove an exposed port from a cloud sandbox
      sbx --cloud port unpublish sbx_abc123 8080
@y
      # Remove an exposed port from a cloud sandbox
      sbx --cloud port unpublish sbx_abc123 8080
@z

% see_also:

@x
    - sbx port - Manage sandbox port publishing
@y
    - sbx port - Manage sandbox port publishing
@z
