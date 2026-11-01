%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Calculator Tool"
description: "Calculate arithmetic expressions with exact results instead of relying on the model's mental arithmetic."
keywords: docker agent, ai agents, tools, toolsets, calculator, arithmetic
linkTitle: "Calculator"
@y
title: "Calculator Tool"
description: "Calculate arithmetic expressions with exact results instead of relying on the model's mental arithmetic."
keywords: docker agent, ai agents, tools, toolsets, calculator, arithmetic
linkTitle: "Calculator"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/calculator/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/calculator/
@z

@x
The calculator toolset gives agents one tool, `calculate`, for reliable arithmetic.
It uses exact rational numbers rather than floating-point arithmetic: `0.1 + 0.2`
returns exactly `0.3`, and large integers do not silently overflow.
@y
The calculator toolset gives agents one tool, `calculate`, for reliable arithmetic.
It uses exact rational numbers rather than floating-point arithmetic: `0.1 + 0.2`
returns exactly `0.3`, and large integers do not silently overflow.
@z

@x
Calculations run locally, with no code execution, filesystem access, network
access, or side effects. The tool is read-only and available in native and browser
(WASM) builds.
@y
Calculations run locally, with no code execution, filesystem access, network
access, or side effects. The tool is read-only and available in native and browser
(WASM) builds.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: Use calculate for all numerical calculations.
    toolsets:
      - type: calculator
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: Use calculate for all numerical calculations.
    toolsets:
      - type: calculator
```
@z

@x
No toolset-specific configuration is required. See
[`examples/calculator.yaml`](https://github.com/docker/docker-agent/blob/main/examples/calculator.yaml)
for a complete agent.
@y
No toolset-specific configuration is required. See
[`examples/calculator.yaml`](https://github.com/docker/docker-agent/blob/main/examples/calculator.yaml)
for a complete agent.
@z

@x
## Arguments
@y
## Arguments
@z

@x
`calculate` takes one required argument:
@y
`calculate` takes one required argument:
@z

@x
| Argument | Type | Description |
| --- | --- | --- |
| `expression` | string | An arithmetic expression, such as `(19.99 * 3) * (1 + 8.25 / 100)`. |
@y
| Argument | Type | Description |
| --- | --- | --- |
| `expression` | string | An arithmetic expression, such as `(19.99 * 3) * (1 + 8.25 / 100)`. |
@z

@x
Supported syntax:
@y
Supported syntax:
@z

@x
- Decimal integers and fractions, including `.5`, `1.`, and scientific notation
  (`1.5e3`). Leading zeros are decimal, not octal.
- Addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- Integer remainder (`%`), with the sign of the dividend: `-17 % 5` is `-2`.
  **This is not a percentage operator**; write `15 / 100` for 15%.
- Powers (`^`) with integer exponents, including negative exponents (`2^-3`).
- Parentheses, whitespace, and unary `+` and `-`.
@y
- Decimal integers and fractions, including `.5`, `1.`, and scientific notation
  (`1.5e3`). Leading zeros are decimal, not octal.
- Addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- Integer remainder (`%`), with the sign of the dividend: `-17 % 5` is `-2`.
  **This is not a percentage operator**; write `15 / 100` for 15%.
- Powers (`^`) with integer exponents, including negative exponents (`2^-3`).
- Parentheses, whitespace, and unary `+` and `-`.
@z

@x
Powers bind before unary signs, then multiplication/division/remainder, then
addition/subtraction. Powers associate right-to-left: `2^3^2` is `512`;
`-2^2` is `-4`, while `(-2)^2` is `4`.
@y
Powers bind before unary signs, then multiplication/division/remainder, then
addition/subtraction. Powers associate right-to-left: `2^3^2` is `512`;
`-2^2` is `-4`, while `(-2)^2` is `4`.
@z

@x
Variables, functions, units, commas, implicit multiplication, and programming
language syntax are not supported. Convert quantities to compatible units before
calculating; the calculator cannot verify that the expression models the user's
problem correctly.
@y
Variables, functions, units, commas, implicit multiplication, and programming
language syntax are not supported. Convert quantities to compatible units before
calculating; the calculator cannot verify that the expression models the user's
problem correctly.
@z

@x
## Results and precision
@y
## Results and precision
@z

@x
For terminating decimals, both `result` and `decimal` are exact:
@y
For terminating decimals, both `result` and `decimal` are exact:
@z

@x
```json
{"result":"0.3","decimal":"0.3","approximate":false}
```
@y
```json
{"result":"0.3","decimal":"0.3","approximate":false}
```
@z

@x
For repeating decimals, `result` is an exact reduced fraction and `decimal` is
rounded to 20 decimal places:
@y
For repeating decimals, `result` is an exact reduced fraction and `decimal` is
rounded to 20 decimal places:
@z

@x
```json
{"result":"1/3","decimal":"0.33333333333333333333","approximate":true}
```
@y
```json
{"result":"1/3","decimal":"0.33333333333333333333","approximate":true}
```
@z

@x
All numbers are returned as **strings**, preserving precision across JSON clients.
Use `result`, not a rounded `decimal`, in subsequent expressions. Intermediate
calculations remain exact: `1 / 3 * 3` returns `1`.
@y
All numbers are returned as **strings**, preserving precision across JSON clients.
Use `result`, not a rounded `decimal`, in subsequent expressions. Intermediate
calculations remain exact: `1 / 3 * 3` returns `1`.
@z

@x
## Errors and limits
@y
## Errors and limits
@z

@x
Malformed expressions, division or remainder by zero, non-integer remainder
operands or power exponents, and `0^0` return tool errors rather than guessed
answers. To bound resource use, expressions are limited to 8192 bytes, nesting to
64 levels, scientific and power exponents to -1024 through 1024, and intermediate
numerators and denominators to 4096 bits. Oversized powers can be rejected before
calculation using a conservative size estimate.
@y
Malformed expressions, division or remainder by zero, non-integer remainder
operands or power exponents, and `0^0` return tool errors rather than guessed
answers. To bound resource use, expressions are limited to 8192 bytes, nesting to
64 levels, scientific and power exponents to -1024 through 1024, and intermediate
numerators and denominators to 4096 bits. Oversized powers can be rejected before
calculation using a conservative size estimate.
@z
