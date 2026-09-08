%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: MCP access policies
linkTitle: MCP access
@y
title: MCP access policies
linkTitle: MCP access
@z

@x
description: Use Cedar-based policies to control MCP server registration and activity routed through the Docker Sandboxes MCP gateway.
keywords: docker sandboxes, MCP policy, MCP access, Cedar policy, requireApproval, AI Governance
@y
description: Use Cedar-based policies to control MCP server registration and activity routed through the Docker Sandboxes MCP gateway.
keywords: docker sandboxes, MCP policy, MCP access, Cedar policy, requireApproval, AI Governance
@z

@x
MCP access policies let organization administrators control which Model
Context Protocol (MCP) servers developers can register and what agents can do
through Docker's MCP gateway. Use these policies to approve trusted servers,
withdraw access to a server, require approval for tool calls, and restrict
host-run servers. To register MCP servers and connect them to sandboxes, see
[MCP gateway](../../mcp-gateway.md).
@y
MCP access policies let organization administrators control which Model
Context Protocol (MCP) servers developers can register and what agents can do
through Docker's MCP gateway. Use these policies to approve trusted servers,
withdraw access to a server, require approval for tool calls, and restrict
host-run servers. To register MCP servers and connect them to sandboxes, see
[MCP gateway](../../mcp-gateway.md).
@z

@x
MCP access policies apply only to server registration and requests handled by
Docker's MCP gateway. They don't govern an MCP server that an agent or MCP
client configures and connects to directly from inside the sandbox. A direct
connection to a remote MCP server is outbound sandbox traffic, so
[network access policy](network.md) determines whether the sandbox can reach
the server. To prevent access through both paths, block the server in MCP
access policy and block its network destination in network access policy.
@y
MCP access policies apply only to server registration and requests handled by
Docker's MCP gateway. They don't govern an MCP server that an agent or MCP
client configures and connects to directly from inside the sandbox. A direct
connection to a remote MCP server is outbound sandbox traffic, so
[network access policy](network.md) determines whether the sandbox can reach
the server. To prevent access through both paths, block the server in MCP
access policy and block its network destination in network access policy.
@z

