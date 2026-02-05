%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Introduction to build policies
linkTitle: Introduction
description: Get started with writing and evaluating build policies
keywords: build policies, opa, rego, policy tutorial, docker build, security
@y
title: Introduction to build policies
linkTitle: Introduction
description: Get started with writing and evaluating build policies
keywords: build policies, opa, rego, policy tutorial, docker build, security
@z

@x
Build policies let you validate the inputs to your Docker builds before they
run. This tutorial walks you through creating your first policy, teaching the
Rego basics you need along the way.
@y
Build policies let you validate the inputs to your Docker builds before they
run. This tutorial walks you through creating your first policy, teaching the
Rego basics you need along the way.
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
By the end of this tutorial, you'll understand:
@y
By the end of this tutorial, you'll understand:
@z

@x
- How to create and organize policy files
- Basic Rego syntax and patterns
- How to write policies that validate URLs, checksums, and images
- How policies evaluate during builds
@y
- How to create and organize policy files
- Basic Rego syntax and patterns
- How to write policies that validate URLs, checksums, and images
- How policies evaluate during builds
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Buildx version 0.31 or later
- Basic familiarity with Dockerfiles and building images
@y
- Buildx version 0.31 or later
- Basic familiarity with Dockerfiles and building images
@z

@x
## How policies work
@y
## How policies work
@z

@x
When you build an image, Buildx resolves all the inputs your
Dockerfile references: base images from `FROM` instructions, files
from `ADD` or `COPY` or build contexts, and Git repositories. Before
running the build, Buildx evaluates your policies against these
inputs. If any input violates a policy, the build fails before any
instructions execute.
@y
When you build an image, Buildx resolves all the inputs your
Dockerfile references: base images from `FROM` instructions, files
from `ADD` or `COPY` or build contexts, and Git repositories. Before
running the build, Buildx evaluates your policies against these
inputs. If any input violates a policy, the build fails before any
instructions execute.
@z

@x
Policies are written in Rego, a declarative language designed for expressing
rules and constraints. You don't need to know Rego to get started - this
tutorial teaches you what you need.
@y
Policies are written in Rego, a declarative language designed for expressing
rules and constraints. You don't need to know Rego to get started - this
tutorial teaches you what you need.
@z

@x
## Create your first policy
@y
## Create your first policy
@z

@x
Create a new directory for this tutorial and add a Dockerfile:
@y
Create a new directory for this tutorial and add a Dockerfile:
@z

@x
```console
$ mkdir policy-tutorial
$ cd policy-tutorial
```
@y
```console
$ mkdir policy-tutorial
$ cd policy-tutorial
```
@z

@x
Create a `Dockerfile` that downloads a file with `ADD`:
@y
Create a `Dockerfile` that downloads a file with `ADD`:
@z

@x
```dockerfile
FROM scratch
ADD https://example.com/index.html /index.html
```
@y
```dockerfile
FROM scratch
ADD https://example.com/index.html /index.html
```
@z

@x
Now create a policy file. Policies use the `.rego` extension and live alongside
your Dockerfile. Create `Dockerfile.rego`:
@y
Now create a policy file. Policies use the `.rego` extension and live alongside
your Dockerfile. Create `Dockerfile.rego`:
@z

@x
```rego {title="Dockerfile.rego"}
package docker
@y
```rego {title="Dockerfile.rego"}
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
allow if {
  input.http.host == "example.com"
}
@y
allow if input.local
allow if {
  input.http.host == "example.com"
}
@z

@x
decision := {"allow": allow}
```
@y
decision := {"allow": allow}
```
@z

@x
Save this file as `Dockerfile.rego` in the same directory as your Dockerfile.
@y
Save this file as `Dockerfile.rego` in the same directory as your Dockerfile.
@z

@x
Let's break down what this policy does:
@y
Let's break down what this policy does:
@z

