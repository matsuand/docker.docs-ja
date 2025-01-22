%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Expression evaluation in Bake
linkTitle: Expressions
@y
title: Expression evaluation in Bake
linkTitle: Expressions
@z

@x
description: Learn about advanced Bake features, like user-defined functions
keywords: build, buildx, bake, buildkit, hcl, expressions, evaluation, math, arithmetic, conditionals
@y
description: Learn about advanced Bake features, like user-defined functions
keywords: build, buildx, bake, buildkit, hcl, expressions, evaluation, math, arithmetic, conditionals
@z

@x
Bake files in the HCL format support expression evaluation, which lets you
perform arithmetic operations, conditionally set values, and more.
@y
Bake files in the HCL format support expression evaluation, which lets you
perform arithmetic operations, conditionally set values, and more.
@z

@x
## Arithmetic operations
@y
## Arithmetic operations
@z

@x
You can perform arithmetic operations in expressions. The following example
shows how to multiply two numbers.
@y
You can perform arithmetic operations in expressions. The following example
shows how to multiply two numbers.
@z

% snip code...

@x
Printing the Bake file with the `--print` flag shows the evaluated value for
the `answer` build argument.
@y
Printing the Bake file with the `--print` flag shows the evaluated value for
the `answer` build argument.
@z

% snip command...
% snip code...

@x
## Ternary operators
@y
## Ternary operators
@z

@x
You can use ternary operators to conditionally register a value.
@y
You can use ternary operators to conditionally register a value.
@z

@x
The following example adds a tag only when a variable is not empty, using the
built-in `notequal` [function](./funcs.md).
@y
The following example adds a tag only when a variable is not empty, using the
built-in `notequal` [function](./funcs.md).
@z

% snip code...

@x
In this case, `TAG` is an empty string, so the resulting build configuration
only contains the hard-coded `my-image:latest` tag.
@y
In this case, `TAG` is an empty string, so the resulting build configuration
only contains the hard-coded `my-image:latest` tag.
@z

% snip command...
% snip code...

@x
## Expressions with variables
@y
## Expressions with variables
@z

@x
You can use expressions with [variables](./variables.md) to conditionally set
values, or to perform arithmetic operations.
@y
You can use expressions with [variables](./variables.md) to conditionally set
values, or to perform arithmetic operations.
@z

@x
The following example uses expressions to set values based on the value of
variables. The `v1` build argument is set to "higher" if the variable `FOO` is
greater than 5, otherwise it is set to "lower". The `v2` build argument is set
to "yes" if the `IS_FOO` variable is true, otherwise it is set to "no".
@y
The following example uses expressions to set values based on the value of
variables. The `v1` build argument is set to "higher" if the variable `FOO` is
greater than 5, otherwise it is set to "lower". The `v2` build argument is set
to "yes" if the `IS_FOO` variable is true, otherwise it is set to "no".
@z

% snip code...

@x
Printing the Bake file with the `--print` flag shows the evaluated values for
the `v1` and `v2` build arguments.
@y
Printing the Bake file with the `--print` flag shows the evaluated values for
the `v1` and `v2` build arguments.
@z

% snip command...
% snip code...
