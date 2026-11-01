%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Agent Distribution"
description: "Package, share, and run agents via OCI-compatible registries — just like container images."
keywords: docker agent, ai agents, concepts, agent distribution
@y
title: "Agent Distribution"
description: "Package, share, and run agents via OCI-compatible registries — just like container images."
keywords: docker agent, ai agents, concepts, agent distribution
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/concepts/distribution/
@y
canonical: __SUBDIR__/ai/docker-agent/concepts/distribution/
@z

@x
_Package, share, and run agents via OCI-compatible registries — just like container images._
@y
_Package, share, and run agents via OCI-compatible registries — just like container images._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Agent agents can be pushed to any OCI-compatible registry (Docker Hub, GitHub Container Registry, etc.) and pulled/run anywhere. This makes sharing agents as easy as sharing Docker images.
@y
Docker Agent agents can be pushed to any OCI-compatible registry (Docker Hub, GitHub Container Registry, etc.) and pulled/run anywhere. This makes sharing agents as easy as sharing Docker images.
@z

@x
> [!TIP]
> For CLI commands related to distribution, see [CLI Reference](../../features/cli/index.md) (`docker agent share push`, `docker agent share pull`, `docker agent alias`).
@y
> [!TIP]
> For CLI commands related to distribution, see [CLI Reference](../../features/cli/index.md) (`docker agent share push`, `docker agent share pull`, `docker agent alias`).
@z

@x
## Pushing Agents
@y
## Pushing Agents
@z

@x
```bash
# Push to Docker Hub
$ docker agent share push ./agent.yaml docker.io/username/my-agent:latest
@y
```bash
# Push to Docker Hub
$ docker agent share push ./agent.yaml docker.io/username/my-agent:latest
@z

@x
# Push to GitHub Container Registry
$ docker agent share push ./agent.yaml ghcr.io/username/my-agent:v1.0
```
@y
# Push to GitHub Container Registry
$ docker agent share push ./agent.yaml ghcr.io/username/my-agent:v1.0
```
@z

@x
## Pulling Agents
@y
## Pulling Agents
@z

@x
```bash
# Pull an agent
$ docker agent share pull docker.io/username/my-agent:latest
@y
```bash
# Pull an agent
$ docker agent share pull docker.io/username/my-agent:latest
@z

@x
# Pull from Docker Hub shorthand
$ docker agent share pull myorg/agent:tag
```
@y
# Pull from Docker Hub shorthand
$ docker agent share pull myorg/agent:tag
```
@z

@x
## Signing and Encrypting Agents
@y
## Signing and Encrypting Agents
@z

@x
`share push --key <key>` protects the agent so that pullers holding the matching key can check it was published by you and has not been altered. The YAML is **always pushed in clear**; only the proof goes into the OCI manifest annotations. `share pull --key <key>` performs the check and refuses the artifact if it fails.
@y
`share push --key <key>` protects the agent so that pullers holding the matching key can check it was published by you and has not been altered. The YAML is **always pushed in clear**; only the proof goes into the OCI manifest annotations. `share pull --key <key>` performs the check and refuses the artifact if it fails.
@z

@x
The key is given inline, or as a path prefixed with `file://` (a plain prefix, not a URL: `file://./agent.key`, `file:///etc/agent.key`, `file://~/.ssh/id_ed25519` and `file://C:\keys\agent.key` all work; there is no percent-decoding). Inline material that itself starts with `file://` cannot be passed inline — use the file form instead. `DOCKER_AGENT_ENCRYPT_KEY` accepts the same forms and is used when `--key` is not set.
@y
The key is given inline, or as a path prefixed with `file://` (a plain prefix, not a URL: `file://./agent.key`, `file:///etc/agent.key`, `file://~/.ssh/id_ed25519` and `file://C:\keys\agent.key` all work; there is no percent-decoding). Inline material that itself starts with `file://` cannot be passed inline — use the file form instead. `DOCKER_AGENT_ENCRYPT_KEY` accepts the same forms and is used when `--key` is not set.
@z

@x
```bash
# Asymmetric: sign with a private key, verify with the public key
$ docker agent share push ./agent.yaml myorg/agent:v1 --key file://~/.ssh/id_ed25519
$ docker agent share pull myorg/agent:v1 --key file://~/.ssh/id_ed25519.pub
@y
```bash
# Asymmetric: sign with a private key, verify with the public key
$ docker agent share push ./agent.yaml myorg/agent:v1 --key file://~/.ssh/id_ed25519
$ docker agent share pull myorg/agent:v1 --key file://~/.ssh/id_ed25519.pub
@z

