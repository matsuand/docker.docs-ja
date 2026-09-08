%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "User Prompt Tool"
description: "Ask the user questions and collect interactive input during agent execution."
keywords: docker agent, ai agents, tools, toolsets, user prompt tool
linkTitle: "User Prompt"
@y
title: "User Prompt Tool"
description: "Ask the user questions and collect interactive input during agent execution."
keywords: docker agent, ai agents, tools, toolsets, user prompt tool
linkTitle: "User Prompt"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/user-prompt/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/user-prompt/
@z

@x
_Ask the user questions and collect interactive input during agent execution._
@y
_Ask the user questions and collect interactive input during agent execution._
@z

@x
## Overview
@y
## Overview
@z

@x
The user prompt tool allows agents to ask questions and collect input from users during execution. This enables interactive workflows where the agent needs clarification, confirmation, or additional information before proceeding.
@y
The user prompt tool allows agents to ask questions and collect input from users during execution. This enables interactive workflows where the agent needs clarification, confirmation, or additional information before proceeding.
@z

@x
> [!NOTE]
> **When to Use**
>
> - When the agent needs clarification before proceeding
> - Collecting credentials or configuration values
> - Presenting choices and getting user decisions
> - Confirming destructive or important actions
@y
> [!NOTE]
> **When to Use**
>
> - When the agent needs clarification before proceeding
> - Collecting credentials or configuration values
> - Presenting choices and getting user decisions
> - Confirming destructive or important actions
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
agents:
  assistant:
    model: openai/gpt-4o
    description: Interactive assistant
    instruction: |
      You are a helpful assistant. When you need information
      from the user, use the user_prompt tool to ask them.
    toolsets:
      - type: user_prompt
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  assistant:
    model: openai/gpt-4o
    description: Interactive assistant
    instruction: |
      You are a helpful assistant. When you need information
      from the user, use the user_prompt tool to ask them.
    toolsets:
      - type: user_prompt
      - type: filesystem
      - type: shell
