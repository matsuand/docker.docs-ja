%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Troubleshoot code quality workflows
linkTitle: Troubleshoot
summary: Resolve common issues with E2B sandboxes, MCP server connections, and GitHub/SonarQube integration.
description: Solutions for MCP tools not loading, authentication errors, permission issues, workflow timeouts, and other common problems when building code quality workflows with E2B.
@y
title: Troubleshoot code quality workflows
linkTitle: Troubleshoot
summary: Resolve common issues with E2B sandboxes, MCP server connections, and GitHub/SonarQube integration.
description: Solutions for MCP tools not loading, authentication errors, permission issues, workflow timeouts, and other common problems when building code quality workflows with E2B.
@z

@x
This page covers common issues you might encounter when building code quality
workflows with E2B sandboxes and MCP servers, along with their solutions.
@y
This page covers common issues you might encounter when building code quality
workflows with E2B sandboxes and MCP servers, along with their solutions.
@z

@x
If you're experiencing problems not covered here, check the
[E2B documentation](https://e2b.dev/docs).
@y
If you're experiencing problems not covered here, check the
[E2B documentation](https://e2b.dev/docs).
@z

@x
## MCP tools not available
@y
## MCP tools not available
@z

@x
Issue: Claude reports `I don't have any MCP tools available`.
@y
Issue: Claude reports `I don't have any MCP tools available`.
@z

@x
Solution:
@y
Solution:
@z

@x
1. Verify you're using the authorization header:
@y
1. Verify you're using the authorization header:
@z

% snip code...

@x
2. Check you're waiting for MCP initialization:
@y
2. Check you're waiting for MCP initialization:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
3. Ensure credentials are in both `envs` and `mcp` configuration:
@y
3. Ensure credentials are in both `envs` and `mcp` configuration:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
4. Verify your API tokens are valid and have proper scopes.
@y
4. Verify your API tokens are valid and have proper scopes.
@z

@x
## GitHub tools work but SonarQube doesn't
@y
## GitHub tools work but SonarQube doesn't
@z

@x
Issue: GitHub MCP tools load but SonarQube tools don't appear.
@y
Issue: GitHub MCP tools load but SonarQube tools don't appear.
@z

@x
Solution: SonarQube MCP server requires GitHub to be configured simultaneously.
Always include both servers in your sandbox configuration, even if you're only
testing one.
@y
Solution: SonarQube MCP server requires GitHub to be configured simultaneously.
Always include both servers in your sandbox configuration, even if you're only
testing one.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x within code
// Include both servers even if only using one
@y
// Include both servers even if only using one
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x within code
# Include both servers even if only using one
@y
# Include both servers even if only using one
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Claude can't access private repositories
@y
## Claude can't access private repositories
@z

@x
Issue: "I don't have access to that repository".
@y
Issue: "I don't have access to that repository".
@z

@x
Solution:
@y
Solution:
@z

@x
1. Verify your GitHub token has `repo` scope (not just `public_repo`).
2. Test with a public repository first.
3. Ensure the repository owner and name are correct in your `.env`:
@y
1. Verify your GitHub token has `repo` scope (not just `public_repo`).
2. Test with a public repository first.
3. Ensure the repository owner and name are correct in your `.env`:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Workflow times out or runs too long
@y
## Workflow times out or runs too long
@z

@x
Issue: Workflow doesn't complete or Claude credits run out.
@y
Issue: Workflow doesn't complete or Claude credits run out.
@z

@x
Solutions:
@y
Solutions:
@z

@x
1. Use `timeoutMs: 0` (TypeScript) or `timeout_ms=0` (Python) for complex workflows to allow unlimited time:
@y
1. Use `timeoutMs: 0` (TypeScript) or `timeout_ms=0` (Python) for complex workflows to allow unlimited time:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x within code
    timeoutMs: 0, // No timeout
@y
    timeoutMs: 0, // No timeout
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x within code
    timeout_ms=0,  # No timeout
@y
    timeout_ms=0,  # No timeout
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
2. Break complex workflows into smaller, focused tasks.
3. Monitor your Anthropic API credit usage.
4. Add checkpoints in prompts: "After each step, show progress before continuing".
@y
2. Break complex workflows into smaller, focused tasks.
3. Monitor your Anthropic API credit usage.
4. Add checkpoints in prompts: "After each step, show progress before continuing".
@z

@x
## Sandbox cleanup errors
@y
## Sandbox cleanup errors
@z

@x
Issue: Sandboxes aren't being cleaned up properly, leading to resource exhaustion.
@y
Issue: Sandboxes aren't being cleaned up properly, leading to resource exhaustion.
@z

@x
Solution: Always use proper error handling with cleanup in the `finally` block:
@y
Solution: Always use proper error handling with cleanup in the `finally` block:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x within code
      // ... configuration
@y
      // ... configuration
@z
@x
    // ... workflow logic
@y
    // ... workflow logic
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x within code
            # ... configuration
@y
            # ... configuration
@z
@x
        # ... workflow logic
@y
        # ... workflow logic
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Environment variable not loading
@y
## Environment variable not loading
@z

@x
Issue: Script fails with "undefined" or "None" for environment variables.
@y
Issue: Script fails with "undefined" or "None" for environment variables.
@z

@x
Solution:
@y
Solution:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
1. Ensure `dotenv` is loaded at the top of your file:
@y
1. Ensure `dotenv` is loaded at the top of your file:
@z

% snip code...

@x
2. Verify the `.env` file is in the same directory as your script.
@y
2. Verify the `.env` file is in the same directory as your script.
@z

@x
3. Check variable names match exactly (case-sensitive):
@y
3. Check variable names match exactly (case-sensitive):
@z

@x within code
// .env file
@y
// .env file
@z
@x
// In code
@y
// In code
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
1. Ensure `dotenv` is loaded at the top of your file:
@y
1. Ensure `dotenv` is loaded at the top of your file:
@z

% snip code...

@x
2. Verify the `.env` file is in the same directory as your script.
@y
2. Verify the `.env` file is in the same directory as your script.
@z

@x
3. Check variable names match exactly (case-sensitive):
@y
3. Check variable names match exactly (case-sensitive):
@z

@x within code
# .env file
@y
# .env file
@z
@x
# In code
@y
# In code
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## SonarQube returns empty results
@y
## SonarQube returns empty results
@z

@x
Issue: SonarQube analysis returns no projects or issues.
@y
Issue: SonarQube analysis returns no projects or issues.
@z

@x
Solution:
@y
Solution:
@z

@x
1. Verify your SonarCloud organization key is correct.
2. Ensure you have at least one project configured in SonarCloud.
3. Check that your SonarQube token has the necessary permissions.
4. Confirm your project has been analyzed at least once in SonarCloud.
@y
1. Verify your SonarCloud organization key is correct.
2. Ensure you have at least one project configured in SonarCloud.
3. Check that your SonarQube token has the necessary permissions.
4. Confirm your project has been analyzed at least once in SonarCloud.
@z