@x
# Symmetric: same secret on both sides
$ openssl rand -hex 32 > agent.key
$ docker agent share push ./agent.yaml myorg/agent:v1 --key file://agent.key
$ docker agent share pull myorg/agent:v1 --key file://agent.key
@y
# Symmetric: same secret on both sides
$ openssl rand -hex 32 > agent.key
$ docker agent share push ./agent.yaml myorg/agent:v1 --key file://agent.key
$ docker agent share pull myorg/agent:v1 --key file://agent.key
@z

@x
# Symmetric, inline
$ docker agent share push ./agent.yaml myorg/agent:v1 --key "$(openssl rand -hex 32)"
```
@y
# Symmetric, inline
$ docker agent share push ./agent.yaml myorg/agent:v1 --key "$(openssl rand -hex 32)"
```
@z

@x
### Key formats
@y
### Key formats
@z

@x
The key kind is detected from its contents:
@y
The key kind is detected from its contents:
@z

@x
| Key contents                                               | Kind       | Sign | Verify | `--encrypt` |
| ---------------------------------------------------------- | ---------- | ---- | ------ | ----------- |
| PEM / OpenSSH **Ed25519** private key                      | asymmetric | ✓    | ✓      | ✗           |
| PEM / OpenSSH **ECDSA** or **RSA** private key             | asymmetric | ✓    | ✓      | ✓           |
| PEM / OpenSSH public key (`.pub`)                          | asymmetric | ✗    | ✓      | ✗           |
| Anything else: a raw **secret** of at least 16 bytes       | symmetric  | ✓    | ✓      | ✓           |
@y
| Key contents                                               | Kind       | Sign | Verify | `--encrypt` |
| ---------------------------------------------------------- | ---------- | ---- | ------ | ----------- |
| PEM / OpenSSH **Ed25519** private key                      | asymmetric | ✓    | ✓      | ✗           |
| PEM / OpenSSH **ECDSA** or **RSA** private key             | asymmetric | ✓    | ✓      | ✓           |
| PEM / OpenSSH public key (`.pub`)                          | asymmetric | ✗    | ✓      | ✗           |
| Anything else: a raw **secret** of at least 16 bytes       | symmetric  | ✓    | ✓      | ✓           |
@z

@x
Passphrase-protected keys are not supported. Anything containing a PEM boundary (`-----BEGIN`) or an OpenSSH key-type marker (`ssh-`, `ecdsa-sha2-`, `sk-ssh-`, `sk-ecdsa-`) anywhere is treated as a key and rejected if it does not parse — a broken public key is never silently used as a secret. Symmetric secrets can be guessed offline against the public YAML, so use random material (`openssl rand -hex 32`), not a password.
@y
Passphrase-protected keys are not supported. Anything containing a PEM boundary (`-----BEGIN`) or an OpenSSH key-type marker (`ssh-`, `ecdsa-sha2-`, `sk-ssh-`, `sk-ecdsa-`) anywhere is treated as a key and rejected if it does not parse — a broken public key is never silently used as a secret. Symmetric secrets can be guessed offline against the public YAML, so use random material (`openssl rand -hex 32`), not a password.
@z

@x
### Modes
@y
### Modes
@z

@x
- **Sign** (default): records a signature (private key) or an HMAC (secret) over an in-toto statement describing the artifact. Anyone with the public key or secret can verify integrity, provenance, and that the artifact is served from the reference it was published as.
- **Encrypt** (`--encrypt`): additionally records an authenticated encrypted copy of the whole YAML. Holders of the secret or private key can recover the YAML from the annotation alone, without the layer. With an asymmetric key this requires the private key and a signature is still recorded — a copy encrypted to a public key could have been produced by anyone, so it proves nothing on its own.
@y
- **Sign** (default): records a signature (private key) or an HMAC (secret) over an in-toto statement describing the artifact. Anyone with the public key or secret can verify integrity, provenance, and that the artifact is served from the reference it was published as.
- **Encrypt** (`--encrypt`): additionally records an authenticated encrypted copy of the whole YAML. Holders of the secret or private key can recover the YAML from the annotation alone, without the layer. With an asymmetric key this requires the private key and a signature is still recorded — a copy encrypted to a public key could have been produced by anyone, so it proves nothing on its own.
@z

