%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model search
@y
# docker model search
@z

@x
<!---MARKER_GEN_START-->
Search for models from Docker Hub (ai/ namespace) and HuggingFace.
@y
<!---MARKER_GEN_START-->
Search for models from Docker Hub (ai/ namespace) and HuggingFace.
@z

@x
When no search term is provided, lists all available models.
When a search term is provided, filters models by name/description.
@y
When no search term is provided, lists all available models.
When a search term is provided, filters models by name/description.
@z

@x
Examples:
  docker model search                       # List available models from Docker Hub
  docker model search llama                 # Search for models containing "llama"
  docker model search --source=all          # Search both Docker Hub and HuggingFace
  docker model search --source=huggingface  # Only search HuggingFace
  docker model search --limit=50 phi        # Search with custom limit
  docker model search --json llama          # Output as JSON
@y
Examples:
  docker model search                       # List available models from Docker Hub
  docker model search llama                 # Search for models containing "llama"
  docker model search --source=all          # Search both Docker Hub and HuggingFace
  docker model search --source=huggingface  # Only search HuggingFace
  docker model search --limit=50 phi        # Search with custom limit
  docker model search --json llama          # Output as JSON
@z

@x
### Options
@y
### オプション {#options}
@z

@x
| Name            | Type     | Default | Description                                   |
|:----------------|:---------|:--------|:----------------------------------------------|
| `--json`        | `bool`   |         | Output results as JSON                        |
| `-n`, `--limit` | `int`    | `32`    | Maximum number of results to show             |
| `--source`      | `string` | `all`   | Source to search: all, dockerhub, huggingface |
@y
| Name            | Type     | Default | Description                                   |
|:----------------|:---------|:--------|:----------------------------------------------|
| `--json`        | `bool`   |         | Output results as JSON                        |
| `-n`, `--limit` | `int`    | `32`    | Maximum number of results to show             |
| `--source`      | `string` | `all`   | Source to search: all, dockerhub, huggingface |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
