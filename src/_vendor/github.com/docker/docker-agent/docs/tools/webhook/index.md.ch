%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Webhook Tool"
description: "Reliable outbound notifications to Slack, Discord, Telegram, IFTTT, and more."
keywords: docker agent, ai agents, tools, toolsets, webhook, slack, discord, telegram, ifttt, notifications
linkTitle: "Webhook"
@y
title: "Webhook Tool"
description: "Reliable outbound notifications to Slack, Discord, Telegram, IFTTT, and more."
keywords: docker agent, ai agents, tools, toolsets, webhook, slack, discord, telegram, ifttt, notifications
linkTitle: "Webhook"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/webhook/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/webhook/
@z

@x
_Reliable outbound notifications to Slack, Discord, Telegram, IFTTT, and more._
@y
_Reliable outbound notifications to Slack, Discord, Telegram, IFTTT, and more._
@z

@x
## Overview
@y
## Overview
@z

@x
The webhook toolset delivers a notification to a destination **you configure**. The
agent supplies only the message text: it never sees or chooses the URL, because a
webhook URL is itself a credential (Slack and Mattermost embed a secret path,
Discord a token, IFTTT a key, Telegram a bot token).
@y
The webhook toolset delivers a notification to a destination **you configure**. The
agent supplies only the message text: it never sees or chooses the URL, because a
webhook URL is itself a credential (Slack and Mattermost embed a secret path,
Discord a token, IFTTT a key, Telegram a bot token).
@z

@x
This is not a general HTTP client — that is the [`api`](../api/index.md) toolset.
The webhook toolset owns *delivery*:
@y
This is not a general HTTP client — that is the [`api`](../api/index.md) toolset.
The webhook toolset owns *delivery*:
@z

@x
- **At-least-once delivery.** Transient failures (`429`, `5xx`, network errors) are
  retried with exponential backoff, honouring the server's `Retry-After`. A `4xx`
  is permanent and fails immediately without wasting retries.
- **Non-blocking.** The call returns as soon as the notification is queued, so a
  slow or retrying endpoint never stalls the agent's turn. The agent is messaged
  back **only if delivery ultimately fails**.
- **Storm protection.** An identical message to the same destination inside a short
  window is suppressed, and notifications are rate limited, so a looping agent
  cannot flood a channel.
- **Provider-shaped payloads.** Each service's wire format is applied for you.
@y
- **At-least-once delivery.** Transient failures (`429`, `5xx`, network errors) are
  retried with exponential backoff, honouring the server's `Retry-After`. A `4xx`
  is permanent and fails immediately without wasting retries.
- **Non-blocking.** The call returns as soon as the notification is queued, so a
  slow or retrying endpoint never stalls the agent's turn. The agent is messaged
  back **only if delivery ultimately fails**.
- **Storm protection.** An identical message to the same destination inside a short
  window is suppressed, and notifications are rate limited, so a looping agent
  cannot flood a channel.
- **Provider-shaped payloads.** Each service's wire format is applied for you.
@z

@x
## Configuration
@y
## Configuration
@z

@x
The destination lives in `webhook_config`. Use `${env.VAR}` for anything secret —
values are expanded at call time and never stored in the config file.
@y
The destination lives in `webhook_config`. Use `${env.VAR}` for anything secret —
values are expanded at call time and never stored in the config file.
@z

@x
```yaml
toolsets:
  - type: webhook
    webhook_config:
      provider: slack
      url: ${env.SLACK_WEBHOOK_URL}
```
@y
```yaml
toolsets:
  - type: webhook
    webhook_config:
      provider: slack
      url: ${env.SLACK_WEBHOOK_URL}
```
@z

@x
| Field | Required | Description |
| --- | --- | --- |
| `url` | Yes | Webhook endpoint. Usually embeds a secret — prefer `${env.VAR}`. |
| `provider` | No | Payload shape (default `generic`). |
| `headers` | No | Extra headers, for endpoints authenticating with a token. |
| `chat_id` | No | Destination chat — required for `provider: telegram`. |
@y
| Field | Required | Description |
| --- | --- | --- |
| `url` | Yes | Webhook endpoint. Usually embeds a secret — prefer `${env.VAR}`. |
| `provider` | No | Payload shape (default `generic`). |
| `headers` | No | Extra headers, for endpoints authenticating with a token. |
| `chat_id` | No | Destination chat — required for `provider: telegram`. |
@z

@x
`timeout` on the toolset (seconds) overrides the per-request HTTP timeout.
@y
`timeout` on the toolset (seconds) overrides the per-request HTTP timeout.
@z

@x
## Providers
@y
## Providers
@z