@x
The pull side never needs to choose: the annotations describe what was recorded, and verification checks whatever is present. With an asymmetric key the artifact must carry a signature, which also prevents downgrading a signed artifact to an encrypted-only one.
@y
The pull side never needs to choose: the annotations describe what was recorded, and verification checks whatever is present. With an asymmetric key the artifact must carry a signature, which also prevents downgrading a signed artifact to an encrypted-only one.
@z

@x
### Signed metadata (DSSE + in-toto)
@y
### Signed metadata (DSSE + in-toto)
@z

@x
A signature does not cover the YAML directly: it covers an [in-toto Statement v1](https://github.com/in-toto/attestation/blob/main/spec/v1/statement.md) carried in a [DSSE envelope](https://github.com/secure-systems-lab/dsse) (`application/vnd.dsse.envelope.v1+json`), recorded in clear in the `io.docker.agent.attestation` annotation. The format is the one cosign and in-toto tooling use, so the attestation can be read and verified without Docker Agent.
@y
A signature does not cover the YAML directly: it covers an [in-toto Statement v1](https://github.com/in-toto/attestation/blob/main/spec/v1/statement.md) carried in a [DSSE envelope](https://github.com/secure-systems-lab/dsse) (`application/vnd.dsse.envelope.v1+json`), recorded in clear in the `io.docker.agent.attestation` annotation. The format is the one cosign and in-toto tooling use, so the attestation can be read and verified without Docker Agent.
@z

@x
The manifest carries two annotations for it:
@y
The manifest carries two annotations for it:
@z

@x
| Annotation                     | Contents                                                              |
| ------------------------------ | --------------------------------------------------------------------- |
| `io.docker.agent.attestation`  | base64 of the DSSE envelope (`application/vnd.dsse.envelope.v1+json`) |
| `in-toto.io/predicate-type`    | the statement's `predicateType`, so consumers can filter without decoding |
@y
| Annotation                     | Contents                                                              |
| ------------------------------ | --------------------------------------------------------------------- |
| `io.docker.agent.attestation`  | base64 of the DSSE envelope (`application/vnd.dsse.envelope.v1+json`) |
| `in-toto.io/predicate-type`    | the statement's `predicateType`, so consumers can filter without decoding |
@z

@x
`in-toto.io/predicate-type` is the same key BuildKit puts on its in-toto attestation layers. It is a convenience hint outside the signature: verification always uses the `predicateType` inside the signed statement and ignores the annotation.
@y
`in-toto.io/predicate-type` is the same key BuildKit puts on its in-toto attestation layers. It is a convenience hint outside the signature: verification always uses the `predicateType` inside the signed statement and ignores the annotation.
@z

@x
```json
{
  "_type": "https://in-toto.io/Statement/v1",
  "subject": [
    {
      "name": "index.docker.io/myorg/agent:v1",
      "digest": { "sha256": "889871ef7773a7f535b04b7c79c456ce7f0f70983a3f073d33b2cee07f9939dc" }
    }
  ],
  "predicateType": "https://docker.com/docker-agent/share/publication/v1",
  "predicate": {
    "registry": "index.docker.io",
    "repository": "myorg/agent",
    "tag": "v1",
    "created": "2026-09-11T08:30:00Z"
  }
}
```
@y
```json
{
  "_type": "https://in-toto.io/Statement/v1",
  "subject": [
    {
      "name": "index.docker.io/myorg/agent:v1",
      "digest": { "sha256": "889871ef7773a7f535b04b7c79c456ce7f0f70983a3f073d33b2cee07f9939dc" }
    }
  ],
  "predicateType": "https://docker.com/docker-agent/share/publication/v1",
  "predicate": {
    "registry": "index.docker.io",
    "repository": "myorg/agent",
    "tag": "v1",
    "created": "2026-09-11T08:30:00Z"
  }
}
```
@z

@x
The `subject` is the security-critical part: `name` is the fully qualified reference the artifact was published as, and `digest` (bare hex, as in-toto requires) covers the agent YAML as stored in the layer. The digest binds the statement to the YAML, so a valid statement paired with a different layer is rejected. The name binds it to a location, which is what makes a signed artifact copied to another repository or tag detectable. The `predicate` carries the publication metadata.
@y
The `subject` is the security-critical part: `name` is the fully qualified reference the artifact was published as, and `digest` (bare hex, as in-toto requires) covers the agent YAML as stored in the layer. The digest binds the statement to the YAML, so a valid statement paired with a different layer is rejected. The name binds it to a location, which is what makes a signed artifact copied to another repository or tag detectable. The `predicate` carries the publication metadata.
@z

@x
Because the envelope is stored in clear, anyone can read the metadata; because it is signed, only a key holder can have produced it. The signature covers the DSSE pre-authentication encoding `PAE("application/vnd.in-toto+json", <statement bytes>)`, and verification always uses the bytes exactly as received — never a re-serialized copy. The `keyid` in the envelope is an unauthenticated hint and never drives a verification decision.
@y
Because the envelope is stored in clear, anyone can read the metadata; because it is signed, only a key holder can have produced it. The signature covers the DSSE pre-authentication encoding `PAE("application/vnd.in-toto+json", <statement bytes>)`, and verification always uses the bytes exactly as received — never a re-serialized copy. The `keyid` in the envelope is an unauthenticated hint and never drives a verification decision.
@z

@x
On pull the metadata is printed once verification succeeds:
@y
On pull the metadata is printed once verification succeeds:
@z

@x
```console
$ docker agent share pull myorg/agent:v1 --key file://~/.ssh/id_ed25519.pub
Pulling agent myorg/agent:v1
Verified signature (ed25519)
  image:   index.docker.io/myorg/agent:v1
  digest:  sha256:889871ef7773a7f535b04b7c79c456ce7f0f70983a3f073d33b2cee07f9939dc
  created: 2026-09-11T08:30:00Z
Agent saved to myorg_agent:v1.yaml
```
@y
```console
$ docker agent share pull myorg/agent:v1 --key file://~/.ssh/id_ed25519.pub
Pulling agent myorg/agent:v1
Verified signature (ed25519)
  image:   index.docker.io/myorg/agent:v1
  digest:  sha256:889871ef7773a7f535b04b7c79c456ce7f0f70983a3f073d33b2cee07f9939dc
  created: 2026-09-11T08:30:00Z
Agent saved to myorg_agent:v1.yaml
```
@z

@x
The metadata is readable without a key too, but only a signature check makes it trustworthy:
@y
The metadata is readable without a key too, but only a signature check makes it trustworthy:
@z

@x
```bash
$ docker buildx imagetools inspect docker.io/myorg/agent:v1 --raw \
    | jq -r '.annotations["io.docker.agent.attestation"]' | base64 -d \
    | jq -r .payload | base64 -d | jq .
```
@y
```bash
$ docker buildx imagetools inspect docker.io/myorg/agent:v1 --raw \
    | jq -r '.annotations["io.docker.agent.attestation"]' | base64 -d \
    | jq -r .payload | base64 -d | jq .
```
@z

@x
Encrypt mode with a symmetric secret records the encrypted copy only — it is proof by itself — so such an artifact carries no signature and no attestation (and no predicate-type annotation).
@y
Encrypt mode with a symmetric secret records the encrypted copy only — it is proof by itself — so such an artifact carries no signature and no attestation (and no predicate-type annotation).
@z

@x
#### Adding metadata later
@y
#### Adding metadata later
@z

@x
The two halves of the statement are treated differently on purpose:
@y
The two halves of the statement are treated differently on purpose:
@z

@x
- The **statement** is strict. `_type`, `subject` (with its digest set) and `predicateType` are what bind an artifact to its bytes and its location, so a verifier rejects unknown fields there.
- The **predicate** is lenient. Fields a future version adds are surfaced as opaque values rather than rejected, and an unknown `predicateType` yields "signature valid, predicate not understood" instead of a failure.
@y
- The **statement** is strict. `_type`, `subject` (with its digest set) and `predicateType` are what bind an artifact to its bytes and its location, so a verifier rejects unknown fields there.
- The **predicate** is lenient. Fields a future version adds are surfaced as opaque values rather than rejected, and an unknown `predicateType` yields "signature valid, predicate not understood" instead of a failure.
@z

@x
So new publication metadata can be added without breaking already-deployed verifiers. The `predicateType` URI is the version: a breaking change to the predicate shape gets a new URI, and old verifiers report the predicate as not understood while still checking the signature and the subject binding.
@y
So new publication metadata can be added without breaking already-deployed verifiers. The `predicateType` URI is the version: a breaking change to the predicate shape gets a new URI, and old verifiers report the predicate as not understood while still checking the signature and the subject binding.
@z

@x
### Verifying when running
@y
### Verifying when running
@z

@x
Programs embedding Docker Agent can pass `ocisource.WithVerificationKey(key)` to `sources.Resolve` or `ocisource.New` so an OCI-sourced agent is verified on every read, including that the attestation names the reference being read. Import `pkg/config/sources` and `pkg/config/ocisource` from `github.com/docker/docker-agent`.
@y
Programs embedding Docker Agent can pass `ocisource.WithVerificationKey(key)` to `sources.Resolve` or `ocisource.New` so an OCI-sourced agent is verified on every read, including that the attestation names the reference being read. Import `pkg/config/sources` and `pkg/config/ocisource` from `github.com/docker/docker-agent`.
@z

@x
### What the signature does and does not cover
@y
### What the signature does and does not cover
@z

@x
The attestation authenticates the agent YAML and where it was published — nothing else in the manifest.
@y
The attestation authenticates the agent YAML and where it was published — nothing else in the manifest.
@z

@x
| Authenticated (in the signed statement)                     | Not authenticated                                                                                                                                                             |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The agent YAML bytes, via the subject `digest`              | `org.opencontainers.image.authors`, `.licenses`, `.revision`, `.description`                                                                                                    |
| The published reference, via the subject `name`             | `io.docker.agent.tags`, `io.docker.agent.version`, `io.docker.cagent.version`                                                                                                   |
| `predicateType`, and the predicate (registry, repository, tag, creation date) | `in-toto.io/predicate-type` (a hint; the signed value is inside the envelope) and the `org.opencontainers.image.created` annotation — the signed copy is in the predicate |
@y
| Authenticated (in the signed statement)                     | Not authenticated                                                                                                                                                             |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The agent YAML bytes, via the subject `digest`              | `org.opencontainers.image.authors`, `.licenses`, `.revision`, `.description`                                                                                                    |
| The published reference, via the subject `name`             | `io.docker.agent.tags`, `io.docker.agent.version`, `io.docker.cagent.version`                                                                                                   |
| `predicateType`, and the predicate (registry, repository, tag, creation date) | `in-toto.io/predicate-type` (a hint; the signed value is inside the envelope) and the `org.opencontainers.image.created` annotation — the signed copy is in the predicate |
@z

@x
The subject digest covers the agent YAML layer, not the manifest: annotations are part of the manifest, so a manifest digest could not be recorded inside one without a circular dependency.
@y
The subject digest covers the agent YAML layer, not the manifest: annotations are part of the manifest, so a manifest digest could not be recorded inside one without a circular dependency.
@z

@x
The practical consequence is that anyone who can push to the repository can rewrite the unauthenticated annotations of a signed artifact and the signature still verifies — the agent YAML they describe cannot be changed, but the metadata around it can. **Do not build policy on those annotations.** Use the values the pull side prints after verification, which come from the signed statement, and treat everything else in the manifest as advisory. Note that `created` appears in both places: `share pull --key` reports the signed one, so a rewritten annotation does not change what a verifying client sees.
@y
The practical consequence is that anyone who can push to the repository can rewrite the unauthenticated annotations of a signed artifact and the signature still verifies — the agent YAML they describe cannot be changed, but the metadata around it can. **Do not build policy on those annotations.** Use the values the pull side prints after verification, which come from the signed statement, and treat everything else in the manifest as advisory. Note that `created` appears in both places: `share pull --key` reports the signed one, so a rewritten annotation does not change what a verifying client sees.
@z

@x
Authenticating the whole manifest would mean publishing the envelope as a referring artifact (OCI Referrers API) so the subject can be the manifest digest, which also covers every annotation. That is also what would make the attestation discoverable by `cosign verify-attestation`: the envelope here is a conformant DSSE/in-toto object, but tools that expect attestations as referring artifacts will not find it in an annotation.
@y
Authenticating the whole manifest would mean publishing the envelope as a referring artifact (OCI Referrers API) so the subject can be the manifest digest, which also covers every annotation. That is also what would make the attestation discoverable by `cosign verify-attestation`: the envelope here is a conformant DSSE/in-toto object, but tools that expect attestations as referring artifacts will not find it in an annotation.
@z

@x
### Other limitations
@y
### Other limitations
@z

@x
The metadata in the predicate is what the publisher declared, not a verified identity: a valid signature proves a key holder published an artifact claiming that metadata, not that the claim is true.
@y
The metadata in the predicate is what the publisher declared, not a verified identity: a valid signature proves a key holder published an artifact claiming that metadata, not that the claim is true.
@z

@x
Serving an older signed version under the same tag is not detected: the attestation records the tag, not which version is current. Pin digests (`myorg/agent@sha256:…`) when rollback protection matters.
@y
Serving an older signed version under the same tag is not detected: the attestation records the tag, not which version is current. Pin digests (`myorg/agent@sha256:…`) when rollback protection matters.
@z

@x
## Running from a Registry
@y
## Running from a Registry
@z

@x
Run agents directly from a registry without pulling first:
@y
Run agents directly from a registry without pulling first:
@z

@x
```bash
# Run directly from Docker Hub
$ docker agent run docker.io/username/my-agent:latest
@y
```bash
# Run directly from Docker Hub
$ docker agent run docker.io/username/my-agent:latest
@z

@x
# Docker Hub shorthand (docker.io is implied)
$ docker agent run myorg/agent:tag
@y
# Docker Hub shorthand (docker.io is implied)
$ docker agent run myorg/agent:tag
@z

@x
# Run with a specific agent from a multi-agent config
$ docker agent run docker.io/username/dev-team:latest -a developer
```
@y
# Run with a specific agent from a multi-agent config
$ docker agent run docker.io/username/dev-team:latest -a developer
```
@z

@x
## Using as Sub-Agents
@y
## Using as Sub-Agents
@z

@x
Registry agents can be used directly as sub-agents in a multi-agent configuration — no need to define them locally:
@y
Registry agents can be used directly as sub-agents in a multi-agent configuration — no need to define them locally:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    description: Coordinator
    instruction: Delegate tasks to the right sub-agent.
    sub_agents:
      - myorg/agent:tag             # auto-named "agent"
      - my_reviewer:myorg/reviewer  # explicitly named "my_reviewer"
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    description: Coordinator
    instruction: Delegate tasks to the right sub-agent.
    sub_agents:
      - myorg/agent:tag             # auto-named "agent"
      - my_reviewer:myorg/reviewer  # explicitly named "my_reviewer"
```
@z

@x
External sub-agents are automatically named after their last path segment. Use the `name:reference` syntax to give them a custom name.
@y
External sub-agents are automatically named after their last path segment. Use the `name:reference` syntax to give them a custom name.
@z

@x
Tag references are checked against the registry on every `docker agent run`, which adds a network round-trip per sub-agent at startup. Pin them to a digest (`myorg/agent@sha256:…`) to serve them from cache instead.
@y
Tag references are checked against the registry on every `docker agent run`, which adds a network round-trip per sub-agent at startup. Pin them to a digest (`myorg/agent@sha256:…`) to serve them from cache instead.
@z

@x
See [Pin external sub-agents to a digest](../multi-agent/index.md#pin-external-sub-agents-to-a-digest) and [External Sub-Agents](../multi-agent/index.md#external-sub-agents-from-registries) for details.
@y
See [Pin external sub-agents to a digest](../multi-agent/index.md#pin-external-sub-agents-to-a-digest) and [External Sub-Agents](../multi-agent/index.md#external-sub-agents-from-registries) for details.
@z

@x
## Using with Aliases
@y
## Using with Aliases
@z

@x
Combine OCI references with aliases for convenient access:
@y
Combine OCI references with aliases for convenient access:
@z

@x
```bash
# Create an alias for a registry agent
$ docker agent alias add coder myorg/coder --yolo
@y
```bash
# Create an alias for a registry agent
$ docker agent alias add coder myorg/coder --yolo
@z

@x
# Now just run
$ docker agent run coder
```
@y
# Now just run
$ docker agent run coder
```
@z

@x
## Using with API Server
@y
## Using with API Server
@z

@x
The API server supports OCI references with auto-refresh:
@y
The API server supports OCI references with auto-refresh:
@z

@x
```bash
# Start API from registry, auto-pull every 10 minutes
$ docker agent serve api docker.io/username/agent:latest --pull-interval 10
```
@y
```bash
# Start API from registry, auto-pull every 10 minutes
$ docker agent serve api docker.io/username/agent:latest --pull-interval 10
```
@z

@x
## Private Repositories
@y
## Private Repositories
@z

@x
Docker Agent supports pulling from private GitHub repositories and registries that require authentication. Use standard Docker login or GitHub authentication:
@y
Docker Agent supports pulling from private GitHub repositories and registries that require authentication. Use standard Docker login or GitHub authentication:
@z

@x
```bash
# Login to a registry
$ docker login docker.io
@y
```bash
# Login to a registry
$ docker login docker.io
@z

@x
# Now push/pull works with private repos
$ docker agent share push ./agent.yaml docker.io/myorg/private-agent:latest
$ docker agent run docker.io/myorg/private-agent:latest
```
@y
# Now push/pull works with private repos
$ docker agent share push ./agent.yaml docker.io/myorg/private-agent:latest
$ docker agent run docker.io/myorg/private-agent:latest
```
@z

@x
> [!NOTE]
> **Docker authentication**
>
> When pulling or running an agent from a `docker.com` or `*.docker.com` HTTPS URL (e.g. `desktop.docker.com`), Docker Agent automatically forwards a Docker token for authentication. If Docker Desktop is running and signed in, its token is used; otherwise, Docker Agent exchanges the access token stored by `docker login` for a fresh Docker token. Either way, no explicit login step is required beyond `docker login` (or being signed into Docker Desktop).
>
> Note: `docker.io` (the standard Docker Hub registry domain) is a separate domain and is **not** covered by automatic token forwarding. Agents pulled from `docker.io` or `registry-1.docker.io` still require `docker login docker.io` for private repositories.
@y
> [!NOTE]
> **Docker authentication**
>
> When pulling or running an agent from a `docker.com` or `*.docker.com` HTTPS URL (e.g. `desktop.docker.com`), Docker Agent automatically forwards a Docker token for authentication. If Docker Desktop is running and signed in, its token is used; otherwise, Docker Agent exchanges the access token stored by `docker login` for a fresh Docker token. Either way, no explicit login step is required beyond `docker login` (or being signed into Docker Desktop).
>
> Note: `docker.io` (the standard Docker Hub registry domain) is a separate domain and is **not** covered by automatic token forwarding. Agents pulled from `docker.io` or `registry-1.docker.io` still require `docker login docker.io` for private repositories.
@z

@x
> [!NOTE]
> **Troubleshooting**
>
> Having issues with push/pull? See [Troubleshooting](../../guides/troubleshooting/index.md) for common registry issues.
@y
> [!NOTE]
> **Troubleshooting**
>
> Having issues with push/pull? See [Troubleshooting](../../guides/troubleshooting/index.md) for common registry issues.
@z

@x
## Local Development
@y
## Local Development
@z

@x
For local development and testing, you can run an agent directly from a local HTTP server without a registry:
@y
For local development and testing, you can run an agent directly from a local HTTP server without a registry:
@z

@x
```bash
# Serve an agent config locally
$ python3 -m http.server 8080
@y
```bash
# Serve an agent config locally
$ python3 -m http.server 8080
@z

@x
# Run it directly via HTTP
$ docker agent run http://localhost:8080/agent.yaml
$ docker agent run http://127.0.0.1:8080/agent.yaml
```
@y
# Run it directly via HTTP
$ docker agent run http://localhost:8080/agent.yaml
$ docker agent run http://127.0.0.1:8080/agent.yaml
```
@z

@x
This is useful for iterating on agent configs served from a local dev server before pushing to a registry. Both `localhost` and `127.0.0.1` addresses are supported with plain `http://` URLs.
@y
This is useful for iterating on agent configs served from a local dev server before pushing to a registry. Both `localhost` and `127.0.0.1` addresses are supported with plain `http://` URLs.
@z

@x
Agent configurations loaded from HTTP(S) URLs or OCI artifacts are limited to 32 MiB after decompression.
@y
Agent configurations loaded from HTTP(S) URLs or OCI artifacts are limited to 32 MiB after decompression.
@z
