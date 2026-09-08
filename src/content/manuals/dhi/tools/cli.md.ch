%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Use the DHI CLI
linkTitle: CLI
@y
title: Use the DHI CLI
linkTitle: CLI
@z

@x
keywords: docker dhi, CLI, command line, docker hardened images
description: Learn how to install and use docker dhi, the command-line interface for managing Docker Hardened Images.
@y
keywords: docker dhi, CLI, command line, docker hardened images
description: Learn how to install and use docker dhi, the command-line interface for managing Docker Hardened Images.
@z

@x
The `docker dhi` command-line interface (CLI) is a tool for managing Docker Hardened Images:
- Browse the catalog of available DHI images and their metadata
- View attestations for DHI images, including SBOMs and provenance
- Mirror DHI images to your Docker Hub organization
- Create and manage customizations of DHI images
- Generate authentication for enterprise package repositories
- Monitor customization builds
@y
The `docker dhi` command-line interface (CLI) is a tool for managing Docker Hardened Images:
- Browse the catalog of available DHI images and their metadata
- View attestations for DHI images, including SBOMs and provenance
- Mirror DHI images to your Docker Hub organization
- Create and manage customizations of DHI images
- Generate authentication for enterprise package repositories
- Monitor customization builds
@z

@x
## Installation
@y
## Installation
@z

