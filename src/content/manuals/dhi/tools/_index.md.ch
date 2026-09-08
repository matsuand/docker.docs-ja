%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Tools
description: Interfaces and tools for browsing, managing, and automating Docker Hardened Images.
@y
title: Tools
description: Interfaces and tools for browsing, managing, and automating Docker Hardened Images.
@z

@x
    - title: Use Docker Hub
      description: Browse the DHI catalog on Docker Hub to search repositories, inspect image metadata, and view SBOMs, CVEs, and attestations.
      icon: squares-2x2
      link: /dhi/tools/hub/
@y
    - title: Use Docker Hub
      description: Browse the DHI catalog on Docker Hub to search repositories, inspect image metadata, and view SBOMs, CVEs, and attestations.
      icon: squares-2x2
      link: __SUBDIR__/dhi/tools/hub/
@z

@x
    - title: CLI
      description: Install and use the `docker dhi` command-line interface to browse the catalog, inspect images, and manage mirrors from your terminal.
      icon: command-line
      link: /dhi/tools/cli/
@y
    - title: CLI
      description: Install and use the `docker dhi` command-line interface to browse the catalog, inspect images, and manage mirrors from your terminal.
      icon: command-line
      link: __SUBDIR__/dhi/tools/cli/
@z

@x
    - title: MCP server
      description: Connect an AI assistant to the DHI catalog to search repositories, inspect images, retrieve SBOMs, and check CVEs using plain language.
      icon: cpu-chip
      link: /dhi/tools/mcp/
@y
    - title: MCP server
      description: Connect an AI assistant to the DHI catalog to search repositories, inspect images, retrieve SBOMs, and check CVEs using plain language.
      icon: cpu-chip
      link: __SUBDIR__/dhi/tools/mcp/
@z

@x
    - title: Use the DHI Terraform provider
      description: Use the DHI Terraform provider to manage mirrors and automate DHI configuration as infrastructure as code.
      icon: wrench-screwdriver
      link: /dhi/tools/terraform/
@y
    - title: Use the DHI Terraform provider
      description: Use the DHI Terraform provider to manage mirrors and automate DHI configuration as infrastructure as code.
      icon: wrench-screwdriver
      link: __SUBDIR__/dhi/tools/terraform/
@z

@x
    - title: Use the DHI API
      description: Query Docker Hardened Images data programmatically using the DHI GraphQL API.
      icon: code-bracket
      link: /dhi/tools/api/
@y
    - title: Use the DHI API
      description: Query Docker Hardened Images data programmatically using the DHI GraphQL API.
      icon: code-bracket
      link: __SUBDIR__/dhi/tools/api/
@z

@x
Docker Hardened Images can be accessed and managed through several interfaces.
Choose the tool that fits your workflow.
@y
Docker Hardened Images can be accessed and managed through several interfaces.
Choose the tool that fits your workflow.
@z

@x
{{< grid items="grid_tools" >}}
@y
{{< grid items="grid_tools" >}}
@z