```
@z

@x
## Tool Interface
@y
## Tool Interface
@z

@x
The `user_prompt` tool takes these parameters:
@y
The `user_prompt` tool takes these parameters:
@z

@x
| Parameter | Type   | Required | Description                                                                                        |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------- |
| `message` | string | ✓        | The question or prompt to display.                                                                 |
| `title`   | string | ✗        | Optional title for the dialog window in the TUI. Defaults to `"Question"` when not provided.       |
| `schema`  | object | ✗        | JSON Schema defining the expected response structure (object or primitive).                        |
@y
| Parameter | Type   | Required | Description                                                                                        |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------- |
| `message` | string | ✓        | The question or prompt to display.                                                                 |
| `title`   | string | ✗        | Optional title for the dialog window in the TUI. Defaults to `"Question"` when not provided.       |
| `schema`  | object | ✗        | JSON Schema defining the expected response structure (object or primitive).                        |
@z

@x
## Response Format
@y
## Response Format
@z

@x
The tool returns a JSON response:
@y
The tool returns a JSON response:
@z

@x
```json
{
  "action": "accept",
  "content": {
    "field1": "user value",
    "field2": true
  }
}
```
@y
```json
{
  "action": "accept",
  "content": {
    "field1": "user value",
    "field2": true
  }
}
```
@z

@x
### Action Values
@y
### Action Values
@z

@x
| Action    | Meaning                                    |
| --------- | ------------------------------------------ |
| `accept`  | User provided a response (check `content`) |
| `decline` | User declined to answer                    |
| `cancel`  | User cancelled the prompt                  |
@y
| Action    | Meaning                                    |
| --------- | ------------------------------------------ |
| `accept`  | User provided a response (check `content`) |
| `decline` | User declined to answer                    |
| `cancel`  | User cancelled the prompt                  |
@z

@x
## Schema Examples
@y
## Schema Examples
@z

@x
### Simple String Input
@y
### Simple String Input
@z

@x
```json
{
  "type": "string",
  "title": "API Key",
  "description": "Enter your API key"
}
```
@y
```json
{
  "type": "string",
  "title": "API Key",
  "description": "Enter your API key"
}
```
@z

@x
### Multiple Choice
@y
### Multiple Choice
@z

@x
```json
{
  "type": "string",
  "enum": ["development", "staging", "production"],
  "title": "Environment",
  "description": "Select the target environment"
}
```
@y
```json
{
  "type": "string",
  "enum": ["development", "staging", "production"],
  "title": "Environment",
  "description": "Select the target environment"
}
```
@z

@x
### Boolean Confirmation
@y
### Boolean Confirmation
@z

@x
```json
{
  "type": "boolean",
  "title": "Confirm",
  "description": "Are you sure you want to proceed?"
}
```
@y
```json
{
  "type": "boolean",
  "title": "Confirm",
  "description": "Are you sure you want to proceed?"
}
```
@z

@x
### Object with Multiple Fields
@y
### Object with Multiple Fields
@z

@x
```json
{
  "type": "object",
  "properties": {
    "username": {
      "type": "string",
      "description": "Your username"
    },
    "password": {
      "type": "string",
      "description": "Your password"
    },
    "remember": {
      "type": "boolean",
      "description": "Remember credentials"
    }
  },
  "required": ["username", "password"]
}
```
@y
```json
{
  "type": "object",
  "properties": {
    "username": {
      "type": "string",
      "description": "Your username"
    },
    "password": {
      "type": "string",
      "description": "Your password"
    },
    "remember": {
      "type": "boolean",
      "description": "Remember credentials"
    }
  },
  "required": ["username", "password"]
}
```
@z

@x
### Number Input
@y
### Number Input
@z

@x
```json
{
  "type": "integer",
  "title": "Port Number",
  "description": "Enter the port number (1024-65535)",
  "minimum": 1024,
  "maximum": 65535
}
```
@y
```json
{
  "type": "integer",
  "title": "Port Number",
  "description": "Enter the port number (1024-65535)",
  "minimum": 1024,
  "maximum": 65535
}
```
@z

@x
## Example Usage
@y
## Example Usage
@z

@x
Here's how an agent might use the user prompt tool:
@y
Here's how an agent might use the user prompt tool:
@z

@x
```text
Agent: I need to deploy this application. Let me ask which environment to target.
@y
```text
Agent: I need to deploy this application. Let me ask which environment to target.
@z

@x
[Calls user_prompt with message: "Which environment should I deploy to?"
 and schema with enum: ["development", "staging", "production"]]
@y
[Calls user_prompt with message: "Which environment should I deploy to?"
 and schema with enum: ["development", "staging", "production"]]
@z

@x
User selects: "staging"
@y
User selects: "staging"
@z

@x
Agent: Great, I'll deploy to staging. Let me confirm this action.
@y
Agent: Great, I'll deploy to staging. Let me confirm this action.
@z

@x
[Calls user_prompt with message: "Deploy to staging? This will replace the current version."
 and schema with type: "boolean"]
@y
[Calls user_prompt with message: "Deploy to staging? This will replace the current version."
 and schema with type: "boolean"]
@z

@x
User confirms: true
@y
User confirms: true
@z

@x
Agent: Deploying to staging...
```
@y
Agent: Deploying to staging...
```
@z

@x
## UI Presentation
@y
## UI Presentation
@z

@x
How the prompt appears depends on the interface:
@y
How the prompt appears depends on the interface:
@z

@x
- **TUI**: Displays an interactive dialog with appropriate input controls
- **CLI (exec mode)**: Prints the prompt and reads from stdin
- **API/MCP**: Returns an elicitation request to the client
@y
- **TUI**: Displays an interactive dialog with appropriate input controls
- **CLI (exec mode)**: Prints the prompt and reads from stdin
- **API/MCP**: Returns an elicitation request to the client
@z

@x
> [!TIP]
> **Best Practice**
>
> Provide clear, concise messages. Include context about why you're asking and what the information will be used for. Use schemas with descriptions to guide users on expected input format.
@y
> [!TIP]
> **Best Practice**
>
> Provide clear, concise messages. Include context about why you're asking and what the information will be used for. Use schemas with descriptions to guide users on expected input format.
@z

@x
## Handling Responses
@y
## Handling Responses
@z

@x
The agent should handle all possible actions:
@y
The agent should handle all possible actions:
@z

@x
- **accept**: Process the `content` and continue
- **decline**: Acknowledge and try an alternative approach or explain what's needed
- **cancel**: Stop the current operation gracefully
@y
- **accept**: Process the `content` and continue
- **decline**: Acknowledge and try an alternative approach or explain what's needed
- **cancel**: Stop the current operation gracefully
@z

@x
> [!WARNING]
> **Context Requirement**
>
> The user prompt tool requires an elicitation handler to be configured. It works in the TUI and CLI modes but may not be available in all contexts (e.g., some MCP client configurations).
@y
> [!WARNING]
> **Context Requirement**
>
> The user prompt tool requires an elicitation handler to be configured. It works in the TUI and CLI modes but may not be available in all contexts (e.g., some MCP client configurations).
@z
