%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy check http
synopsis: Check HTTP access to a URL
description: |-
    Evaluate current policy for an HTTP request to URL.
@y
name: sbx policy check http
synopsis: Check HTTP access to a URL
description: |-
    Evaluate current policy for an HTTP request to URL.
@z

@x
    URL must be an absolute HTTP or HTTPS URL. The check evaluates network access
    first, then evaluates HTTP method, path, and query policy when it applies. It
    does not resolve hostnames, make a network request, or account for runtime
    transport behavior. Transparent connections that require HTTP authorization are
    blocked at runtime, while daemon-managed aliases can be reachable regardless of
    the policy result. Results for hostnames do not include policy applied to their
    resolved IP addresses. The displayed URL retains the target's host spelling;
    with --verbose, Resource shows the normalized host and port evaluated by policy.
@y
    URL must be an absolute HTTP or HTTPS URL. The check evaluates network access
    first, then evaluates HTTP method, path, and query policy when it applies. It
    does not resolve hostnames, make a network request, or account for runtime
    transport behavior. Transparent connections that require HTTP authorization are
    blocked at runtime, while daemon-managed aliases can be reachable regardless of
    the policy result. Results for hostnames do not include policy applied to their
    resolved IP addresses. The displayed URL retains the target's host spelling;
    with --verbose, Resource shows the normalized host and port evaluated by policy.
@z

@x
usage: sbx policy check http [--sandbox SANDBOX] [--method METHOD] URL [flags]
@y
usage: sbx policy check http [--sandbox SANDBOX] [--method METHOD] URL [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for http
@y
      usage: help for http
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x method
      usage: HTTP method to evaluate
@y
      usage: HTTP method to evaluate
@z

@x sandbox
      usage: Evaluate in a specific sandbox policy context
@y
      usage: Evaluate in a specific sandbox policy context
@z

@x verbose
      usage: Show the policy action and resource
@y
      usage: Show the policy action and resource
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
      # Check a GET request
      sbx policy check http https://api.example.com/v1/items
@y
example: |4-
      # Check a GET request
      sbx policy check http https://api.example.com/v1/items
@z

@x
      # Check a POST request in a sandbox context
      sbx policy check http --sandbox my-sandbox --method POST https://api.example.com/v1/items
@y
      # Check a POST request in a sandbox context
      sbx policy check http --sandbox my-sandbox --method POST https://api.example.com/v1/items
@z

@x
      # Check a query-qualified request and output JSON
      sbx policy check http --json 'https://api.example.com/search?team=platform'
@y
      # Check a query-qualified request and output JSON
      sbx policy check http --json 'https://api.example.com/search?team=platform'
@z

% see_also:

@x
    - sbx policy check - Check whether policy allows an access request
@y
    - sbx policy check - Check whether policy allows an access request
@z