@x
- `package docker` - All build policies must start with this package declaration
- `default allow := false` - This example uses a deny-by-default rule: if inputs do not match an `allow` rule, the policy check fails
- `allow if input.local` - The first rule allows any local files (your build context)
- `allow if { input.http.host == "example.com" }` - The second rule allows HTTP downloads from `example.com`
- `decision := {"allow": allow}` - The final decision object tells Buildx whether to allow or deny the input
@y
- `package docker` - All build policies must start with this package declaration
- `default allow := false` - This example uses a deny-by-default rule: if inputs do not match an `allow` rule, the policy check fails
- `allow if input.local` - The first rule allows any local files (your build context)
- `allow if { input.http.host == "example.com" }` - The second rule allows HTTP downloads from `example.com`
- `decision := {"allow": allow}` - The final decision object tells Buildx whether to allow or deny the input
@z

@x
This policy says: "Only allow local files and HTTP downloads from
`example.com`". Rego evaluates all the policy rules to figure out the return
value for the `decision` variable, for each build input. The evaluations happen
in parallel and on-demand; the order of the policy rules has no significance.
@y
This policy says: "Only allow local files and HTTP downloads from
`example.com`". Rego evaluates all the policy rules to figure out the return
value for the `decision` variable, for each build input. The evaluations happen
in parallel and on-demand; the order of the policy rules has no significance.
@z

@x
### About `input.local`
@y
### About `input.local`
@z

@x
You'll see `allow if input.local` in nearly every policy. This rule allows
local file access, which includes your build context (typically, the `.`
directory) and importantly, the Dockerfile itself. Without this rule, Buildx
can't read your Dockerfile to start the build.
@y
You'll see `allow if input.local` in nearly every policy. This rule allows
local file access, which includes your build context (typically, the `.`
directory) and importantly, the Dockerfile itself. Without this rule, Buildx
can't read your Dockerfile to start the build.
@z

@x
Even builds that don't reference any files from the build context often need
`input.local` because the Dockerfile is a local file. The policy evaluates
before the build starts, and denying local access means denying access to the
Dockerfile.
@y
Even builds that don't reference any files from the build context often need
`input.local` because the Dockerfile is a local file. The policy evaluates
before the build starts, and denying local access means denying access to the
Dockerfile.
@z

@x
In rare cases, you might want stricter local file policies - for example, in CI
builds where the build context uses a Git URL as a context directly. In these
cases, you may want to deny local sources to prevent untracked files or changes
from making their way into your build.
@y
In rare cases, you might want stricter local file policies - for example, in CI
builds where the build context uses a Git URL as a context directly. In these
cases, you may want to deny local sources to prevent untracked files or changes
from making their way into your build.
@z

@x
## Automatic policy loading
@y
## Automatic policy loading
@z

@x
Buildx automatically loads policies that match your Dockerfile name. When you
build with `Dockerfile`, Buildx looks for `Dockerfile.rego` in the same
directory. For a file named `app.Dockerfile`, it looks for
`app.Dockerfile.rego`.
@y
Buildx automatically loads policies that match your Dockerfile name. When you
build with `Dockerfile`, Buildx looks for `Dockerfile.rego` in the same
directory. For a file named `app.Dockerfile`, it looks for
`app.Dockerfile.rego`.
@z

@x
This automatic loading means you don't need any command-line flags in most
cases - create the policy file and build.
@y
This automatic loading means you don't need any command-line flags in most
cases - create the policy file and build.
@z

@x
The policy file must be in the same directory as the Dockerfile. If Buildx
can't find a matching policy, the build proceeds without policy evaluation
(unless you use `--policy strict=true`).
@y
The policy file must be in the same directory as the Dockerfile. If Buildx
can't find a matching policy, the build proceeds without policy evaluation
(unless you use `--policy strict=true`).
@z

@x
For more control over policy loading, see the [Usage guide](./usage.md).
@y
For more control over policy loading, see the [Usage guide](./usage.md).
@z

