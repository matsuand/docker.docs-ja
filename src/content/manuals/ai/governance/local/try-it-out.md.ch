%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Try out local policy
linkTitle: Try it out
@y
title: Try out local policy
linkTitle: Try it out
@z

@x
description: Follow an example that allows and blocks network destinations and HTTP methods for one sandbox with local policy.
keywords: docker sandboxes, local policy, try it out, tutorial, sbx policy check, sbx policy ls, sbx policy allow, sbx policy deny, sbx policy log, http rules
@y
description: Follow an example that allows and blocks network destinations and HTTP methods for one sandbox with local policy.
keywords: docker sandboxes, local policy, try it out, tutorial, sbx policy check, sbx policy ls, sbx policy allow, sbx policy deny, sbx policy log, http rules
@z

@x
In this example, you create a sandbox, allow and block destinations for it,
block an HTTP method, and review what happened. It uses the `shell` agent, so
you don't need to sign in to an agent.
@y
In this example, you create a sandbox, allow and block destinations for it,
block an HTTP method, and review what happened. It uses the `shell` agent, so
you don't need to sign in to an agent.
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
[Install Docker Sandboxes](/manuals/ai/sandboxes/install.md).
@y
[Install Docker Sandboxes](manuals/ai/sandboxes/install.md).
@z

