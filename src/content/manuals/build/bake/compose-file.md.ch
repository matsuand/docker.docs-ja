%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Building with Bake from a Compose file
description: Build your compose services with Bake
keywords: build, buildx, bake, buildkit, compose, yaml
@y
title: Building with Bake from a Compose file
description: Build your compose services with Bake
keywords: build, buildx, bake, buildkit, compose, yaml
@z

@x
Bake supports the [Compose file format](/reference/compose-file/_index.md)
to parse a Compose file and translate each service to a [target](reference.md#target).
@y
Bake supports the [Compose file format](reference/compose-file/_index.md)
to parse a Compose file and translate each service to a [target](reference.md#target).
@z

% snip code...
% snip command...
% snip code...

@x
The compose format has some limitations compared to the HCL format:
@y
The compose format has some limitations compared to the HCL format:
@z

@x
- Specifying variables or global scope attributes is not yet supported
- `inherits` service field is not supported, but you can use [YAML anchors](/reference/compose-file/fragments.md)
  to reference other services, as demonstrated in the previous example with `&build-dev`.
@y
- Specifying variables or global scope attributes is not yet supported
- `inherits` service field is not supported, but you can use [YAML anchors](reference/compose-file/fragments.md)
  to reference other services, as demonstrated in the previous example with `&build-dev`.
@z

@x
## `.env` file
@y
## `.env` file
@z

@x
You can declare default environment variables in an environment file named
`.env`. This file will be loaded from the current working directory,
where the command is executed and applied to compose definitions passed
with `-f`.
@y
You can declare default environment variables in an environment file named
`.env`. This file will be loaded from the current working directory,
where the command is executed and applied to compose definitions passed
with `-f`.
@z

% snip code...
% snip code...
% snip command...
% snip code...

@x
> [!NOTE]
>
> System environment variables take precedence over environment variables
> in `.env` file.
@y
> [!NOTE]
>
> System environment variables take precedence over environment variables
> in `.env` file.
@z

@x
## Extension field with `x-bake`
@y
## Extension field with `x-bake`
@z

@x
Where some fields are not available in the compose specification, you can use
the [special extension](/reference/compose-file/extension.md) field
`x-bake` in your compose file to evaluate extra fields:
@y
Where some fields are not available in the compose specification, you can use
the [special extension](reference/compose-file/extension.md) field
`x-bake` in your compose file to evaluate extra fields:
@z

% snip code...
% snip command...
% snip code...

@x
Complete list of valid fields for `x-bake`:
@y
Complete list of valid fields for `x-bake`:
@z

@x
- `cache-from`
- `cache-to`
- `contexts`
- `no-cache`
- `no-cache-filter`
- `output`
- `platforms`
- `pull`
- `secret`
- `ssh`
- `tags`
@y
- `cache-from`
- `cache-to`
- `contexts`
- `no-cache`
- `no-cache-filter`
- `output`
- `platforms`
- `pull`
- `secret`
- `ssh`
- `tags`
@z