@x
## Run a build with your policy
@y
## Run a build with your policy
@z

@x
Build the image with policy evaluation enabled:
@y
Build the image with policy evaluation enabled:
@z

@x
```console
$ docker build .
```
@y
```console
$ docker build .
```
@z

@x
The build succeeds because the URL in your Dockerfile matches the policy. Now
try changing the URL in your Dockerfile to something else:
@y
The build succeeds because the URL in your Dockerfile matches the policy. Now
try changing the URL in your Dockerfile to something else:
@z

@x
```dockerfile
FROM scratch
ADD https://api.github.com/users/octocat /user.json
```
@y
```dockerfile
FROM scratch
ADD https://api.github.com/users/octocat /user.json
```
@z

@x
Build again:
@y
Build again:
@z

@x
```console
$ docker build .
```
@y
```console
$ docker build .
```
@z

@x
This time the build fails with a policy violation. The `api.github.com`
hostname doesn't match the rule in your policy, so Buildx rejects it before
running any build steps.
@y
This time the build fails with a policy violation. The `api.github.com`
hostname doesn't match the rule in your policy, so Buildx rejects it before
running any build steps.
@z

@x
## Debugging policy failures
@y
## Debugging policy failures
@z

@x
If your build fails with a policy violation, use `--progress=plain` to see
exactly what went wrong:
@y
If your build fails with a policy violation, use `--progress=plain` to see
exactly what went wrong:
@z

@x
```console
$ docker buildx build --progress=plain .
```
@y
```console
$ docker buildx build --progress=plain .
```
@z

@x
This shows all policy checks, the input data for each source, and allow/deny
decisions. For complete debugging guidance, see [Debugging](./debugging.md).
@y
This shows all policy checks, the input data for each source, and allow/deny
decisions. For complete debugging guidance, see [Debugging](./debugging.md).
@z

@x
## Add helpful error messages
@y
## Add helpful error messages
@z

@x
When a policy denies an input, users see a generic error message. You can
provide custom messages that explain why the build was denied:
@y
When a policy denies an input, users see a generic error message. You can
provide custom messages that explain why the build was denied:
@z

@x
```rego {title="Dockerfile.rego"}
package docker
@y
```rego {title="Dockerfile.rego"}
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
allow if {
  input.http.host == "example.com"
  input.http.schema == "https"
}
@y
allow if input.local
allow if {
  input.http.host == "example.com"
  input.http.schema == "https"
}
@z

@x
deny_msg contains msg if {
  not allow
  input.http
  msg := "only HTTPS downloads from example.com are allowed"
}
@y
deny_msg contains msg if {
  not allow
  input.http
  msg := "only HTTPS downloads from example.com are allowed"
}
@z

@x
decision := {"allow": allow, "deny_msg": deny_msg}
```
@y
decision := {"allow": allow, "deny_msg": deny_msg}
```
@z

@x
Now when a build is denied, users see your custom message explaining what went
wrong:
@y
Now when a build is denied, users see your custom message explaining what went
wrong:
@z

@x
```console
$ docker buildx build .
Policy: only HTTPS downloads from example.com are allowed
ERROR: failed to build: ... source not allowed by policy
```
@y
```console
$ docker buildx build .
Policy: only HTTPS downloads from example.com are allowed
ERROR: failed to build: ... source not allowed by policy
```
@z

@x
The `deny_msg` rule uses `contains` to add messages to a set. You can add
multiple deny messages for different failure conditions to help users understand
exactly what needs to change.
@y
The `deny_msg` rule uses `contains` to add messages to a set. You can add
multiple deny messages for different failure conditions to help users understand
exactly what needs to change.
@z

@x
## Understand Rego rules
@y
## Understand Rego rules
@z

@x
Rego policies are built from rules. A rule defines when something is allowed.
The basic pattern is:
@y
Rego policies are built from rules. A rule defines when something is allowed.
The basic pattern is:
@z

