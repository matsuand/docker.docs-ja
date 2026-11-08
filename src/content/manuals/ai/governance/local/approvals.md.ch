%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Respond to approval requests
linkTitle: Respond to approvals
@y
title: Respond to approval requests
linkTitle: Respond to approvals
@z

@x
description: Approve or dismiss sandbox network requests that need your confirmation, under local policy or an organization policy.
keywords: docker sandboxes, approval required, approve network access, sbx policy approval, local policy, organization policy
@y
description: Approve or dismiss sandbox network requests that need your confirmation, under local policy or an organization policy.
keywords: docker sandboxes, approval required, approve network access, sbx policy approval, local policy, organization policy
@z

@x
When a sandbox tries to reach a destination that needs your approval, the
request is blocked and `sbx` records an approval request. Approve it to allow
the destination for that sandbox, or dismiss it to keep the destination
blocked. You respond the same way whether local policy or an organization
policy asks for the approval.
@y
When a sandbox tries to reach a destination that needs your approval, the
request is blocked and `sbx` records an approval request. Approve it to allow
the destination for that sandbox, or dismiss it to keep the destination
blocked. You respond the same way whether local policy or an organization
policy asks for the approval.
@z

@x
A request needs approval in these cases:
@y
A request needs approval in these cases:
@z

