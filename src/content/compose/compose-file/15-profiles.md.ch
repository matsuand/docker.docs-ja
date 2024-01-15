%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Profiles
description: Learn about profiles
keywords: compose, compose specification, profiles, compose file reference
---
@y
---
title: Profiles
description: Learn about profiles
keywords: compose, compose specification, profiles, compose file reference
---
@z

@x
With profiles you can define a set of active profiles so your Compose application model is adjusted for various usages and environments.
The exact mechanism is implementation specific and may include command line flags, environment variables, etc.
@y
With profiles you can define a set of active profiles so your Compose application model is adjusted for various usages and environments.
The exact mechanism is implementation specific and may include command line flags, environment variables, etc.
@z

@x
The [services](05-services.md) top-level element supports a `profiles` attribute to define a list of named profiles. 
Services without a `profiles` attribute are always enabled. 
@y
The [services](05-services.md) top-level element supports a `profiles` attribute to define a list of named profiles. 
Services without a `profiles` attribute are always enabled. 
@z

@x
A service is ignored by Compose when none of the listed `profiles` match the active ones, unless the service is
explicitly targeted by a command. In that case its profile is added to the set of active profiles.
@y
A service is ignored by Compose when none of the listed `profiles` match the active ones, unless the service is
explicitly targeted by a command. In that case its profile is added to the set of active profiles.
@z

@x
> **Note**
>
> All other top-level elements are not affected by `profiles` and are always active.
@y
> **Note**
>
> All other top-level elements are not affected by `profiles` and are always active.
@z

@x
References to other services (by `links`, `extends` or shared resource syntax `service:xxx`) do not
automatically enable a component that would otherwise have been ignored by active profiles. Instead
Compose returns an error.
@y
References to other services (by `links`, `extends` or shared resource syntax `service:xxx`) do not
automatically enable a component that would otherwise have been ignored by active profiles. Instead
Compose returns an error.
@z

@x
## Illustrative example
@y
## Illustrative example
@z

@x
```yaml
services:
  foo:
    image: foo
  bar:
    image: bar
    profiles:
      - test
  baz:
    image: baz
    depends_on:
      - bar
    profiles:
      - test
  zot:
    image: zot
    depends_on:
      - bar
    profiles:
      - debug
```
@y
```yaml
services:
  foo:
    image: foo
  bar:
    image: bar
    profiles:
      - test
  baz:
    image: baz
    depends_on:
      - bar
    profiles:
      - test
  zot:
    image: zot
    depends_on:
      - bar
    profiles:
      - debug
```
@z

@x
In the above example:
@y
In the above example:
@z

@x
- If the Compose application model is parsed with no profile enabled, it only contains the `foo` service.
- If the profile `test` is enabled, the model contains the services `bar` and `baz`, and service `foo`, which is always enabled.
- If the profile `debug` is enabled, the model contains both `foo` and `zot` services, but not `bar` and `baz`,
  and as such the model is invalid regarding the `depends_on` constraint of `zot`.
- If the profiles `debug` and `test` are enabled, the model contains all services; `foo`, `bar`, `baz` and `zot`.
- If Compose is executed with `bar` as the explicit service to run, `bar` and the `test` profile
  are active even if `test` profile is not enabled.
- If Compose is executed with `baz` as the explicit service to run, the service `baz` and the
  profile `test` are active and `bar` is pulled in by the `depends_on` constraint.
- If Compose is executed with `zot` as the explicit service to run, again the model is
  invalid regarding the `depends_on` constraint of `zot`, since `zot` and `bar` have no common `profiles`
  listed.
- If Compose is executed with `zot` as the explicit service to run and profile `test` is enabled,
  profile `debug` is automatically enabled and service `bar` is pulled in as a dependency starting both
  services `zot` and `bar`.
@y
- If the Compose application model is parsed with no profile enabled, it only contains the `foo` service.
- If the profile `test` is enabled, the model contains the services `bar` and `baz`, and service `foo`, which is always enabled.
- If the profile `debug` is enabled, the model contains both `foo` and `zot` services, but not `bar` and `baz`,
  and as such the model is invalid regarding the `depends_on` constraint of `zot`.
- If the profiles `debug` and `test` are enabled, the model contains all services; `foo`, `bar`, `baz` and `zot`.
- If Compose is executed with `bar` as the explicit service to run, `bar` and the `test` profile
  are active even if `test` profile is not enabled.
- If Compose is executed with `baz` as the explicit service to run, the service `baz` and the
  profile `test` are active and `bar` is pulled in by the `depends_on` constraint.
- If Compose is executed with `zot` as the explicit service to run, again the model is
  invalid regarding the `depends_on` constraint of `zot`, since `zot` and `bar` have no common `profiles`
  listed.
- If Compose is executed with `zot` as the explicit service to run and profile `test` is enabled,
  profile `debug` is automatically enabled and service `bar` is pulled in as a dependency starting both
  services `zot` and `bar`.
@z

@x
See how you can use `profiles` in [Docker Compose](../profiles.md).
@y
See how you can use `profiles` in [Docker Compose](../profiles.md).
@z
