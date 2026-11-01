%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Random Tool"
description: "Generate random integers with bounds chosen by the agent."
keywords: docker agent, ai agents, tools, toolsets, random integer
linkTitle: "Random"
@y
title: "Random Tool"
description: "Generate random integers with bounds chosen by the agent."
keywords: docker agent, ai agents, tools, toolsets, random integer
linkTitle: "Random"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/random/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/random/
@z

@x
The `random` toolset exposes `random_int`, which generates a uniformly random
integer between an agent-chosen minimum and maximum, **both inclusive**. It
requires no external dependencies and does not modify files or external state.
@y
The `random` toolset exposes `random_int`, which generates a uniformly random
integer between an agent-chosen minimum and maximum, **both inclusive**. It
requires no external dependencies and does not modify files or external state.
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
    instruction: Use random_int to roll dice and make random choices.
    toolsets:
      - type: random
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: Use random_int to roll dice and make random choices.
    toolsets:
      - type: random
```
@z

@x
Bounds are tool-call arguments, not toolset configuration: the agent chooses
them on every call.
@y
Bounds are tool-call arguments, not toolset configuration: the agent chooses
them on every call.
@z

@x
## Parameters
@y
## Parameters
@z

@x
| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `min` | integer | ✓ | Inclusive minimum value. |
| `max` | integer | ✓ | Inclusive maximum value; must be greater than or equal to `min`. |
@y
| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `min` | integer | ✓ | Inclusive minimum value. |
| `max` | integer | ✓ | Inclusive maximum value; must be greater than or equal to `min`. |
@z

@x
The tool returns the generated integer. Negative bounds are supported, and
setting `min` equal to `max` returns that value. Bounds must fit in a signed
64-bit integer. Missing bounds or `min > max` produce an error.
@y
The tool returns the generated integer. Negative bounds are supported, and
setting `min` equal to `max` returns that value. Bounds must fit in a signed
64-bit integer. Missing bounds or `min > max` produce an error.
@z

@x
For a six-sided die, the agent calls:
@y
For a six-sided die, the agent calls:
@z

@x
```json
{"min": 1, "max": 6}
```
@y
```json
{"min": 1, "max": 6}
```
@z

@x
For a coin flip, use `min: 0` and `max: 1` and map the result to heads or tails.
@y
For a coin flip, use `min: 0` and `max: 1` and map the result to heads or tails.
@z

@x
Successful draws may repeat identical arguments without triggering duplicate-call
loop detection. Failed calls still count toward that limit. To bound the number
of model turns, set the agent's `max_iterations`; it defaults to unlimited.
@y
Successful draws may repeat identical arguments without triggering duplicate-call
loop detection. Failed calls still count toward that limit. To bound the number
of model turns, set the agent's `max_iterations`; it defaults to unlimited.
@z

@x
See [`examples/random.yaml`](https://github.com/docker/docker-agent/blob/main/examples/random.yaml)
for a runnable example.
@y
See [`examples/random.yaml`](https://github.com/docker/docker-agent/blob/main/examples/random.yaml)
for a runnable example.
@z
