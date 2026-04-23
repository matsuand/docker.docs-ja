%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Use the DHI CLI
linkTitle: Use the CLI
@y
title: Use the DHI CLI
linkTitle: Use the CLI
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
- Mirror DHI images to your Docker Hub organization
- Create and manage customizations of DHI images
- Generate authentication for enterprise package repositories
- Monitor customization builds
@y
The `docker dhi` command-line interface (CLI) is a tool for managing Docker Hardened Images:
- Browse the catalog of available DHI images and their metadata
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
Hardened Image](./customize.md).
@y
The CLI can be used to create and manage DHI image customizations. For detailed
instructions on creating customizations using the GUI, see [Customize a Docker
Hardened Image](./customize.md).
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

@x
```bash
# Prepare a customization scaffold
docker dhi customization prepare golang 1.25 \
  --org my-org \
  --destination my-org/dhi-golang \
  --name "golang with git" \
  --output my-customization.yaml
@y
```bash
# Prepare a customization scaffold
docker dhi customization prepare golang 1.25 \
  --org my-org \
  --destination my-org/dhi-golang \
  --name "golang with git" \
  --output my-customization.yaml
@z

@x
# Create a customization
docker dhi customization create my-customization.yaml --org my-org
@y
# Create a customization
docker dhi customization create my-customization.yaml --org my-org
@z

@x
# List customizations
docker dhi customization list --org my-org
@y
# List customizations
docker dhi customization list --org my-org
@z

@x
# Filter customizations by name, repository, or source
docker dhi customization list --org my-org --filter git
docker dhi customization list --org my-org --repo dhi-golang
docker dhi customization list --org my-org --source golang
@y
# Filter customizations by name, repository, or source
docker dhi customization list --org my-org --filter git
docker dhi customization list --org my-org --repo dhi-golang
docker dhi customization list --org my-org --source golang
@z

@x
# Get a customization
docker dhi customization get my-org/dhi-golang "golang with git" --org my-org --output my-customization.yaml
@y
# Get a customization
docker dhi customization get my-org/dhi-golang "golang with git" --org my-org --output my-customization.yaml
@z

@x
# The YAML file must include the 'id' field to identify the customization to update
docker dhi customization edit my-customization.yaml --org my-org
@y
# The YAML file must include the 'id' field to identify the customization to update
docker dhi customization edit my-customization.yaml --org my-org
@z

@x
# Delete a customization
docker dhi customization delete my-org/dhi-golang "golang with git" --org my-org
@y
# Delete a customization
docker dhi customization delete my-org/dhi-golang "golang with git" --org my-org
@z

@x
# Delete without confirmation prompt
docker dhi customization delete my-org/dhi-golang "golang with git" --org my-org --yes
```
@y
# Delete without confirmation prompt
docker dhi customization delete my-org/dhi-golang "golang with git" --org my-org --yes
```
@z

@x
### Enterprise package authentication
@y
### Enterprise package authentication
@z

@x
Generate authentication credentials for accessing the enterprise hardened
package repository. This is used when configuring your package manager to
install compliance-specific packages in your own images. For detailed
instructions, see [Enterprise
repository](./hardened-packages.md#enterprise-repository).
@y
Generate authentication credentials for accessing the enterprise hardened
package repository. This is used when configuring your package manager to
install compliance-specific packages in your own images. For detailed
instructions, see [Enterprise
repository](./hardened-packages.md#enterprise-repository).
@z

@x
```bash
docker dhi auth apk
```
@y
```bash
docker dhi auth apk
```
@z

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

@x
```bash
docker dhi customization build list my-org/dhi-golang "golang with git" --org my-org
docker dhi customization build list my-org/dhi-golang "golang with git" --org my-org --json
```
@y
```bash
docker dhi customization build list my-org/dhi-golang "golang with git" --org my-org
docker dhi customization build list my-org/dhi-golang "golang with git" --org my-org --json
```
@z

@x
Get details of a specific build:
@y
Get details of a specific build:
@z

@x
```bash
docker dhi customization build get my-org/dhi-golang "golang with git" <build-id> --org my-org
docker dhi customization build get my-org/dhi-golang "golang with git" <build-id> --org my-org --json
```
@y
```bash
docker dhi customization build get my-org/dhi-golang "golang with git" <build-id> --org my-org
docker dhi customization build get my-org/dhi-golang "golang with git" <build-id> --org my-org --json
```
@z

@x
View build logs:
@y
View build logs:
@z

@x
```bash
docker dhi customization build logs my-org/dhi-golang "golang with git" <build-id> --org my-org
docker dhi customization build logs my-org/dhi-golang "golang with git" <build-id> --org my-org --json
```
@y
```bash
docker dhi customization build logs my-org/dhi-golang "golang with git" <build-id> --org my-org
docker dhi customization build logs my-org/dhi-golang "golang with git" <build-id> --org my-org --json
```
@z

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

@x
```bash
docker dhi catalog list --json
docker dhi catalog get golang --json
docker dhi mirror list --org my-org --json
docker dhi mirror start --org my-org -r golang --json
docker dhi customization list --org my-org --json
docker dhi customization build list my-org/dhi-golang "golang with git" --org my-org --json
```
@y
```bash
docker dhi catalog list --json
docker dhi catalog get golang --json
docker dhi mirror list --org my-org --json
docker dhi mirror start --org my-org -r golang --json
docker dhi customization list --org my-org --json
docker dhi customization build list my-org/dhi-golang "golang with git" --org my-org --json
```
@z

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
If `$XDG_CONFIG_HOME` is set, the configuration file is located at `$XDG_CONFIG_HOME/dhictl/config.yaml` (see the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir/spec/latest/)).
@y
If `$XDG_CONFIG_HOME` is set, the configuration file is located at `$XDG_CONFIG_HOME/dhictl/config.yaml` (see the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir/spec/latest/)).
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
