%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: OIDC connections rulesets and subject claims
linkTitle: Rulesets and subject claims
description: Configure rulesets and subject claims to control OIDC workflow access
keywords: oidc connections, rulesets, subject claims, github actions, jwt claims, access control, wildcards, enterprise security
@y
title: OIDC connections rulesets and subject claims
linkTitle: Rulesets and subject claims
description: Configure rulesets and subject claims to control OIDC workflow access
keywords: oidc connections, rulesets, subject claims, github actions, jwt claims, access control, wildcards, enterprise security
@z

@x
{{< summary-bar feature_name="OIDC connections" >}}
@y
{{< summary-bar feature_name="OIDC connections" >}}
@z

@x
Rulesets and subject claims define what actions your GitHub workflows can
take with your Docker resources. Use them to authorize GitHub workflow
behaviors for an OIDC connection.
@y
Rulesets and subject claims define what actions your GitHub workflows can
take with your Docker resources. Use them to authorize GitHub workflow
behaviors for an OIDC connection.
@z

@x
## Rulesets
@y
## Rulesets
@z

@x
A ruleset is a set of conditions that Docker evaluates against an incoming
GitHub ID token. When a workflow triggers an OIDC exchange, Docker checks
the token against every ruleset defined in your connection. If a ruleset's
conditions are satisfied, Docker grants access based on the parameters set
by that ruleset.
@y
A ruleset is a set of conditions that Docker evaluates against an incoming
GitHub ID token. When a workflow triggers an OIDC exchange, Docker checks
the token against every ruleset defined in your connection. If a ruleset's
conditions are satisfied, Docker grants access based on the parameters set
by that ruleset.
@z

@x
Each ruleset contains the following fields:
@y
Each ruleset contains the following fields:
@z

@x
- Label: A name for the ruleset.
- Rules: One or more conditions based on OIDC token claims, such as the
  repository name, branch, or workflow path.
  - These are expressed as subject claim strings.
  - See [Subject claims](#subject-claims).
- Resources: The Docker resources a workflow can access when the ruleset
  matches. See [Resources](#resources).
- Scopes: The permissions granted on those resources, such as read or write
  access.
@y
- Label: A name for the ruleset.
- Rules: One or more conditions based on OIDC token claims, such as the
  repository name, branch, or workflow path.
  - These are expressed as subject claim strings.
  - See [Subject claims](#subject-claims).
- Resources: The Docker resources a workflow can access when the ruleset
  matches. See [Resources](#resources).
- Scopes: The permissions granted on those resources, such as read or write
  access.
@z

@x
You can define between 1 and 5 rulesets per connection. Use multiple
rulesets to apply different access levels across different workflows or
branches. If more than one ruleset matches an incoming token, Docker merges
the resources from all matching rulesets and grants access to the combined
set.
@y
You can define between 1 and 5 rulesets per connection. Use multiple
rulesets to apply different access levels across different workflows or
branches. If more than one ruleset matches an incoming token, Docker merges
the resources from all matching rulesets and grants access to the combined
set.
@z

@x
## Subject claims
@y
## Subject claims
@z

@x
A subject claim is the `sub` field in a GitHub-issued JWT ID token. It
encodes details of a workflow into a single string, identifying the
workflow by organization, repository, branch, environment, and so on.
@y
A subject claim is the `sub` field in a GitHub-issued JWT ID token. It
encodes details of a workflow into a single string, identifying the
workflow by organization, repository, branch, environment, and so on.
@z

@x
Docker uses the subject claim as the primary condition when evaluating your
ruleset rules. The default subject claim format is:
@y
Docker uses the subject claim as the primary condition when evaluating your
ruleset rules. The default subject claim format is:
@z

@x
```text
repo:<org>/<repo>:ref:refs/heads/<branch>
```
@y
```text
repo:<org>/<repo>:ref:refs/heads/<branch>
```
@z

@x
For example:
@y
For example:
@z

@x
```text
repo:octo-org/octo-repo:ref:refs/heads/main
```
@y
```text
repo:octo-org/octo-repo:ref:refs/heads/main
```
@z

@x
The exact format varies and depends on what triggered the workflow.
@y
The exact format varies and depends on what triggered the workflow.
@z

@x
- A branch push, pull request, tag, or environment deployment each produces
  a different `sub` value.
- Refer to
  [GitHub's OpenID Connect reference](https://docs.github.com/en/actions/reference/security/oidc)
  for the full list of formats.
@y
- A branch push, pull request, tag, or environment deployment each produces
  a different `sub` value.
- Refer to
  [GitHub's OpenID Connect reference](https://docs.github.com/en/actions/reference/security/oidc)
  for the full list of formats.
@z

@x
> [!NOTE]
> GitHub repositories created after July 15, 2026 use immutable
> identifiers for default subject claims. For example:
> `repo:octocat@123456/my-repo@456789:ref:refs/heads/main`. See the
> [GitHub changelog](https://github.blog/changelog/2026-04-23-immutable-subject-claims-for-github-actions-oidc-tokens/)
> for more details.
@y
> [!NOTE]
> GitHub repositories created after July 15, 2026 use immutable
> identifiers for default subject claims. For example:
> `repo:octocat@123456/my-repo@456789:ref:refs/heads/main`. See the
> [GitHub changelog](https://github.blog/changelog/2026-04-23-immutable-subject-claims-for-github-actions-oidc-tokens/)
> for more details.
@z

@x
You can use wildcards to match across repositories or branches:
@y
You can use wildcards to match across repositories or branches:
@z

@x
| Pattern                                        | Matches                                         |
| :--------------------------------------------- | :---------------------------------------------- |
| `repo:my-org/my-repo:ref:refs/heads/main`      | Only the `main` branch of a specific repository |
| `repo:my-org/*`                                | All repos in the organization                   |
| `repo:my-org/my-repo:ref:refs/heads/release-*` | All branches starting with `release-`           |
@y
| Pattern                                        | Matches                                         |
| :--------------------------------------------- | :---------------------------------------------- |
| `repo:my-org/my-repo:ref:refs/heads/main`      | Only the `main` branch of a specific repository |
| `repo:my-org/*`                                | All repos in the organization                   |
| `repo:my-org/my-repo:ref:refs/heads/release-*` | All branches starting with `release-`           |
@z

@x
## Resources
@y
## Resources
@z

@x
Resources define the Docker resources a workflow can access when a ruleset
matches. You specify resources per ruleset, alongside the scopes that
determine the level of access granted.
@y
Resources define the Docker resources a workflow can access when a ruleset
matches. You specify resources per ruleset, alongside the scopes that
determine the level of access granted.
@z

@x
Docker Hub repositories and Docker Build Cloud are supported resources.
@y
Docker Hub repositories and Docker Build Cloud are supported resources.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [OIDC connections overview](/manuals/enterprise/security/oidc-connections/_index.md)
- [Create or manage OIDC connections](/manuals/enterprise/security/oidc-connections/create-manage.md)
@y
- [OIDC connections overview](manuals/enterprise/security/oidc-connections/_index.md)
- [Create or manage OIDC connections](manuals/enterprise/security/oidc-connections/create-manage.md)
@z
