%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Variables in Bake
linkTitle: Variables
@y
title: Variables in Bake
linkTitle: Variables
@z

@x
description: 
keywords: build, buildx, bake, buildkit, hcl, variables
@y
description: 
keywords: build, buildx, bake, buildkit, hcl, variables
@z

@x
You can define and use variables in a Bake file to set attribute values,
interpolate them into other values, and perform arithmetic operations.
Variables can be defined with default values, and can be overridden with
environment variables.
@y
You can define and use variables in a Bake file to set attribute values,
interpolate them into other values, and perform arithmetic operations.
Variables can be defined with default values, and can be overridden with
environment variables.
@z

@x
## Using variables as attribute values
@y
## Using variables as attribute values
@z

@x
Use the `variable` block to define a variable.
@y
Use the `variable` block to define a variable.
@z

% snip code...

@x
The following example shows how to use the `TAG` variable in a target.
@y
The following example shows how to use the `TAG` variable in a target.
@z

% snip code...

@x
## Interpolate variables into values
@y
## Interpolate variables into values
@z

@x
Bake supports string interpolation of variables into values. You can use the
`${}` syntax to interpolate a variable into a value. The following example
defines a `TAG` variable with a value of `latest`.
@y
Bake supports string interpolation of variables into values. You can use the
`${}` syntax to interpolate a variable into a value. The following example
defines a `TAG` variable with a value of `latest`.
@z

% snip code...

@x
To interpolate the `TAG` variable into the value of an attribute, use the
`${TAG}` syntax.
@y
To interpolate the `TAG` variable into the value of an attribute, use the
`${TAG}` syntax.
@z

% snip code...

@x
Printing the Bake file with the `--print` flag shows the interpolated value in
the resolved build configuration.
@y
Printing the Bake file with the `--print` flag shows the interpolated value in
the resolved build configuration.
@z

% snip command...
% snip code...

@x
## Escape variable interpolation
@y
## Escape variable interpolation
@z

@x
If you want to bypass variable interpolation when parsing the Bake definition,
use double dollar signs (`$${VARIABLE}`).
@y
If you want to bypass variable interpolation when parsing the Bake definition,
use double dollar signs (`$${VARIABLE}`).
@z

% snip code...
% snip command...

@x
## Using variables in variables across files
@y
## Using variables in variables across files
@z

@x
When multiple files are specified, one file can use variables defined in
another file. In the following example, the `vars.hcl` file defines a
`BASE_IMAGE` variable with a default value of `docker.io/library/alpine`.
@y
When multiple files are specified, one file can use variables defined in
another file. In the following example, the `vars.hcl` file defines a
`BASE_IMAGE` variable with a default value of `docker.io/library/alpine`.
@z

% snip code...

@x
The following `docker-bake.hcl` file defines a `BASE_LATEST` variable that
references the `BASE_IMAGE` variable.
@y
The following `docker-bake.hcl` file defines a `BASE_LATEST` variable that
references the `BASE_IMAGE` variable.
@z

% snip code...

@x
When you print the resolved build configuration, using the `-f` flag to specify
the `vars.hcl` and `docker-bake.hcl` files, you see that the `BASE_LATEST`
variable is resolved to `docker.io/library/alpine:latest`.
@y
When you print the resolved build configuration, using the `-f` flag to specify
the `vars.hcl` and `docker-bake.hcl` files, you see that the `BASE_LATEST`
variable is resolved to `docker.io/library/alpine:latest`.
@z

% snip command...
% snip code...

@x
## Additional resources
@y
## Additional resources
@z

@x
Here are some additional resources that show how you can use variables in Bake:
@y
Here are some additional resources that show how you can use variables in Bake:
@z

@x
- You can override `variable` values using environment variables. See
  [Overriding configurations](./overrides.md#environment-variables) for more
  information.
- You can refer to and use global variables in functions. See [HCL
  functions](./funcs.md#variables-in-functions)
- You can use variable values when evaluating expressions. See [Expression
  evaluation](./expressions.md#expressions-with-variables)
@y
- You can override `variable` values using environment variables. See
  [Overriding configurations](./overrides.md#environment-variables) for more
  information.
- You can refer to and use global variables in functions. See [HCL
  functions](./funcs.md#variables-in-functions)
- You can use variable values when evaluating expressions. See [Expression
  evaluation](./expressions.md#expressions-with-variables)
@z
