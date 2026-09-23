%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run sandboxes in CI
linkTitle: CI and headless
@y
title: Run sandboxes in CI
linkTitle: CI and headless
@z

@x
description: Authenticate and run Docker Sandboxes in CI systems and other headless environments.
keywords: docker sandboxes, sbx, ci, headless, automation, personal access token
@y
description: Authenticate and run Docker Sandboxes in CI systems and other headless environments.
keywords: docker sandboxes, sbx, ci, headless, automation, personal access token
@z

@x
For CI environments and scripts where a browser isn't available, authenticate
with a Docker Personal Access Token (PAT):
@y
For CI environments and scripts where a browser isn't available, authenticate
with a Docker Personal Access Token (PAT):
@z

% snip command...

@x
Generate a PAT from your
[Docker account settings](https://app.docker.com/settings/personal-access-tokens)
with at least **Read** scope.
@y
Generate a PAT from your
[Docker account settings](https://app.docker.com/settings/personal-access-tokens)
with at least **Read** scope.
@z

@x
Create the sandbox in the background with `sbx create`, run agent tasks with
`sbx exec`, and remove the sandbox when finished:
@y
Create the sandbox in the background with `sbx create`, run agent tasks with
`sbx exec`, and remove the sandbox when finished:
@z

% snip command...

@x
Agent credentials (API keys, GitHub token) can be preconfigured as global
secrets so they're available to any sandbox the CI runner creates. If the
relevant environment variables are already set in the CI environment (see the
[built-in services table](../configuration/credentials.md#built-in-services) for which
variables each service reads), import them all at once:
@y
Agent credentials (API keys, GitHub token) can be preconfigured as global
secrets so they're available to any sandbox the CI runner creates. If the
relevant environment variables are already set in the CI environment (see the
[built-in services table](../configuration/credentials.md#built-in-services) for which
variables each service reads), import them all at once:
@z

% snip command...

@x
To overwrite an existing stored entry, add `--force`. To pass a value from your
CI provider's secret store, use `-t`. For example, in a GitHub Actions step:
@y
To overwrite an existing stored entry, add `--force`. To pass a value from your
CI provider's secret store, use `-t`. For example, in a GitHub Actions step:
@z

% snip code...

@x
## Cleanup and exit codes
@y
## Cleanup and exit codes
@z

@x
Use `--force` to skip confirmation when removing resources in scripts.
Declining a removal or required-restart prompt returns a non-zero exit code.
Treat this as an incomplete operation when deciding whether to continue a
script.
@y
Use `--force` to skip confirmation when removing resources in scripts.
Declining a removal or required-restart prompt returns a non-zero exit code.
Treat this as an incomplete operation when deciding whether to continue a
script.
@z

@x
For repeatable cleanup, check which resources exist before removing them. For
example, use `sbx mcp ls` before `sbx mcp rm`, which fails for an unregistered
server even with `--force`.
@y
For repeatable cleanup, check which resources exist before removing them. For
example, use `sbx mcp ls` before `sbx mcp rm`, which fails for an unregistered
server even with `--force`.
@z
