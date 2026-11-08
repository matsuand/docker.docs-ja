%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Manage local network rules
linkTitle: Manage network rules
@y
title: Manage local network rules
linkTitle: Manage network rules
@z

@x
description: Allow, deny, and remove local network rules for sandboxes on your machine with sbx policy.
keywords: docker sandboxes, local policy, network rules, sbx policy allow, sbx policy deny, HTTP rules, UDP
@y
description: Allow, deny, and remove local network rules for sandboxes on your machine with sbx policy.
keywords: docker sandboxes, local policy, network rules, sbx policy allow, sbx policy deny, HTTP rules, UDP
@z

@x
Local network rules allow or block destinations on top of your
[preset](_index.md#start-from-a-preset). You can add rules for all sandboxes or
for one sandbox, narrow a rule to HTTP methods and paths, and remove rules you
no longer need. For the host patterns a rule accepts, see
[Network and HTTP rule syntax](../reference/network-rules.md#destinations).
@y
Local network rules allow or block destinations on top of your
[preset](_index.md#start-from-a-preset). You can add rules for all sandboxes or
for one sandbox, narrow a rule to HTTP methods and paths, and remove rules you
no longer need. For the host patterns a rule accepts, see
[Network and HTTP rule syntax](../reference/network-rules.md#destinations).
@z

@x
## Allow or block a destination
@y
## Allow or block a destination
@z

@x
Use [`sbx policy allow`](/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](/reference/cli/sbx/policy/deny/) to add or restrict access
on top of the active preset. Changes take effect immediately. Rules apply to
all sandboxes by default:
@y
Use [`sbx policy allow`](__SUBDIR__/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](__SUBDIR__/reference/cli/sbx/policy/deny/) to add or restrict access
on top of the active preset. Changes take effect immediately. Rules apply to
all sandboxes by default:
@z

@x
```console
$ sbx policy allow network api.anthropic.com
$ sbx policy deny network ads.example.com
```
@y
```console
$ sbx policy allow network api.anthropic.com
$ sbx policy deny network ads.example.com
```
@z

@x
Specify multiple hosts in one command with a comma-separated list:
@y
Specify multiple hosts in one command with a comma-separated list:
@z

@x
```console
$ sbx policy allow network "api.anthropic.com,*.npmjs.org,*.pypi.org"
```
@y
```console
$ sbx policy allow network "api.anthropic.com,*.npmjs.org,*.pypi.org"
```
@z

@x
## Allow or block a destination for one sandbox
@y
## Allow or block a destination for one sandbox
@z

@x
Pass `--sandbox <name>` to scope a rule to one sandbox:
@y
Pass `--sandbox <name>` to scope a rule to one sandbox:
@z

@x
```console
$ sbx policy allow network --sandbox my-sandbox api.example.com
$ sbx policy deny network --sandbox my-sandbox ads.example.com
```
@y
```console
$ sbx policy allow network --sandbox my-sandbox api.example.com
$ sbx policy deny network --sandbox my-sandbox ads.example.com
```
@z

@x
You can also add deny rules for a sandbox when you create it, with
`--deny-network` on `sbx create` or `sbx run`:
@y
You can also add deny rules for a sandbox when you create it, with
`--deny-network` on `sbx create` or `sbx run`:
@z

@x
```console
$ sbx create --deny-network ads.example.com claude .
$ sbx run --deny-network ads.example.com claude
```
@y
```console
$ sbx create --deny-network ads.example.com claude .
$ sbx run --deny-network ads.example.com claude
```
@z

@x
Pass the flag multiple times to deny more than one host. Rules added this way
appear in `sbx policy ls <name>`, like any other rule scoped to the sandbox.
@y
Pass the flag multiple times to deny more than one host. Rules added this way
appear in `sbx policy ls <name>`, like any other rule scoped to the sandbox.
@z

@x
To block a destination that a kit allows, add a deny rule for the sandbox that
uses the kit. A deny rule takes precedence over the kit's allow rule:
@y
To block a destination that a kit allows, add a deny rule for the sandbox that
uses the kit. A deny rule takes precedence over the kit's allow rule:
@z

@x
```console
$ sbx policy deny network --sandbox my-sandbox openrouter.ai
```
@y
```console
$ sbx policy deny network --sandbox my-sandbox openrouter.ai
```
@z

@x
Removing a sandbox also removes the rules scoped to it.
@y
Removing a sandbox also removes the rules scoped to it.
@z

@x
## Allow or block HTTP methods and paths
@y
## Allow or block HTTP methods and paths
@z

@x
The rules in the previous sections match a whole host. An HTTP rule matches
specific HTTP methods and paths on a host instead, so you can allow or block
specific API requests. For example, you can let an agent read from an API
without letting it write to it.
@y
The rules in the previous sections match a whole host. An HTTP rule matches
specific HTTP methods and paths on a host instead, so you can allow or block
specific API requests. For example, you can let an agent read from an API
without letting it write to it.
@z

@x
Add `--method` to an allow or deny rule to match specific HTTP methods, and
`--path` to narrow it to part of the host's URL space. Quote the path so your
shell doesn't expand the wildcard:
@y
Add `--method` to an allow or deny rule to match specific HTTP methods, and
`--path` to narrow it to part of the host's URL space. Quote the path so your
shell doesn't expand the wildcard:
@z

@x
```console
$ sbx policy allow network api.github.com --method GET --path '/repos/org/project/**'
```
@y
```console
$ sbx policy allow network api.github.com --method GET --path '/repos/org/project/**'
```
@z

@x
Write the host without a scheme, such as `api.github.com` rather than
`https://api.github.com`. It follows the same patterns as network rules and can
include a port, but it must be a hostname. To match an IP address or a CIDR
range, use a network rule without `--method` or `--path`.
@y
Write the host without a scheme, such as `api.github.com` rather than
`https://api.github.com`. It follows the same patterns as network rules and can
include a port, but it must be a hostname. To match an IP address or a CIDR
range, use a network rule without `--method` or `--path`.
@z

@x
### Choose methods
@y
### Choose methods
@z

@x
Pass several methods as a comma-separated list, or `ANY` to match every
method. Method names are case-insensitive, and `ANY` can't be combined with
specific methods:
@y
Pass several methods as a comma-separated list, or `ANY` to match every
method. Method names are case-insensitive, and `ANY` can't be combined with
specific methods:
@z

@x
```console
$ sbx policy allow network api.github.com --method GET,HEAD
```
@y
```console
$ sbx policy allow network api.github.com --method GET,HEAD
```
@z

@x
The accepted methods are `GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE`,
`OPTIONS`, `CONNECT`, and `TRACE`.
@y
The accepted methods are `GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE`,
`OPTIONS`, `CONNECT`, and `TRACE`.
@z

@x
### Choose paths
@y
### Choose paths
@z

@x
A rule without `--path` matches every path on the host. A rule takes one path,
and a path needs a method. Repeating `--path` keeps only the last value, and a
comma is read as part of the path, so add a separate rule for each path:
@y
A rule without `--path` matches every path on the host. A rule takes one path,
and a path needs a method. Repeating `--path` keeps only the last value, and a
comma is read as part of the path, so add a separate rule for each path:
@z

@x
```console
$ sbx policy allow network api.github.com --method GET --path '/repos/**'
$ sbx policy allow network api.github.com --method GET --path '/users/**'
```
@y
```console
$ sbx policy allow network api.github.com --method GET --path '/repos/**'
$ sbx policy allow network api.github.com --method GET --path '/users/**'
```
@z

@x
A path must start with `/` and be canonical. For the full path rules, see
[HTTP method and path](../reference/network-rules.md#http-method-and-path).
@y
A path must start with `/` and be canonical. For the full path rules, see
[HTTP method and path](../reference/network-rules.md#http-method-and-path).
@z

@x
### Match query parameters
@y
### Match query parameters
@z

@x
Add `--query` to require URL query parameters, separately from the path. Repeat
the flag to require more than one. Like a path, a query restriction needs a
method, so keep `--method` or use `--method ANY`:
@y
Add `--query` to require URL query parameters, separately from the path. Repeat
the flag to require more than one. Like a path, a query restriction needs a
method, so keep `--method` or use `--method ANY`:
@z

@x
```console
$ sbx policy allow network api.example.com --method GET --path '/search' \
    --query 'team=platform' --query 'label=release*'
```
@y
```console
$ sbx policy allow network api.example.com --method GET --path '/search' \
    --query 'team=platform' --query 'label=release*'
```
@z

@x
For value patterns and matching behavior, see
[Query parameters](../reference/network-rules.md#query-parameters).
@y
For value patterns and matching behavior, see
[Query parameters](../reference/network-rules.md#query-parameters).
@z

@x
### Block part of an allowed host
@y
### Block part of an allowed host
@z

@x
To restrict part of a host, add a deny rule with the same flags on top of a
broader allow:
@y
To restrict part of a host, add a deny rule with the same flags on top of a
broader allow:
@z

@x
```console
$ sbx policy allow network api.example.com
$ sbx policy deny network api.example.com --method POST --path '/admin/**'
```
@y
```console
$ sbx policy allow network api.example.com
$ sbx policy deny network api.example.com --method POST --path '/admin/**'
```
@z

@x
## Remove a rule
@y
## Remove a rule
@z

@x
Remove a rule by resource or by rule ID:
@y
Remove a rule by resource or by rule ID:
@z

@x
```console
$ sbx policy rm network --resource ads.example.com
$ sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
```
@y
```console
$ sbx policy rm network --resource ads.example.com
$ sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
```
@z

@x
To remove a rule scoped to a sandbox, pass `--sandbox <name>`:
@y
To remove a rule scoped to a sandbox, pass `--sandbox <name>`:
@z

@x
```console
$ sbx policy rm network --sandbox my-sandbox --resource api.example.com
```
@y
```console
$ sbx policy rm network --sandbox my-sandbox --resource api.example.com
```
@z

@x
To remove an HTTP rule, name the same method, path, and any `--query` flags you
added it with, or use its rule ID:
@y
To remove an HTTP rule, name the same method, path, and any `--query` flags you
added it with, or use its rule ID:
@z

@x
```console
$ sbx policy rm network --resource api.example.com --method GET --path '/search' \
    --query 'team=platform' --query 'label=release*'
```
@y
```console
$ sbx policy rm network --resource api.example.com --method GET --path '/search' \
    --query 'team=platform' --query 'label=release*'
```
@z

@x
To find a rule's ID, run `sbx policy ls --wide`. For more details, see
[Inspect policy status and rules](inspect.md).
@y
To find a rule's ID, run `sbx policy ls --wide`. For more details, see
[Inspect policy status and rules](inspect.md).
@z

@x
## Allow outbound UDP
@y
## Allow outbound UDP
@z

@x
Outbound UDP is experimental and disabled by default. Turn on experimental
features and UDP egress before you add UDP allow rules. The CLI warns you if
you save a UDP rule while UDP egress is off:
@y
Outbound UDP is experimental and disabled by default. Turn on experimental
features and UDP egress before you add UDP allow rules. The CLI warns you if
you save a UDP rule while UDP egress is off:
@z

@x
```console
$ sbx settings set platform.allowExperimentalFeatures true
$ sbx settings set feature.udp-egress true
$ sbx policy allow network --protocol udp api.example.com:443
```
@y
```console
$ sbx settings set platform.allowExperimentalFeatures true
$ sbx settings set feature.udp-egress true
$ sbx policy allow network --protocol udp api.example.com:443
```
@z

@x
Local allow rules apply to TCP by default. Use `--protocol udp` for UDP or
`--protocol tcp,udp` for both. Deny rules apply to both protocols by default,
and `--protocol` restricts a deny rule to one. UDP rules follow the same
organization and local precedence as TCP rules.
@y
Local allow rules apply to TCP by default. Use `--protocol udp` for UDP or
`--protocol tcp,udp` for both. Deny rules apply to both protocols by default,
and `--protocol` restricts a deny rule to one. UDP rules follow the same
organization and local precedence as TCP rules.
@z

@x
Some UDP traffic is blocked whatever your rules allow:
@y
Some UDP traffic is blocked whatever your rules allow:
@z

@x
- Traffic to a destination that needs an HTTP, SOCKS5, system, or PAC-selected
  proxy, because those proxies can't carry UDP.
- Traffic to local-network destinations, including multicast, link-local, and
  unspecified addresses, `255.255.255.255`, and the broadcast addresses of the
  host's networks. This block applies before any policy is evaluated, so even a
  rule that allows all hosts doesn't permit it, and discovery protocols such as
  mDNS and SSDP don't work from a sandbox. UDP to `host.docker.internal` isn't
  affected. The network log records these connections under the rule
  `<udp local network boundary>`.
@y
- Traffic to a destination that needs an HTTP, SOCKS5, system, or PAC-selected
  proxy, because those proxies can't carry UDP.
- Traffic to local-network destinations, including multicast, link-local, and
  unspecified addresses, `255.255.255.255`, and the broadcast addresses of the
  host's networks. This block applies before any policy is evaluated, so even a
  rule that allows all hosts doesn't permit it, and discovery protocols such as
  mDNS and SSDP don't work from a sandbox. UDP to `host.docker.internal` isn't
  affected. The network log records these connections under the rule
  `<udp local network boundary>`.
@z

@x
To list UDP rules or check a destination:
@y
To list UDP rules or check a destination:
@z

@x
```console
$ sbx policy ls --protocol udp
$ sbx policy check network --protocol udp api.example.com:443
```
@y
```console
$ sbx policy ls --protocol udp
$ sbx policy check network --protocol udp api.example.com:443
```
@z

@x
## Set or reset the preset
@y
## Set or reset the preset
@z

@x
If no preset is set, the CLI prompts you to choose one when you run a sandbox
in an interactive terminal. For more details, see
[Start from a preset](_index.md#start-from-a-preset). To set the preset without
the prompt, or to start over with a new one, use `sbx policy init` or `sbx
policy reset`.
@y
If no preset is set, the CLI prompts you to choose one when you run a sandbox
in an interactive terminal. For more details, see
[Start from a preset](_index.md#start-from-a-preset). To set the preset without
the prompt, or to start over with a new one, use `sbx policy init` or `sbx
policy reset`.
@z

@x
### Set the preset without the prompt
@y
### Set the preset without the prompt
@z

@x
In non-interactive environments such as CI pipelines or headless servers, the
CLI can't prompt you, so commands such as `sbx run` return an error until a
preset is set. Use `sbx policy init` to set the preset before you run a
sandbox:
@y
In non-interactive environments such as CI pipelines or headless servers, the
CLI can't prompt you, so commands such as `sbx run` return an error until a
preset is set. Use `sbx policy init` to set the preset before you run a
sandbox:
@z

@x
```console
$ sbx policy init balanced
```
@y
```console
$ sbx policy init balanced
```
@z

@x
Available values are `allow-all` (Open), `balanced` (Balanced), and `deny-all`
(Locked Down). `sbx policy init` only works before a preset is set. To change
the preset after that, reset local policy.
@y
Available values are `allow-all` (Open), `balanced` (Balanced), and `deny-all`
(Locked Down). `sbx policy init` only works before a preset is set. To change
the preset after that, reset local policy.
@z

@x
### Reset local policy
@y
### Reset local policy
@z

@x
To remove all custom rules and start fresh with a new preset, use
`sbx policy reset`:
@y
To remove all custom rules and start fresh with a new preset, use
`sbx policy reset`:
@z

@x
```console
$ sbx policy reset
```
@y
```console
$ sbx policy reset
```
@z

@x
This deletes the local policy store, restarts the daemon, and prompts you to
choose a new preset. Running sandboxes stop when the daemon shuts down. Pass
`--force` to skip the confirmation prompt:
@y
This deletes the local policy store, restarts the daemon, and prompts you to
choose a new preset. Running sandboxes stop when the daemon shuts down. Pass
`--force` to skip the confirmation prompt:
@z

@x
```console
$ sbx policy reset --force
```
@y
```console
$ sbx policy reset --force
```
@z

@x
> [!WARNING]
> `sbx policy reset` deletes all locally configured policy rules, including any
> destinations you approved. Those destinations are requested again the next
> time a sandbox reaches them. To pick up organization policy changes without
> deleting local rules, use `sbx policy refresh` instead. For more details, see
> [Organization policy changes aren't taking effect](../troubleshooting.md#organization-policy-changes-arent-taking-effect).
@y
> [!WARNING]
> `sbx policy reset` deletes all locally configured policy rules, including any
> destinations you approved. Those destinations are requested again the next
> time a sandbox reaches them. To pick up organization policy changes without
> deleting local rules, use `sbx policy refresh` instead. For more details, see
> [Organization policy changes aren't taking effect](../troubleshooting.md#organization-policy-changes-arent-taking-effect).
@z
