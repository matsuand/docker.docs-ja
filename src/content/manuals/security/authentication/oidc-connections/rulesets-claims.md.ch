%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure OIDC rulesets and subject claims
linkTitle: Rulesets and subject claims
description: >-
  Rulesets and subject claims control which GitHub Actions workflows can
  push images, pull images, read public repositories, and connect to Docker
  Build Cloud.
keywords: >-
  oidc connections, rulesets, subject claims, github actions, openid connect,
  image push, image pull, docker build cloud, wildcards, access control
@y
title: Configure OIDC rulesets and subject claims
linkTitle: Rulesets and subject claims
description: >-
  Rulesets and subject claims control which GitHub Actions workflows can
  push images, pull images, read public repositories, and connect to Docker
  Build Cloud.
keywords: >-
  oidc connections, rulesets, subject claims, github actions, openid connect,
  image push, image pull, docker build cloud, wildcards, access control
@z

@x
{{< summary-bar feature_name="OIDC connections" >}}
@y
{{< summary-bar feature_name="OIDC connections" >}}
@z

@x
Rulesets and subject claims authorize which GitHub workflows can use which
Docker resources on an OIDC connection.
@y
Rulesets and subject claims authorize which GitHub workflows can use which
Docker resources on an OIDC connection.
@z

@x
## Rulesets
@y
## Rulesets
@z

@x
When a workflow triggers an OIDC exchange, Docker checks the token's
subject claim against every ruleset on the connection. If the subject
claim matches, Docker grants the resources and scopes on that ruleset.
@y
When a workflow triggers an OIDC exchange, Docker checks the token's
subject claim against every ruleset on the connection. If the subject
claim matches, Docker grants the resources and scopes on that ruleset.
@z

@x
Each ruleset has these fields:
@y
Each ruleset has these fields:
@z

@x
- **Ruleset name**: A name for the ruleset.
- **Subject claim**: One `sub` string from the GitHub ID token.
- **Resources**: What the workflow can access.
- **Scopes**: The access granted on those resources.
@y
- **Ruleset name**: A name for the ruleset.
- **Subject claim**: One `sub` string from the GitHub ID token.
- **Resources**: What the workflow can access.
- **Scopes**: The access granted on those resources.
@z

@x
You can add one to five rulesets on a connection. If more than one
ruleset matches a token, Docker grants the union of their resources and
scopes.
@y
You can add one to five rulesets on a connection. If more than one
ruleset matches a token, Docker grants the union of their resources and
scopes.
@z

@x
## Subject claims
@y
## Subject claims
@z

@x
A subject claim is the `sub` field in a GitHub-issued JWT ID token. It
encodes the workflow's organization, repository, branch, environment, and
related details into a single string. The repository, branch, tag, pull
request, or environment is part of that string, not a separate field.
@y
A subject claim is the `sub` field in a GitHub-issued JWT ID token. It
encodes the workflow's organization, repository, branch, environment, and
related details into a single string. The repository, branch, tag, pull
request, or environment is part of that string, not a separate field.
@z

@x
The default format is:
@y
The default format is:
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
You can use wildcards to match across repositories or branches:
@y
You can use wildcards to match across repositories or branches:
@z

