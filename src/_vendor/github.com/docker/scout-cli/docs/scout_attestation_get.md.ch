%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout attestation get
@y
# docker scout attestation get
@z

@x
<!---MARKER_GEN_START-->
Get attestation for image
@y
<!---MARKER_GEN_START-->
Get attestation for image
@z

@x
### Aliases
@y
### Aliases
@z

@x
`docker scout attestation get`, `docker scout attest get`
@y
`docker scout attestation get`, `docker scout attest get`
@z

@x
### Options
@y
### Options
@z

@x
| Name               | Type     | Default                                                    | Description                                                                                             |
|:-------------------|:---------|:-----------------------------------------------------------|:--------------------------------------------------------------------------------------------------------|
| `--key`            | `string` | `https://registry.scout.docker.com/keyring/dhi/latest.pub` | Signature key to use for verification                                                                   |
| `--org`            | `string` |                                                            | Namespace of the Docker organization                                                                    |
| `-o`, `--output`   | `string` |                                                            | Write the report to a file                                                                              |
| `--platform`       | `string` |                                                            | Platform of image to analyze                                                                            |
| `--predicate`      |          |                                                            | Get in-toto predicate only dropping the subject                                                         |
| `--predicate-type` | `string` |                                                            | Predicate-type for attestation                                                                          |
| `--ref`            | `string` |                                                            | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive |
| `--skip-tlog`      |          |                                                            | Skip signature verification against public transaction log                                              |
| `--verify`         |          |                                                            | Verify the signature on the attestation                                                                 |
@y
| Name               | Type     | Default                                                    | Description                                                                                             |
|:-------------------|:---------|:-----------------------------------------------------------|:--------------------------------------------------------------------------------------------------------|
| `--key`            | `string` | `https://registry.scout.docker.com/keyring/dhi/latest.pub` | Signature key to use for verification                                                                   |
| `--org`            | `string` |                                                            | Namespace of the Docker organization                                                                    |
| `-o`, `--output`   | `string` |                                                            | Write the report to a file                                                                              |
| `--platform`       | `string` |                                                            | Platform of image to analyze                                                                            |
| `--predicate`      |          |                                                            | Get in-toto predicate only dropping the subject                                                         |
| `--predicate-type` | `string` |                                                            | Predicate-type for attestation                                                                          |
| `--ref`            | `string` |                                                            | Reference to use if the provided tarball contains multiple references.<br>Can only be used with archive |
| `--skip-tlog`      |          |                                                            | Skip signature verification against public transaction log                                              |
| `--verify`         |          |                                                            | Verify the signature on the attestation                                                                 |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
