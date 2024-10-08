%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm ca
short: Display and rotate the root CA
long: |-
    View or rotate the current swarm CA certificate.
@y
command: docker swarm ca
short: Display and rotate the root CA
long: |-
    View or rotate the current swarm CA certificate.
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker swarm ca [OPTIONS]
@y
usage: docker swarm ca [OPTIONS]
@z

% options:

@x ca-cert
      description: |
        Path to the PEM-formatted root CA certificate to use for the new cluster
@y
      description: |
        Path to the PEM-formatted root CA certificate to use for the new cluster
@z

@x ca-key
      description: Path to the PEM-formatted root CA key to use for the new cluster
@y
      description: Path to the PEM-formatted root CA key to use for the new cluster
@z

@x cert-expiry
      description: Validity period for node certificates (ns|us|ms|s|m|h)
@y
      description: Validity period for node certificates (ns|us|ms|s|m|h)
@z

@x detach
      description: |
        Exit immediately instead of waiting for the root rotation to converge
@y
      description: |
        Exit immediately instead of waiting for the root rotation to converge
@z

@x external-ca
      description: Specifications of one or more certificate signing endpoints
@y
      description: Specifications of one or more certificate signing endpoints
@z

@x quiet
      description: Suppress progress output
@y
      description: Suppress progress output
@z

@x rotate
      description: |
        Rotate the swarm CA - if no certificate or key are provided, new ones will be generated
@y
      description: |
        Rotate the swarm CA - if no certificate or key are provided, new ones will be generated
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    Run the `docker swarm ca` command without any options to view the current root CA certificate
    in PEM format.
@y
examples: |-
    Run the `docker swarm ca` command without any options to view the current root CA certificate
    in PEM format.
@z

@x
    ```console
    $ docker swarm ca
@y
    ```console
    $ docker swarm ca
@z

@x
    -----BEGIN CERTIFICATE-----
    MIIBazCCARCgAwIBAgIUJPzo67QC7g8Ebg2ansjkZ8CbmaswCgYIKoZIzj0EAwIw
    EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTAzMTcxMDAwWhcNMzcwNDI4MTcx
    MDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABKL6/C0sihYEb935wVPRA8MqzPLn3jzou0OJRXHsCLcVExigrMdgmLCC+Va4
    +sJ+SLVO1eQbvLHH8uuDdF/QOU6jQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
    Af8EBTADAQH/MB0GA1UdDgQWBBSfUy5bjUnBAx/B0GkOBKp91XvxzjAKBggqhkjO
    PQQDAgNJADBGAiEAnbvh0puOS5R/qvy1PMHY1iksYKh2acsGLtL/jAIvO4ACIQCi
    lIwQqLkJ48SQqCjG1DBTSBsHmMSRT+6mE2My+Z3GKA==
    -----END CERTIFICATE-----
    ```
@y
    -----BEGIN CERTIFICATE-----
    MIIBazCCARCgAwIBAgIUJPzo67QC7g8Ebg2ansjkZ8CbmaswCgYIKoZIzj0EAwIw
    EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTAzMTcxMDAwWhcNMzcwNDI4MTcx
    MDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABKL6/C0sihYEb935wVPRA8MqzPLn3jzou0OJRXHsCLcVExigrMdgmLCC+Va4
    +sJ+SLVO1eQbvLHH8uuDdF/QOU6jQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
    Af8EBTADAQH/MB0GA1UdDgQWBBSfUy5bjUnBAx/B0GkOBKp91XvxzjAKBggqhkjO
    PQQDAgNJADBGAiEAnbvh0puOS5R/qvy1PMHY1iksYKh2acsGLtL/jAIvO4ACIQCi
    lIwQqLkJ48SQqCjG1DBTSBsHmMSRT+6mE2My+Z3GKA==
    -----END CERTIFICATE-----
    ```
@z

@x
    Pass the `--rotate` flag (and optionally a `--ca-cert`, along with a `--ca-key` or
    `--external-ca` parameter flag), in order to rotate the current swarm root CA.
@y
    Pass the `--rotate` flag (and optionally a `--ca-cert`, along with a `--ca-key` or
    `--external-ca` parameter flag), in order to rotate the current swarm root CA.
@z

@x
    ```console
    $ docker swarm ca --rotate
    desired root digest: sha256:05da740cf2577a25224c53019e2cce99bcc5ba09664ad6bb2a9425d9ebd1b53e
      rotated TLS certificates:  [=========================>                         ] 1/2 nodes
      rotated CA certificates:   [>                                                  ] 0/2 nodes
    ```
@y
    ```console
    $ docker swarm ca --rotate
    desired root digest: sha256:05da740cf2577a25224c53019e2cce99bcc5ba09664ad6bb2a9425d9ebd1b53e
      rotated TLS certificates:  [=========================>                         ] 1/2 nodes
      rotated CA certificates:   [>                                                  ] 0/2 nodes
    ```
@z

@x
    Once the rotation os finished (all the progress bars have completed) the now-current
    CA certificate will be printed:
@y
    Once the rotation os finished (all the progress bars have completed) the now-current
    CA certificate will be printed:
@z

