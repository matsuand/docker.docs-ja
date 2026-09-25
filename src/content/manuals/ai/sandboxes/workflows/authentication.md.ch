%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Authenticate command-line tools
linkTitle: Authenticate tools
@y
title: Authenticate command-line tools
linkTitle: Authenticate tools
@z

@x
description: Use authenticated command-line tools and dynamic secret sources inside Docker Sandboxes.
keywords: docker sandboxes, sbx, authentication, github cli, registry, 1password, aws secrets manager
@y
description: Use authenticated command-line tools and dynamic secret sources inside Docker Sandboxes.
keywords: docker sandboxes, sbx, authentication, github cli, registry, 1password, aws secrets manager
@z

@x
These workflows resolve credentials on the host for local sandboxes. For
cloud secret setup, see [Authenticate cloud agents](../cloud/credentials.md).
@y
These workflows resolve credentials on the host for local sandboxes. For
cloud secret setup, see [Authenticate cloud agents](../cloud/credentials.md).
@z

@x
The sandbox proxy handles API credentials for model providers automatically,
but agents often also need credentials for tools like `gh`, `docker`, or a
secrets manager. Configure the credential source on your host, and the proxy
injects the resolved value into matching requests from the sandbox. Dynamic
secret sources can retrieve a value from an authenticated host CLI without
copying the value into the secret store.
@y
The sandbox proxy handles API credentials for model providers automatically,
but agents often also need credentials for tools like `gh`, `docker`, or a
secrets manager. Configure the credential source on your host, and the proxy
injects the resolved value into matching requests from the sandbox. Dynamic
secret sources can retrieve a value from an authenticated host CLI without
copying the value into the secret store.
@z