@x
| Pattern                                        | Matches                                              |
| :--------------------------------------------- | :--------------------------------------------------- |
| `repo:my-org/my-repo:ref:refs/heads/main`      | Only the `main` branch of a specific repository      |
| `repo:my-org/*`                                | All repositories in the organization                 |
| `repo:my-org/my-repo:ref:refs/heads/release-*` | All branches starting with `release-`                |
@y
| Pattern                                        | Matches                                              |
| :--------------------------------------------- | :--------------------------------------------------- |
| `repo:my-org/my-repo:ref:refs/heads/main`      | Only the `main` branch of a specific repository      |
| `repo:my-org/*`                                | All repositories in the organization                 |
| `repo:my-org/my-repo:ref:refs/heads/release-*` | All branches starting with `release-`                |
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
For the full list of formats, see
[GitHub's OpenID Connect reference](https://docs.github.com/en/actions/reference/security/oidc).
@y
For the full list of formats, see
[GitHub's OpenID Connect reference](https://docs.github.com/en/actions/reference/security/oidc).
@z

@x
## Resources
@y
## Resources
@z

@x
A resource is a Docker Hub repository or Docker Build Cloud builder.
Scopes on the matching ruleset decide what the workflow can do with a defined resource.
@y
A resource is a Docker Hub repository or Docker Build Cloud builder.
Scopes on the matching ruleset decide what the workflow can do with a defined resource.
@z

@x
- A repository resource is a Docker Hub repository in your organization.
  **Image Pull** and **Image Push** apply to that repository. **Read
  public repositories** applies to public repositories.
- A Docker Build Cloud resource uses the **Cloud Connect** scope, so the
  workflow can connect and build in Docker Build Cloud.
@y
- A repository resource is a Docker Hub repository in your organization.
  **Image Pull** and **Image Push** apply to that repository. **Read
  public repositories** applies to public repositories.
- A Docker Build Cloud resource uses the **Cloud Connect** scope, so the
  workflow can connect and build in Docker Build Cloud.
@z

@x
## Ruleset examples
@y
## Ruleset examples
@z

@x
The following examples are working setups you can adapt. They are not
exhaustive, and they are not the only valid way to configure a
connection. Use them when you decide how to allocate your five
rulesets.
@y
The following examples are working setups you can adapt. They are not
exhaustive, and they are not the only valid way to configure a
connection. Use them when you decide how to allocate your five
rulesets.
@z

@x
Start with one ruleset. Add more when different branches or permissions
need to change independently. Each example is a complete setup on its
own.
@y
Start with one ruleset. Add more when different branches or permissions
need to change independently. Each example is a complete setup on its
own.
@z

@x
### Publish from main and use Build Cloud
@y
### Publish from main and use Build Cloud
@z

@x
Use one ruleset when the same workflows need several permissions and
you want to change those permissions together.
@y
Use one ruleset when the same workflows need several permissions and
you want to change those permissions together.
@z

@x
| Ruleset name | Subject claim                                 | Resources and scopes                                                                               |
| :----------- | :-------------------------------------------- | :------------------------------------------------------------------------------------------------- |
| `main`       | `repo:octo-org/octo-repo:ref:refs/heads/main` | Repository `octo-org/octo-repo` with **Image Push**, and Docker Build Cloud with **Cloud Connect** |
@y
| Ruleset name | Subject claim                                 | Resources and scopes                                                                               |
| :----------- | :-------------------------------------------- | :------------------------------------------------------------------------------------------------- |
| `main`       | `repo:octo-org/octo-repo:ref:refs/heads/main` | Repository `octo-org/octo-repo` with **Image Push**, and Docker Build Cloud with **Cloud Connect** |
@z

@x
Other branches receive `access denied` unless you add another ruleset.
@y
Other branches receive `access denied` unless you add another ruleset.
@z

@x
### Different access for release branches and main
@y
### Different access for release branches and main
@z

@x
Split into two rulesets when release work should only pull an image,
but `main` should publish it. You can then tighten release access
without editing the publish rule.
@y
Split into two rulesets when release work should only pull an image,
but `main` should publish it. You can then tighten release access
without editing the publish rule.
@z

@x
| Ruleset name   | Subject claim                                      | Resources and scopes                                |
| :------------- | :------------------------------------------------- | :-------------------------------------------------- |
| `release-pull` | `repo:octo-org/octo-repo:ref:refs/heads/release-*` | Repository `octo-org/octo-repo` with **Image Pull** |
| `main-push`    | `repo:octo-org/octo-repo:ref:refs/heads/main`      | Repository `octo-org/octo-repo` with **Image Push** |
@y
| Ruleset name   | Subject claim                                      | Resources and scopes                                |
| :------------- | :------------------------------------------------- | :-------------------------------------------------- |
| `release-pull` | `repo:octo-org/octo-repo:ref:refs/heads/release-*` | Repository `octo-org/octo-repo` with **Image Pull** |
| `main-push`    | `repo:octo-org/octo-repo:ref:refs/heads/main`      | Repository `octo-org/octo-repo` with **Image Push** |
@z

@x
With this setup:
@y
With this setup:
@z

@x
- Branches whose names start with `release-` can pull the image.
- Workflows on `main` can publish the image.
- Other branches, such as `feature-x`, receive `access denied`.
@y
- Branches whose names start with `release-` can pull the image.
- Workflows on `main` can publish the image.
- Other branches, such as `feature-x`, receive `access denied`.
@z

@x
### Combine a broad read rule with a narrow push rule
@y
### Combine a broad read rule with a narrow push rule
@z

@x
Use two overlapping rulesets when every repository in the GitHub org
should read public images, but only `main` in one repository should
publish.
@y
Use two overlapping rulesets when every repository in the GitHub org
should read public images, but only `main` in one repository should
publish.
@z

@x
| Ruleset name | Subject claim                                 | Resources and scopes                                   |
| :----------- | :-------------------------------------------- | :----------------------------------------------------- |
| `main-push`  | `repo:octo-org/octo-repo:ref:refs/heads/main` | Repository `octo-org/octo-repo` with **Image Push**    |
| `org-read`   | `repo:octo-org/*`                             | Public repositories with **Read public repositories** |
@y
| Ruleset name | Subject claim                                 | Resources and scopes                                   |
| :----------- | :-------------------------------------------- | :----------------------------------------------------- |
| `main-push`  | `repo:octo-org/octo-repo:ref:refs/heads/main` | Repository `octo-org/octo-repo` with **Image Push**    |
| `org-read`   | `repo:octo-org/*`                             | Public repositories with **Read public repositories** |
@z

@x
With this setup:
@y
With this setup:
@z

@x
- A workflow on `main` matches both rulesets, so it can publish the
  image and read public repositories.
- A workflow on any other branch or repository in `octo-org` matches
  `org-read` only, so it can read public repositories.
- Deleting `org-read` removes the shared read permission and leaves the
  publish rule unchanged.
@y
- A workflow on `main` matches both rulesets, so it can publish the
  image and read public repositories.
- A workflow on any other branch or repository in `octo-org` matches
  `org-read` only, so it can read public repositories.
- Deleting `org-read` removes the shared read permission and leaves the
  publish rule unchanged.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [OIDC connections overview](/manuals/security/authentication/oidc-connections/_index.md)
- [Create or manage OIDC connections](/manuals/security/authentication/oidc-connections/create-manage.md)
- [Troubleshoot OIDC connections](/manuals/security/authentication/oidc-connections/troubleshoot.md)
@y
- [OIDC connections overview](manuals/security/authentication/oidc-connections/_index.md)
- [Create or manage OIDC connections](manuals/security/authentication/oidc-connections/create-manage.md)
- [Troubleshoot OIDC connections](manuals/security/authentication/oidc-connections/troubleshoot.md)
@z
