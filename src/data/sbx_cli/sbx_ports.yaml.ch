%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx ports
synopsis: Manage sandbox port publishing
description: |-
    Manage sandbox port publishing.
@y
name: sbx ports
synopsis: Manage sandbox port publishing
description: |-
    Manage sandbox port publishing.
@z

@x
    List, publish, or unpublish sandbox ports. Publishing a local port starts a
    stopped sandbox before creating the host binding. Without --publish or
    --unpublish flags, lists all published ports.
@y
    List, publish, or unpublish sandbox ports. Publishing a local port starts a
    stopped sandbox before creating the host binding. Without --publish or
    --unpublish flags, lists all published ports.
@z

@x
    Port spec format: [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    If HOST_PORT is omitted, an ephemeral port is allocated automatically.
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@y
    Port spec format: [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    If HOST_PORT is omitted, an ephemeral port is allocated automatically.
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
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
    Manage the exposed ports of a cloud sandbox.
@y
    With --cloud:
    Manage the exposed ports of a cloud sandbox.
@z

@x
    List, publish, or unpublish ports on a cloud sandbox given by ID (sbx_*) or
    name. Without --publish or --unpublish flags, lists the exposed ports.
@y
    List, publish, or unpublish ports on a cloud sandbox given by ID (sbx_*) or
    name. Without --publish or --unpublish flags, lists the exposed ports.
@z

@x
    A port is the sandbox port number alone or with a /tcp suffix; UDP and host
    bindings are refused. The cloud control plane assigns a publicly reachable URL
    for each exposed port.
@y
    A port is the sandbox port number alone or with a /tcp suffix; UDP and host
    bindings are refused. The cloud control plane assigns a publicly reachable URL
    for each exposed port.
@z

@x
usage: sbx ports SANDBOX [flags]
@y
usage: sbx ports SANDBOX [flags]
@z

% options:

@x help
      usage: help for ports
@y
      usage: help for ports
@z

@x json
      usage: Output in JSON format (for port listing)
@y
      usage: Output in JSON format (for port listing)
@z

@x publish
      usage: |
        Publish a port (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL] (local) or SANDBOX_PORT[/tcp] (cloud)
@y
      usage: |
        Publish a port (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL] (local) or SANDBOX_PORT[/tcp] (cloud)
@z

@x unpublish
      usage: |
        Unpublish a port (can be repeated): [HOST_IP:]HOST_PORT:SANDBOX_PORT[/PROTOCOL] (local) or SANDBOX_PORT[/tcp] (cloud)
@y
      usage: |
        Unpublish a port (can be repeated): [HOST_IP:]HOST_PORT:SANDBOX_PORT[/PROTOCOL] (local) or SANDBOX_PORT[/tcp] (cloud)
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

@x
example: |4-
      # List published ports
      sbx ports my-sandbox
@y
example: |4-
      # List published ports
      sbx ports my-sandbox
@z

@x
      # Publish sandbox port 8080 to an ephemeral host port
      sbx ports my-sandbox --publish 8080
@y
      # Publish sandbox port 8080 to an ephemeral host port
      sbx ports my-sandbox --publish 8080
@z

@x
      # Publish with a specific host port
      sbx ports my-sandbox --publish 3000:8080
@y
      # Publish with a specific host port
      sbx ports my-sandbox --publish 3000:8080
@z

@x
      # Unpublish a port
      sbx ports my-sandbox --unpublish 3000:8080
@y
      # Unpublish a port
      sbx ports my-sandbox --unpublish 3000:8080
@z

@x
      # Expose port 8080 on a cloud sandbox
      sbx --cloud ports sbx_abc123 --publish 8080
@y
      # Expose port 8080 on a cloud sandbox
      sbx --cloud ports sbx_abc123 --publish 8080
@z

@x
      # Remove an exposed port from a cloud sandbox
      sbx --cloud ports sbx_abc123 --unpublish 8080
@y
      # Remove an exposed port from a cloud sandbox
      sbx --cloud ports sbx_abc123 --unpublish 8080
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
