%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx port publish
synopsis: Publish ports
description: |-
    Publish sandbox ports to the host.
@y
name: sbx port publish
synopsis: Publish ports
description: |-
    Publish sandbox ports to the host.
@z

@x
    Publishing a local port starts a stopped sandbox before creating the host
    binding. A SPEC is [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL].
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@y
    Publishing a local port starts a stopped sandbox before creating the host
    binding. A SPEC is [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL].
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@z

@x
    When publishing without a HOST_PORT, an ephemeral port is allocated automatically.
@y
    When publishing without a HOST_PORT, an ephemeral port is allocated automatically.
@z

@x
    When publishing without a PROTOCOL, tcp4 is used — so a sandbox service
    listening only on IPv4 is reachable without a host client having to avoid
    ::1 — or tcp6 when HOST_IP is an IPv6 address. Publish tcp explicitly to
    bind both families.
@y
    When publishing without a PROTOCOL, tcp4 is used — so a sandbox service
    listening only on IPv4 is reachable without a host client having to avoid
    ::1 — or tcp6 when HOST_IP is an IPv6 address. Publish tcp explicitly to
    bind both families.
@z

@x
    With --cloud:
    Expose ports of a cloud sandbox given by ID (sbx_*) or name.
@y
    With --cloud:
    Expose ports of a cloud sandbox given by ID (sbx_*) or name.
@z

@x
    A SPEC is the sandbox port number alone or with a /tcp suffix; UDP and host
    bindings are refused.
    The cloud control plane assigns a publicly reachable URL for each exposed port.
@y
    A SPEC is the sandbox port number alone or with a /tcp suffix; UDP and host
    bindings are refused.
    The cloud control plane assigns a publicly reachable URL for each exposed port.
@z

@x
usage: sbx port publish SANDBOX SPEC... [flags]
@y
usage: sbx port publish SANDBOX SPEC... [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for publish
@y
      usage: help for publish
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
      # Publish sandbox port 8080 to an ephemeral host port
      sbx port publish my-sandbox 8080
@y
example: |4-
      # Publish sandbox port 8080 to an ephemeral host port
      sbx port publish my-sandbox 8080
@z

@x
      # Publish with a specific host port
      sbx port publish my-sandbox 3000:8080
@y
      # Publish with a specific host port
      sbx port publish my-sandbox 3000:8080
@z

@x
      # Publish several ports at once
      sbx port publish my-sandbox 8080 9090/udp
@y
      # Publish several ports at once
      sbx port publish my-sandbox 8080 9090/udp
@z

@x
      # Expose port 8080 on a cloud sandbox
      sbx --cloud port publish sbx_abc123 8080
@y
      # Expose port 8080 on a cloud sandbox
      sbx --cloud port publish sbx_abc123 8080
@z

% see_also:

@x
    - sbx port - Manage sandbox port publishing
@y
    - sbx port - Manage sandbox port publishing
@z
