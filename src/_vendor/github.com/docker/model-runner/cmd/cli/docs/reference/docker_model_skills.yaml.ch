%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model skills
short: Install Docker Model Runner skills for AI coding assistants
long: |-
    Install Docker Model Runner skills for AI coding assistants.
@y
command: docker model skills
short: Install Docker Model Runner skills for AI coding assistants
long: |-
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
usage: docker model skills
@y
usage: docker model skills
@z

% pname
% plink
% options

@x claude
      description: Install skills for Claude Code (~/.claude/skills)
@y
      description: Install skills for Claude Code (~/.claude/skills)
@z

@x codex
      description: Install skills for OpenAI Codex CLI (~/.codex/skills)
@y
      description: Install skills for OpenAI Codex CLI (~/.codex/skills)
@z

@x dest
      description: Install skills to a custom directory
@y
      description: Install skills to a custom directory
@z

@x force
      description: Overwrite existing skills without prompting
@y
      description: Overwrite existing skills without prompting
@z

@x opencode
      description: Install skills for OpenCode (~/.config/opencode/skills)
@y
      description: Install skills for OpenCode (~/.config/opencode/skills)
@z

% snip directives...
