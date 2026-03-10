%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model search
short: Search for models on Docker Hub and HuggingFace
long: |-
    Search for models from Docker Hub (ai/ namespace) and HuggingFace.
@y
command: docker model search
short: Search for models on Docker Hub and HuggingFace
long: |-
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
usage: docker model search [OPTIONS] [TERM]
@y
usage: docker model search [OPTIONS] [TERM]
@z

% pname
% plink
% options

@x json
      description: Output results as JSON
@y
      description: Output results as JSON
@z

@x limit
      description: Maximum number of results to show
@y
      description: Maximum number of results to show
@z

@x source
      description: 'Source to search: all, dockerhub, huggingface'
@y
      description: 'Source to search: all, dockerhub, huggingface'
@z

% snip directives...
