%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Security FAQs
linkTitle: Security FAQs
description: Frequently asked questions related to MCP Catalog and Toolkit security
keywords: MCP, Toolkit, MCP server, MCP client, security, faq
@y
title: Security FAQs
linkTitle: Security FAQs
description: Frequently asked questions related to MCP Catalog and Toolkit security
keywords: MCP, Toolkit, MCP server, MCP client, security, faq
@z

@x
Docker MCP Catalog and Toolkit is a solution for securely building, sharing, and
running MCP tools. This page answers common questions about MCP Catalog and Toolkit security.
@y
Docker MCP Catalog and Toolkit is a solution for securely building, sharing, and
running MCP tools. This page answers common questions about MCP Catalog and Toolkit security.
@z

@x
### What process does Docker follow to add a new MCP server to the catalog?
@y
### What process does Docker follow to add a new MCP server to the catalog?
@z

@x
Developers can submit a pull request to the [Docker MCP Registry](https://github.com/docker/mcp-registry) to propose new servers. Docker provides detailed [contribution guidelines](https://github.com/docker/mcp-registry/blob/main/CONTRIBUTING.md) to help developers meet the required standards.
@y
Developers can submit a pull request to the [Docker MCP Registry](https://github.com/docker/mcp-registry) to propose new servers. Docker provides detailed [contribution guidelines](https://github.com/docker/mcp-registry/blob/main/CONTRIBUTING.md) to help developers meet the required standards.
@z

@x
Currently, a majority of the servers in the catalog are built directly by Docker. Each server includes attestations such as:
@y
Currently, a majority of the servers in the catalog are built directly by Docker. Each server includes attestations such as:
@z

@x
- Build attestation: Servers are built on Docker Build Cloud.
- Source provenance: Verifiable source code origins.
- Signed SBOMs: Software Bill of Materials with cryptographic signatures.
@y
- Build attestation: Servers are built on Docker Build Cloud.
- Source provenance: Verifiable source code origins.
- Signed SBOMs: Software Bill of Materials with cryptographic signatures.
@z

@x
> [!NOTE]
> When using the images with [Docker MCP gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md),
> you can verify attestations at runtime using the `docker mcp gateway run
> --verify-signatures` CLI command.
@y
> [!NOTE]
> When using the images with [Docker MCP gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md),
> you can verify attestations at runtime using the `docker mcp gateway run
> --verify-signatures` CLI command.
@z

@x
In addition to Docker-built servers, the catalog includes select servers from trusted registries such as GitHub and HashiCorp. Each third-party server undergoes a verification process that includes:
@y
In addition to Docker-built servers, the catalog includes select servers from trusted registries such as GitHub and HashiCorp. Each third-party server undergoes a verification process that includes:
@z

@x
- Pulling and building the code in an ephemeral build environment.
- Testing initialization and functionality.
- Verifying that tools can be successfully listed.
@y
- Pulling and building the code in an ephemeral build environment.
- Testing initialization and functionality.
- Verifying that tools can be successfully listed.
@z

@x
### Under what conditions does Docker reject MCP server submissions?
@y
### Under what conditions does Docker reject MCP server submissions?
@z

@x
Docker rejects MCP server submissions that fail automated testing and validation processes during pull request review. Additionally, Docker reviewers evaluate submissions against specific requirements and reject MCP servers that don't meet these criteria.
@y
Docker rejects MCP server submissions that fail automated testing and validation processes during pull request review. Additionally, Docker reviewers evaluate submissions against specific requirements and reject MCP servers that don't meet these criteria.
@z

@x
### Does Docker take accountability for malicious MCP servers in the Toolkit?
@y
### Does Docker take accountability for malicious MCP servers in the Toolkit?
@z

@x
Docker’s security measures currently represent a best-effort approach. While Docker implements automated testing, scanning, and metadata extraction for each server in the catalog, these security measures are not yet exhaustive. Docker is actively working to enhance its security processes and expand testing coverage. Enterprise customers can contact their Docker account manager for specific security requirements and implementation details.
@y
Docker’s security measures currently represent a best-effort approach. While Docker implements automated testing, scanning, and metadata extraction for each server in the catalog, these security measures are not yet exhaustive. Docker is actively working to enhance its security processes and expand testing coverage. Enterprise customers can contact their Docker account manager for specific security requirements and implementation details.
@z

@x
### How are credentials managed for MCP servers?
@y
### How are credentials managed for MCP servers?
@z

@x
Starting with Docker Desktop version 4.43.0, credentials are stored securely in the Docker Desktop VM. The storage implementation depends on the platform (for example, macOS, WSL2). You can manage the credentials using the following CLI commands:
@y
Starting with Docker Desktop version 4.43.0, credentials are stored securely in the Docker Desktop VM. The storage implementation depends on the platform (for example, macOS, WSL2). You can manage the credentials using the following CLI commands:
@z

@x
- `docker mcp secret ls` - List stored credentials
- `docker mcp secret rm` - Remove specific credentials
- `docker mcp oauth revoke` - Revoke OAuth-based credentials
@y
- `docker mcp secret ls` - List stored credentials
- `docker mcp secret rm` - Remove specific credentials
- `docker mcp oauth revoke` - Revoke OAuth-based credentials
@z

@x
In the upcoming versions of Docker Desktop, Docker plans to support pluggable storage for these secrets and additional out-of-the-box storage providers to give users more flexibility in managing credentials.
@y
In the upcoming versions of Docker Desktop, Docker plans to support pluggable storage for these secrets and additional out-of-the-box storage providers to give users more flexibility in managing credentials.
@z

@x
### Are credentials removed when an MCP server is uninstalled?
@y
### Are credentials removed when an MCP server is uninstalled?
@z

@x
No. MCP servers are not technically uninstalled since they exist as Docker containers pulled to your local Docker Desktop. Removing an MCP server stops the container but leaves the image on your system. Even if the container is deleted, credentials remain stored until you remove them manually.
@y
No. MCP servers are not technically uninstalled since they exist as Docker containers pulled to your local Docker Desktop. Removing an MCP server stops the container but leaves the image on your system. Even if the container is deleted, credentials remain stored until you remove them manually.
@z

@x
### Why don't I see remote MCP servers in the catalog?
@y
### Why don't I see remote MCP servers in the catalog?
@z

@x
If remote MCP servers aren't visible in the Docker Desktop catalog, your local
catalog may be out of date. Remote servers are indicated by a cloud icon and
include services like GitHub, Notion, and Linear.
@y
If remote MCP servers aren't visible in the Docker Desktop catalog, your local
catalog may be out of date. Remote servers are indicated by a cloud icon and
include services like GitHub, Notion, and Linear.
@z

@x
Update your catalog by running:
@y
Update your catalog by running:
@z

% snip command...

@x
After the update completes, refresh the **Catalog** tab in Docker Desktop.
@y
After the update completes, refresh the **Catalog** tab in Docker Desktop.
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [Get started with MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/get-started.md)
- [Open-source MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@y
- [Get started with MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/get-started.md)
- [Open-source MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@z
