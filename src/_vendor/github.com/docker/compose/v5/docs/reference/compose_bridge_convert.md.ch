%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose bridge convert
@y
# docker compose bridge convert
@z

@x
<!---MARKER_GEN_START-->
Convert compose files to Kubernetes manifests, Helm charts, or another model
@y
<!---MARKER_GEN_START-->
Convert compose files to Kubernetes manifests, Helm charts, or another model
@z

@x
### Options
@y
### Options
@z

@x
| Name                     | Type          | Default | Description                                                                          |
|:-------------------------|:--------------|:--------|:-------------------------------------------------------------------------------------|
| `--dry-run`              | `bool`        |         | Execute command in dry run mode                                                      |
| `-o`, `--output`         | `string`      | `out`   | The output directory for the Kubernetes resources                                    |
| `--templates`            | `string`      |         | Directory containing transformation templates                                        |
| `-t`, `--transformation` | `stringArray` |         | Transformation to apply to compose model (default: docker/compose-bridge-kubernetes) |
@y
| Name                     | Type          | Default | Description                                                                          |
|:-------------------------|:--------------|:--------|:-------------------------------------------------------------------------------------|
| `--dry-run`              | `bool`        |         | Execute command in dry run mode                                                      |
| `-o`, `--output`         | `string`      | `out`   | The output directory for the Kubernetes resources                                    |
| `--templates`            | `string`      |         | Directory containing transformation templates                                        |
| `-t`, `--transformation` | `stringArray` |         | Transformation to apply to compose model (default: docker/compose-bridge-kubernetes) |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
