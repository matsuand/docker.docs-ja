%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use the DHI MCP server
linktitle: MCP server
description: Connect an AI assistant to the Docker Hardened Images catalog using the DHI MCP server to search repositories, inspect images, view SBOMs, and check CVEs.
@y
title: Use the DHI MCP server
linktitle: MCP server
description: Connect an AI assistant to the Docker Hardened Images catalog using the DHI MCP server to search repositories, inspect images, view SBOMs, and check CVEs.
@z

@x
keywords: docker hardened images mcp, ai assistant dhi, mcp server docker, dhi catalog ai, claude cursor docker images, sbom mcp, cve mcp
@y
keywords: docker hardened images mcp, ai assistant dhi, mcp server docker, dhi catalog ai, claude cursor docker images, sbom mcp, cve mcp
@z

@x
The Docker Hardened Images (DHI) MCP server exposes the DHI catalog through the
Model Context Protocol (MCP), letting you query repositories, inspect image
metadata, retrieve SBOMs, and check CVEs directly from your AI assistant in
plain language.
@y
The Docker Hardened Images (DHI) MCP server exposes the DHI catalog through the
Model Context Protocol (MCP), letting you query repositories, inspect image
metadata, retrieve SBOMs, and check CVEs directly from your AI assistant in
plain language.
@z

@x
The MCP server is:
@y
The MCP server is:
@z

@x
- Remote. No local binary to install. Your AI assistant connects directly to
  `https://dhi.io/mcp`.
- Compatible with any MCP-capable AI assistant, including Claude,
  Cursor, and others.
@y
- Remote. No local binary to install. Your AI assistant connects directly to
  `https://dhi.io/mcp`.
- Compatible with any MCP-capable AI assistant, including Claude,
  Cursor, and others.
@z

@x
Most tools are public and require no credentials. The mirror management tools
(`dhi_list_mirrors`, `dhi_create_mirror`, `dhi_remove_mirror`) require a Docker
Hub username and personal access token (PAT) with owner access to the target
organization. Credentials are passed as an HTTP Basic auth header in the MCP
client configuration — they are never passed as tool arguments.
@y
Most tools are public and require no credentials. The mirror management tools
(`dhi_list_mirrors`, `dhi_create_mirror`, `dhi_remove_mirror`) require a Docker
Hub username and personal access token (PAT) with owner access to the target
organization. Credentials are passed as an HTTP Basic auth header in the MCP
client configuration — they are never passed as tool arguments.
@z

@x
## Connect your AI assistant
@y
## Connect your AI assistant
@z

@x
Configuration varies by client. Select the tab for your AI assistant.
@y
Configuration varies by client. Select the tab for your AI assistant.
@z

@x
{{< tabs >}}
{{< tab name="Claude Desktop" >}}
@y
{{< tabs >}}
{{< tab name="Claude Desktop" >}}
@z

@x
Add the following to your Claude Desktop configuration file:
@y
Add the following to your Claude Desktop configuration file:
@z

@x
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp"
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp"
    }
  }
}
```
@z

@x
The configuration file is located at:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
@y
The configuration file is located at:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
@z

@x
{{< /tab >}}
{{< tab name="Cursor" >}}
@y
{{< /tab >}}
{{< tab name="Cursor" >}}
@z

@x
Add the following to `.cursor/mcp.json` in your project, or
`~/.cursor/mcp.json` globally:
@y
Add the following to `.cursor/mcp.json` in your project, or
`~/.cursor/mcp.json` globally:
@z

@x
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp"
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp"
    }
  }
}
```
@z

@x
{{< /tab >}}
{{< tab name="Claude Code" >}}
@y
{{< /tab >}}
{{< tab name="Claude Code" >}}
@z

@x
Run the following command to add the DHI MCP server:
@y
Run the following command to add the DHI MCP server:
@z

@x
```console
$ claude mcp add dhi --url https://dhi.io/mcp
```
@y
```console
$ claude mcp add dhi --url https://dhi.io/mcp
```
@z

@x
Or add it manually to `.claude/mcp.json` in your project:
@y
Or add it manually to `.claude/mcp.json` in your project:
@z

