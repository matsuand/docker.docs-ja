%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Handle errors and degradation"
linkTitle: "Handle errors and degradation"
description: "Tell an API refusal, a failed sandbox transition, and a nonzero command exit apart, and read the code and details each one carries."
keywords: "cloud sandboxes, sandboxes api, handle errors and degradation"
@y
title: "Handle errors and degradation"
linkTitle: "Handle errors and degradation"
description: "Tell an API refusal, a failed sandbox transition, and a nonzero command exit apart, and read the code and details each one carries."
keywords: "cloud sandboxes, sandboxes api, handle errors and degradation"
@z

@x
Distinguish a rejected request from an accepted operation that later fails. This keeps retries from hiding invalid input or duplicating work.
@y
Distinguish a rejected request from an accepted operation that later fails. This keeps retries from hiding invalid input or duplicating work.
@z

@x
The SDK exposes typed request and wait errors. A command's nonzero exit code is a third outcome: the SDK can successfully observe a command that failed.
@y
The SDK exposes typed request and wait errors. A command's nonzero exit code is a third outcome: the SDK can successfully observe a command that failed.
@z

@x
## Classify the failure {#1-classify-the-failure}
@y
## Classify the failure {#1-classify-the-failure}
@z

@x
Use the error type and structured code, not the text of its message. The example groups common request failures and retains their details for the caller.
@y
Use the error type and structured code, not the text of its message. The example groups common request failures and retains their details for the caller.
@z

@x
- Invalid arguments need a corrected request.
- Authentication failures need a valid credential; permission failures need appropriate account access.
- A wrong-state error needs a state check before another attempt.
- A capacity or quota refusal may require waiting or reducing usage.
- A transient availability failure may be retryable if the operation can be repeated safely.
@y
- Invalid arguments need a corrected request.
- Authentication failures need a valid credential; permission failures need appropriate account access.
- A wrong-state error needs a state check before another attempt.
- A capacity or quota refusal may require waiting or reducing usage.
- A transient availability failure may be retryable if the operation can be repeated safely.
@z

@x
Wait errors retain the state or resource observed before the wait stopped. Inspect that information and read the resource again when necessary. A failed create, an interrupted wait, and an expired client deadline do not have the same cleanup outcome.
@y
Wait errors retain the state or resource observed before the wait stopped. Inspect that information and read the resource again when necessary. A failed create, an interrupted wait, and an expired client deadline do not have the same cleanup outcome.
@z

@x
A process helper can fail while obtaining a sandbox credential or reading output after the process has started. The error retains the accepted process and its cause. That process may still be running: inspect it before deciding whether to retry the command. Inspect the cause chain for a typed credential-service rate-limit error, including any request identifier and retry delay supplied by the service.
@y
A process helper can fail while obtaining a sandbox credential or reading output after the process has started. The error retains the accepted process and its cause. That process may still be running: inspect it before deciding whether to retry the command. Inspect the cause chain for a typed credential-service rate-limit error, including any request identifier and retry delay supplied by the service.
@z

@x
Unknown errors remain unknown in the example. They may be connection failures before any response arrived. Do not assume that a write was never accepted.
@y
Unknown errors remain unknown in the example. They may be connection failures before any response arrived. Do not assume that a write was never accepted.
@z

@x
Keep credentials and secret-bearing request bodies out of diagnostics. Record resource names, error codes, and request identifiers instead. See [safe retries](retry-without-creating-duplicates.md) before repeating a mutation.
@y
Keep credentials and secret-bearing request bodies out of diagnostics. Record resource names, error codes, and request identifiers instead. See [safe retries](retry-without-creating-duplicates.md) before repeating a mutation.
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
if (!(error instanceof RequestError)) {
  return { kind: 'other', code: undefined, details: [] };
}
const { code, details } = error.raw;
const known = KINDS.get(code);
return { kind: known ?? 'other', code, details: details ?? [] };
```
@y
```typescript
if (!(error instanceof RequestError)) {
  return { kind: 'other', code: undefined, details: [] };
}
const { code, details } = error.raw;
const known = KINDS.get(code);
return { kind: known ?? 'other', code, details: details ?? [] };
```
@z

@x
<details>
<summary>Complete TypeScript example: failures/classify.ts</summary>
@y
<details>
<summary>Complete TypeScript example: failures/classify.ts</summary>
@z

@x
```typescript
import { RequestError, ResourceWaitError } from '@docker/sandboxes';
@y
```typescript
import { RequestError, ResourceWaitError } from '@docker/sandboxes';
@z

@x
type Status = RequestError['raw'];
type Detail = NonNullable<Status['details']>[number];
@y
type Status = RequestError['raw'];
type Detail = NonNullable<Status['details']>[number];
@z

@x
export type FailureKind =
  | 'invalid-request'
  | 'not-served'
  | 'wrong-state'
  | 'exhausted'
  | 'access-or-missing'
  | 'unavailable'
  | 'other';
@y
export type FailureKind =
  | 'invalid-request'
  | 'not-served'
  | 'wrong-state'
  | 'exhausted'
  | 'access-or-missing'
  | 'unavailable'
  | 'other';
@z

@x
export interface Failure {
  kind: FailureKind;
  code: string | undefined;
  details: Detail[];
}
@y
export interface Failure {
  kind: FailureKind;
  code: string | undefined;
  details: Detail[];
}
@z

@x
const KINDS = new Map<string, FailureKind>([
  ['invalidArgument', 'invalid-request'],
  ['unimplemented', 'not-served'],
  ['failedPrecondition', 'wrong-state'],
  ['resourceExhausted', 'exhausted'],
  ['unauthenticated', 'access-or-missing'],
  ['permissionDenied', 'access-or-missing'],
  ['notFound', 'access-or-missing'],
  ['unavailable', 'unavailable'],
]);
@y
const KINDS = new Map<string, FailureKind>([
  ['invalidArgument', 'invalid-request'],
  ['unimplemented', 'not-served'],
  ['failedPrecondition', 'wrong-state'],
  ['resourceExhausted', 'exhausted'],
  ['unauthenticated', 'access-or-missing'],
  ['permissionDenied', 'access-or-missing'],
  ['notFound', 'access-or-missing'],
  ['unavailable', 'unavailable'],
]);
@z

@x
export function readFailure(error: unknown): Failure {
  if (!(error instanceof RequestError)) {
    return { kind: 'other', code: undefined, details: [] };
  }
  const { code, details } = error.raw;
  const known = KINDS.get(code);
  return { kind: known ?? 'other', code, details: details ?? [] };
}
@y
export function readFailure(error: unknown): Failure {
  if (!(error instanceof RequestError)) {
    return { kind: 'other', code: undefined, details: [] };
  }
  const { code, details } = error.raw;
  const known = KINDS.get(code);
  return { kind: known ?? 'other', code, details: details ?? [] };
}
@z

@x
export function readSandboxWait(
  error: unknown,
): 'degraded' | 'failed' | 'other' {
  if (error instanceof ResourceWaitError) {
    if (error.kind === 'interrupted' && error.state === 'degraded')
      return 'degraded';
    if (error.kind === 'failure' && error.state === 'failed')
      return 'failed';
  }
  return 'other';
}
```
@y
export function readSandboxWait(
  error: unknown,
): 'degraded' | 'failed' | 'other' {
  if (error instanceof ResourceWaitError) {
    if (error.kind === 'interrupted' && error.state === 'degraded')
      return 'degraded';
    if (error.kind === 'failure' && error.state === 'failed')
      return 'failed';
  }
  return 'other';
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
