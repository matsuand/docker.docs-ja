%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Monitoring policies
@y
title: Monitoring policies
@z

@x
description: Inspect active policy rules and monitor sandbox network traffic with sbx policy ls and sbx policy log.
keywords: docker sandboxes, policy monitoring, sbx policy ls, sbx policy log, network traffic, policy debugging
@y
description: Inspect active policy rules and monitor sandbox network traffic with sbx policy ls and sbx policy log.
keywords: docker sandboxes, policy monitoring, sbx policy ls, sbx policy log, network traffic, policy debugging
@z

@x
`sbx policy ls` and `sbx policy log` give you a combined view of all active
policy rules and sandbox network activity, regardless of whether those rules
come from local configuration or organization governance. They're useful both
for verifying rules you've written and for debugging why a request is being
blocked or allowed.
@y
`sbx policy ls` and `sbx policy log` give you a combined view of all active
policy rules and sandbox network activity, regardless of whether those rules
come from local configuration or organization governance. They're useful both
for verifying rules you've written and for debugging why a request is being
blocked or allowed.
@z

@x
## Listing rules
@y
## Listing rules
@z

@x
Use `sbx policy ls` to see all active policies and their current status:
@y
Use `sbx policy ls` to see all active policies and their current status:
@z

@x
```console
$ sbx policy ls
POLICY                                 SOURCE   APPLIES TO          SUMMARY
local-policy                           local    all                 network: 42 allow, 1 deny; filesystem read: 1 allow; filesystem write: 1 allow
1b2633ea-e604-48bb-a5e6-3ac86ba383fe   kit      sandbox:my-sandbox  network: 3 allow
```
@y
```console
$ sbx policy ls
POLICY                                 SOURCE   APPLIES TO          SUMMARY
local-policy                           local    all                 network: 42 allow, 1 deny; filesystem read: 1 allow; filesystem write: 1 allow
1b2633ea-e604-48bb-a5e6-3ac86ba383fe   kit      sandbox:my-sandbox  network: 3 allow
```
@z

@x
The columns are:
@y
The columns are:
@z

