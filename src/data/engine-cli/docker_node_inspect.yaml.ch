%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node inspect
short: Display detailed information on one or more nodes
long: |-
    Returns information about a node. By default, this command renders all results
    in a JSON array. You can specify an alternate format to execute a
    given template for each result. Go's
    [text/template](https://pkg.go.dev/text/template) package describes all the
    details of the format.
@y
command: docker node inspect
short: Display detailed information on one or more nodes
long: |-
    Returns information about a node. By default, this command renders all results
    in a JSON array. You can specify an alternate format to execute a
    given template for each result. Go's
    [text/template](https://pkg.go.dev/text/template) package describes all the
    details of the format.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node inspect [OPTIONS] self|NODE [NODE...]
pname: docker node
plink: docker_node.yaml
options:
    - option: format
      shorthand: f
      value_type: string
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pretty
      value_type: bool
      default_value: "false"
      description: Print the information in a human friendly format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Inspect a node
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker node inspect [OPTIONS] self|NODE [NODE...]
pname: docker node
plink: docker_node.yaml
options:
    - option: format
      shorthand: f
      value_type: string
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pretty
      value_type: bool
      default_value: "false"
      description: Print the information in a human friendly format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Inspect a node
@z

@x
    ```console
    $ docker node inspect swarm-manager
    ```
@y
    ```console
    $ docker node inspect swarm-manager
    ```
@z

@x
    ```json
    [
      {
        "ID": "e216jshn25ckzbvmwlnh5jr3g",
        "Version": {
          "Index": 10
        },
        "CreatedAt": "2017-05-16T22:52:44.9910662Z",
        "UpdatedAt": "2017-05-16T22:52:45.230878043Z",
        "Spec": {
          "Role": "manager",
          "Availability": "active"
        },
        "Description": {
          "Hostname": "swarm-manager",
          "Platform": {
            "Architecture": "x86_64",
            "OS": "linux"
          },
          "Resources": {
            "NanoCPUs": 1000000000,
            "MemoryBytes": 1039843328
          },
          "Engine": {
            "EngineVersion": "17.06.0-ce",
            "Plugins": [
              {
                "Type": "Volume",
                "Name": "local"
              },
              {
                "Type": "Network",
                "Name": "overlay"
              },
              {
                "Type": "Network",
                "Name": "null"
              },
              {
                "Type": "Network",
                "Name": "host"
              },
              {
                "Type": "Network",
                "Name": "bridge"
              },
              {
                "Type": "Network",
                "Name": "overlay"
              }
            ]
          },
          "TLSInfo": {
            "TrustRoot": "-----BEGIN CERTIFICATE-----\nMIIBazCCARCgAwIBAgIUOzgqU4tA2q5Yv1HnkzhSIwGyIBswCgYIKoZIzj0EAwIw\nEzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTAyMDAyNDAwWhcNMzcwNDI3MDAy\nNDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH\nA0IABMbiAmET+HZyve35ujrnL2kOLBEQhFDZ5MhxAuYs96n796sFlfxTxC1lM/2g\nAh8DI34pm3JmHgZxeBPKUURJHKWjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB\nAf8EBTADAQH/MB0GA1UdDgQWBBS3sjTJOcXdkls6WSY2rTx1KIJueTAKBggqhkjO\nPQQDAgNJADBGAiEAoeVWkaXgSUAucQmZ3Yhmx22N/cq1EPBgYHOBZmHt0NkCIQC3\nzONcJ/+WA21OXtb+vcijpUOXtNjyHfcox0N8wsLDqQ==\n-----END CERTIFICATE-----\n",
            "CertIssuerSubject": "MBMxETAPBgNVBAMTCHN3YXJtLWNh",
            "CertIssuerPublicKey": "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExuICYRP4dnK97fm6OucvaQ4sERCEUNnkyHEC5iz3qfv3qwWV/FPELWUz/aACHwMjfimbcmYeBnF4E8pRREkcpQ=="
          }
        },
        "Status": {
          "State": "ready",
          "Addr": "168.0.32.137"
        },
        "ManagerStatus": {
          "Leader": true,
          "Reachability": "reachable",
          "Addr": "168.0.32.137:2377"
        }
      }
    ]
    ```
@y
    ```json
    [
      {
        "ID": "e216jshn25ckzbvmwlnh5jr3g",
        "Version": {
          "Index": 10
        },
        "CreatedAt": "2017-05-16T22:52:44.9910662Z",
        "UpdatedAt": "2017-05-16T22:52:45.230878043Z",
        "Spec": {
          "Role": "manager",
          "Availability": "active"
        },
        "Description": {
          "Hostname": "swarm-manager",
          "Platform": {
            "Architecture": "x86_64",
            "OS": "linux"
          },
          "Resources": {
            "NanoCPUs": 1000000000,
            "MemoryBytes": 1039843328
          },
          "Engine": {
            "EngineVersion": "17.06.0-ce",
            "Plugins": [
              {
                "Type": "Volume",
                "Name": "local"
              },
              {
                "Type": "Network",
                "Name": "overlay"
              },
              {
                "Type": "Network",
                "Name": "null"
              },
              {
                "Type": "Network",
                "Name": "host"
              },
              {
                "Type": "Network",
                "Name": "bridge"
              },
              {
                "Type": "Network",
                "Name": "overlay"
              }
            ]
          },
          "TLSInfo": {
            "TrustRoot": "-----BEGIN CERTIFICATE-----\nMIIBazCCARCgAwIBAgIUOzgqU4tA2q5Yv1HnkzhSIwGyIBswCgYIKoZIzj0EAwIw\nEzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTAyMDAyNDAwWhcNMzcwNDI3MDAy\nNDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH\nA0IABMbiAmET+HZyve35ujrnL2kOLBEQhFDZ5MhxAuYs96n796sFlfxTxC1lM/2g\nAh8DI34pm3JmHgZxeBPKUURJHKWjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB\nAf8EBTADAQH/MB0GA1UdDgQWBBS3sjTJOcXdkls6WSY2rTx1KIJueTAKBggqhkjO\nPQQDAgNJADBGAiEAoeVWkaXgSUAucQmZ3Yhmx22N/cq1EPBgYHOBZmHt0NkCIQC3\nzONcJ/+WA21OXtb+vcijpUOXtNjyHfcox0N8wsLDqQ==\n-----END CERTIFICATE-----\n",
            "CertIssuerSubject": "MBMxETAPBgNVBAMTCHN3YXJtLWNh",
            "CertIssuerPublicKey": "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExuICYRP4dnK97fm6OucvaQ4sERCEUNnkyHEC5iz3qfv3qwWV/FPELWUz/aACHwMjfimbcmYeBnF4E8pRREkcpQ=="
          }
        },
        "Status": {
          "State": "ready",
          "Addr": "168.0.32.137"
        },
        "ManagerStatus": {
          "Leader": true,
          "Reachability": "reachable",
          "Addr": "168.0.32.137:2377"
        }
      }
    ]
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    ```console
    $ docker node inspect --format '{{ .ManagerStatus.Leader }}' self
@y
    ```console
    $ docker node inspect --format '{{ .ManagerStatus.Leader }}' self
@z

@x
    false
    ```
@y
    false
    ```
@z

@x
    Use `--format=pretty` or the `--pretty` shorthand to pretty-print the output:
@y
    Use `--format=pretty` or the `--pretty` shorthand to pretty-print the output:
@z

@x
    ```console
    $ docker node inspect --format=pretty self
@y
    ```console
    $ docker node inspect --format=pretty self
@z

@x
    ID:                     e216jshn25ckzbvmwlnh5jr3g
    Hostname:               swarm-manager
    Joined at:              2017-05-16 22:52:44.9910662 +0000 utc
    Status:
     State:                 Ready
     Availability:          Active
     Address:               172.17.0.2
    Manager Status:
     Address:               172.17.0.2:2377
     Raft Status:           Reachable
     Leader:                Yes
    Platform:
     Operating System:      linux
     Architecture:          x86_64
    Resources:
     CPUs:                  4
     Memory:                7.704 GiB
    Plugins:
      Network:              overlay, bridge, null, host, overlay
      Volume:               local
    Engine Version:         17.06.0-ce
    TLS Info:
     TrustRoot:
    -----BEGIN CERTIFICATE-----
    MIIBazCCARCgAwIBAgIUOzgqU4tA2q5Yv1HnkzhSIwGyIBswCgYIKoZIzj0EAwIw
    EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTAyMDAyNDAwWhcNMzcwNDI3MDAy
    NDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABMbiAmET+HZyve35ujrnL2kOLBEQhFDZ5MhxAuYs96n796sFlfxTxC1lM/2g
    Ah8DI34pm3JmHgZxeBPKUURJHKWjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
    Af8EBTADAQH/MB0GA1UdDgQWBBS3sjTJOcXdkls6WSY2rTx1KIJueTAKBggqhkjO
    PQQDAgNJADBGAiEAoeVWkaXgSUAucQmZ3Yhmx22N/cq1EPBgYHOBZmHt0NkCIQC3
    zONcJ/+WA21OXtb+vcijpUOXtNjyHfcox0N8wsLDqQ==
    -----END CERTIFICATE-----
@y
    ID:                     e216jshn25ckzbvmwlnh5jr3g
    Hostname:               swarm-manager
    Joined at:              2017-05-16 22:52:44.9910662 +0000 utc
    Status:
     State:                 Ready
     Availability:          Active
     Address:               172.17.0.2
    Manager Status:
     Address:               172.17.0.2:2377
     Raft Status:           Reachable
     Leader:                Yes
    Platform:
     Operating System:      linux
     Architecture:          x86_64
    Resources:
     CPUs:                  4
     Memory:                7.704 GiB
    Plugins:
      Network:              overlay, bridge, null, host, overlay
      Volume:               local
    Engine Version:         17.06.0-ce
    TLS Info:
     TrustRoot:
    -----BEGIN CERTIFICATE-----
    MIIBazCCARCgAwIBAgIUOzgqU4tA2q5Yv1HnkzhSIwGyIBswCgYIKoZIzj0EAwIw
    EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNTAyMDAyNDAwWhcNMzcwNDI3MDAy
    NDAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABMbiAmET+HZyve35ujrnL2kOLBEQhFDZ5MhxAuYs96n796sFlfxTxC1lM/2g
    Ah8DI34pm3JmHgZxeBPKUURJHKWjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
    Af8EBTADAQH/MB0GA1UdDgQWBBS3sjTJOcXdkls6WSY2rTx1KIJueTAKBggqhkjO
    PQQDAgNJADBGAiEAoeVWkaXgSUAucQmZ3Yhmx22N/cq1EPBgYHOBZmHt0NkCIQC3
    zONcJ/+WA21OXtb+vcijpUOXtNjyHfcox0N8wsLDqQ==
    -----END CERTIFICATE-----
@z

@x
     Issuer Public Key: MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExuICYRP4dnK97fm6OucvaQ4sERCEUNnkyHEC5iz3qfv3qwWV/FPELWUz/aACHwMjfimbcmYeBnF4E8pRREkcpQ==
     Issuer Subject:    MBMxETAPBgNVBAMTCHN3YXJtLWNh
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
     Issuer Public Key: MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExuICYRP4dnK97fm6OucvaQ4sERCEUNnkyHEC5iz3qfv3qwWV/FPELWUz/aACHwMjfimbcmYeBnF4E8pRREkcpQ==
     Issuer Subject:    MBMxETAPBgNVBAMTCHN3YXJtLWNh
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
