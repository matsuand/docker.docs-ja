%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass plugins 1password setup
short: Set the 1Password service account token and enable the plugin.
long: |-
    Store a 1Password [service account token](https://developer.1password.com/docs/service-accounts/get-started/) in the local OS keychain and enable the `1password-sdk` plugin.
@y
command: docker pass plugins 1password setup
short: Set the 1Password service account token and enable the plugin.
long: |-
    Store a 1Password [service account token](https://developer.1password.com/docs/service-accounts/get-started/) in the local OS keychain and enable the `1password-sdk` plugin.
@z

@x
    The token is read from STDIN and replaces any previously stored token. Once it is stored, the secrets engine is asked to enable the plugin so subsequent lookups resolve against 1Password.
@y
    The token is read from STDIN and replaces any previously stored token. Once it is stored, the secrets engine is asked to enable the plugin so subsequent lookups resolve against 1Password.
@z

@x
    Service account tokens are scoped to a fixed set of vaults; only items in those vaults are reachable through the plugin.
usage: docker pass plugins 1password setup
pname: docker pass plugins 1password
plink: docker_pass_plugins_1password.yaml
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
@y
    Service account tokens are scoped to a fixed set of vaults; only items in those vaults are reachable through the plugin.
usage: docker pass plugins 1password setup
pname: docker pass plugins 1password
plink: docker_pass_plugins_1password.yaml
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
@z
