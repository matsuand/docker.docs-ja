%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Organization policy limits
linkTitle: Policy limits
@y
title: Organization policy limits
linkTitle: Policy limits
@z

@x
description: Limits on the number and size of Docker Sandboxes organization policies and their rules.
keywords: docker sandboxes, organization policy, policy limits, rules per policy, AI Governance
@y
description: Limits on the number and size of Docker Sandboxes organization policies and their rules.
keywords: docker sandboxes, organization policy, policy limits, rules per policy, AI Governance
@z

@x
Organization policies have the following limits, which help ensure fair usage
and resource availability across organizations:
@y
Organization policies have the following limits, which help ensure fair usage
and resource availability across organizations:
@z

@x
| Limit                     | Value  | Applies to                                                                    |
|---------------------------|--------|-------------------------------------------------------------------------------|
| Policies per organization | 100    | All organization policies combined, whatever their type                       |
| Rules per policy          | 250    | Each network or filesystem policy. MCP policies don't have a rule limit.      |
| Policy size               | 400 KB | Each policy, whatever its type                                                |
@y
| Limit                     | Value  | Applies to                                                                    |
|---------------------------|--------|-------------------------------------------------------------------------------|
| Policies per organization | 100    | All organization policies combined, whatever their type                       |
| Rules per policy          | 250    | Each network or filesystem policy. MCP policies don't have a rule limit.      |
| Policy size               | 400 KB | Each policy, whatever its type                                                |
@z

@x
The policies per organization limit is one shared total, not a separate
allowance for each policy type. For example, an organization with 60 network
policies, 30 filesystem policies, and 10 MCP policies has reached the limit.
@y
The policies per organization limit is one shared total, not a separate
allowance for each policy type. For example, an organization with 60 network
policies, 30 filesystem policies, and 10 MCP policies has reached the limit.
@z

@x
The policy size limit applies to each policy as Docker stores it. This
includes the policy's content, such as its name, description, scope, and
rules or Cedar statements, plus a small amount of metadata that Docker stores
with every policy. Typical policies use only a small fraction of this limit.
Domain and file path values have no separate length limit beyond valid format.
Because MCP policies have no rule limit, the policy size limit is what caps how
many Cedar statements an MCP policy can hold.
@y
The policy size limit applies to each policy as Docker stores it. This
includes the policy's content, such as its name, description, scope, and
rules or Cedar statements, plus a small amount of metadata that Docker stores
with every policy. Typical policies use only a small fraction of this limit.
Domain and file path values have no separate length limit beyond valid format.
Because MCP policies have no rule limit, the policy size limit is what caps how
many Cedar statements an MCP policy can hold.
@z

@x
If these limits don't fit your organization's needs,
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to discuss options.
@y
If these limits don't fit your organization's needs,
[contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
to discuss options.
@z
