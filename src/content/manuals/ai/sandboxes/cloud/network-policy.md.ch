%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Manage cloud network policy
linkTitle: Network policy
description: Control outbound connections from Docker cloud sandboxes with account-level and sandbox-level allow and deny network rules.
keywords: docker sandboxes, cloud network policy, sbx cloud, allow network, deny network
@y
title: Manage cloud network policy
linkTitle: Network policy
description: Control outbound connections from Docker cloud sandboxes with account-level and sandbox-level allow and deny network rules.
keywords: docker sandboxes, cloud network policy, sbx cloud, allow network, deny network
@z

@x
Cloud network policy controls outbound connections from cloud sandboxes. It is
a separate, network-only policy store with Docker account and individual
sandbox scopes.
@y
Cloud network policy controls outbound connections from cloud sandboxes. It is
a separate, network-only policy store with Docker account and individual
sandbox scopes.
@z

@x
> [!IMPORTANT]
>
> Local policy configuration isn't copied to cloud sandboxes. Configure cloud
> rules with `sbx --cloud policy` and verify network access using connection
> checks and policy logs.
@y
> [!IMPORTANT]
>
> Local policy configuration isn't copied to cloud sandboxes. Configure cloud
> rules with `sbx --cloud policy` and verify network access using connection
> checks and policy logs.
@z

@x
## Understand policy scope
@y
## Understand policy scope
@z

@x
The cloud CLI supports account and sandbox policy scopes. Your account policy
supplies the default for cloud sandboxes you create in the Docker account. A
sandbox policy adds rules for one cloud sandbox. Matching deny rules take
precedence over allow rules across the applicable policies.
@y
The cloud CLI supports account and sandbox policy scopes. Your account policy
supplies the default for cloud sandboxes you create in the Docker account. A
sandbox policy adds rules for one cloud sandbox. Matching deny rules take
precedence over allow rules across the applicable policies.
@z

@x
Cloud creation uses cloud account policy, network rules passed to the command,
and network access declared by the agent or kit. Both `sbx --cloud create` and
`sbx --cloud run` leave local network and organization policies on the host.
Moving a local sandbox to the cloud also uses cloud policy.
@y
Cloud creation uses cloud account policy, network rules passed to the command,
and network access declared by the agent or kit. Both `sbx --cloud create` and
`sbx --cloud run` leave local network and organization policies on the host.
Moving a local sandbox to the cloud also uses cloud policy.
@z

