%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Get an SSH certificate"
linkTitle: "Get an SSH certificate"
description: "Have the service sign your SSH public key for one sandbox and return the host, port, username, and host keys your SSH client needs."
keywords: "cloud sandboxes, sandboxes api, get an ssh certificate"
@y
title: "Get an SSH certificate"
linkTitle: "Get an SSH certificate"
description: "Have the service sign your SSH public key for one sandbox and return the host, port, username, and host keys your SSH client needs."
keywords: "cloud sandboxes, sandboxes api, get an ssh certificate"
@z

@x
Request a short-lived SSH certificate for access to a sandbox. Keep the private key on your machine; send only the public key to Docker.
@y
Request a short-lived SSH certificate for access to a sandbox. Keep the private key on your machine; send only the public key to Docker.
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), a sandbox name, and an SSH public key. Generate a key pair with your SSH tooling if you do not have one.
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), a sandbox name, and an SSH public key. Generate a key pair with your SSH tooling if you do not have one.
@z

@x
## Request the certificate {#1-request-the-certificate}
@y
## Request the certificate {#1-request-the-certificate}
@z

@x
Pass the sandbox name and public key. Save the returned certificate using your SSH client's expected certificate-file format, alongside the matching private key.
@y
Pass the sandbox name and public key. Save the returned certificate using your SSH client's expected certificate-file format, alongside the matching private key.
@z

@x
The response supplies the connection details for the sandbox. Use them rather than guessing a hostname or port. The example returns those details; it does not start an SSH process.
@y
The response supplies the connection details for the sandbox. Use them rather than guessing a hostname or port. The example returns those details; it does not start an SSH process.
@z

@x
A certificate expires. Request a new one when needed, and keep the private key and certificate out of your repository. For programmatic command execution without an SSH client, use [processes](run-your-first-command.md).
@y
A certificate expires. Request a new one when needed, and keep the private key and certificate out of your repository. For programmatic command execution without an SSH client, use [processes](run-your-first-command.md).
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
return sandbox.ssh.issueCertificate({
  publicKey,
  ttlMs: lifeSeconds * 1_000,
});
```
@y
```typescript
return sandbox.ssh.issueCertificate({
  publicKey,
  ttlMs: lifeSeconds * 1_000,
});
```
@z

@x
<details>
<summary>Complete TypeScript example: ssh/certificate.ts</summary>
@y
<details>
<summary>Complete TypeScript example: ssh/certificate.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function issueSSHCert(
  client: Sandboxes,
  sandboxName: string,
  publicKey: string,
  lifeSeconds: number,
) {
  const sandbox = await client.get(sandboxName);
  return sandbox.ssh.issueCertificate({
    publicKey,
    ttlMs: lifeSeconds * 1_000,
  });
}
```
@y
export async function issueSSHCert(
  client: Sandboxes,
  sandboxName: string,
  publicKey: string,
  lifeSeconds: number,
) {
  const sandbox = await client.get(sandboxName);
  return sandbox.ssh.issueCertificate({
    publicKey,
    ttlMs: lifeSeconds * 1_000,
  });
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