@x
The `docker dhi` CLI is available in [Docker Desktop](https://docs.docker.com/desktop/) version 4.65 and later.
You can also install the standalone `dhictl` binary.
@y
The `docker dhi` CLI is available in [Docker Desktop](https://docs.docker.com/desktop/) version 4.65 and later.
You can also install the standalone `dhictl` binary.
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
The `docker dhi` command is included in Docker Desktop 4.65 and later. No additional installation is required.
@y
The `docker dhi` command is included in Docker Desktop 4.65 and later. No additional installation is required.
@z

@x
### Standalone binary
@y
### Standalone binary
@z

@x
1. Download the `dhictl` binary for your platform from the
   [releases](https://github.com/docker-hardened-images/dhictl/releases) page.
2. Move it to a directory in your `PATH`:
    - `mv dhictl /usr/local/bin/` on _Linux_ and _macOS_
    - Move `dhictl.exe` to a directory in your `PATH` on _Windows_
@y
1. Download the `dhictl` binary for your platform from the
   [releases](https://github.com/docker-hardened-images/dhictl/releases) page.
2. Move it to a directory in your `PATH`:
    - `mv dhictl /usr/local/bin/` on _Linux_ and _macOS_
    - Move `dhictl.exe` to a directory in your `PATH` on _Windows_
@z

@x
## Usage
@y
## Usage
@z

@x
Every command has built-in help accessible with the `--help` flag:
@y
Every command has built-in help accessible with the `--help` flag:
@z

% snip command...

@x
### Browse the DHI catalog
@y
### Browse the DHI catalog
@z

@x
List all available DHI images:
@y
List all available DHI images:
@z

% snip command...

@x
Filter by type, name, or compliance:
@y
Filter by type, name, or compliance:
@z

% snip command...

@x
Get details of a specific image, including available tags and CVE counts:
@y
Get details of a specific image, including available tags and CVE counts:
@z

% snip command...

@x
### Mirror DHI images
@y
### Mirror DHI images
@z

@x
Start mirroring one or more DHI images to your Docker Hub organization:
@y
Start mirroring one or more DHI images to your Docker Hub organization:
@z

% snip command...

@x
Mirror with dependencies:
@y
Mirror with dependencies:
@z

% snip command...

@x
List mirrored images in your organization:
@y
List mirrored images in your organization:
@z

% snip command...

@x
Filter mirrored images by name or type:
@y
Filter mirrored images by name or type:
@z

% snip command...

@x
Stop mirroring one or more images:
@y
Stop mirroring one or more images:
@z

% snip command...

@x
Stop mirroring and delete the repositories:
@y
Stop mirroring and delete the repositories:
@z

% snip command...

@x
### Customize DHI images
@y
### Customize DHI images
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
The CLI can be used to create and manage DHI image customizations. For detailed
instructions on creating customizations using the GUI, see [Customize a Docker
Hardened Image](../how-to/customize.md).
@y
The CLI can be used to create and manage DHI image customizations. For detailed
instructions on creating customizations using the GUI, see [Customize a Docker
Hardened Image](../how-to/customize.md).
@z

@x
The following is a quick reference for CLI commands. For complete details on all
options and flags, see the
[CLI reference](/reference/cli/docker/dhi/).
@y
The following is a quick reference for CLI commands. For complete details on all
options and flags, see the
[CLI reference](__SUBDIR__/reference/cli/docker/dhi/).
@z

@x within command...
# Prepare a single customization scaffold
@y
# Prepare a single customization scaffold
@z
@x
# Prepare a bulk customization scaffold (pipe JSON array via stdin)
@y
# Prepare a bulk customization scaffold (pipe JSON array via stdin)
@z
@x
# Create a customization
@y
# Create a customization
@z
@x
# List customizations
@y
# List customizations
@z
@x
# Filter customizations by name, repository, or source
@y
# Filter customizations by name, repository, or source
@z
@x
# Get a customization by ID
@y
# Get a customization by ID
@z
@x
# Update a customization
# The YAML file must include the 'id' field to identify the customization to update
@y
# Update a customization
# The YAML file must include the 'id' field to identify the customization to update
@z
@x
# Delete a customization by ID
@y
# Delete a customization by ID
@z
@x
# Delete multiple customizations
@y
# Delete multiple customizations
@z
@x
# Delete without confirmation prompt
@y
# Delete without confirmation prompt
@z

@x
### Enterprise package authentication
@y
### Enterprise package authentication
@z

@x
{{< summary-bar feature_name="Docker Hardened Images Enterprise" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images Enterprise" >}}
@z

@x
Generate authentication credentials for accessing the enterprise hardened
package repository. These credentials are used when configuring your package
manager to install compliance and security-patched packages in your own images. For detailed
instructions, see [Enterprise
repository](../how-to/hardened-packages.md#enterprise-repository).
@y
Generate authentication credentials for accessing the enterprise hardened
package repository. These credentials are used when configuring your package
manager to install compliance and security-patched packages in your own images. For detailed
instructions, see [Enterprise
repository](../how-to/hardened-packages.md#enterprise-repository).
@z

@x
For Alpine-based images:
@y
For Alpine-based images:
@z

% snip command...

For Debian-based images:

% snip command...

@x
### Monitor customization builds
@y
### Monitor customization builds
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
List builds for a customization:
@y
List builds for a customization:
@z

% snip command...

@x
Get details of a specific build:
@y
Get details of a specific build:
@z

% snip command...

@x
View build logs:
@y
View build logs:
@z

% snip command...

@x
### JSON output
@y
### JSON output
@z

@x
Most list and get commands support a `--json` flag for machine-readable output:
@y
Most list and get commands support a `--json` flag for machine-readable output:
@z

% snip command...

@x
## Configuration
@y
## Configuration
@z

@x
The `docker dhi` CLI can be configured with a YAML file located at:
- `$HOME/.config/dhictl/config.yaml` on _Linux_ and _macOS_
- `%USERPROFILE%\.config\dhictl\config.yaml` on _Windows_
@y
The `docker dhi` CLI can be configured with a YAML file located at:
- `$HOME/.config/dhictl/config.yaml` on _Linux_ and _macOS_
- `%USERPROFILE%\.config\dhictl\config.yaml` on _Windows_
@z

@x
If `$XDG_CONFIG_HOME` is set, the configuration file is located at `$XDG_CONFIG_HOME/dhictl/config.yaml`.
@y
If `$XDG_CONFIG_HOME` is set, the configuration file is located at `$XDG_CONFIG_HOME/dhictl/config.yaml`.
@z

@x
Available configuration options:
@y
Available configuration options:
@z

@x
| Option      | Environment Variable | Description                                                                                                               |
|-------------|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| `org`       | `DHI_ORG`            | Default Docker Hub organization for mirror and customization commands.                                                    |
| `api_token` | `DHI_API_TOKEN`      | Docker token for authentication. You can generate a token in your [Docker Hub account settings](https://hub.docker.com/). |
@y
| Option      | Environment Variable | Description                                                                                                               |
|-------------|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| `org`       | `DHI_ORG`            | Default Docker Hub organization for mirror and customization commands.                                                    |
| `api_token` | `DHI_API_TOKEN`      | Docker token for authentication. You can generate a token in your [Docker Hub account settings](https://hub.docker.com/). |
@z

@x
Environment variables take precedence over configuration file values.
@y
Environment variables take precedence over configuration file values.
@z