@x
- Local policy: under the Balanced or Locked Down
  [preset](_index.md#start-from-a-preset), a sandbox reaches a destination that
  no rule allows or denies. A request never asks for approval under the Open
  preset, because Open allows every destination. This applies only when no
  organization policy is enforced for you.
- Organization policy: a network access policy allows the destination
  but requires approval first. For more details, see
  [Approval-required access](../organization/policies/network.md#approval-required-access).
@y
- Local policy: under the Balanced or Locked Down
  [preset](_index.md#start-from-a-preset), a sandbox reaches a destination that
  no rule allows or denies. A request never asks for approval under the Open
  preset, because Open allows every destination. This applies only when no
  organization policy is enforced for you.
- Organization policy: a network access policy allows the destination
  but requires approval first. For more details, see
  [Approval-required access](../organization/policies/network.md#approval-required-access).
@z

@x
A request that a deny rule matches is blocked without
asking.
@y
A request that a deny rule matches is blocked without
asking.
@z

@x
## List pending approval requests
@y
## List pending approval requests
@z

@x
When a request needs approval, the sandbox receives a message naming the
destination:
@y
When a request needs approval, the sandbox receives a message naming the
destination:
@z

@x
```plaintext
Approval required for api.example.com.
@y
```plaintext
Approval required for api.example.com.
@z

@x
Review and respond with:
  sbx policy approval ls
```
@y
Review and respond with:
  sbx policy approval ls
```
@z

@x
List the destinations waiting for a response:
@y
List the destinations waiting for a response:
@z

@x
```console
$ sbx policy approval ls
APPROVAL                                              SANDBOX      TITLE                 DETAIL                                                                              OPTIONS
network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY   my-sandbox   api.example.com:443   Protocol: TCP Resource type: domain approval required by policy "default network"   allow (Allow), dismiss (Dismiss)
```
@y
```console
$ sbx policy approval ls
APPROVAL                                              SANDBOX      TITLE                 DETAIL                                                                              OPTIONS
network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY   my-sandbox   api.example.com:443   Protocol: TCP Resource type: domain approval required by policy "default network"   allow (Allow), dismiss (Dismiss)
```
@z

@x
Each entry names the destination, the sandbox that asked for it, and why it
needs approval. When an organization policy is enforced for you, that reason
names the policy, as shown. Under local policy, the reason is that no matching allow rule covers the
destination. A request that an HTTP rule matches also shows the method and
path, such as `GET api.example.com:443/v1/data`.
@y
Each entry names the destination, the sandbox that asked for it, and why it
needs approval. When an organization policy is enforced for you, that reason
names the policy, as shown. Under local policy, the reason is that no matching allow rule covers the
destination. A request that an HTTP rule matches also shows the method and
path, such as `GET api.example.com:443/v1/data`.
@z

@x
Repeated attempts collapse into a single entry, so a sandbox retrying in a loop
leaves one request to answer, not a queue of duplicates.
@y
Repeated attempts collapse into a single entry, so a sandbox retrying in a loop
leaves one request to answer, not a queue of duplicates.
@z

@x
To see the details of a single entry, pass its ID to
`sbx policy approval inspect`:
@y
To see the details of a single entry, pass its ID to
`sbx policy approval inspect`:
@z

@x
```console
$ sbx policy approval inspect network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY
```
@y
```console
$ sbx policy approval inspect network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY
```
@z

@x
## Approve or dismiss a request
@y
## Approve or dismiss a request
@z

@x
Respond by selecting one of the options the entry offers:
@y
Respond by selecting one of the options the entry offers:
@z

@x
```console
$ sbx policy approval respond network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY --option allow
```
@y
```console
$ sbx policy approval respond network:cWtN-4xUrNjxh4ouezcstgjrky6Rg57QfeRe3WEkyyY --option allow
```
@z

@x
Choosing `allow` grants access to that destination. Choosing `dismiss` leaves
it blocked, and the destination is requested again the next time the sandbox
tries to reach it.
@y
Choosing `allow` grants access to that destination. Choosing `dismiss` leaves
it blocked, and the destination is requested again the next time the sandbox
tries to reach it.
@z

@x
The request that triggered the approval doesn't wait for your answer. It's
denied, and approving the destination affects later requests. Agents that
retry a failed request pick up the new access on their next attempt. For other
tools, run the operation again.
@y
The request that triggered the approval doesn't wait for your answer. It's
denied, and approving the destination affects later requests. Agents that
retry a failed request pick up the new access on their next attempt. For other
tools, run the operation again.
@z

@x
Approving records a rule that allows the destination the sandbox actually asked
for, scoped to the sandbox that asked:
@y
Approving records a rule that allows the destination the sandbox actually asked
for, scoped to the sandbox that asked:
@z

@x
- The rule covers one destination, not a pattern. A policy that allows
  `*.example.com` with approval asks about `api.example.com` and
  `cdn.example.com` separately.
- A destination includes its port, so `api.example.com:443` and
  `api.example.com:8443` are approved separately.
- Another sandbox reaching the same destination asks again.
@y
- The rule covers one destination, not a pattern. A policy that allows
  `*.example.com` with approval asks about `api.example.com` and
  `cdn.example.com` separately.
- A destination includes its port, so `api.example.com:443` and
  `api.example.com:8443` are approved separately.
- Another sandbox reaching the same destination asks again.
@z

@x
When an [HTTP rule](../reference/network-rules.md#http-method-and-path) in the
policy matches the request, approving covers the method and exact path the
sandbox requested rather than the whole destination. `GET /v1/data` and
`POST /v1/data` on the same host are approved separately. A request whose
method or path can't be recorded as a rule, such as a path with
percent-encoding, is blocked without an entry to respond to.
@y
When an [HTTP rule](../reference/network-rules.md#http-method-and-path) in the
policy matches the request, approving covers the method and exact path the
sandbox requested rather than the whole destination. `GET /v1/data` and
`POST /v1/data` on the same host are approved separately. A request whose
method or path can't be recorded as a rule, such as a path with
percent-encoding, is blocked without an entry to respond to.
@z

@x
## Review and remove approved destinations
@y
## Review and remove approved destinations
@z

@x
Approved destinations stay allowed until you remove the rule. List them:
@y
Approved destinations stay allowed until you remove the rule. List them:
@z

@x
```console
$ sbx policy ls --wide --created-via approval
```
@y
```console
$ sbx policy ls --wide --created-via approval
```
@z

@x
Remove one by its rule ID, the same way as any other local rule:
@y
Remove one by its rule ID, the same way as any other local rule:
@z

@x
```console
$ sbx policy rm network --sandbox my-sandbox --id <RULE_ID>
```
@y
```console
$ sbx policy rm network --sandbox my-sandbox --id <RULE_ID>
```
@z

@x
For more details, see [Remove a rule](network-rules.md#remove-a-rule).
@y
For more details, see [Remove a rule](network-rules.md#remove-a-rule).
@z