@x
For secret scope and how changes apply to existing sandboxes, see
[Store a secret](../configuration/credentials.md#store-a-secret).
@y
For secret scope and how changes apply to existing sandboxes, see
[Store a secret](../configuration/credentials.md#store-a-secret).
@z

@x
## GitHub CLI
@y
## GitHub CLI
@z

@x
Store your GitHub token as a sandbox secret. The proxy injects it into
outbound requests, so `gh` works inside the sandbox without any additional
configuration:
@y
Store your GitHub token as a sandbox secret. The proxy injects it into
outbound requests, so `gh` works inside the sandbox without any additional
configuration:
@z

@x
```console
$ sbx secret set github --command 'gh auth token'
```
@y
```console
$ sbx secret set github --command 'gh auth token'
```
@z

@x
The daemon runs `gh auth token` on the host and caches its output for 55 minutes
by default. After the cache expires, it runs the command again, so token updates
from `gh` don't need to be copied into `sbx` manually. Use `--refresh on-demand`
to run the command for every credential use.
@y
The daemon runs `gh auth token` on the host and caches its output for 55 minutes
by default. After the cache expires, it runs the command again, so token updates
from `gh` don't need to be copied into `sbx` manually. Use `--refresh on-demand`
to run the command for every credential use.
@z

@x
The agent can then create pull requests, open issues, comment on PRs, and
interact with the GitHub API the same way it would from your host:
@y
The agent can then create pull requests, open issues, comment on PRs, and
interact with the GitHub API the same way it would from your host:
@z

@x
```console
# Inside the sandbox
$ gh pr create --title "feat: my feature" --body "..."
$ gh issue list
```
@y
```console
# Inside the sandbox
$ gh pr create --title "feat: my feature" --body "..."
$ gh issue list
```
@z

@x
The token is never stored in plaintext inside the sandbox. See
[GitHub token](../configuration/credentials.md#github-token) for details.
@y
The token is never stored in plaintext inside the sandbox. See
[GitHub token](../configuration/credentials.md#github-token) for details.
@z

@x
## Docker registry
@y
## Docker registry
@z

@x
When using Docker Hub, authentication is handled automatically; `sbx` reuses
your existing login session. For other registries, you need to configure
credentials for `sbx` so it can pull private [templates](../usage.md#load-a-template)
and kits when creating a sandbox:
@y
When using Docker Hub, authentication is handled automatically; `sbx` reuses
your existing login session. For other registries, you need to configure
credentials for `sbx` so it can pull private [templates](../usage.md#load-a-template)
and kits when creating a sandbox:
@z

@x
```console
$ gh auth token | sbx secret set --all-sandboxes --registry ghcr.io \
    --username <github-username> --password-stdin
$ echo "$ACR_PASSWORD" | sbx secret set --all-sandboxes \
    --registry myregistry.azurecr.io \
    --username myuser --password-stdin
```
@y
```console
$ gh auth token | sbx secret set --all-sandboxes --registry ghcr.io \
    --username <github-username> --password-stdin
$ echo "$ACR_PASSWORD" | sbx secret set --all-sandboxes \
    --registry myregistry.azurecr.io \
    --username myuser --password-stdin
```
@z

@x
Add `-g` or a sandbox name when the agent needs to run authenticated
`docker pull` or `docker push` commands from inside the sandbox. The host-side
proxy handles the registry login without writing the credential into the
sandbox.
@y
Add `-g` or a sandbox name when the agent needs to run authenticated
`docker pull` or `docker push` commands from inside the sandbox. The host-side
proxy handles the registry login without writing the credential into the
sandbox.
@z

@x
Images and containers built inside the sandbox run on the sandbox's private
Docker daemon, not your host's. They're deleted when the sandbox is removed.
@y
Images and containers built inside the sandbox run on the sandbox's private
Docker daemon, not your host's. They're deleted when the sandbox is removed.
@z

@x
For information on how registry credentials differ from other secrets,
per-registry username requirements, and all-sandbox versus per-sandbox scoping, see
[Registry credentials](../configuration/credentials.md#registry-credentials).
@y
For information on how registry credentials differ from other secrets,
per-registry username requirements, and all-sandbox versus per-sandbox scoping, see
[Registry credentials](../configuration/credentials.md#registry-credentials).
@z

@x
## Source credentials from 1Password
@y
## Source credentials from 1Password
@z

@x
Install the 1Password CLI, sign in on the host, and pass an `op://` reference to
`sbx secret set`. The secret store records the reference, and the daemon uses
`op read` on the host when the proxy needs the credential:
@y
Install the 1Password CLI, sign in on the host, and pass an `op://` reference to
`sbx secret set`. The secret store records the reference, and the daemon uses
`op read` on the host when the proxy needs the credential:
@z

@x
```console
$ sbx secret set github --ref 'op://Work/GitHub/token'
$ sbx secret set anthropic --ref 'op://Work/Anthropic/credential'
```
@y
```console
$ sbx secret set github --ref 'op://Work/GitHub/token'
$ sbx secret set anthropic --ref 'op://Work/Anthropic/credential'
```
@z

@x
The real value stays on your host, and the sandbox sees the proxy-managed
placeholder. Service secrets are cached for 55 minutes by default. To retrieve
the value from 1Password for every credential use, set the refresh policy:
@y
The real value stays on your host, and the sandbox sees the proxy-managed
placeholder. Service secrets are cached for 55 minutes by default. To retrieve
the value from 1Password for every credential use, set the refresh policy:
@z

@x
```console
$ sbx secret set anthropic \
    --ref 'op://Work/Anthropic/credential' \
    --refresh on-demand
```
@y
```console
$ sbx secret set anthropic \
    --ref 'op://Work/Anthropic/credential' \
    --refresh on-demand
```
@z

@x
## Source credentials from AWS Secrets Manager
@y
## Source credentials from AWS Secrets Manager
@z

@x
Install and authenticate the AWS CLI on the host, then register the secret's
ARN. The daemon calls AWS Secrets Manager when the proxy needs the value:
@y
Install and authenticate the AWS CLI on the host, then register the secret's
ARN. The daemon calls AWS Secrets Manager when the proxy needs the value:
@z

@x
```console
$ sbx secret set anthropic \
    --ref 'arn:aws:secretsmanager:us-west-2:123456789012:secret:anthropic-api-key'
```
@y
```console
$ sbx secret set anthropic \
    --ref 'arn:aws:secretsmanager:us-west-2:123456789012:secret:anthropic-api-key'
```
@z

@x
See [Use a dynamic secret source](../configuration/credentials.md#use-a-dynamic-secret-source)
for refresh policies, verification options, custom secrets, and provider
account or profile selection.
@y
See [Use a dynamic secret source](../configuration/credentials.md#use-a-dynamic-secret-source)
for refresh policies, verification options, custom secrets, and provider
account or profile selection.
@z