@x
```rego
allow if {
    condition_one
    condition_two
    condition_three
}
```
@y
```rego
allow if {
    condition_one
    condition_two
    condition_three
}
```
@z

@x
All conditions must be true for the rule to match. Think of it as an AND
operation - the URL must match AND the checksum must match AND any other
conditions you specify.
@y
All conditions must be true for the rule to match. Think of it as an AND
operation - the URL must match AND the checksum must match AND any other
conditions you specify.
@z

@x
You can have multiple `allow` rules in one policy. If any rule matches, the
input is allowed:
@y
You can have multiple `allow` rules in one policy. If any rule matches, the
input is allowed:
@z

@x
```rego
# Allow downloads from example.com
allow if {
    input.http.host == "example.com"
}
@y
```rego
# Allow downloads from example.com
allow if {
    input.http.host == "example.com"
}
@z

@x
# Also allow downloads from api.github.com
allow if {
    input.http.host == "api.github.com"
}
```
@y
# Also allow downloads from api.github.com
allow if {
    input.http.host == "api.github.com"
}
```
@z

@x
This works like OR - the input can match the first rule OR the second rule.
@y
This works like OR - the input can match the first rule OR the second rule.
@z

@x
## Access input fields
@y
## Access input fields
@z

@x
The `input` object gives you access to information about build inputs. The
structure depends on the input type:
@y
The `input` object gives you access to information about build inputs. The
structure depends on the input type:
@z

@x
- `input.http` - Files downloaded with `ADD https://...`
- `input.image` - Container images from `FROM` or `COPY --from`
- `input.git` - Git repositories from `ADD git://...` or build context
- `input.local` - Local file context
@y
- `input.http` - Files downloaded with `ADD https://...`
- `input.image` - Container images from `FROM` or `COPY --from`
- `input.git` - Git repositories from `ADD git://...` or build context
- `input.local` - Local file context
@z

@x
Refer to the [Input reference](./inputs.md) for all available input fields.
@y
Refer to the [Input reference](./inputs.md) for all available input fields.
@z

@x
For HTTP downloads, you can access:
@y
For HTTP downloads, you can access:
@z

@x
| Key                 | Description                        | Example                          |
| ------------------- | ---------------------------------- | -------------------------------- |
| `input.http.url`    | The full URL                       | `https://example.com/index.html` |
| `input.http.schema` | The protocol (HTTP/HTTPS)          | `https`                          |
| `input.http.host`   | The hostname                       | `example.com`                    |
| `input.http.path`   | The URL path, including parameters | `/index.html`                    |
@y
| Key                 | Description                        | Example                          |
| ------------------- | ---------------------------------- | -------------------------------- |
| `input.http.url`    | The full URL                       | `https://example.com/index.html` |
| `input.http.schema` | The protocol (HTTP/HTTPS)          | `https`                          |
| `input.http.host`   | The hostname                       | `example.com`                    |
| `input.http.path`   | The URL path, including parameters | `/index.html`                    |
@z

@x
Update your policy to require HTTPS:
@y
Update your policy to require HTTPS:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if {
    input.http.host == "example.com"
    input.http.schema == "https"
}
@y
allow if {
    input.http.host == "example.com"
    input.http.schema == "https"
}
@z

@x
decision := {"allow": allow}
```
@y
decision := {"allow": allow}
```
@z

@x
Now the policy requires both the hostname to be `example.com` and the protocol
to be HTTPS. HTTP URLs (without TLS) would fail the policy check.
@y
Now the policy requires both the hostname to be `example.com` and the protocol
to be HTTPS. HTTP URLs (without TLS) would fail the policy check.
@z

@x
## Pattern matching and strings
@y
## Pattern matching and strings
@z

@x
Rego provides [built-in functions] for pattern matching. Use `startswith()` to
match URL prefixes:
@y
Rego provides [built-in functions] for pattern matching. Use `startswith()` to
match URL prefixes:
@z