@x
- `POLICY`: the policy name.
- `SOURCE`: where the policy came from. `local` means your local configuration
  — a preset or rules you added with `sbx policy`. `kit` means a
  [kit](../../customize/kits.md#control-network-access). `org` means your
  organization.
- `APPLIES TO`: which sandboxes the policy applies to. `all` means the policy
  is global. `sandbox:<name>` scopes it to a single sandbox; a profile name
  scopes it to sandboxes using that profile.
- `SUMMARY`: a count of rule entries by type and decision, for example
  `network: 5 allow, 1 deny`. A rule that names several destinations
  contributes one entry per destination. When the listing includes rules that
  match an HTTP method and path, the network count labels each part `(L4)` or
  `(L7)`. See [HTTP rules](#http-rules).
@y
- `POLICY`: the policy name.
- `SOURCE`: where the policy came from. `local` means your local configuration
  — a preset or rules you added with `sbx policy`. `kit` means a
  [kit](../../customize/kits.md#control-network-access). `org` means your
  organization.
- `APPLIES TO`: which sandboxes the policy applies to. `all` means the policy
  is global. `sandbox:<name>` scopes it to a single sandbox; a profile name
  scopes it to sandboxes using that profile.
- `SUMMARY`: a count of rule entries by type and decision, for example
  `network: 5 allow, 1 deny`. A rule that names several destinations
  contributes one entry per destination. When the listing includes rules that
  match an HTTP method and path, the network count labels each part `(L4)` or
  `(L7)`. See [HTTP rules](#http-rules).
@z

@x
To see full rule-level detail including rule IDs and resources, pass `--wide`.
To inspect a single policy or rule, use `sbx policy inspect`:
@y
To see full rule-level detail including rule IDs and resources, pass `--wide`.
To inspect a single policy or rule, use `sbx policy inspect`:
@z

@x
```console
$ sbx policy inspect Balanced
```
@y
```console
$ sbx policy inspect Balanced
```
@z

@x
Use `--source` to filter by origin (`local`, `org`, or `kit`) and `--decision`
to filter by outcome (`allow` or `deny`).
@y
Use `--source` to filter by origin (`local`, `org`, or `kit`) and `--decision`
to filter by outcome (`allow` or `deny`).
@z

@x
A `STATUS` column also appears when you pass `--include-inactive`; see
[Showing inactive rules](#showing-inactive-rules).
@y
A `STATUS` column also appears when you pass `--include-inactive`; see
[Showing inactive rules](#showing-inactive-rules).
@z

@x
When organization governance is active, the output starts with a summary line
showing which organization manages the policy, the sync state, and how many
inactive rules are hidden:
@y
When organization governance is active, the output starts with a summary line
showing which organization manages the policy, the sync state, and how many
inactive rules are hidden:
@z

@x
```console
$ sbx policy ls
Governance: Managed by my-org | Sync: OK, last synced 08:21:01 | Hidden: 9 inactive rules. Show with: sbx policy ls --include-inactive
@y
```console
$ sbx policy ls
Governance: Managed by my-org | Sync: OK, last synced 08:21:01 | Hidden: 9 inactive rules. Show with: sbx policy ls --include-inactive
@z

@x
POLICY               SOURCE   APPLIES TO   SUMMARY
default filesystem   org      all          filesystem read: 2 allow; filesystem write: 7 allow, 2 deny
default network      org      all          network: 38 allow, 4 deny
```
@y
POLICY               SOURCE   APPLIES TO   SUMMARY
default filesystem   org      all          filesystem read: 2 allow; filesystem write: 7 allow, 2 deny
default network      org      all          network: 38 allow, 4 deny
```
@z

@x
`Governance` shows which organization manages the policy, and `Sync` confirms
the daemon has pulled the latest rules. If the sync state shows an error or a
stale timestamp, the daemon may not have the most recent org policy. Run
`sbx policy reset` to force a fresh pull. `Hidden` reports how many inactive
rules are suppressed and how to reveal them.
@y
`Governance` shows which organization manages the policy, and `Sync` confirms
the daemon has pulled the latest rules. If the sync state shows an error or a
stale timestamp, the daemon may not have the most recent org policy. Run
`sbx policy reset` to force a fresh pull. `Hidden` reports how many inactive
rules are suppressed and how to reveal them.
@z

@x
### Showing inactive rules
@y
### Showing inactive rules
@z

@x
When organization governance is active, local and kit-defined allow rules are
not evaluated, so `sbx policy ls` hides them by default. To list them too — for
example, to confirm which allow rules the organization policy overrides — pass
`--include-inactive`. This adds a `STATUS` column:
@y
When organization governance is active, local and kit-defined allow rules are
not evaluated, so `sbx policy ls` hides them by default. To list them too — for
example, to confirm which allow rules the organization policy overrides — pass
`--include-inactive`. This adds a `STATUS` column:
@z

@x
```console
$ sbx policy ls --include-inactive
Governance: Managed by my-org | Sync: OK, last synced 08:41:06
@y
```console
$ sbx policy ls --include-inactive
Governance: Managed by my-org | Sync: OK, last synced 08:41:06
@z

@x
POLICY                       SOURCE   APPLIES TO   SUMMARY                                                    STATUS
default filesystem           org      all          filesystem read: 2 allow; filesystem write: 7 allow, 2 deny   active
default network              org      all          network: 38 allow, 4 deny                                   active
default-fs-read-allow-all    local    all          filesystem read: 1 allow                                    inactive
default-fs-write-allow-all   local    all          filesystem write: 1 allow                                   inactive
```
@y
POLICY                       SOURCE   APPLIES TO   SUMMARY                                                    STATUS
default filesystem           org      all          filesystem read: 2 allow; filesystem write: 7 allow, 2 deny   active
default network              org      all          network: 38 allow, 4 deny                                   active
default-fs-read-allow-all    local    all          filesystem read: 1 allow                                    inactive
default-fs-write-allow-all   local    all          filesystem write: 1 allow                                   inactive
```
@z

@x
Inactive policies show `inactive` in the `STATUS` column. They have no effect
while organization governance is active. Local and kit-defined deny rules stay
active and aren't hidden, because a deny still applies on top of the
organization policy. See [Precedence](../concepts.md#precedence).
@y
Inactive policies show `inactive` in the `STATUS` column. They have no effect
while organization governance is active. Local and kit-defined deny rules stay
active and aren't hidden, because a deny still applies on top of the
organization policy. See [Precedence](../concepts.md#precedence).
@z

@x
Use `--type network`, `--type filesystem`, or `--type http` to show only
policies of that type. Without a sandbox argument, `sbx policy ls` shows every
policy across all sandboxes. Pass a sandbox name to filter to global policies
and those scoped to that sandbox:
@y
Use `--type network`, `--type filesystem`, or `--type http` to show only
policies of that type. Without a sandbox argument, `sbx policy ls` shows every
policy across all sandboxes. Pass a sandbox name to filter to global policies
and those scoped to that sandbox:
@z

@x
```console
$ sbx policy ls my-sandbox
```
@y
```console
$ sbx policy ls my-sandbox
```
@z

@x
### Filesystem rules
@y
### Filesystem rules
@z

@x
`sbx policy ls` lists filesystem policies alongside network policies. Filesystem
rules control which host paths a sandbox can mount as a workspace. Pass
`--type filesystem` to show only them:
@y
`sbx policy ls` lists filesystem policies alongside network policies. Filesystem
rules control which host paths a sandbox can mount as a workspace. Pass
`--type filesystem` to show only them:
@z

@x
```console
$ sbx policy ls --type filesystem
POLICY         SOURCE   APPLIES TO   SUMMARY
local-policy   local    all          filesystem read: 1 allow; filesystem write: 1 allow
```
@y
```console
$ sbx policy ls --type filesystem
POLICY         SOURCE   APPLIES TO   SUMMARY
local-policy   local    all          filesystem read: 1 allow; filesystem write: 1 allow
```
@z

@x
A writable workspace mount must be allowed by both a `filesystem:read` and a
`filesystem:write` rule; a read-only mount needs only `filesystem:read`. The
default local policy allows read and write access to all paths, shown as the
two `default-fs-*` rules above. For the rule syntax and path patterns, see
[Policy concepts](../concepts.md#filesystem-rules).
@y
A writable workspace mount must be allowed by both a `filesystem:read` and a
`filesystem:write` rule; a read-only mount needs only `filesystem:read`. The
default local policy allows read and write access to all paths, shown as the
two `default-fs-*` rules above. For the rule syntax and path patterns, see
[Policy concepts](../concepts.md#filesystem-rules).
@z

@x
### HTTP rules
@y
### HTTP rules
@z

@x
Rules that match an HTTP method and path are listed as type `http`. Pass
`--wide` to see the `METHOD` and `PATH` columns alongside network rules:
@y
Rules that match an HTTP method and path are listed as type `http`. Pass
`--wide` to see the `METHOD` and `PATH` columns alongside network rules:
@z

% snip command...

@x
Rules that match a whole destination show `-` in both columns. To list only
HTTP rules, pass `--type http`.
@y
Rules that match a whole destination show `-` in both columns. To list only
HTTP rules, pass `--type http`.
@z

@x
HTTP rules are counted as network rules in the `SUMMARY` column, with each part
labeled by the network layer it matches on. `L4` counts entries that match a
whole destination, and `L7` counts those that also match an HTTP method and
path:
@y
HTTP rules are counted as network rules in the `SUMMARY` column, with each part
labeled by the network layer it matches on. `L4` counts entries that match a
whole destination, and `L7` counts those that also match an HTTP method and
path:
@z

% snip command...

@x
The labels appear when the current listing includes at least one HTTP rule.
Because filters and hidden inactive rules change what the listing contains, a
filtered listing with no HTTP rules shows an unlabeled count, such as
`network: 42 allow`.
@y
The labels appear when the current listing includes at least one HTTP rule.
Because filters and hidden inactive rules change what the listing contains, a
filtered listing with no HTTP rules shows an unlabeled count, such as
`network: 42 allow`.
@z

@x
For the rule syntax, see
[HTTP method and path](../concepts.md#http-method-and-path).
@y
For the rule syntax, see
[HTTP method and path](../concepts.md#http-method-and-path).
@z

@x
## Monitoring traffic
@y
## Monitoring traffic
@z

@x
Use `sbx policy log` to see which hosts your sandboxes have contacted and
which rules matched:
@y
Use `sbx policy log` to see which hosts your sandboxes have contacted and
which rules matched:
@z

@x
```console
$ sbx policy log
Blocked requests:
SANDBOX      TYPE     HOST                   PROXY        RULE            REASON         LAST SEEN        COUNT
my-sandbox   network  blocked.example.com    transparent  domain-blocked  default-deny   10:15:25 29-Jan  1
@y
```console
$ sbx policy log
Blocked requests:
SANDBOX      TYPE     HOST                   PROXY        RULE            REASON         LAST SEEN        COUNT
my-sandbox   network  blocked.example.com    transparent  domain-blocked  default-deny   10:15:25 29-Jan  1
@z

@x
Allowed requests:
SANDBOX      TYPE     HOST                   PROXY          RULE             REASON   LAST SEEN        COUNT
my-sandbox   network  api.anthropic.com      forward        domain-allowed            10:15:23 29-Jan  42
my-sandbox   network  registry.npmjs.org     forward-bypass domain-allowed            10:15:20 29-Jan  18
my-sandbox   network  app.example.com        browser-open                             10:15:10 29-Jan  1
```
@y
Allowed requests:
SANDBOX      TYPE     HOST                   PROXY          RULE             REASON   LAST SEEN        COUNT
my-sandbox   network  api.anthropic.com      forward        domain-allowed            10:15:23 29-Jan  42
my-sandbox   network  registry.npmjs.org     forward-bypass domain-allowed            10:15:20 29-Jan  18
my-sandbox   network  app.example.com        browser-open                             10:15:10 29-Jan  1
```
@z

@x
The `PROXY` column shows how the request left the sandbox:
@y
The `PROXY` column shows how the request left the sandbox:
@z

@x
| Value            | Description                                                                                                    |
| ---------------- | -------------------------------------------------------------------------------------------------------------- |
| `forward`        | Routed through the forward proxy. Supports [credential injection](../../configuration/credentials.md).              |
| `forward-bypass` | Routed through the forward proxy without credential injection.                                                 |
| `transparent`    | Intercepted by the transparent proxy. Policy is enforced but credential injection is not available.            |
| `network`        | Non-HTTP traffic (raw TCP, UDP, ICMP). TCP can be allowed with a policy rule. UDP and ICMP are always blocked. |
| `browser-open`   | A sandbox process requested opening a URL in the host browser. Policy is enforced before opening the URL.      |
@y
| Value            | Description                                                                                                    |
| ---------------- | -------------------------------------------------------------------------------------------------------------- |
| `forward`        | Routed through the forward proxy. Supports [credential injection](../../configuration/credentials.md).              |
| `forward-bypass` | Routed through the forward proxy without credential injection.                                                 |
| `transparent`    | Intercepted by the transparent proxy. Policy is enforced but credential injection is not available.            |
| `network`        | Non-HTTP traffic (raw TCP, UDP, ICMP). TCP can be allowed with a policy rule. UDP and ICMP are always blocked. |
| `browser-open`   | A sandbox process requested opening a URL in the host browser. Policy is enforced before opening the URL.      |
@z

@x
The `RULE` column identifies the policy rule that matched the request. The
`REASON` column includes extra context when the daemon records one.
@y
The `RULE` column identifies the policy rule that matched the request. The
`REASON` column includes extra context when the daemon records one.
@z

@x
Filter by sandbox name by passing it as an argument:
@y
Filter by sandbox name by passing it as an argument:
@z

@x
```console
$ sbx policy log my-sandbox
```
@y
```console
$ sbx policy log my-sandbox
```
@z

@x
Use `--limit N` to show only the last `N` entries, `--json` for
machine-readable output, or `--type network` to filter by policy type.
`sbx policy log` records network traffic only; filesystem mount decisions
aren't available in the log yet.
@y
Use `--limit N` to show only the last `N` entries, `--json` for
machine-readable output, or `--type network` to filter by policy type.
`sbx policy log` records network traffic only; filesystem mount decisions
aren't available in the log yet.
@z
