%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
# docker scout cache prune
@y
# docker scout cache prune
@z

@x
<!---MARKER_GEN_START-->
Remove temporary or cached data
@y
<!---MARKER_GEN_START-->
Remove temporary or cached data
@z

@x
### Options
@y
### Options
@z

@x
| Name            | Type | Default | Description                    |
|:----------------|:-----|:--------|:-------------------------------|
| `--epss`        |      |         | Prune cached EPSS scores       |
| `-f`, `--force` |      |         | Do not prompt for confirmation |
| `--sboms`       |      |         | Prune cached SBOMs             |
@y
| Name            | Type | Default | Description                    |
|:----------------|:-----|:--------|:-------------------------------|
| `--epss`        |      |         | Prune cached EPSS scores       |
| `-f`, `--force` |      |         | Do not prompt for confirmation |
| `--sboms`       |      |         | Prune cached SBOMs             |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
The `docker scout cache prune` command removes temporary data and SBOM cache.
@y
The `docker scout cache prune` command removes temporary data and SBOM cache.
@z

@x
By default, `docker scout cache prune` only deletes temporary data.
To delete temporary data and clear the SBOM cache, use the `--sboms` flag.
@y
By default, `docker scout cache prune` only deletes temporary data.
To delete temporary data and clear the SBOM cache, use the `--sboms` flag.
@z

@x
## Examples
@y
## Examples
@z

@x
### Delete temporary data
@y
### Delete temporary data
@z

% snip command...

@x
### Delete temporary _and_ cache data
@y
### Delete temporary _and_ cache data
@z

% snip command...