@x
[built-in functions]: https://www.openpolicyagent.org/docs/policy-language#built-in-functions
@y
[built-in functions]: https://www.openpolicyagent.org/docs/policy-language#built-in-functions
@z

@x
```rego
allow if {
    startswith(input.http.url, "https://example.com/")
}
```
@y
```rego
allow if {
    startswith(input.http.url, "https://example.com/")
}
```
@z

@x
This allows any URL that starts with `https://example.com/`.
@y
This allows any URL that starts with `https://example.com/`.
@z

@x
Use `regex.match()` for complex patterns:
@y
Use `regex.match()` for complex patterns:
@z

@x
```rego
allow if {
    regex.match(`^https://example\.com/.+\.json$`, input.http.url)
}
```
@y
```rego
allow if {
    regex.match(`^https://example\.com/.+\.json$`, input.http.url)
}
```
@z

@x
This matches URLs that:
@y
This matches URLs that:
@z

@x
- Start with `https://example.com/`
- End with `.json`
- Have at least one character between the domain and extension
@y
- Start with `https://example.com/`
- End with `.json`
- Have at least one character between the domain and extension
@z

@x
## Policy file location
@y
## Policy file location
@z

@x
Policy files live adjacent to the Dockerfile they validate, using the naming
pattern `<dockerfile-name>.rego`:
@y
Policy files live adjacent to the Dockerfile they validate, using the naming
pattern `<dockerfile-name>.rego`:
@z

@x
```text
project/
├── Dockerfile           # Main Dockerfile
├── Dockerfile.rego      # Policy for Dockerfile
├── lint.Dockerfile      # Linting Dockerfile
└── lint.Dockerfile.rego # Policy for lint.Dockerfile
```
@y
```text
project/
├── Dockerfile           # Main Dockerfile
├── Dockerfile.rego      # Policy for Dockerfile
├── lint.Dockerfile      # Linting Dockerfile
└── lint.Dockerfile.rego # Policy for lint.Dockerfile
```
@z

@x
When you build, Buildx automatically loads the corresponding policy file:
@y
When you build, Buildx automatically loads the corresponding policy file:
@z

@x
```console
$ docker buildx build -f Dockerfile .        # Loads Dockerfile.rego
$ docker buildx build -f lint.Dockerfile .   # Loads lint.Dockerfile.rego
```
@y
```console
$ docker buildx build -f Dockerfile .        # Loads Dockerfile.rego
$ docker buildx build -f lint.Dockerfile .   # Loads lint.Dockerfile.rego
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
You now understand how to write basic build policies for HTTP resources. To
continue learning:
@y
You now understand how to write basic build policies for HTTP resources. To
continue learning:
@z

@x
- Apply and test policies: [Using build policies](./usage.md)
- Learn [Image validation](./validate-images.md) to validate container images
  from `FROM` instructions
- Learn [Git validation](./validate-git.md) to validate Git repositories used
  in builds
- See [Example policies](./examples.md) for copy-paste-ready policies covering
  common scenarios
- Write unit tests for your policies: [Test build policies](./testing.md)
- Debug policy failures: [Debugging](./debugging.md)
- Read the [Input reference](./inputs.md) for all available input fields
- Check the [Built-in functions](./built-ins.md) for signature verification,
  attestations, and other security checks
@y
- Apply and test policies: [Using build policies](./usage.md)
- Learn [Image validation](./validate-images.md) to validate container images
  from `FROM` instructions
- Learn [Git validation](./validate-git.md) to validate Git repositories used
  in builds
- See [Example policies](./examples.md) for copy-paste-ready policies covering
  common scenarios
- Write unit tests for your policies: [Test build policies](./testing.md)
- Debug policy failures: [Debugging](./debugging.md)
- Read the [Input reference](./inputs.md) for all available input fields
- Check the [Built-in functions](./built-ins.md) for signature verification,
  attestations, and other security checks
@z