@x
| Provider | Payload sent | Where the secret lives |
| --- | --- | --- |
| `slack`, `mattermost`, `rocketchat`, `googlechat`, `teams`, `generic` | `{"text": message}` | secret webhook URL |
| `discord` | `{"content": message}` | token in the webhook URL |
| `ifttt` | `{"value1": message, "value2": …, "value3": …}` | key in the webhook URL |
| `telegram` | `{"chat_id": …, "text": message}` | bot token in the URL, plus `chat_id` |
@y
| Provider | Payload sent | Where the secret lives |
| --- | --- | --- |
| `slack`, `mattermost`, `rocketchat`, `googlechat`, `teams`, `generic` | `{"text": message}` | secret webhook URL |
| `discord` | `{"content": message}` | token in the webhook URL |
| `ifttt` | `{"value1": message, "value2": …, "value3": …}` | key in the webhook URL |
| `telegram` | `{"chat_id": …, "text": message}` | bot token in the URL, plus `chat_id` |
@z

@x
Aliases are accepted: `msteams`/`microsoft_teams` → `teams`, `google_chat`/`gchat`
→ `googlechat`, `rocket.chat` → `rocketchat`.
@y
Aliases are accepted: `msteams`/`microsoft_teams` → `teams`, `google_chat`/`gchat`
→ `googlechat`, `rocket.chat` → `rocketchat`.
@z

@x
### Per-service examples
@y
### Per-service examples
@z

@x
```yaml
# Slack / Mattermost / Rocket.Chat — the URL is the credential
toolsets:
  - type: webhook
    webhook_config:
      provider: slack
      url: ${env.SLACK_WEBHOOK_URL}
```
@y
```yaml
# Slack / Mattermost / Rocket.Chat — the URL is the credential
toolsets:
  - type: webhook
    webhook_config:
      provider: slack
      url: ${env.SLACK_WEBHOOK_URL}
```
@z

@x
```yaml
# Discord — the token is part of the webhook URL
toolsets:
  - type: webhook
    webhook_config:
      provider: discord
      url: ${env.DISCORD_WEBHOOK_URL}
```
@y
```yaml
# Discord — the token is part of the webhook URL
toolsets:
  - type: webhook
    webhook_config:
      provider: discord
      url: ${env.DISCORD_WEBHOOK_URL}
```
@z

@x
```yaml
# Telegram — bot token in the URL, chat_id selects the destination chat
toolsets:
  - type: webhook
    webhook_config:
      provider: telegram
      url: https://api.telegram.org/bot${env.TELEGRAM_BOT_TOKEN}/sendMessage
      chat_id: "123456789"
```
@y
```yaml
# Telegram — bot token in the URL, chat_id selects the destination chat
toolsets:
  - type: webhook
    webhook_config:
      provider: telegram
      url: https://api.telegram.org/bot${env.TELEGRAM_BOT_TOKEN}/sendMessage
      chat_id: "123456789"
```
@z

@x
```yaml
# IFTTT — the key is part of the trigger URL
toolsets:
  - type: webhook
    webhook_config:
      provider: ifttt
      url: https://maker.ifttt.com/trigger/build_failed/with/key/${env.IFTTT_KEY}
```
@y
```yaml
# IFTTT — the key is part of the trigger URL
toolsets:
  - type: webhook
    webhook_config:
      provider: ifttt
      url: https://maker.ifttt.com/trigger/build_failed/with/key/${env.IFTTT_KEY}
```
@z

@x
```yaml
# Generic endpoint authenticating with a bearer token
toolsets:
  - type: webhook
    webhook_config:
      provider: generic
      url: https://alerts.example.com/notify
      headers:
        Authorization: Bearer ${env.ALERTS_TOKEN}
```
@y
```yaml
# Generic endpoint authenticating with a bearer token
toolsets:
  - type: webhook
    webhook_config:
      provider: generic
      url: https://alerts.example.com/notify
      headers:
        Authorization: Bearer ${env.ALERTS_TOKEN}
```
@z

@x
## `send_webhook`
@y
## `send_webhook`
@z

@x
| Parameter | Required | Description |
| --- | --- | --- |
| `message` | Yes | The message text to deliver. |
| `value2`, `value3` | No | Extra IFTTT data fields (`provider: ifttt`). |
@y
| Parameter | Required | Description |
| --- | --- | --- |
| `message` | Yes | The message text to deliver. |
| `value2`, `value3` | No | Extra IFTTT data fields (`provider: ifttt`). |
@z

@x
Returns immediately once queued. On success nothing further happens; if delivery
ultimately fails, the agent receives a message saying so.
@y
Returns immediately once queued. On success nothing further happens; if delivery
ultimately fails, the agent receives a message saying so.
@z

@x
## Example
@y
## Example
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: If a check fails, notify the team with send_webhook.
    toolsets:
      - type: webhook
        webhook_config:
          provider: slack
          url: ${env.SLACK_WEBHOOK_URL}
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: If a check fails, notify the team with send_webhook.
    toolsets:
      - type: webhook
        webhook_config:
          provider: slack
          url: ${env.SLACK_WEBHOOK_URL}
```
@z

@x
> [!NOTE]
> Requests to non-public addresses are refused (the SSRF-safe HTTP client), and the
> configured URL is never echoed back to the model or into error messages.
@y
> [!NOTE]
> Requests to non-public addresses are refused (the SSRF-safe HTTP client), and the
> configured URL is never echoed back to the model or into error messages.
@z
