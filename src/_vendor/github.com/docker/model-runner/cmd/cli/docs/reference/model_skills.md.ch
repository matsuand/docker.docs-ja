%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model skills
@y
# docker model skills
@z

@x
<!---MARKER_GEN_START-->
Install Docker Model Runner skills for AI coding assistants.
@y
<!---MARKER_GEN_START-->
Install Docker Model Runner skills for AI coding assistants.
@z

@x
Skills are configuration files that help AI coding assistants understand
how to use Docker Model Runner effectively for local model inference.
@y
Skills are configuration files that help AI coding assistants understand
how to use Docker Model Runner effectively for local model inference.
@z

@x
Supported targets:
  --codex     Install to ~/.codex/skills (OpenAI Codex CLI)
  --claude    Install to ~/.claude/skills (Claude Code)
  --opencode  Install to ~/.config/opencode/skills (OpenCode)
  --dest      Install to a custom directory
@y
Supported targets:
  --codex     Install to ~/.codex/skills (OpenAI Codex CLI)
  --claude    Install to ~/.claude/skills (Claude Code)
  --opencode  Install to ~/.config/opencode/skills (OpenCode)
  --dest      Install to a custom directory
@z

@x
Example:
  docker model skills --claude
  docker model skills --codex --claude
  docker model skills --dest /path/to/skills
@y
Example:
  docker model skills --claude
  docker model skills --codex --claude
  docker model skills --dest /path/to/skills
@z

@x
### Options
@y
### オプション {#options}
@z

@x
| Name            | Type     | Default | Description                                             |
|:----------------|:---------|:--------|:--------------------------------------------------------|
| `--claude`      | `bool`   |         | Install skills for Claude Code (~/.claude/skills)       |
| `--codex`       | `bool`   |         | Install skills for OpenAI Codex CLI (~/.codex/skills)   |
| `--dest`        | `string` |         | Install skills to a custom directory                    |
| `-f`, `--force` | `bool`   |         | Overwrite existing skills without prompting             |
| `--opencode`    | `bool`   |         | Install skills for OpenCode (~/.config/opencode/skills) |
@y
| Name            | Type     | Default | Description                                             |
|:----------------|:---------|:--------|:--------------------------------------------------------|
| `--claude`      | `bool`   |         | Install skills for Claude Code (~/.claude/skills)       |
| `--codex`       | `bool`   |         | Install skills for OpenAI Codex CLI (~/.codex/skills)   |
| `--dest`        | `string` |         | Install skills to a custom directory                    |
| `-f`, `--force` | `bool`   |         | Overwrite existing skills without prompting             |
| `--opencode`    | `bool`   |         | Install skills for OpenCode (~/.config/opencode/skills) |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
