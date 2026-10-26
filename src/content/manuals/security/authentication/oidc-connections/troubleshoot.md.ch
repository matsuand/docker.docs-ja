%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Troubleshoot OIDC connections
linkTitle: Troubleshoot
description: >-
  Troubleshoot common OIDC connection token-exchange errors with GitHub
  Actions
@y
title: Troubleshoot OIDC connections
linkTitle: Troubleshoot
description: >-
  Troubleshoot common OIDC connection token-exchange errors with GitHub
  Actions
@z

@x
keywords: >-
  oidc troubleshooting, oidc connection errors, Failures tab, github actions
  oidc, subject claims, rulesets, docker login-action,
  DOCKERHUB_OIDC_CONNECTIONID, access denied, connection_id is invalid,
  subject_token
@y
keywords: >-
  oidc troubleshooting, oidc connection errors, Failures tab, github actions
  oidc, subject claims, rulesets, docker login-action,
  DOCKERHUB_OIDC_CONNECTIONID, access denied, connection_id is invalid,
  subject_token
@z

@x
{{< summary-bar feature_name="OIDC connections" >}}
@y
{{< summary-bar feature_name="OIDC connections" >}}
@z

@x
OIDC connection problems can stem from mismatched rulesets, an inactive
or incorrect connection ID, or your GitHub Actions workflow. The following
sections describe common errors and how to resolve them.
@y
OIDC connection problems can stem from mismatched rulesets, an inactive
or incorrect connection ID, or your GitHub Actions workflow. The following
sections describe common errors and how to resolve them.
@z

