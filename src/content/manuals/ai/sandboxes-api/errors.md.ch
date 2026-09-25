%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Errors and retries
description: Handle Docker Sandboxes API errors, recover from failed waits, and retry requests without duplicating work.
keywords: docker sandboxes API errors, REST errors, API retries, idempotency keys, rate limits
@y
title: Errors and retries
description: Handle Docker Sandboxes API errors, recover from failed waits, and retry requests without duplicating work.
keywords: docker sandboxes API errors, REST errors, API retries, idempotency keys, rate limits
@z

@x
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@y
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@z

@x
Before retrying a failed request, check whether the service already started
the work. For example, a create request can succeed even if your application
loses the response. Retrying without checking can create a second sandbox.
@y
Before retrying a failed request, check whether the service already started
the work. For example, a create request can succeed even if your application
loses the response. Retrying without checking can create a second sandbox.
@z

@x
## Read an error response
@y
## Read an error response
@z

@x
API errors contain a `code`, a `message`, and optional typed `details`. Use the
code to decide how to respond. Several codes share an HTTP status, so the
status alone might not explain the failure.
@y
API errors contain a `code`, a `message`, and optional typed `details`. Use the
code to decide how to respond. Several codes share an HTTP status, so the
status alone might not explain the failure.
@z

@x
| Code | What to do |
| --- | --- |
| `invalidArgument` | Correct the malformed request or unsupported value before retrying. |
| `unauthenticated` | Obtain a valid credential to replace the missing, invalid, or expired one. |
| `permissionDenied` | Check that your credentials have permission for the action. |
| `notFound` | Check the resource name and request URL. Cloud also returns this code for routes it doesn't serve. |
| `failedPrecondition` | Check the resource state, required features, and any `If-Match` header. |
| `resourceExhausted` | Check the error details for a quota, rate limit, or request-size limit. |
| `unimplemented` | Check whether the backend supports the requested feature. |
| `unavailable` | Retry after a delay, once you know the retry won't duplicate work. |
@y
| Code | What to do |
| --- | --- |
| `invalidArgument` | Correct the malformed request or unsupported value before retrying. |
| `unauthenticated` | Obtain a valid credential to replace the missing, invalid, or expired one. |
| `permissionDenied` | Check that your credentials have permission for the action. |
| `notFound` | Check the resource name and request URL. Cloud also returns this code for routes it doesn't serve. |
| `failedPrecondition` | Check the resource state, required features, and any `If-Match` header. |
| `resourceExhausted` | Check the error details for a quota, rate limit, or request-size limit. |
| `unimplemented` | Check whether the backend supports the requested feature. |
| `unavailable` | Retry after a delay, once you know the retry won't duplicate work. |
@z

@x
For more detail, inspect `google.rpc.ErrorInfo` in the error's `details`, if
present. Use its `reason` and `domain` fields together with the error code to
handle specific causes. Avoid matching the free-form message text, and
handle responses even when they include detail types you don't recognize.
@y
For more detail, inspect `google.rpc.ErrorInfo` in the error's `details`, if
present. Use its `reason` and `domain` fields together with the error code to
handle specific causes. Avoid matching the free-form message text, and
handle responses even when they include detail types you don't recognize.
@z

@x
## Recover from a failed wait
@y
## Recover from a failed wait
@z

@x
If the API returns HTTP 202, the work is still in progress. Keep reading the
resource until it reaches the state you need or fails. The resource's `failure`
field describes a failure that occurs after the initial request succeeds.
@y
If the API returns HTTP 202, the work is still in progress. Keep reading the
resource until it reaches the state you need or fails. The resource's `failure`
field describes a failure that occurs after the initial request succeeds.
@z

@x
If a wait times out or is canceled, the action can still finish. Inspect the
resource before trying again or deleting it. SDK wait helpers report
`WaitError`, which includes the last resource the client received and any
failure details.
@y
If a wait times out or is canceled, the action can still finish. Inspect the
resource before trying again or deleting it. SDK wait helpers report
`WaitError`, which includes the last resource the client received and any
failure details.
@z

