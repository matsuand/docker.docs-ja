%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Profiles
description: Learn about profiles
keywords: compose, compose specification, profiles, compose file reference
@y
title: Profiles
description: Learn about profiles
keywords: compose, compose specification, profiles, compose file reference
@z

@x
With profiles you can define a set of active profiles so your Compose application model is adjusted for various usages and environments.
@y
With profiles you can define a set of active profiles so your Compose application model is adjusted for various usages and environments.
@z

@x
The [services](services.md) top-level element supports a `profiles` attribute to define a list of named profiles. 
Services without a `profiles` attribute are always enabled. 
@y
The [services](services.md) top-level element supports a `profiles` attribute to define a list of named profiles. 
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
> [!NOTE]
>
> All other top-level elements are not affected by `profiles` and are always active.
@y
> [!NOTE]
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
  web:
    image: web_image
@y
```yaml
services:
  web:
    image: web_image
@z

@x
  test_lib:
    image: test_lib_image
    profiles:
      - test
@y
  test_lib:
    image: test_lib_image
    profiles:
      - test
@z

@x
  coverage_lib:
    image: coverage_lib_image
    depends_on:
      - test_lib
    profiles:
      - test
@y
  coverage_lib:
    image: coverage_lib_image
    depends_on:
      - test_lib
    profiles:
      - test
@z

@x
  debug_lib:
    image: debug_lib_image
    depends_on:
      - test_lib
    profiles:
      - debug
```
@y
  debug_lib:
    image: debug_lib_image
    depends_on:
      - test_lib
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
- If the Compose application model is parsed with no profile enabled, it only contains the `web` service.
- If the profile `test` is enabled, the model contains the services `test_lib` and `coverage_lib`, and service `web`, which is always enabled.
- If the profile `debug` is enabled, the model contains both `web` and `debug_lib` services, but not `test_lib` and `coverage_lib`,
  and as such the model is invalid regarding the `depends_on` constraint of `debug_lib`.
- If the profiles `debug` and `test` are enabled, the model contains all services; `web`, `test_lib`, `coverage_lib` and `debug_lib`.
- If Compose is executed with `test_lib` as the explicit service to run, `test_lib` and the `test` profile
  are active even if `test` profile is not enabled.
- If Compose is executed with `coverage_lib` as the explicit service to run, the service `coverage_lib` and the
  profile `test` are active and `test_lib` is pulled in by the `depends_on` constraint.
- If Compose is executed with `debug_lib` as the explicit service to run, again the model is
  invalid regarding the `depends_on` constraint of `debug_lib`, since `debug_lib` and `test_lib` have no common `profiles`
  listed.
- If Compose is executed with `debug_lib` as the explicit service to run and profile `test` is enabled,
  profile `debug` is automatically enabled and service `test_lib` is pulled in as a dependency starting both
  services `debug_lib` and `test_lib`.
@y
- If the Compose application model is parsed with no profile enabled, it only contains the `web` service.
- If the profile `test` is enabled, the model contains the services `test_lib` and `coverage_lib`, and service `web`, which is always enabled.
- If the profile `debug` is enabled, the model contains both `web` and `debug_lib` services, but not `test_lib` and `coverage_lib`,
  and as such the model is invalid regarding the `depends_on` constraint of `debug_lib`.
- If the profiles `debug` and `test` are enabled, the model contains all services; `web`, `test_lib`, `coverage_lib` and `debug_lib`.
- If Compose is executed with `test_lib` as the explicit service to run, `test_lib` and the `test` profile
  are active even if `test` profile is not enabled.
- If Compose is executed with `coverage_lib` as the explicit service to run, the service `coverage_lib` and the
  profile `test` are active and `test_lib` is pulled in by the `depends_on` constraint.
- If Compose is executed with `debug_lib` as the explicit service to run, again the model is
  invalid regarding the `depends_on` constraint of `debug_lib`, since `debug_lib` and `test_lib` have no common `profiles`
  listed.
- If Compose is executed with `debug_lib` as the explicit service to run and profile `test` is enabled,
  profile `debug` is automatically enabled and service `test_lib` is pulled in as a dependency starting both
  services `debug_lib` and `test_lib`.
@z

@x
See how you can use `profiles` in [Docker Compose](/manuals/compose/profiles.md).
@y
See how you can use `profiles` in [Docker Compose](manuals/compose/profiles.md).
@z
