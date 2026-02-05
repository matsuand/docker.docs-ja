%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Test build policies
linkTitle: Testing
description: Write and run unit tests for build policies, similar to the opa test command
keywords: build policies, opa, rego, testing, unit tests, policy validation
@y
title: Test build policies
linkTitle: Testing
description: Write and run unit tests for build policies, similar to the opa test command
keywords: build policies, opa, rego, testing, unit tests, policy validation
@z

@x
The [`docker buildx policy test`](/reference/cli/docker/buildx/policy/test/)
command runs unit tests for build policies using OPA's [standard test
framework](https://www.openpolicyagent.org/docs/policy-testing).
@y
The [`docker buildx policy test`](__SUBDIR__/reference/cli/docker/buildx/policy/test/)
command runs unit tests for build policies using OPA's [standard test
framework](https://www.openpolicyagent.org/docs/policy-testing).
@z

@x
```console
$ docker buildx policy test <path>
```
@y
```console
$ docker buildx policy test <path>
```
@z

@x
This validates policy logic with mocked inputs.
@y
This validates policy logic with mocked inputs.
@z

@x
For testing against real sources (actual image metadata, Git repositories), use
[`docker buildx policy eval`](/reference/cli/docker/buildx/policy/eval/)
instead. You can use the `eval --print` option to resolve input for a specific
source for writing a test case.
@y
For testing against real sources (actual image metadata, Git repositories), use
[`docker buildx policy eval`](__SUBDIR__/reference/cli/docker/buildx/policy/eval/)
instead. You can use the `eval --print` option to resolve input for a specific
source for writing a test case.
@z

@x
## Basic example
@y
## Basic example
@z

@x
Start with a simple policy that only allows `alpine` images:
@y
Start with a simple policy that only allows `alpine` images:
@z

@x
```rego {title="Dockerfile.rego"}
package docker
@y
```rego {title="Dockerfile.rego"}
package docker
@z

@x
default allow = false
@y
default allow = false
@z

@x
allow if {
    input.image.repo == "alpine"
}
@y
allow if {
    input.image.repo == "alpine"
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
Create a test file with the `*_test.rego` suffix. Test functions must start
with `test_`:
@y
Create a test file with the `*_test.rego` suffix. Test functions must start
with `test_`:
@z

@x
```rego {title="Dockerfile_test.rego"}
package docker
@y
```rego {title="Dockerfile_test.rego"}
package docker
@z

@x
test_alpine_allowed if {
    decision.allow with input as {"image": {"repo": "alpine"}}
}
@y
test_alpine_allowed if {
    decision.allow with input as {"image": {"repo": "alpine"}}
}
@z

@x
test_ubuntu_denied if {
    not decision.allow with input as {"image": {"repo": "ubuntu"}}
}
```
@y
test_ubuntu_denied if {
    not decision.allow with input as {"image": {"repo": "ubuntu"}}
}
```
@z

@x
Run the tests:
@y
Run the tests:
@z

@x
```console
$ docker buildx policy test .
test_alpine_allowed: PASS (allow=true)
test_ubuntu_denied: PASS (allow=false)
```
@y
```console
$ docker buildx policy test .
test_alpine_allowed: PASS (allow=true)
test_ubuntu_denied: PASS (allow=false)
```
@z

@x
`PASS` indicates that the tests defined in `Dockerfile_test.rego` executed
successfully and all assertions were satisfied.
@y
`PASS` indicates that the tests defined in `Dockerfile_test.rego` executed
successfully and all assertions were satisfied.
@z

@x
## Command options
@y
## Command options
@z

@x
Filter tests by name with `--run`:
@y
Filter tests by name with `--run`:
@z

@x
```console
$ docker buildx policy test --run alpine .
test_alpine_allowed: PASS (allow=true)
```
@y
```console
$ docker buildx policy test --run alpine .
test_alpine_allowed: PASS (allow=true)
```
@z

@x
Test policies with non-default filenames using `--filename`:
@y
Test policies with non-default filenames using `--filename`:
@z

@x
```console
$ docker buildx policy test --filename app.Dockerfile .
```
@y
```console
$ docker buildx policy test --filename app.Dockerfile .
```
@z

@x
This loads `app.Dockerfile.rego` and runs `*_test.rego` files against it.
@y
This loads `app.Dockerfile.rego` and runs `*_test.rego` files against it.
@z

@x
## Test output
@y
## Test output
@z

@x
Passed tests show the allow status and any deny messages:
@y
Passed tests show the allow status and any deny messages:
@z

@x
```console
test_alpine_allowed: PASS (allow=true)
test_ubuntu_denied: PASS (allow=false, deny_msg=only alpine images are allowed)
```
@y
```console
test_alpine_allowed: PASS (allow=true)
test_ubuntu_denied: PASS (allow=false, deny_msg=only alpine images are allowed)
```
@z

@x
Failed tests show input, decision output, and missing fields:
@y
Failed tests show input, decision output, and missing fields:
@z

@x
```console
test_invalid: FAIL (allow=false)
input:
  {
    "image": {}
  }
decision:
  {
    "allow": false,
    "deny_msg": [
      "only alpine images are allowed"
    ]
  }
missing_input: input.image.repo
```
@y
```console
test_invalid: FAIL (allow=false)
input:
  {
    "image": {}
  }
decision:
  {
    "allow": false,
    "deny_msg": [
      "only alpine images are allowed"
    ]
  }
missing_input: input.image.repo
```
@z

@x
## Test deny messages
@y
## Test deny messages
@z

@x
To test custom error messages, capture the full decision result and assert on
the `deny_msg` field.
@y
To test custom error messages, capture the full decision result and assert on
the `deny_msg` field.
@z

@x
For a policy with deny messages:
@y
For a policy with deny messages:
@z

@x
```rego {title="Dockerfile.rego"}
package docker
@y
```rego {title="Dockerfile.rego"}
package docker
@z

@x
default allow = false
@y
default allow = false
@z

@x
allow if {
    input.image.repo == "alpine"
}
@y
allow if {
    input.image.repo == "alpine"
}
@z

@x
deny_msg contains msg if {
    not allow
    msg := "only alpine images are allowed"
}
@y
deny_msg contains msg if {
    not allow
    msg := "only alpine images are allowed"
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
Test the deny message:
@y
Test the deny message:
@z

@x
```rego {title="Dockerfile_test.rego"}
test_deny_message if {
    result := decision with input as {"image": {"repo": "ubuntu"}}
    not result.allow
    "only alpine images are allowed" in result.deny_msg
}
```
@y
```rego {title="Dockerfile_test.rego"}
test_deny_message if {
    result := decision with input as {"image": {"repo": "ubuntu"}}
    not result.allow
    "only alpine images are allowed" in result.deny_msg
}
```
@z

@x
## Test patterns
@y
## Test patterns
@z

@x
**Test environment-specific rules:**
@y
**Test environment-specific rules:**
@z

@x
```rego
test_production_requires_digest if {
    decision.allow with input as {
        "env": {"target": "production"},
        "image": {"isCanonical": true}
    }
}
@y
```rego
test_production_requires_digest if {
    decision.allow with input as {
        "env": {"target": "production"},
        "image": {"isCanonical": true}
    }
}
@z

@x
test_development_allows_tags if {
    decision.allow with input as {
        "env": {"target": "development"},
        "image": {"isCanonical": false}
    }
}
```
@y
test_development_allows_tags if {
    decision.allow with input as {
        "env": {"target": "development"},
        "image": {"isCanonical": false}
    }
}
```
@z

@x
**Test multiple registries:**
@y
**Test multiple registries:**
@z

@x
```rego
test_dockerhub_allowed if {
    decision.allow with input as {
        "image": {
            "ref": "docker.io/library/alpine",
            "host": "docker.io",
            "repo": "alpine"
        }
    }
}
@y
```rego
test_dockerhub_allowed if {
    decision.allow with input as {
        "image": {
            "ref": "docker.io/library/alpine",
            "host": "docker.io",
            "repo": "alpine"
        }
    }
}
@z

@x
test_ghcr_allowed if {
    decision.allow with input as {
        "image": {
            "ref": "ghcr.io/myorg/myapp",
            "host": "ghcr.io",
            "repo": "myorg/myapp"
        }
    }
}
```
@y
test_ghcr_allowed if {
    decision.allow with input as {
        "image": {
            "ref": "ghcr.io/myorg/myapp",
            "host": "ghcr.io",
            "repo": "myorg/myapp"
        }
    }
}
```
@z

@x
For available input fields, see the [Input reference](./inputs.md).
@y
For available input fields, see the [Input reference](./inputs.md).
@z

@x
## Organize test files
@y
## Organize test files
@z

@x
The test runner discovers all `*_test.rego` files recursively:
@y
The test runner discovers all `*_test.rego` files recursively:
@z

@x
```plaintext
build-policies/
├── Dockerfile.rego
├── Dockerfile_test.rego
└── tests/
    ├── registries_test.rego
    ├── signatures_test.rego
    └── environments_test.rego
```
@y
```plaintext
build-policies/
├── Dockerfile.rego
├── Dockerfile_test.rego
└── tests/
    ├── registries_test.rego
    ├── signatures_test.rego
    └── environments_test.rego
```
@z

@x
Run all tests:
@y
Run all tests:
@z

@x
```console
$ docker buildx policy test .
```
@y
```console
$ docker buildx policy test .
```
@z

@x
Or test specific files:
@y
Or test specific files:
@z

@x
```console
$ docker buildx policy test tests/registries_test.rego
```
@y
```console
$ docker buildx policy test tests/registries_test.rego
```
@z