@x
If the client never received a resource, retry the original request with its
idempotency key to recover the response. See
[Retry without duplicating work](#retry-without-duplicating-work).
@y
If the client never received a resource, retry the original request with its
idempotency key to recover the response. See
[Retry without duplicating work](#retry-without-duplicating-work).
@z

@x
## Retry without duplicating work
@y
## Retry without duplicating work
@z

@x
An idempotency key identifies one request, so the service can return its
original response if you send it again. For example, repeating a sandbox
creation request with the same key returns the first sandbox instead of
creating another one.
@y
An idempotency key identifies one request, so the service can return its
original response if you send it again. For example, repeating a sandbox
creation request with the same key returns the first sandbox instead of
creating another one.
@z

@x
The SDK generates a key for each supported mutation unless you supply one.
For direct API calls, include an `Idempotency-Key` header in the original
request. Keep the key and the exact request, including any `If-Match` value,
for retries.
@y
The SDK generates a key for each supported mutation unless you supply one.
For direct API calls, include an `Idempotency-Key` header in the original
request. Keep the key and the exact request, including any `If-Match` value,
for retries.
@z

@x
The service keeps accepted results for at least 24 hours. A replay returns
the original response, so read the resource afterward to check its latest
state.
@y
The service keeps accepted results for at least 24 hours. A replay returns
the original response, so read the resource afterward to check its latest
state.
@z

@x
Use the same key only when repeating the same request. Changing the request
under that key causes an error, and using a different key submits another
action. Send the header only for operations that support it:
@y
Use the same key only when repeating the same request. Changing the request
under that key causes an error, and using a different key submits another
action. Send the header only for operations that support it:
@z

@x
| Operations | `Idempotency-Key` |
| --- | --- |
| Create a sandbox, image, process, port, snapshot, secret, or volume | Optional |
| Restore a snapshot | Optional |
| Start, stop, or delete a sandbox | Optional |
| Update a secret | Optional |
| Update a sandbox | Required |
@y
| Operations | `Idempotency-Key` |
| --- | --- |
| Create a sandbox, image, process, port, snapshot, secret, or volume | Optional |
| Restore a snapshot | Optional |
| Start, stop, or delete a sandbox | Optional |
| Update a secret | Optional |
| Update a sandbox | Required |
@z

@x
Other operations don't accept an idempotency key.
@y
Other operations don't accept an idempotency key.
@z

@x
Once you know a create request succeeded, poll the returned resource to wait
for completion. Retry only when you need to recover from a failure or a lost
response. For temporary failures, wait between retries and limit the number
of attempts.
@y
Once you know a create request succeeded, poll the returned resource to wait
for completion. Retry only when you need to recover from a failure or a lost
response. For temporary failures, wait between retries and limit the number
of attempts.
@z

@x
Process creation also supports an idempotency key. Recover the creation
response with the same key before starting another process. Process input,
signals, and file writes aren't covered by that key. Check the outcome
before repeating those actions.
@y
Process creation also supports an idempotency key. Recover the creation
response with the same key before starting another process. Process input,
signals, and file writes aren't covered by that key. Check the outcome
before repeating those actions.
@z

@x
## Account for SDK retries
@y
## Account for SDK retries
@z

@x
The SDK makes up to two additional attempts for eligible transient failures.
If your application manages its own retry loop, set `maxRetries: 0` for the
call to disable automatic retries. Combining both policies can produce more
attempts than you intended.
@y
The SDK makes up to two additional attempts for eligible transient failures.
If your application manages its own retry loop, set `maxRetries: 0` for the
call to disable automatic retries. Combining both policies can produce more
attempts than you intended.
@z

@x
Automatic retries within a call reuse its idempotency key. When retrying from
your application, pass the original key in the call options as
`idempotencyKey`. Otherwise, a separate create call can generate a different
key and create another sandbox.
@y
Automatic retries within a call reuse its idempotency key. When retrying from
your application, pass the original key in the call options as
`idempotencyKey`. Otherwise, a separate create call can generate a different
key and create another sandbox.
@z

@x
Limit both retry attempts and elapsed time, and honor server retry delays.
See [Request rate limits](limits.md#request-rate-limits) for how rate limits
differ from resource quotas.
@y
Limit both retry attempts and elapsed time, and honor server retry delays.
See [Request rate limits](limits.md#request-rate-limits) for how rate limits
differ from resource quotas.
@z

@x
## Handle concurrent changes
@y
## Handle concurrent changes
@z

@x
To avoid changing a resource that someone else has modified, send its `etag`
in the `If-Match` header. An etag identifies the version of the resource you
read. Operations such as sandbox updates and deletion require this header.
The SDK sends the etag stored in the resource object you're using.
@y
To avoid changing a resource that someone else has modified, send its `etag`
in the `If-Match` header. An etag identifies the version of the resource you
read. Operations such as sandbox updates and deletion require this header.
The SDK sends the etag stored in the resource object you're using.
@z

@x
For direct API requests, pass the etag exactly as returned, including its
quotes. A missing required header returns HTTP 428, and a stale etag returns
HTTP 412.
@y
For direct API requests, pass the etag exactly as returned, including its
quotes. A missing required header returns HTTP 428, and a stale etag returns
HTTP 412.
@z

@x
If the etag is stale, read the resource again and decide whether your change
is still appropriate. In the SDK, use the object returned by `refresh()` for
the next operation. The original object still has the old etag. Use a
different idempotency key for a request with an updated etag.
@y
If the etag is stale, read the resource again and decide whether your change
is still appropriate. In the SDK, use the object returned by `refresh()` for
the next operation. The original object still has the old etag. Use a
different idempotency key for a request with an updated etag.
@z

@x
## Check command results
@y
## Check command results
@z

@x
An API request can succeed even when the command it runs fails. Check the
command result's exit code and output separately from request and wait errors.
A nonzero exit code reports a command failure.
@y
An API request can succeed even when the command it runs fails. Check the
command result's exit code and output separately from request and wait errors.
A nonzero exit code reports a command failure.
@z

@x
## Set a timeout for commands
@y
## Set a timeout for commands
@z

@x
To limit how long `processes.run()` waits for a command, pass `timeoutMs` in
the second argument. For example,
`sandbox.processes.run(input, { timeoutMs: 300_000 })` waits up to five minutes.
Timing out or canceling the call stops local waiting. It doesn't kill the
process in the sandbox.
@y
To limit how long `processes.run()` waits for a command, pass `timeoutMs` in
the second argument. For example,
`sandbox.processes.run(input, { timeoutMs: 300_000 })` waits up to five minutes.
Timing out or canceling the call stops local waiting. It doesn't kill the
process in the sandbox.
@z

@x
Without `timeoutMs`, the overall run has no timeout. Individual requests to
create the process and read its output have a 30-second timeout.
@y
Without `timeoutMs`, the overall run has no timeout. Individual requests to
create the process and read its output have a 30-second timeout.
@z
