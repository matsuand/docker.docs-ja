%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: OIDC connections overview
linkTitle: OIDC connections
description: Authenticate GitHub Actions to Docker with short-lived OpenID Connect tokens
keywords: oidc connections, openid connect, github actions, jwt, subject claims, rulesets, enterprise security, workload authentication
@y
title: OIDC connections overview
linkTitle: OIDC connections
description: Authenticate GitHub Actions to Docker with short-lived OpenID Connect tokens
keywords: oidc connections, openid connect, github actions, jwt, subject claims, rulesets, enterprise security, workload authentication
@z

@x
{{< summary-bar feature_name="OIDC connections" >}}
@y
{{< summary-bar feature_name="OIDC connections" >}}
@z

@x
OIDC connections create a trust relationship between Docker and a trusted
third party so you don't have to maintain long-lived credentials. When you
create an OIDC connection, Docker exchanges short-lived tokens with another
vendor that can grant fine-grained access to your Docker resources.
@y
OIDC connections create a trust relationship between Docker and a trusted
third party so you don't have to maintain long-lived credentials. When you
create an OIDC connection, Docker exchanges short-lived tokens with another
vendor that can grant fine-grained access to your Docker resources.
@z

@x
## How OIDC connections work
@y
## How OIDC connections work
@z

@x
OIDC connections follow the OpenID Connect (OIDC) standard. Establishing a
trust relationship involves creating the connection, configuring a
workflow, and testing. For example, a trust relationship between Docker and
GitHub follows these steps:
@y
OIDC connections follow the OpenID Connect (OIDC) standard. Establishing a
trust relationship involves creating the connection, configuring a
workflow, and testing. For example, a trust relationship between Docker and
GitHub follows these steps:
@z

@x
- GitHub issues a JWT ID token for the workflow run.
- During authentication, Docker:
  - Verifies the token against GitHub's public key registry
  - Matches subject claims against rulesets created in
    [Docker Home](https://app.docker.com/)
- Docker returns an access token so the GitHub Action can sign in to Docker
  and access resources.
@y
- GitHub issues a JWT ID token for the workflow run.
- During authentication, Docker:
  - Verifies the token against GitHub's public key registry
  - Matches subject claims against rulesets created in
    [Docker Home](https://app.docker.com/)
- Docker returns an access token so the GitHub Action can sign in to Docker
  and access resources.
@z

@x
All tokens created and exchanged during an OIDC workflow are short-lived
and issued on a per-workflow basis.
@y
All tokens created and exchanged during an OIDC workflow are short-lived
and issued on a per-workflow basis.
@z

@x
For how OIDC connections compare to organization access tokens, see
[Access tokens](/manuals/security/access-tokens/_index.md).
@y
For how OIDC connections compare to organization access tokens, see
[Access tokens](manuals/security/access-tokens/_index.md).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Create an OIDC connection](/manuals/security/authentication/oidc-connections/create-manage.md)
- [OIDC rulesets and subject claims](/manuals/security/authentication/oidc-connections/rulesets-claims.md)
@y
- [Create an OIDC connection](manuals/security/authentication/oidc-connections/create-manage.md)
- [OIDC rulesets and subject claims](manuals/security/authentication/oidc-connections/rulesets-claims.md)
@z