@x
If your organization enforces a policy for you, some steps behave differently.
For more details, see
[How organization policy relates to local and kit rules](../organization/policies/_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@y
If your organization enforces a policy for you, some steps behave differently.
For more details, see
[How organization policy relates to local and kit rules](../organization/policies/_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@z

@x
## Step 1: Create a sandbox
@y
## Step 1: Create a sandbox
@z

@x
Create a sandbox named `policy-demo` that uses the current directory as its
workspace:
@y
Create a sandbox named `policy-demo` that uses the current directory as its
workspace:
@z

@x
```console
$ sbx create --name policy-demo shell .
```
@y
```console
$ sbx create --name policy-demo shell .
```
@z

@x
If you haven't chosen a network [preset](_index.md#start-from-a-preset) yet,
`sbx` asks you to choose one. This example works with any preset.
@y
If you haven't chosen a network [preset](_index.md#start-from-a-preset) yet,
`sbx` asks you to choose one. This example works with any preset.
@z

@x
## Step 2: Allow a destination for this sandbox
@y
## Step 2: Allow a destination for this sandbox
@z

@x
Add an allow rule for `example.com` that applies only to `policy-demo`:
@y
Add an allow rule for `example.com` that applies only to `policy-demo`:
@z

@x
```console
$ sbx policy allow network --sandbox policy-demo example.com
```
@y
```console
$ sbx policy allow network --sandbox policy-demo example.com
```
@z

@x
The rule doesn't affect your other sandboxes. List the rules you've added that
apply to the sandbox:
@y
The rule doesn't affect your other sandboxes. List the rules you've added that
apply to the sandbox:
@z

@x
```console
$ sbx policy ls policy-demo --wide --created-via added
```
@y
```console
$ sbx policy ls policy-demo --wide --created-via added
```
@z

@x
The listing includes the `example.com` rule, with `sandbox:policy-demo` in the
`APPLIES TO` column. Rules from your preset aren't listed, because
`--created-via added` shows only rules you added. For more details, see
[Inspect policy status and rules](inspect.md).
@y
The listing includes the `example.com` rule, with `sandbox:policy-demo` in the
`APPLIES TO` column. Rules from your preset aren't listed, because
`--created-via added` shows only rules you added. For more details, see
[Inspect policy status and rules](inspect.md).
@z

@x
Reach the destination from inside the sandbox:
@y
Reach the destination from inside the sandbox:
@z

@x
```console
$ sbx exec policy-demo -- curl -sI https://example.com
```
@y
```console
$ sbx exec policy-demo -- curl -sI https://example.com
```
@z

@x
For more details, see [Manage local network rules](network-rules.md).
@y
For more details, see [Manage local network rules](network-rules.md).
@z

@x
## Step 3: Block a destination for this sandbox
@y
## Step 3: Block a destination for this sandbox
@z

@x
Add a deny rule for `registry.npmjs.org` that applies only to `policy-demo`:
@y
Add a deny rule for `registry.npmjs.org` that applies only to `policy-demo`:
@z

@x
```console
$ sbx policy deny network --sandbox policy-demo registry.npmjs.org
```
@y
```console
$ sbx policy deny network --sandbox policy-demo registry.npmjs.org
```
@z

@x
Check the destination:
@y
Check the destination:
@z

@x
```console
$ sbx policy check network --sandbox policy-demo registry.npmjs.org
```
@y
```console
$ sbx policy check network --sandbox policy-demo registry.npmjs.org
```
@z

@x
The check reports `Denied`. A deny rule takes precedence over allow rules,
including the ones your preset and kits add.
@y
The check reports `Denied`. A deny rule takes precedence over allow rules,
including the ones your preset and kits add.
@z

@x
## Step 4: Block an HTTP method for this sandbox
@y
## Step 4: Block an HTTP method for this sandbox
@z

@x
An HTTP rule matches a method and path on a host, rather than the whole host.
Use HTTP rules to allow or block specific API requests, such as letting an
agent read from an API without letting it write to it. Block `POST` requests to
`example.com` for `policy-demo`:
@y
An HTTP rule matches a method and path on a host, rather than the whole host.
Use HTTP rules to allow or block specific API requests, such as letting an
agent read from an API without letting it write to it. Block `POST` requests to
`example.com` for `policy-demo`:
@z

@x
```console
$ sbx policy deny network --sandbox policy-demo example.com --method POST
```
@y
```console
$ sbx policy deny network --sandbox policy-demo example.com --method POST
```
@z

@x
Send a `POST` request from inside the sandbox:
@y
Send a `POST` request from inside the sandbox:
@z

@x
```console
$ sbx exec policy-demo -- curl -s -X POST https://example.com
```
@y
```console
$ sbx exec policy-demo -- curl -s -X POST https://example.com
```
@z

@x
The response starts with `Blocked by local rule`. Other methods are still
allowed. Send a `GET` request to the same destination:
@y
The response starts with `Blocked by local rule`. Other methods are still
allowed. Send a `GET` request to the same destination:
@z

@x
```console
$ sbx exec policy-demo -- curl -s https://example.com
```
@y
```console
$ sbx exec policy-demo -- curl -s https://example.com
```
@z

@x
The response is the HTML of the `example.com` page.
@y
The response is the HTML of the `example.com` page.
@z

@x
`sbx policy check network` reports the decision for the host, not for a method
or path, so use a request like this one to test an HTTP rule. For more details,
see
[Allow or block HTTP methods and paths](network-rules.md#allow-or-block-http-methods-and-paths).
@y
`sbx policy check network` reports the decision for the host, not for a method
or path, so use a request like this one to test an HTTP rule. For more details,
see
[Allow or block HTTP methods and paths](network-rules.md#allow-or-block-http-methods-and-paths).
@z

@x
## Step 5: Review network activity
@y
## Step 5: Review network activity
@z

@x
See the sandbox's network activity:
@y
See the sandbox's network activity:
@z

@x
```console
$ sbx policy log policy-demo
```
@y
```console
$ sbx policy log policy-demo
```
@z

@x
For more details, see [Test and monitor network policy](test-monitor.md).
@y
For more details, see [Test and monitor network policy](test-monitor.md).
@z

@x
## Step 6: Clean up
@y
## Step 6: Clean up
@z

@x
Remove the sandbox:
@y
Remove the sandbox:
@z

@x
```console
$ sbx rm policy-demo
```
@y
```console
$ sbx rm policy-demo
```
@z

@x
Removing a sandbox also removes the rules scoped to it, so you don't need to
remove the rules you added in this example.
@y
Removing a sandbox also removes the rules scoped to it, so you don't need to
remove the rules you added in this example.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Learn how presets, rules for one sandbox, and kit rules combine in
  [Local policy](_index.md).
- Approve destinations that no rule allows, under the Balanced and Locked Down
  presets, in [Respond to approval requests](approvals.md).
- Reference the [Network and HTTP rule
  syntax](../reference/network-rules.md#http-method-and-path).
@y
- Learn how presets, rules for one sandbox, and kit rules combine in
  [Local policy](_index.md).
- Approve destinations that no rule allows, under the Balanced and Locked Down
  presets, in [Respond to approval requests](approvals.md).
- Reference the [Network and HTTP rule
  syntax](../reference/network-rules.md#http-method-and-path).
@z