@x
Unlike [network access policies](network.md) and
[filesystem access policies](filesystem.md), MCP policies are organization
policies written in Cedar. Docker defines the `MCP` namespace, including the
actions, resource types, attributes, and approval behavior that policies can
match. This page focuses on representative access patterns. For Docker's exact
policy surface, see the [MCP policy reference](../reference/mcp-policy.md). For
Cedar syntax and language semantics, see the
[Cedar documentation](https://docs.cedarpolicy.com/).
@y
Unlike [network access policies](network.md) and
[filesystem access policies](filesystem.md), MCP policies are organization
policies written in Cedar. Docker defines the `MCP` namespace, including the
actions, resource types, attributes, and approval behavior that policies can
match. This page focuses on representative access patterns. For Docker's exact
policy surface, see the [MCP policy reference](../reference/mcp-policy.md). For
Cedar syntax and language semantics, see the
[Cedar documentation](https://docs.cedarpolicy.com/).
@z

@x
## Govern the server lifecycle
@y
## Govern the server lifecycle
@z

@x
MCP policy applies at two points in a server's lifecycle. A rule for one point
doesn't automatically govern the other.
@y
MCP policy applies at two points in a server's lifecycle. A rule for one point
doesn't automatically govern the other.
@z

@x
| Admin decision                             | Evaluation point                            | Match with                                                                 |
| ------------------------------------------ | ------------------------------------------- | -------------------------------------------------------------------------- |
| Whether a server can be registered         | When a developer runs `sbx mcp add`         | The registered name and resolved server attributes, such as `identityURL`  |
| What agents can do through the MCP gateway | When the gateway handles a governed request | The registered server name, tool annotations, resource URI, or prompt name |
@y
| Admin decision                             | Evaluation point                            | Match with                                                                 |
| ------------------------------------------ | ------------------------------------------- | -------------------------------------------------------------------------- |
| Whether a server can be registered         | When a developer runs `sbx mcp add`         | The registered name and resolved server attributes, such as `identityURL`  |
| What agents can do through the MCP gateway | When the gateway handles a governed request | The registered server name, tool annotations, resource URI, or prompt name |
@z

@x
Registration rules affect future registrations. They don't remove a saved
registration or prevent an existing registration from being loaded with
`sbx mcp load`. Use-time rules govern tool calls, resource reads, and prompt
retrieval from servers that are already registered or loaded.
@y
Registration rules affect future registrations. They don't remove a saved
registration or prevent an existing registration from being loaded with
`sbx mcp load`. Use-time rules govern tool calls, resource reads, and prompt
retrieval from servers that are already registered or loaded.
@z

@x
Server names are chosen during registration. Registration rules can match the
chosen name and resolved server identity together. At use time, tools,
resources, and prompts are associated with the registered name, so rules for an
existing server must match every name under which it was registered.
@y
Server names are chosen during registration. Registration rules can match the
chosen name and resolved server identity together. At use time, tools,
resources, and prompts are associated with the registered name, so rules for an
existing server must match every name under which it was registered.
@z

@x
Built-in gateway tools, such as `mcp-add`, `code-mode`, and OAuth authorization
helpers, are also governed at use time. They are `MCP::Primordial` resources
rather than tools associated with a registered server. For details, see
[Built-in gateway tools](../../mcp-gateway.md#built-in-gateway-tools).
@y
Built-in gateway tools, such as `mcp-add`, `code-mode`, and OAuth authorization
helpers, are also governed at use time. They are `MCP::Primordial` resources
rather than tools associated with a registered server. For details, see
[Built-in gateway tools](../../mcp-gateway.md#built-in-gateway-tools).
@z

@x
Use-time policy doesn't hide or remove existing registrations. Tool and
resource listings can also include entries that policy denies when an agent
tries to use them.
@y
Use-time policy doesn't hide or remove existing registrations. Tool and
resource listings can also include entries that policy denies when an agent
tries to use them.
@z

@x
## Choose an access posture
@y
## Choose an access posture
@z

@x
When MCP policy enforcement is active for a user, registration and governed MCP
requests are denied unless a matching `permit` allows them. A matching `forbid`
overrides any `permit`, including a permit with `@requireApproval`.
@y
When MCP policy enforcement is active for a user, registration and governed MCP
requests are denied unless a matching `permit` allows them. A matching `forbid`
overrides any `permit`, including a permit with `@requireApproval`.
@z

@x
Use permits for an allowlist policy. For a blocklist policy that grants MCP
activity except for explicit restrictions, start with an actionless permit:
@y
Use permits for an allowlist policy. For a blocklist policy that grants MCP
activity except for explicit restrictions, start with an actionless permit:
@z

@x
```plaintext
permit (principal, action, resource);
```
@y
```plaintext
permit (principal, action, resource);
```
@z

@x
This statement permits every MCP action that reaches Cedar evaluation. Add
`forbid` statements for the restrictions the policy must enforce.
@y
This statement permits every MCP action that reaches Cedar evaluation. Add
`forbid` statements for the restrictions the policy must enforce.
@z

@x
Policy scope supplies the principal. Use organization or team scope instead of
matching users, teams, tenants, or roles in Cedar. If MCP policy enforcement
isn't active for a user, the gateway doesn't evaluate Cedar policy and permits
MCP activity. MCP doesn't have a local preset equivalent to network policy.
@y
Policy scope supplies the principal. Use organization or team scope instead of
matching users, teams, tenants, or roles in Cedar. If MCP policy enforcement
isn't active for a user, the gateway doesn't evaluate Cedar policy and permits
MCP activity. MCP doesn't have a local preset equivalent to network policy.
@z

@x
## Approve a server
@y
## Approve a server
@z

@x
For an allowlist, approve both the server registration and its use-time
capabilities. The following policy approves a remote server only when it is
registered as `example` with the expected identity URL. It permits read-only
tool calls, resource reads, and prompt retrieval from that registered server:
@y
For an allowlist, approve both the server registration and its use-time
capabilities. The following policy approves a remote server only when it is
registered as `example` with the expected identity URL. It permits read-only
tool calls, resource reads, and prompt retrieval from that registered server:
@z

@x
```plaintext
// Permit registration with the expected name and identity URL.
permit (principal, action == MCP::Action::"register", resource)
when {
  resource in MCP::Server::"example" &&
  resource.identityURL == "https://mcp.example.com/mcp"
};
@y
```plaintext
// Permit registration with the expected name and identity URL.
permit (principal, action == MCP::Action::"register", resource)
when {
  resource in MCP::Server::"example" &&
  resource.identityURL == "https://mcp.example.com/mcp"
};
@z

@x
// Permit read-only tool calls.
permit (principal, action == MCP::Action::"invokeTool", resource)
when {
  resource in MCP::Server::"example" &&
  resource.readOnly == true
};
@y
// Permit read-only tool calls.
permit (principal, action == MCP::Action::"invokeTool", resource)
when {
  resource in MCP::Server::"example" &&
  resource.readOnly == true
};
@z

@x
// Permit resource reads.
permit (principal, action == MCP::Action::"readResource", resource)
when { resource in MCP::Server::"example" };
@y
// Permit resource reads.
permit (principal, action == MCP::Action::"readResource", resource)
when { resource in MCP::Server::"example" };
@z

@x
// Permit prompt retrieval.
permit (principal, action == MCP::Action::"getPrompt", resource)
when { resource in MCP::Server::"example" };
```
@y
// Permit prompt retrieval.
permit (principal, action == MCP::Action::"getPrompt", resource)
when { resource in MCP::Server::"example" };
```
@z

@x
Matching both the name and identity URL establishes a canonical registration.
It prevents a developer from registering another endpoint under the approved
name or registering the approved endpoint under another name. Remove the
resource or prompt permit if users don't need that capability.
@y
Matching both the name and identity URL establishes a canonical registration.
It prevents a developer from registering another endpoint under the approved
name or registering the approved endpoint under another name. Remove the
resource or prompt permit if users don't need that capability.
@z

@x
## Require confirmation with MCP elicitation
@y
## Require confirmation with MCP elicitation
@z

@x
Use `@requireApproval` to require per-request confirmation through MCP. When a
request matches the annotated `permit`, the gateway sends an
`elicitation/create` request to the same MCP client session that made the
governed request. In a human-driven client, the person operating the agent sees
the prompt and decides whether to proceed.
@y
Use `@requireApproval` to require per-request confirmation through MCP. When a
request matches the annotated `permit`, the gateway sends an
`elicitation/create` request to the same MCP client session that made the
governed request. In a human-driven client, the person operating the agent sees
the prompt and decides whether to proceed.
@z

@x
The following policy requires confirmation for non-read-only tools on a server
registered as `example`. Use it alongside any permits needed to register the
server or use its other capabilities. The annotation string becomes the reason
shown in the elicitation:
@y
The following policy requires confirmation for non-read-only tools on a server
registered as `example`. Use it alongside any permits needed to register the
server or use its other capabilities. The annotation string becomes the reason
shown in the elicitation:
@z

@x
```plaintext
@requireApproval("non-read-only tool call")
permit (principal, action == MCP::Action::"invokeTool", resource)
when {
  resource in MCP::Server::"example" &&
  resource.readOnly == false
};
```
@y
```plaintext
@requireApproval("non-read-only tool call")
permit (principal, action == MCP::Action::"invokeTool", resource)
when {
  resource in MCP::Server::"example" &&
  resource.readOnly == false
};
```
@z

@x
Tool annotations are supplied by the server and are advisory. `readOnly`
defaults to `false` for tools that don't declare it, so this pattern requires
confirmation for unannotated tools.
@y
Tool annotations are supplied by the server and are advisory. `readOnly`
defaults to `false` for tools that don't declare it, so this pattern requires
confirmation for unannotated tools.
@z

@x
The gateway handles a matching request as follows:
@y
The gateway handles a matching request as follows:
@z

@x
```mermaid
flowchart TD
  request["Agent sends a governed MCP request"] --> evaluate["Gateway evaluates MCP policy"]
  evaluate -->|"Normal permit"| forward["Forward request"]
  evaluate -->|"No permit or matching forbid"| deny["Deny request"]
  evaluate -->|"Permit with @requireApproval"| elicit["Send MCP elicitation to connected client"]
  elicit --> confirm{"Client returns explicit confirmation?"}
  confirm -->|"No, unsupported, or error"| deny
  confirm -->|"Yes"| reevaluate["Re-evaluate with approval digest"]
  reevaluate -->|"Allowed"| forward
  reevaluate -->|"Denied or changed"| deny
```
@y
```mermaid
flowchart TD
  request["Agent sends a governed MCP request"] --> evaluate["Gateway evaluates MCP policy"]
  evaluate -->|"Normal permit"| forward["Forward request"]
  evaluate -->|"No permit or matching forbid"| deny["Deny request"]
  evaluate -->|"Permit with @requireApproval"| elicit["Send MCP elicitation to connected client"]
  elicit --> confirm{"Client returns explicit confirmation?"}
  confirm -->|"No, unsupported, or error"| deny
  confirm -->|"Yes"| reevaluate["Re-evaluate with approval digest"]
  reevaluate -->|"Allowed"| forward
  reevaluate -->|"Denied or changed"| deny
```
@z

@x
The prompt identifies the server or gateway tool and includes the annotation
reason. It doesn't include raw tool arguments. Each matching request requires a
new confirmation. After confirmation, the gateway re-evaluates the request with
a digest that binds the response to the evaluated authorization request.
@y
The prompt identifies the server or gateway tool and includes the annotation
reason. It doesn't include raw tool arguments. Each matching request requires a
new confirmation. After confirmation, the gateway re-evaluates the request with
a digest that binds the response to the evaluated authorization request.
@z

@x
Use this mechanism as a confirmation guardrail for human-driven clients. It
doesn't create administrator approval or separation of duties. An autonomous
MCP client can respond to an in-protocol elicitation programmatically. Use
`forbid` for operations that must never run.
@y
Use this mechanism as a confirmation guardrail for human-driven clients. It
doesn't create administrator approval or separation of duties. An autonomous
MCP client can respond to an in-protocol elicitation programmatically. Use
`forbid` for operations that must never run.
@z

@x
The request is denied if the originating client session can't handle MCP
elicitation, the user declines, the elicitation fails, or re-evaluation doesn't
allow the request. `sbx mcp add` can't present an elicitation, so a registration
permit with `@requireApproval` results in a denial. Tool calls made from an
execution context that can't relay an elicitation, including calls from inside
`code-mode`, are also denied.
@y
The request is denied if the originating client session can't handle MCP
elicitation, the user declines, the elicitation fails, or re-evaluation doesn't
allow the request. `sbx mcp add` can't present an elicitation, so a registration
permit with `@requireApproval` results in a denial. Tool calls made from an
execution context that can't relay an elicitation, including calls from inside
`code-mode`, are also denied.
@z

@x
## Withdraw server access
@y
## Withdraw server access
@z

@x
To withdraw access from a server that broader rules permit, block it at
registration and at use time. Registration policy controls future `sbx mcp add`
operations, while use-time policy controls requests from servers that are
already registered or loaded.
@y
To withdraw access from a server that broader rules permit, block it at
registration and at use time. Registration policy controls future `sbx mcp add`
operations, while use-time policy controls requests from servers that are
already registered or loaded.
@z

@x
Prevent future registrations of the server by matching its identity URL:
@y
Prevent future registrations of the server by matching its identity URL:
@z

@x
```plaintext
forbid (principal, action == MCP::Action::"register", resource)
when { resource.identityURL == "https://mcp.example.com/mcp" };
```
@y
```plaintext
forbid (principal, action == MCP::Action::"register", resource)
when { resource.identityURL == "https://mcp.example.com/mcp" };
```
@z

@x
Deny use-time requests for each registered name that refers to the server:
@y
Deny use-time requests for each registered name that refers to the server:
@z

@x
```plaintext
forbid (principal, action == MCP::Action::"invokeTool", resource)
when { resource in MCP::Server::"example" };
@y
```plaintext
forbid (principal, action == MCP::Action::"invokeTool", resource)
when { resource in MCP::Server::"example" };
@z

@x
forbid (principal, action == MCP::Action::"readResource", resource)
when { resource in MCP::Server::"example" };
@y
forbid (principal, action == MCP::Action::"readResource", resource)
when { resource in MCP::Server::"example" };
@z

@x
forbid (principal, action == MCP::Action::"getPrompt", resource)
when { resource in MCP::Server::"example" };
```
@y
forbid (principal, action == MCP::Action::"getPrompt", resource)
when { resource in MCP::Server::"example" };
```
@z

@x
The registration remains saved and can still be listed or loaded. These rules
prevent another registration for the identity URL and deny governed use under
the registered name. If the server was registered under other names, add
use-time rules for those names as well.
@y
The registration remains saved and can still be listed or loaded. These rules
prevent another registration for the identity URL and deny governed use under
the registered name. If the server was registered under other names, add
use-time rules for those names as well.
@z

@x
An OAuth authorization helper is a built-in gateway tool, not a child of the
registered server. To prevent agents from starting authorization for the
server, govern the helper separately:
@y
An OAuth authorization helper is a built-in gateway tool, not a child of the
registered server. To prevent agents from starting authorization for the
server, govern the helper separately:
@z

@x
```plaintext
forbid (principal, action == MCP::Action::"invokePrimordial", resource)
when { resource in MCP::Primordial::"example-authorize" };
```
@y
```plaintext
forbid (principal, action == MCP::Action::"invokePrimordial", resource)
when { resource in MCP::Primordial::"example-authorize" };
```
@z

@x
## Restrict host-run servers
@y
## Restrict host-run servers
@z

@x
Local stdio servers run on the host, outside the sandbox VM. This includes
explicit host commands and OCI-packaged stdio servers started with host Docker.
For details about this boundary, see
[Docker Engine isolation](../../security/isolation.md#docker-engine-isolation).
@y
Local stdio servers run on the host, outside the sandbox VM. This includes
explicit host commands and OCI-packaged stdio servers started with host Docker.
For details about this boundary, see
[Docker Engine isolation](../../security/isolation.md#docker-engine-isolation).
@z

@x
In a blocklist policy that otherwise permits registration, deny the host-run
server type:
@y
In a blocklist policy that otherwise permits registration, deny the host-run
server type:
@z

@x
```plaintext
forbid (principal, action == MCP::Action::"register", resource)
when { resource.type == "local-stdio" };
```
@y
```plaintext
forbid (principal, action == MCP::Action::"register", resource)
when { resource.type == "local-stdio" };
```
@z

@x
`local-stdio` covers explicit commands, including commands that start a Docker
container, and OCI-packaged stdio servers resolved from registry or manifest
metadata with `--local`.
@y
`local-stdio` covers explicit commands, including commands that start a Docker
container, and OCI-packaged stdio servers resolved from registry or manifest
metadata with `--local`.
@z

@x
## Related information
@y
## Related information
@z

@x
- [MCP policy concepts](../concepts.md#mcp-policies): policy model and rule
  evaluation.
- [MCP policy reference](../reference/mcp-policy.md): exact action, resource,
  attribute, context, and approval behavior.
- [Organization policies](organization.md): policy creation and scope.
- [MCP policy audit logs](../audit/): policy decision
  records.
@y
- [MCP policy concepts](../concepts.md#mcp-policies): policy model and rule
  evaluation.
- [MCP policy reference](../reference/mcp-policy.md): exact action, resource,
  attribute, context, and approval behavior.
- [Organization policies](organization.md): policy creation and scope.
- [MCP policy audit logs](../audit/): policy decision
  records.
@z
