%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: MCP Toolkit FAQs
linkTitle: FAQs
description: Frequently asked questions related to MCP Catalog and Toolkit security
keywords: MCP, Toolkit, MCP server, MCP client, security, faq
@y
title: MCP Toolkit FAQs
linkTitle: FAQ
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
--verify-signatures` CLI command.
@y
> [!NOTE]
> When using the images with [Docker MCP gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md),
> you can verify attestations at runtime using the `docker mcp gateway run
--verify-signatures` CLI command.
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
### What's the difference between profiles and the catalog?
@y
### What's the difference between profiles and the catalog?
@z

@x
The [catalog](/manuals/ai/mcp-catalog-and-toolkit/catalog.md) is the source of
available MCP servers - a library of tools you can choose from.
[Profiles](/manuals/ai/mcp-catalog-and-toolkit/profiles.md) are collections of
servers you've added to organize your work. Think of the catalog as a library,
and profiles as your personal bookshelves containing the books you've selected
for different purposes.
@y
The [catalog](manuals/ai/mcp-catalog-and-toolkit/catalog.md) is the source of
available MCP servers - a library of tools you can choose from.
[Profiles](manuals/ai/mcp-catalog-and-toolkit/profiles.md) are collections of
servers you've added to organize your work. Think of the catalog as a library,
and profiles as your personal bookshelves containing the books you've selected
for different purposes.
@z

@x
### Can I share profiles with my team?
@y
### Can I share profiles with my team?
@z

@x
Yes. Profiles can be pushed to OCI-compliant registries using
`docker mcp profile push my-profile registry.example.com/profiles/my-profile:v1`.
Team members can pull your profile with
`docker mcp profile pull registry.example.com/profiles/my-profile:v1`. Note
that credentials aren't included in shared profiles for security reasons - team
members need to configure OAuth and other credentials separately.
@y
Yes. Profiles can be pushed to OCI-compliant registries using
`docker mcp profile push my-profile registry.example.com/profiles/my-profile:v1`.
Team members can pull your profile with
`docker mcp profile pull registry.example.com/profiles/my-profile:v1`. Note
that credentials aren't included in shared profiles for security reasons - team
members need to configure OAuth and other credentials separately.
@z

@x
### Do I need to create a profile to use MCP Toolkit?
@y
### Do I need to create a profile to use MCP Toolkit?
@z

@x
Yes, MCP Toolkit requires a profile to run servers. If you're upgrading from a
version before profiles were introduced, a default profile is automatically
created for you with your existing server configurations. You can create
additional named profiles to organize servers for different projects or
environments.
@y
Yes, MCP Toolkit requires a profile to run servers. If you're upgrading from a
version before profiles were introduced, a default profile is automatically
created for you with your existing server configurations. You can create
additional named profiles to organize servers for different projects or
environments.
@z

@x
### What happens to servers when I switch profiles?
@y
### What happens to servers when I switch profiles?
@z

@x
Each profile contains its own set of servers and configurations. When you run
the gateway with `--profile profile-name`, only servers in that profile are
available to clients. The default profile is used when no profile is specified.
Switching between profiles changes which servers your AI applications can
access.
@y
Each profile contains its own set of servers and configurations. When you run
the gateway with `--profile profile-name`, only servers in that profile are
available to clients. The default profile is used when no profile is specified.
Switching between profiles changes which servers your AI applications can
access.
@z

@x
### Can I use the same server in multiple profiles?
@y
### Can I use the same server in multiple profiles?
@z

@x
Yes. You can add the same MCP server to multiple profiles, each with different
configurations if needed. This is useful when you need the same server with
different settings for different projects or environments.
@y
Yes. You can add the same MCP server to multiple profiles, each with different
configurations if needed. This is useful when you need the same server with
different settings for different projects or environments.
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
