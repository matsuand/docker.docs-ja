%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use the DHI CLI
linkTitle: Use the CLI
@y
title: Use the DHI CLI
linkTitle: Use the CLI
@z

@x
keywords: dhictl, CLI, command line, docker hardened images
description: Learn how to install and use dhictl, the command-line interface for managing Docker Hardened Images.
@y
keywords: dhictl, CLI, command line, docker hardened images
description: Learn how to install and use dhictl, the command-line interface for managing Docker Hardened Images.
@z

@x
`dhictl` is a command-line interface (CLI) tool for managing Docker Hardened Images:
- Browse the catalog of available DHI images and their metadata
- Mirror DHI images to your Docker Hub organization
- Create and manage customizations of DHI images
- Generate authentication for enterprise package repositories
- Monitor customization builds
@y
`dhictl` is a command-line interface (CLI) tool for managing Docker Hardened Images:
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
`dhictl` will be available by default on [Docker Desktop](https://docs.docker.com/desktop/) soon.
In the meantime, you can install `dhictl` manually as a Docker CLI plugin or as a standalone binary.
@y
`dhictl` will be available by default on [Docker Desktop](https://docs.docker.com/desktop/) soon.
In the meantime, you can install `dhictl` manually as a Docker CLI plugin or as a standalone binary.
@z

@x
### Docker CLI Plugin
@y
### Docker CLI Plugin
@z

@x
1. Download the `dhictl` binary for your platform from the [releases](https://github.com/docker-hardened-images/dhictl/releases) page.
2. Rename the binary:
    - `docker-dhi` on _Linux_ and _macOS_
    - `docker-dhi.exe` on _Windows_
3. Copy it to the CLI plugins directory:
    - `$HOME/.docker/cli-plugins` on _Linux_ and _macOS_
    - `%USERPROFILE%\.docker\cli-plugins` on _Windows_
4. Make it executable on _Linux_ and _macOS_:
    - `chmod +x $HOME/.docker/cli-plugins/docker-dhi`
5. Run `docker dhi` to verify the installation.
@y
1. Download the `dhictl` binary for your platform from the [releases](https://github.com/docker-hardened-images/dhictl/releases) page.
2. Rename the binary:
    - `docker-dhi` on _Linux_ and _macOS_
    - `docker-dhi.exe` on _Windows_
3. Copy it to the CLI plugins directory:
    - `$HOME/.docker/cli-plugins` on _Linux_ and _macOS_
    - `%USERPROFILE%\.docker\cli-plugins` on _Windows_
4. Make it executable on _Linux_ and _macOS_:
    - `chmod +x $HOME/.docker/cli-plugins/docker-dhi`
5. Run `docker dhi` to verify the installation.
@z

@x
### Standalone Binary
@y
### Standalone Binary
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
> [!NOTE]
>
> The following examples use `dhictl` to reference the CLI tool. Depending on
> your installation, you may need to replace `dhictl` with `docker dhi`.
@y
> [!NOTE]
>
> The following examples use `dhictl` to reference the CLI tool. Depending on
> your installation, you may need to replace `dhictl` with `docker dhi`.
@z

@x
Every command has built-in help accessible with the `--help` flag:
@y
Every command has built-in help accessible with the `--help` flag:
@z

@x
```bash
dhictl --help
dhictl catalog list --help
```
@y
```bash
dhictl --help
dhictl catalog list --help
```
@z

@x
### Browse the DHI Catalog
@y
### Browse the DHI Catalog
@z

@x
List all available DHI images:
@y
List all available DHI images:
@z

@x
```bash
dhictl catalog list
```
@y
```bash
dhictl catalog list
```
@z

@x
Filter by type, name, or compliance:
@y
Filter by type, name, or compliance:
@z

@x
```bash
dhictl catalog list --type image
dhictl catalog list --filter golang
dhictl catalog list --fips
```
@y
```bash
dhictl catalog list --type image
dhictl catalog list --filter golang
dhictl catalog list --fips
```
@z

@x
Get details of a specific image, including available tags and CVE counts:
@y
Get details of a specific image, including available tags and CVE counts:
@z

@x
```bash
dhictl catalog get <image-name>
```
@y
```bash
dhictl catalog get <image-name>
```
@z

@x
### Mirror DHI Images {tier="DHI Select & DHI Enterprise"}
@y
### Mirror DHI Images {tier="DHI Select & DHI Enterprise"}
@z

@x
Start mirroring one or more DHI images to your Docker Hub organization:
@y
Start mirroring one or more DHI images to your Docker Hub organization:
@z

@x
```bash
dhictl mirror start --org my-org \
  -r dhi/golang,my-org/dhi-golang \
  -r dhi/nginx,my-org/dhi-nginx \
  -r dhi/prometheus-chart,my-org/dhi-prometheus-chart
```
@y
```bash
dhictl mirror start --org my-org \
  -r dhi/golang,my-org/dhi-golang \
  -r dhi/nginx,my-org/dhi-nginx \
  -r dhi/prometheus-chart,my-org/dhi-prometheus-chart
```
@z

@x
List mirrored images in your organization:
@y
List mirrored images in your organization:
@z

@x
```bash
dhictl mirror list --org my-org
```
@y
```bash
dhictl mirror list --org my-org
```
@z

@x
Stop mirroring an image:
@y
Stop mirroring an image:
@z

@x
```bash
dhictl mirror stop --org my-org dhi-golang
```
@y
```bash
dhictl mirror stop --org my-org dhi-golang
```
@z

@x
### Customize DHI Images {tier="DHI Select & DHI Enterprise"}
@y
### Customize DHI Images {tier="DHI Select & DHI Enterprise"}
@z

@x
The CLI can be used to create and manage DHI image customizations. For detailed
instructions on creating customizations, including the YAML syntax and
available options, see [Customize a Docker Hardened Image](./customize.md).
@y
The CLI can be used to create and manage DHI image customizations. For detailed
instructions on creating customizations, including the YAML syntax and
available options, see [Customize a Docker Hardened Image](./customize.md).
@z

@x
Quick reference for CLI commands:
@y
Quick reference for CLI commands:
@z

@x
```bash
# Prepare a customization scaffold
dhictl customization prepare --org my-org golang 1.25 \
  --destination my-org/dhi-golang \
  --name "golang with git" \
  --tag-suffix "_git" \
  --output my-customization.yaml
@y
```bash
# Prepare a customization scaffold
dhictl customization prepare --org my-org golang 1.25 \
  --destination my-org/dhi-golang \
  --name "golang with git" \
  --tag-suffix "_git" \
  --output my-customization.yaml
@z

@x
# Create a customization
dhictl customization create --org my-org my-customization.yaml
@y
# Create a customization
dhictl customization create --org my-org my-customization.yaml
@z

@x
# List customizations
dhictl customization list --org my-org
@y
# List customizations
dhictl customization list --org my-org
@z

@x
# Get a customization
dhictl customization get --org my-org my-org/dhi-golang "golang with git" --output my-customization.yaml
@y
# Get a customization
dhictl customization get --org my-org my-org/dhi-golang "golang with git" --output my-customization.yaml
@z

@x
# Update a customization
dhictl customization edit --org my-org my-customization.yaml
@y
# Update a customization
dhictl customization edit --org my-org my-customization.yaml
@z

@x
# Delete a customization
dhictl customization delete --org my-org my-org/dhi-golang "golang with git"
```
@y
# Delete a customization
dhictl customization delete --org my-org my-org/dhi-golang "golang with git"
```
@z

@x
### Enterprise Package Authentication {tier="DHI Enterprise"}
@y
### Enterprise Package Authentication {tier="DHI Enterprise"}
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
dhictl auth apk
```
@y
```bash
dhictl auth apk
```
@z

@x
### Monitor Customization Builds {tier="DHI Select & DHI Enterprise"}
@y
### Monitor Customization Builds {tier="DHI Select & DHI Enterprise"}
@z

@x
List builds for a customization:
@y
List builds for a customization:
@z

@x
```bash
dhictl customization build list --org my-org my-org/dhi-golang "golang with git"
```
@y
```bash
dhictl customization build list --org my-org my-org/dhi-golang "golang with git"
```
@z

@x
Get details of a specific build:
@y
Get details of a specific build:
@z

@x
```bash
dhictl customization build get --org my-org my-org/dhi-golang "golang with git" <build-id>
```
@y
```bash
dhictl customization build get --org my-org my-org/dhi-golang "golang with git" <build-id>
```
@z

@x
View build logs:
@y
View build logs:
@z

@x
```bash
dhictl customization build logs --org my-org my-org/dhi-golang "golang with git" <build-id>
```
@y
```bash
dhictl customization build logs --org my-org my-org/dhi-golang "golang with git" <build-id>
```
@z

@x
### JSON Output
@y
### JSON Output
@z

@x
Most list and get commands support a `--json` flag for machine-readable output:
@y
Most list and get commands support a `--json` flag for machine-readable output:
@z

@x
```bash
dhictl catalog list --json
dhictl mirror list --org my-org --json
dhictl customization list --org my-org --json
```
@y
```bash
dhictl catalog list --json
dhictl mirror list --org my-org --json
dhictl customization list --org my-org --json
```
@z

@x
## Configuration
@y
## Configuration
@z

@x
`dhictl` can be configured with a YAML file located at:
- `$HOME/.config/dhictl/config.yaml` on _Linux_ and _macOS_
- `%USERPROFILE%\.config\dhictl\config.yaml` on _Windows_
@y
`dhictl` can be configured with a YAML file located at:
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
