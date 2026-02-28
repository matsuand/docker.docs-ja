%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox network proxy
short: Manage proxy configuration for a sandbox
long: Manage proxy configuration for a sandbox
usage: docker sandbox network proxy <sandbox> [OPTIONS]
@y
command: docker sandbox network proxy
short: Manage proxy configuration for a sandbox
long: Manage proxy configuration for a sandbox
usage: docker sandbox network proxy <sandbox> [OPTIONS]
@z

% pname
% plink
% options

@x allow-cidr
      description: |
        Remove an IP range in CIDR notation from the block or bypass lists (can be specified multiple times)
@y
      description: |
        Remove an IP range in CIDR notation from the block or bypass lists (can be specified multiple times)
@z

@x allow-host
      description: Permit access to a domain or IP (can be specified multiple times)
@y
      description: Permit access to a domain or IP (can be specified multiple times)
@z

@x block-cidr
      description: |
        Block access to an IP range in CIDR notation (can be specified multiple times)
@y
      description: |
        Block access to an IP range in CIDR notation (can be specified multiple times)
@z

@x block-host
      description: Block access to a domain or IP (can be specified multiple times)
@y
      description: Block access to a domain or IP (can be specified multiple times)
@z

@x bypass-cidr
      description: |
        Bypass MITM proxy for an IP range in CIDR notation (can be specified multiple times)
@y
      description: |
        Bypass MITM proxy for an IP range in CIDR notation (can be specified multiple times)
@z

@x bypass-host
      description: |
        Bypass MITM proxy for a domain or IP (can be specified multiple times)
@y
      description: |
        Bypass MITM proxy for a domain or IP (can be specified multiple times)
@z

@x policy
      description: Set the default policy
@y
      description: Set the default policy
@z

% inherited_options

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x socket
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@y
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@z

@x
examples: |-
    ### Block access to a domain
@y
examples: |-
    ### Block access to a domain
@z

% snip command...

@x
    ### Block multiple domains
@y
    ### Block multiple domains
@z

% snip command...

@x
    ### Block IP range (--block-cidr) {#block-cidr}
@y
    ### Block IP range (--block-cidr) {#block-cidr}
@z

% snip code...

@x
    Block access to an IP range in CIDR notation:
@y
    Block access to an IP range in CIDR notation:
@z

% snip command...

@x
    ### Allow specific domain (--allow-host) {#allow-host}
@y
    ### Allow specific domain (--allow-host) {#allow-host}
@z

% snip code...

@x
    Permit access to a domain (useful with deny-by-default policy):
@y
    Permit access to a domain (useful with deny-by-default policy):
@z

% snip command...

@x
    ### Bypass MITM proxy for domain (--bypass-host) {#bypass-host}
@y
    ### Bypass MITM proxy for domain (--bypass-host) {#bypass-host}
@z

% snip code...

@x
    Bypass MITM proxy for specific domains:
@y
    Bypass MITM proxy for specific domains:
@z

% snip command...

@x
    ### Bypass MITM proxy for IP range (--bypass-cidr) {#bypass-cidr}
@y
    ### Bypass MITM proxy for IP range (--bypass-cidr) {#bypass-cidr}
@z

% snip code...

@x
    Bypass MITM proxy for an IP range:
@y
    Bypass MITM proxy for an IP range:
@z

% snip command...

@x
    ### Set default policy (--policy) {#policy}
@y
    ### Set default policy (--policy) {#policy}
@z

% snip code...

@x
    Set the default policy for network access:
@y
    Set the default policy for network access:
@z

@x within command
    # Allow by default, block specific hosts
@y
    # Allow by default, block specific hosts
@z
@x
    # Deny by default, allow specific hosts
@y
    # Deny by default, allow specific hosts
@z

@x
    ### Remove rules
@y
    ### Remove rules
@z

@x
    Use `--allow-cidr` to remove IP ranges from block or bypass lists:
@y
    Use `--allow-cidr` to remove IP ranges from block or bypass lists:
@z

% snip command...
% snip directives...