@x
Define the intended policy in the cloud store. After creation, inspect the
configured rules and [verify connection decisions](#inspect-network-policy).
@y
Define the intended policy in the cloud store. After creation, inspect the
configured rules and [verify connection decisions](#inspect-network-policy).
@z

@x
## Initialize account policy
@y
## Initialize account policy
@z

@x
Set the account policy to `allow-all`, `balanced`, or `deny-all`:
@y
Set the account policy to `allow-all`, `balanced`, or `deny-all`:
@z

@x
```console
$ sbx --cloud policy init deny-all
```
@y
```console
$ sbx --cloud policy init deny-all
```
@z

@x
The default applies to your cloud sandboxes in the Docker account. You can add
rules after initialization or specify initial rules when creating a sandbox.
A deny-all default still permits destinations allowed by applicable sandbox
or agent-kit rules.
@y
The default applies to your cloud sandboxes in the Docker account. You can add
rules after initialization or specify initial rules when creating a sandbox.
A deny-all default still permits destinations allowed by applicable sandbox
or agent-kit rules.
@z

@x
The `balanced` preset sets deny-all as the default and adds allow rules for
common development services. To set a default for one sandbox, use
`sbx --cloud policy init deny-all --sandbox cloud-project`.
@y
The `balanced` preset sets deny-all as the default and adds allow rules for
common development services. To set a default for one sandbox, use
`sbx --cloud policy init deny-all --sandbox cloud-project`.
@z

@x
You can run `init` again to change the default. Existing allow and deny rules
remain in place. Use `reset` to remove account rules before choosing another
preset.
@y
You can run `init` again to change the default. Existing allow and deny rules
remain in place. Use `reset` to remove account rules before choosing another
preset.
@z

@x
## Add network rules
@y
## Add network rules
@z

@x
Add an account-level exception:
@y
Add an account-level exception:
@z

@x
```console
$ sbx --cloud policy allow network api.github.com:443
```
@y
```console
$ sbx --cloud policy allow network api.github.com:443
```
@z

@x
Scope a rule to one sandbox:
@y
Scope a rule to one sandbox:
@z

@x
```console
$ sbx --cloud policy allow network api.anthropic.com:443 \
    --sandbox cloud-project
```
@y
```console
$ sbx --cloud policy allow network api.anthropic.com:443 \
    --sandbox cloud-project
```
@z

@x
Deny rules take precedence when the same destination matches both an allow
rule and a deny rule.
@y
Deny rules take precedence when the same destination matches both an allow
rule and a deny rule.
@z

@x
Cloud rules match network destinations. HTTP method and path restrictions,
`--protocol`, and local governance profiles aren't supported.
@y
Cloud rules match network destinations. HTTP method and path restrictions,
`--protocol`, and local governance profiles aren't supported.
@z

@x
You can also add initial rules while creating a sandbox:
@y
You can also add initial rules while creating a sandbox:
@z

@x
```console
$ sbx --cloud create --name cloud-project \
    --allow-network api.github.com:443 \
    --deny-network example.com claude
```
@y
```console
$ sbx --cloud create --name cloud-project \
    --allow-network api.github.com:443 \
    --deny-network example.com claude
```
@z

@x
## Inspect network policy
@y
## Inspect network policy
@z

@x
Inspect your account policy or a sandbox's configured policy:
@y
Inspect your account policy or a sandbox's configured policy:
@z

@x
```console
$ sbx --cloud policy ls
$ sbx --cloud policy ls cloud-project
```
@y
```console
$ sbx --cloud policy ls
$ sbx --cloud policy ls cloud-project
```
@z

@x
The sandbox view shows its policy document, or your account default when the
sandbox has no policy document. It does not show the complete combination of
applicable rules.
@y
The sandbox view shows its policy document, or your account default when the
sandbox has no policy document. It does not show the complete combination of
applicable rules.
@z

@x
To verify enforcement, attempt the connection from the sandbox, then review
the connection decisions:
@y
To verify enforcement, attempt the connection from the sandbox, then review
the connection decisions:
@z

@x
```console
$ sbx --cloud exec cloud-project curl -I https://api.github.com
$ sbx --cloud policy log cloud-project
```
@y
```console
$ sbx --cloud exec cloud-project curl -I https://api.github.com
$ sbx --cloud policy log cloud-project
```
@z

@x
These records describe cloud network policy decisions. They aren't Docker AI
Governance organization audit logs.
@y
These records describe cloud network policy decisions. They aren't Docker AI
Governance organization audit logs.
@z

@x
## Remove network rules
@y
## Remove network rules
@z

@x
Remove a rule by its pattern, from whichever allow or deny list contains it:
@y
Remove a rule by its pattern, from whichever allow or deny list contains it:
@z

@x
```console
$ sbx --cloud policy rm network --resource api.github.com:443
$ sbx --cloud policy rm network --sandbox cloud-project --resource api.anthropic.com:443
```
@y
```console
$ sbx --cloud policy rm network --resource api.github.com:443
$ sbx --cloud policy rm network --sandbox cloud-project --resource api.anthropic.com:443
```
@z

@x
Remove the custom account policy and return to the platform default:
@y
Remove the custom account policy and return to the platform default:
@z

@x
```console
$ sbx --cloud policy reset
```
@y
```console
$ sbx --cloud policy reset
```
@z

@x
The command asks for confirmation and prints the default stored by the server
after the reset. Use `--force` in scripts. The local daemon is unaffected.
Sandbox-specific policies remain in place and can still grant access. Inspect
those policies separately.
@y
The command asks for confirmation and prints the default stored by the server
after the reset. Use `--force` in scripts. The local daemon is unaffected.
Sandbox-specific policies remain in place and can still grant access. Inspect
those policies separately.
@z
