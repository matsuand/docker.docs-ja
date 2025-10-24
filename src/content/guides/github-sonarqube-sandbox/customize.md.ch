%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Customize a code quality check workflow
linkTitle: Customize workflow
summary: Adapt your GitHub and SonarQube workflow to focus on specific quality issues, integrate with CI/CD, and set custom thresholds.
description: Learn how to customize prompts for specific quality issues, filter by file patterns, set quality thresholds, and integrate your workflow with GitHub Actions for automated code quality checks.
@y
title: Customize a code quality check workflow
linkTitle: Customize workflow
summary: Adapt your GitHub and SonarQube workflow to focus on specific quality issues, integrate with CI/CD, and set custom thresholds.
description: Learn how to customize prompts for specific quality issues, filter by file patterns, set quality thresholds, and integrate your workflow with GitHub Actions for automated code quality checks.
@z

@x
Now that you understand the basics of automating code quality workflows with
GitHub and SonarQube in E2B sandboxes, you can customize the workflow
for your needs.
@y
Now that you understand the basics of automating code quality workflows with
GitHub and SonarQube in E2B sandboxes, you can customize the workflow
for your needs.
@z

@x
## Focus on specific quality issues
@y
## Focus on specific quality issues
@z

@x
Modify the prompt to prioritize certain issue types:
@y
Modify the prompt to prioritize certain issue types:
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
## Integrate with CI/CD
@y
## Integrate with CI/CD
@z

@x
Add this workflow to GitHub Actions to run automatically on pull requests:
@y
Add this workflow to GitHub Actions to run automatically on pull requests:
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
## Filter by file patterns
@y
## Filter by file patterns
@z

@x
Target specific parts of your codebase:
@y
Target specific parts of your codebase:
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
## Set quality thresholds
@y
## Set quality thresholds
@z

@x
Define when PRs should be created:
@y
Define when PRs should be created:
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
## Next steps
@y
## Next steps
@z

@x
Learn how to troubleshoot common issues.
@y
Learn how to troubleshoot common issues.
@z
