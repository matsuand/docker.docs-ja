%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Troubleshooting
description: Resolve common issues when sandboxing agents locally.
@y
title: Troubleshooting
description: Resolve common issues when sandboxing agents locally.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide helps you resolve common issues when sandboxing Claude Code locally.
@y
This guide helps you resolve common issues when sandboxing Claude Code locally.
@z

@x
<!-- vale off -->
@y
<!-- vale off -->
@z

@x
## 'sandbox' is not a docker command
@y
## 'sandbox' is not a docker command
@z

@x
<!-- vale on -->
@y
<!-- vale on -->
@z

@x
When you run `docker sandbox`, you see an error saying the command doesn't exist.
@y
When you run `docker sandbox`, you see an error saying the command doesn't exist.
@z

@x
This means the CLI plugin isn't installed or isn't in the correct location. To fix:
@y
This means the CLI plugin isn't installed or isn't in the correct location. To fix:
@z

@x
1. Verify the plugin exists:
@y
1. Verify the plugin exists:
@z

@x
   ```console
   $ ls -la ~/.docker/cli-plugins/docker-sandbox
   ```
@y
   ```console
   $ ls -la ~/.docker/cli-plugins/docker-sandbox
   ```
@z

@x
   The file should exist and be executable.
@y
   The file should exist and be executable.
@z

@x
2. If using Docker Desktop, restart it to detect the plugin.
@y
2. If using Docker Desktop, restart it to detect the plugin.
@z

@x
## "Experimental Features" needs to be enabled by your administrator
@y
## "Experimental Features" needs to be enabled by your administrator
@z

@x
You see an error about beta features being disabled when trying to use sandboxes.
@y
You see an error about beta features being disabled when trying to use sandboxes.
@z

@x
This happens when your Docker Desktop installation is managed by an
administrator who has locked settings. If your organization uses [Settings Management](/enterprise/security/hardened-desktop/settings-management/),
ask your administrator to [allow beta features](/enterprise/security/hardened-desktop/settings-management/configure-json-file/#beta-features):
@y
This happens when your Docker Desktop installation is managed by an
administrator who has locked settings. If your organization uses [Settings Management](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/),
ask your administrator to [allow beta features](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/configure-json-file/#beta-features):
@z

@x
```json
{
  "configurationFileVersion": 2,
  "allowBetaFeatures": {
    "locked": false,
    "value": true
  }
}
```
@y
```json
{
  "configurationFileVersion": 2,
  "allowBetaFeatures": {
    "locked": false,
    "value": true
  }
}
```
@z

@x
## Authentication failure
@y
## Authentication failure
@z

@x
Claude can't authenticate, or you see API key errors.
@y
Claude can't authenticate, or you see API key errors.
@z

@x
The API key is likely invalid, expired, or not configured correctly.
@y
The API key is likely invalid, expired, or not configured correctly.
@z

@x
## Workspace contains API key configuration
@y
## Workspace contains API key configuration
@z

@x
You see a warning about conflicting credentials when starting a sandbox.
@y
You see a warning about conflicting credentials when starting a sandbox.
@z

@x
This happens when your workspace has a `.claude.json` file with a `primaryApiKey` field. Choose one of these approaches:
@y
This happens when your workspace has a `.claude.json` file with a `primaryApiKey` field. Choose one of these approaches:
@z

@x
- Remove the `primaryApiKey` field from your `.claude.json`:
@y
- Remove the `primaryApiKey` field from your `.claude.json`:
@z

@x
  ```json
  {
    "apiKeyHelper": "/path/to/script",
    "env": {
      "ANTHROPIC_BASE_URL": "https://api.anthropic.com"
    }
  }
  ```
@y
  ```json
  {
    "apiKeyHelper": "/path/to/script",
    "env": {
      "ANTHROPIC_BASE_URL": "https://api.anthropic.com"
    }
  }
  ```
@z

@x
- Or proceed with the warning - workspace credentials will be ignored in favor of sandbox credentials.
@y
- Or proceed with the warning - workspace credentials will be ignored in favor of sandbox credentials.
@z

@x
## Permission denied when accessing workspace files
@y
## Permission denied when accessing workspace files
@z

@x
Claude or commands fail with "Permission denied" errors when accessing files in the workspace.
@y
Claude or commands fail with "Permission denied" errors when accessing files in the workspace.
@z

@x
This usually means the workspace path isn't accessible to Docker, or file permissions are too restrictive.
@y
This usually means the workspace path isn't accessible to Docker, or file permissions are too restrictive.
@z

@x
If using Docker Desktop:
@y
If using Docker Desktop:
@z

@x
1. Check File Sharing settings at Docker Desktop → **Settings** → **Resources** → **File Sharing**.
@y
1. Check File Sharing settings at Docker Desktop → **Settings** → **Resources** → **File Sharing**.
@z

@x
2. Ensure your workspace path (or a parent directory) is listed under Virtual file shares.
@y
2. Ensure your workspace path (or a parent directory) is listed under Virtual file shares.
@z

@x
3. If missing, click "+" to add the directory containing your workspace.
@y
3. If missing, click "+" to add the directory containing your workspace.
@z

@x
4. Restart Docker Desktop.
@y
4. Restart Docker Desktop.
@z

@x
For all platforms, verify file permissions:
@y
For all platforms, verify file permissions:
@z

@x
```console
$ ls -la <workspace>
```
@y
```console
$ ls -la <workspace>
```
@z

@x
Ensure files are readable. If needed:
@y
Ensure files are readable. If needed:
@z

@x
```console
$ chmod -R u+r <workspace>
```
@y
```console
$ chmod -R u+r <workspace>
```
@z

@x
Also verify the workspace path exists:
@y
Also verify the workspace path exists:
@z

@x
```console
$ cd <workspace>
$ pwd
```
@y
```console
$ cd <workspace>
$ pwd
```
@z