@x
To inspect failed token exchanges in Docker Home, see
[View connection failures](/manuals/security/authentication/oidc-connections/create-manage.md#view-connection-failures).
@y
To inspect failed token exchanges in Docker Home, see
[View connection failures](manuals/security/authentication/oidc-connections/create-manage.md#view-connection-failures).
@z

@x
## Subject claim does not match a ruleset
@y
## Subject claim does not match a ruleset
@z

@x
### Error message
@y
### Error message
@z

@x
In GitHub Actions, the login step fails during token exchange. Docker
returns:
@y
In GitHub Actions, the login step fails during token exchange. Docker
returns:
@z

@x
```text
access denied
```
@y
```text
access denied
```
@z

@x
When Docker records the failure, the **Failures** tab shows the expected
subject claim next to the incoming `sub` value from GitHub. If there is
no failure row, confirm the workflow uses the correct connection ID and
that a ruleset `sub` pattern covers that repository's namespace. See
[View connection failures](/manuals/security/authentication/oidc-connections/create-manage.md#view-connection-failures).
@y
When Docker records the failure, the **Failures** tab shows the expected
subject claim next to the incoming `sub` value from GitHub. If there is
no failure row, confirm the workflow uses the correct connection ID and
that a ruleset `sub` pattern covers that repository's namespace. See
[View connection failures](manuals/security/authentication/oidc-connections/create-manage.md#view-connection-failures).
@z

@x
### Causes
@y
### Causes
@z

@x
- The workflow's repository, branch, tag, pull request, or environment
  produces a different `sub` value than the ruleset expects.
- The ruleset uses a narrow pattern and the workflow runs from a
  different ref (for example, a feature branch instead of `main`).
- The ruleset still uses a mutable `repo:org/repo:...` subject while the
  GitHub repository issues an immutable subject claim. See
  [Subject claims](/manuals/security/authentication/oidc-connections/rulesets-claims.md#subject-claims).
@y
- The workflow's repository, branch, tag, pull request, or environment
  produces a different `sub` value than the ruleset expects.
- The ruleset uses a narrow pattern and the workflow runs from a
  different ref (for example, a feature branch instead of `main`).
- The ruleset still uses a mutable `repo:org/repo:...` subject while the
  GitHub repository issues an immutable subject claim. See
  [Subject claims](manuals/security/authentication/oidc-connections/rulesets-claims.md#subject-claims).
@z

@x
### Solutions
@y
### Solutions
@z

@x
1. Open the connection's **Failures** tab, if a row exists, and compare
   the expected `sub` value with the incoming value marked ❌.
1. Update the ruleset's **Subject claim** on the **Rulesets** tab so it
   matches the workflow, or use a wildcard where appropriate. See
   [Rulesets and subject claims](/manuals/security/authentication/oidc-connections/rulesets-claims.md).
1. Select **Save connection**, then re-run the GitHub Actions workflow.
@y
1. Open the connection's **Failures** tab, if a row exists, and compare
   the expected `sub` value with the incoming value marked ❌.
1. Update the ruleset's **Subject claim** on the **Rulesets** tab so it
   matches the workflow, or use a wildcard where appropriate. See
   [Rulesets and subject claims](manuals/security/authentication/oidc-connections/rulesets-claims.md).
1. Select **Save connection**, then re-run the GitHub Actions workflow.
@z

@x
## Connection ID is invalid or the connection is inactive
@y
## Connection ID is invalid or the connection is inactive
@z

@x
### Error message
@y
### Error message
@z

@x
In GitHub Actions, the login step fails during token exchange. Docker
returns:
@y
In GitHub Actions, the login step fails during token exchange. Docker
returns:
@z

@x
```text
connection_id is invalid
```
@y
```text
connection_id is invalid
```
@z

@x
If the workflow omits the connection ID entirely, Docker returns
`connection_id is required when subject_token_type is id_token`
instead.
@y
If the workflow omits the connection ID entirely, Docker returns
`connection_id is required when subject_token_type is id_token`
instead.
@z

@x
`connection_id is invalid` also appears when the ID is malformed, does
not exist, or the connection is deactivated or deleted. Deactivated and
deleted connections are not available for token exchange, so Docker
treats the ID as invalid.
@y
`connection_id is invalid` also appears when the ID is malformed, does
not exist, or the connection is deactivated or deleted. Deactivated and
deleted connections are not available for token exchange, so Docker
treats the ID as invalid.
@z

@x
This failure does not add a row on the **Failures** tab.
@y
This failure does not add a row on the **Failures** tab.
@z

@x
### Causes
@y
### Causes
@z

@x
- `DOCKERHUB_OIDC_CONNECTIONID` is missing from the workflow, or its
  value does not match the connection ID shown in Docker Home.
- The connection was deactivated from the **OIDC connections** action
  menu. Inactive connections use the same invalid-ID error as unknown
  IDs.
- The connection was deleted and the workflow still references the old
  ID.
@y
- `DOCKERHUB_OIDC_CONNECTIONID` is missing from the workflow, or its
  value does not match the connection ID shown in Docker Home.
- The connection was deactivated from the **OIDC connections** action
  menu. Inactive connections use the same invalid-ID error as unknown
  IDs.
- The connection was deleted and the workflow still references the old
  ID.
@z

@x
### Solutions
@y
### Solutions
@z

@x
1. In Docker Home, open **OIDC connections** and confirm the connection
   status.
1. If the connection is inactive, open the action menu and select
   **Activate**.
1. If the connection was deleted, create a new connection and update
   `DOCKERHUB_OIDC_CONNECTIONID` in every affected workflow. See
   [Create and manage OIDC connections](/manuals/security/authentication/oidc-connections/create-manage.md).
1. If the connection is active, copy the connection ID from the **Edit
   OIDC connection** page and confirm the workflow uses that exact
   value.
@y
1. In Docker Home, open **OIDC connections** and confirm the connection
   status.
1. If the connection is inactive, open the action menu and select
   **Activate**.
1. If the connection was deleted, create a new connection and update
   `DOCKERHUB_OIDC_CONNECTIONID` in every affected workflow. See
   [Create and manage OIDC connections](manuals/security/authentication/oidc-connections/create-manage.md).
1. If the connection is active, copy the connection ID from the **Edit
   OIDC connection** page and confirm the workflow uses that exact
   value.
@z

@x
## Subject token errors
@y
## Subject token errors
@z

@x
### Error message
@y
### Error message
@z

@x
In GitHub Actions, the login step fails before or during token exchange.
Docker may return one of:
@y
In GitHub Actions, the login step fails before or during token exchange.
Docker may return one of:
@z

@x
```text
subject_token is required
subject_token is invalid
subject_token has expired
subject_token audience mismatch
subject_token issuer mismatch
```
@y
```text
subject_token is required
subject_token is invalid
subject_token has expired
subject_token audience mismatch
subject_token issuer mismatch
```
@z

@x
These failures do not appear on the **Failures** tab because the
exchange fails before Docker evaluates your rulesets.
@y
These failures do not appear on the **Failures** tab because the
exchange fails before Docker evaluates your rulesets.
@z

@x
### Causes
@y
### Causes
@z

@x
- The workflow does not supply a GitHub OIDC ID token to the login step.
- The token expired, is not yet valid, or does not match the expected
  issuer or audience.
- The token cannot be verified against the provider's keys.
@y
- The workflow does not supply a GitHub OIDC ID token to the login step.
- The token expired, is not yet valid, or does not match the expected
  issuer or audience.
- The token cannot be verified against the provider's keys.
@z

@x
### Solutions
@y
### Solutions
@z

@x
1. Confirm the job grants GitHub permission to issue an OIDC token:
@y
1. Confirm the job grants GitHub permission to issue an OIDC token:
@z

@x
   ```yaml
   permissions:
     contents: read
     id-token: write
   ```
@y
   ```yaml
   permissions:
     contents: read
     id-token: write
   ```
@z

@x
1. Use `docker/login-action` version 4.5.0 or later with your
   organization name and connection ID. See
   [Configure a GitHub Actions workflow](/manuals/security/authentication/oidc-connections/create-manage.md#configure-a-github-actions-workflow).
1. Re-run the workflow so GitHub issues a fresh ID token.
@y
1. Use `docker/login-action` version 4.5.0 or later with your
   organization name and connection ID. See
   [Configure a GitHub Actions workflow](manuals/security/authentication/oidc-connections/create-manage.md#configure-a-github-actions-workflow).
1. Re-run the workflow so GitHub issues a fresh ID token.
@z

@x
## Username is not an organization
@y
## Username is not an organization
@z

@x
### Causes
@y
### Causes
@z

@x
- The `username` input to `docker/login-action` is an individual Docker Hub
  account instead of an organization name.
- Only organization accounts can sign in with OIDC connections.
@y
- The `username` input to `docker/login-action` is an individual Docker Hub
  account instead of an organization name.
- Only organization accounts can sign in with OIDC connections.
@z

@x
### Solutions
@y
### Solutions
@z

@x
1. Set `username` to the Docker organization that owns the OIDC
   connection.
1. Confirm that organization matches the one where you created the
   connection in Docker Home.
@y
1. Set `username` to the Docker organization that owns the OIDC
   connection.
1. Confirm that organization matches the one where you created the
   connection in Docker Home.
@z

@x
## Related information
@y
## Related information
@z

@x
- [Create and manage OIDC connections](/manuals/security/authentication/oidc-connections/create-manage.md)
- [View connection failures](/manuals/security/authentication/oidc-connections/create-manage.md#view-connection-failures)
- [OIDC rulesets and subject claims](/manuals/security/authentication/oidc-connections/rulesets-claims.md)
- [OIDC connections overview](/manuals/security/authentication/oidc-connections/_index.md)
@y
- [Create and manage OIDC connections](manuals/security/authentication/oidc-connections/create-manage.md)
- [View connection failures](manuals/security/authentication/oidc-connections/create-manage.md#view-connection-failures)
- [OIDC rulesets and subject claims](manuals/security/authentication/oidc-connections/rulesets-claims.md)
- [OIDC connections overview](manuals/security/authentication/oidc-connections/_index.md)
@z