@x
    ```console
    $ docker swarm ca --rotate
    desired root digest: sha256:05da740cf2577a25224c53019e2cce99bcc5ba09664ad6bb2a9425d9ebd1b53e
      rotated TLS certificates:  [==================================================>] 2/2 nodes
      rotated CA certificates:   [==================================================>] 2/2 nodes
    -----BEGIN CERTIFICATE-----
    MIIBazCCARCgAwIBAgIUFynG04h5Rrl4lKyA4/E65tYKg8IwCgYIKoZIzj0EAwIw
    EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTE2MDAxMDAwWhcNMzcwNTExMDAx
    MDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABC2DuNrIETP7C7lfiEPk39tWaaU0I2RumUP4fX4+3m+87j0DU0CsemUaaOG6
    +PxHhGu2VXQ4c9pctPHgf7vWeVajQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
    Af8EBTADAQH/MB0GA1UdDgQWBBSEL02z6mCI3SmMDmITMr12qCRY2jAKBggqhkjO
    PQQDAgNJADBGAiEA263Eb52+825EeNQZM0AME+aoH1319Zp9/J5ijILW+6ACIQCg
    gyg5u9Iliel99l7SuMhNeLkrU7fXs+Of1nTyyM73ig==
    -----END CERTIFICATE-----
    ```
@y
    ```console
    $ docker swarm ca --rotate
    desired root digest: sha256:05da740cf2577a25224c53019e2cce99bcc5ba09664ad6bb2a9425d9ebd1b53e
      rotated TLS certificates:  [==================================================>] 2/2 nodes
      rotated CA certificates:   [==================================================>] 2/2 nodes
    -----BEGIN CERTIFICATE-----
    MIIBazCCARCgAwIBAgIUFynG04h5Rrl4lKyA4/E65tYKg8IwCgYIKoZIzj0EAwIw
    EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTE2MDAxMDAwWhcNMzcwNTExMDAx
    MDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABC2DuNrIETP7C7lfiEPk39tWaaU0I2RumUP4fX4+3m+87j0DU0CsemUaaOG6
    +PxHhGu2VXQ4c9pctPHgf7vWeVajQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
    Af8EBTADAQH/MB0GA1UdDgQWBBSEL02z6mCI3SmMDmITMr12qCRY2jAKBggqhkjO
    PQQDAgNJADBGAiEA263Eb52+825EeNQZM0AME+aoH1319Zp9/J5ijILW+6ACIQCg
    gyg5u9Iliel99l7SuMhNeLkrU7fXs+Of1nTyyM73ig==
    -----END CERTIFICATE-----
    ```
@z

@x
    ### Root CA rotation (--rotate) {#rotate}
@y
    ### Root CA rotation (--rotate) {#rotate}
@z

@x
    > [!NOTE]
    > Mirantis Kubernetes Engine (MKE), formerly known as Docker UCP, provides an external
    > certificate manager service for the swarm. If you run swarm on MKE, you shouldn't
    > rotate the CA certificates manually. Instead, contact Mirantis support if you need
    > to rotate a certificate.
@y
    > [!NOTE]
    > Mirantis Kubernetes Engine (MKE), formerly known as Docker UCP, provides an external
    > certificate manager service for the swarm. If you run swarm on MKE, you shouldn't
    > rotate the CA certificates manually. Instead, contact Mirantis support if you need
    > to rotate a certificate.
@z

@x
    Root CA Rotation is recommended if one or more of the swarm managers have been
    compromised, so that those managers can no longer connect to or be trusted by
    any other node in the cluster.
@y
    Root CA Rotation is recommended if one or more of the swarm managers have been
    compromised, so that those managers can no longer connect to or be trusted by
    any other node in the cluster.
@z

@x
    Alternately, root CA rotation can be used to give control of the swarm CA
    to an external CA, or to take control back from an external CA.
@y
    Alternately, root CA rotation can be used to give control of the swarm CA
    to an external CA, or to take control back from an external CA.
@z

@x
    The `--rotate` flag does not require any parameters to do a rotation, but you can
    optionally specify a certificate and key, or a certificate and external CA URL,
    and those will be used instead of an automatically-generated certificate/key pair.
@y
    The `--rotate` flag does not require any parameters to do a rotation, but you can
    optionally specify a certificate and key, or a certificate and external CA URL,
    and those will be used instead of an automatically-generated certificate/key pair.
@z

@x
    Because the root CA key should be kept secret, if provided it will not be visible
    when viewing swarm any information via the CLI or API.
@y
    Because the root CA key should be kept secret, if provided it will not be visible
    when viewing swarm any information via the CLI or API.
@z

@x
    The root CA rotation will not be completed until all registered nodes have
    rotated their TLS certificates.  If the rotation is not completing within a
    reasonable amount of time, try running
    `docker node ls --format '{{.ID}} {{.Hostname}} {{.Status}} {{.TLSStatus}}'` to
    see if any nodes are down or otherwise unable to rotate TLS certificates.
@y
    The root CA rotation will not be completed until all registered nodes have
    rotated their TLS certificates.  If the rotation is not completing within a
    reasonable amount of time, try running
    `docker node ls --format '{{.ID}} {{.Hostname}} {{.Status}} {{.TLSStatus}}'` to
    see if any nodes are down or otherwise unable to rotate TLS certificates.
@z

@x
    ### Run root CA rotation in detached mode (--detach) {#detach}
@y
    ### Run root CA rotation in detached mode (--detach) {#detach}
@z

@x
    Initiate the root CA rotation, but do not wait for the completion of or display the
    progress of the rotation.
deprecated: false
hidden: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    Initiate the root CA rotation, but do not wait for the completion of or display the
    progress of the rotation.
deprecated: false
hidden: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
