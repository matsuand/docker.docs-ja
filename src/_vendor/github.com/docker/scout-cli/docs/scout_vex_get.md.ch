%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout vex get
@y
# docker scout vex get
@z

@x
<!---MARKER_GEN_START-->
Get VEX attestation for image
@y
<!---MARKER_GEN_START-->
Get VEX attestation for image
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default                                                    | Description                                                                                             |
|:-----------------|:---------|:-----------------------------------------------------------|:--------------------------------------------------------------------------------------------------------|
| `--key`          | `string` | `https://registry.scout.docker.com/keyring/dhi/latest.pub` | Signature key to use for verification                                                                   |
| `--org`          | `string` |                                                            | Namespace of the Docker organization                                                                    |
| `-o`, `--output` | `string` |                                                            | Write the report to a file                                                                              |
| `--platform`     | `string` |                                                            | Platform of image to analyze                                                                            |
| `--ref`          | `string` |                                                            | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive |
| `--skip-tlog`    |          |                                                            | Skip signature verification against public transaction log                                              |
| `--verify`       |          |                                                            | Verify the signature on the attestation                                                                 |
@y
| Name             | Type     | Default                                                    | Description                                                                                             |
|:-----------------|:---------|:-----------------------------------------------------------|:--------------------------------------------------------------------------------------------------------|
| `--key`          | `string` | `https://registry.scout.docker.com/keyring/dhi/latest.pub` | Signature key to use for verification                                                                   |
| `--org`          | `string` |                                                            | Namespace of the Docker organization                                                                    |
| `-o`, `--output` | `string` |                                                            | Write the report to a file                                                                              |
| `--platform`     | `string` |                                                            | Platform of image to analyze                                                                            |
| `--ref`          | `string` |                                                            | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive |
| `--skip-tlog`    |          |                                                            | Skip signature verification against public transaction log                                              |
| `--verify`       |          |                                                            | Verify the signature on the attestation                                                                 |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
