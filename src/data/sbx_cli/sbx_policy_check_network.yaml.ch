%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy check network
synopsis: Check network access to a host
description: |-
    Check whether current policy allows network access to TARGET.
@y
name: sbx policy check network
synopsis: Check network access to a host
description: |-
    Check whether current policy allows network access to TARGET.
@z

@x
    TARGET may be a hostname, host:port, IP literal, or URL. Bare hosts and IP
    literals are evaluated with port 443. HTTP(S) URLs use their default ports;
    other URL schemes must include an explicit port. URLs supply only their host
    and port: this command evaluates network authorization, not HTTP method or path.
@y
    TARGET may be a hostname, host:port, IP literal, or URL. Bare hosts and IP
    literals are evaluated with port 443. HTTP(S) URLs use their default ports;
    other URL schemes must include an explicit port. URLs supply only their host
    and port: this command evaluates network authorization, not HTTP method or path.
@z

@x
usage: sbx policy check network [--sandbox SANDBOX] TARGET [flags]
@y
usage: sbx policy check network [--sandbox SANDBOX] TARGET [flags]
@z

% options:

@x help
      usage: help for network
@y
      usage: help for network
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x protocol
      usage: 'Network protocol to evaluate: tcp or udp'
@y
      usage: 'Network protocol to evaluate: tcp or udp'
@z

@x sandbox
      usage: Evaluate in a specific sandbox policy context
@y
      usage: Evaluate in a specific sandbox policy context
@z

@x verbose
      usage: Show the exact policy request fields
@y
      usage: Show the exact policy request fields
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
      # Check global network policy
      sbx policy check network api.example.com
@y
example: |4-
      # Check global network policy
      sbx policy check network api.example.com
@z

@x
      # Check policy in a sandbox context
      sbx policy check network --sandbox my-sandbox api.example.com:443
@y
      # Check policy in a sandbox context
      sbx policy check network --sandbox my-sandbox api.example.com:443
@z

@x
      # Check a pasted URL and output JSON
      sbx policy check network --json https://api.example.com/v1
@y
      # Check a pasted URL and output JSON
      sbx policy check network --json https://api.example.com/v1
@z

% see_also:

@x
    - sbx policy check - Check whether policy allows an access request
@y
    - sbx policy check - Check whether policy allows an access request
@z