@x
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp"
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp"
    }
  }
}
```
@z

@x
{{< /tab >}}
{{< tab name="Docker Agent" >}}
@y
{{< /tab >}}
{{< tab name="Docker Agent" >}}
@z

@x
In your [Docker Agent](/manuals/ai/docker-agent/_index.md) YAML configuration, add the
DHI MCP server as a remote toolset:
@y
In your [Docker Agent](manuals/ai/docker-agent/_index.md) YAML configuration, add the
DHI MCP server as a remote toolset:
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://dhi.io/mcp"
      transport_type: streamable
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://dhi.io/mcp"
      transport_type: streamable
```
@z

@x
For example, to create an agent that can answer questions about the DHI catalog:
@y
For example, to create an agent that can answer questions about the DHI catalog:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: DHI catalog assistant
    instruction: |
      Help me find and evaluate Docker Hardened Images.
      Search the DHI catalog, inspect image details, check CVEs,
      and retrieve SBOMs and attestations as needed.
    toolsets:
      - type: mcp
        remote:
          url: "https://dhi.io/mcp"
          transport_type: streamable
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: DHI catalog assistant
    instruction: |
      Help me find and evaluate Docker Hardened Images.
      Search the DHI catalog, inspect image details, check CVEs,
      and retrieve SBOMs and attestations as needed.
    toolsets:
      - type: mcp
        remote:
          url: "https://dhi.io/mcp"
          transport_type: streamable
```
@z

@x
Run the agent with:
@y
Run the agent with:
@z

@x
```console
$ docker agent run dhi-agent.yaml
```
@y
```console
$ docker agent run dhi-agent.yaml
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Available tools
@y
## Available tools
@z

@x
The DHI MCP server provides ten tools that your AI assistant calls automatically
based on what you ask:
@y
The DHI MCP server provides ten tools that your AI assistant calls automatically
based on what you ask:
@z

@x
| Tool | What it does |
|------|-------------|
| `dhi_list_repositories` | Search and filter the DHI catalog by name, type, category, FIPS, or STIG compliance |
| `dhi_get_repository` | Get full details for a repository: tag definitions, build config, platforms, and per-manifest vulnerability counts |
| `dhi_get_tag_definition` | Get the deep view of a single tag definition |
| `dhi_get_image_details` | Get per-digest details: tags, platform, size, layer and package counts, vulnerability severity counts, and attestation types |
| `dhi_get_image_packages` | Retrieve the full software bill of materials (SBOM): package name, version, type, purl, licenses, and file locations |
| `dhi_get_image_cves` | List CVEs with severity, CVSS score, fix version, EPSS score, and CISA-exploited flag; filter by minimum severity or fixable-only |
| `dhi_get_image_attestations` | List SBOM, provenance, signature, and other attestations for a specific image digest |
| `dhi_list_mirrors` | List mirrored DHI repositories for a Docker Hub organization — requires authentication |
| `dhi_create_mirror` | Start mirroring a DHI repository into a Docker Hub organization — requires authentication |
| `dhi_remove_mirror` | Stop mirroring a repository by its mirror ID — requires authentication |
@y
| Tool | What it does |
|------|-------------|
| `dhi_list_repositories` | Search and filter the DHI catalog by name, type, category, FIPS, or STIG compliance |
| `dhi_get_repository` | Get full details for a repository: tag definitions, build config, platforms, and per-manifest vulnerability counts |
| `dhi_get_tag_definition` | Get the deep view of a single tag definition |
| `dhi_get_image_details` | Get per-digest details: tags, platform, size, layer and package counts, vulnerability severity counts, and attestation types |
| `dhi_get_image_packages` | Retrieve the full software bill of materials (SBOM): package name, version, type, purl, licenses, and file locations |
| `dhi_get_image_cves` | List CVEs with severity, CVSS score, fix version, EPSS score, and CISA-exploited flag; filter by minimum severity or fixable-only |
| `dhi_get_image_attestations` | List SBOM, provenance, signature, and other attestations for a specific image digest |
| `dhi_list_mirrors` | List mirrored DHI repositories for a Docker Hub organization — requires authentication |
| `dhi_create_mirror` | Start mirroring a DHI repository into a Docker Hub organization — requires authentication |
| `dhi_remove_mirror` | Stop mirroring a repository by its mirror ID — requires authentication |
@z

@x
## Authenticate for mirror tools
@y
## Authenticate for mirror tools
@z

@x
The mirror tools require a Docker Hub username and [personal access token
(PAT)](/security/access-tokens/) with owner access to the target organization,
passed as an HTTP Basic auth header. Generate the value with:
@y
The mirror tools require a Docker Hub username and [personal access token
(PAT)](__SUBDIR__/security/access-tokens/) with owner access to the target organization,
passed as an HTTP Basic auth header. Generate the value with:
@z

@x
```console
$ printf 'USERNAME:dckr_pat_...' | base64 | tr -d '\n'
```
@y
```console
$ printf 'USERNAME:dckr_pat_...' | base64 | tr -d '\n'
```
@z

@x
Then add it to your MCP client configuration:
@y
Then add it to your MCP client configuration:
@z

@x
> [!WARNING]
> Base64 encoding is not encryption. The value in your configuration file
> is effectively a plaintext password. Do not commit this file to version
> control or share it.
@y
> [!WARNING]
> Base64 encoding is not encryption. The value in your configuration file
> is effectively a plaintext password. Do not commit this file to version
> control or share it.
@z

@x
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp",
      "headers": {
        "Authorization": "Basic <base64-value>"
      }
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "dhi": {
      "url": "https://dhi.io/mcp",
      "headers": {
        "Authorization": "Basic <base64-value>"
      }
    }
  }
}
```
@z

@x
Without credentials, the read-only catalog tools work normally and the mirror
tools return an authentication error.
@y
Without credentials, the read-only catalog tools work normally and the mirror
tools return an authentication error.
@z

@x
## What the tools return
@y
## What the tools return
@z

@x
Each tool returns structured data that your AI assistant can summarize,
compare, or act on:
@y
Each tool returns structured data that your AI assistant can summarize,
compare, or act on:
@z

@x
- `dhi_list_repositories` returns a list of repositories with display
  name, distributions, platforms, FIPS/STIG flags, included tools, and category.
- `dhi_get_repository` returns the full repository record, including all tag
  definitions with their tags, build configuration, image indexes, and
  per-platform manifest digests with vulnerability counts.
- `dhi_get_tag_definition` returns tags, build parameters, entrypoint,
  environment variables, run-as user, and per-platform manifests for a single
  tag definition.
- `dhi_get_image_details` returns the image platform, compressed size, layer
  count, package count, vulnerability severity counts by level, labels, and
  a list of attestation predicate types.
- `dhi_get_image_packages` returns each package in the image with its name,
  version, type (`deb`, `rpm`, `apk`, etc.), purl, licenses, and the file paths where
  it was found.
- `dhi_get_image_cves` returns each CVE affecting the image with its
  severity, CVSS score and vector, affected package, fix version (if any), EPSS
  probability score, and a flag indicating whether CISA lists it as
  actively exploited.
- `dhi_get_image_attestations` returns the predicate type and OCI reference
  for each attestation attached to the image digest.
- `dhi_list_mirrors` returns each mirror's ID, source DHI repository,
  destination repository, and mirroring status for the given organization.
- `dhi_create_mirror` starts mirroring a DHI source repository into the
  specified organization and destination repository name.
- `dhi_remove_mirror` stops mirroring for the given mirror ID. It does not
  delete the destination repository — only stops new images from being synced.
@y
- `dhi_list_repositories` returns a list of repositories with display
  name, distributions, platforms, FIPS/STIG flags, included tools, and category.
- `dhi_get_repository` returns the full repository record, including all tag
  definitions with their tags, build configuration, image indexes, and
  per-platform manifest digests with vulnerability counts.
- `dhi_get_tag_definition` returns tags, build parameters, entrypoint,
  environment variables, run-as user, and per-platform manifests for a single
  tag definition.
- `dhi_get_image_details` returns the image platform, compressed size, layer
  count, package count, vulnerability severity counts by level, labels, and
  a list of attestation predicate types.
- `dhi_get_image_packages` returns each package in the image with its name,
  version, type (`deb`, `rpm`, `apk`, etc.), purl, licenses, and the file paths where
  it was found.
- `dhi_get_image_cves` returns each CVE affecting the image with its
  severity, CVSS score and vector, affected package, fix version (if any), EPSS
  probability score, and a flag indicating whether CISA lists it as
  actively exploited.
- `dhi_get_image_attestations` returns the predicate type and OCI reference
  for each attestation attached to the image digest.
- `dhi_list_mirrors` returns each mirror's ID, source DHI repository,
  destination repository, and mirroring status for the given organization.
- `dhi_create_mirror` starts mirroring a DHI source repository into the
  specified organization and destination repository name.
- `dhi_remove_mirror` stops mirroring for the given mirror ID. It does not
  delete the destination repository — only stops new images from being synced.
@z
