%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Install Docker Skills
linkTitle: Install
description: Install Docker's official skills in compatible coding agents, Docker Sandboxes, or Docker Agent, and verify that your agent can use them.
keywords: [docker skills, install skills, agent skills, docker sandboxes, docker agent]
@y
title: Install Docker Skills
linkTitle: Install
description: Install Docker's official skills in compatible coding agents, Docker Sandboxes, or Docker Agent, and verify that your agent can use them.
keywords: [docker skills, install skills, agent skills, docker sandboxes, docker agent]
@z

@x
Choose the installation method managed by your agent or organization. Native
plugins, the Gemini CLI extension, and the cross-client skills CLI are separate
options; the skills CLI is not a prerequisite.
@y
Choose the installation method managed by your agent or organization. Native
plugins, the Gemini CLI extension, and the cross-client skills CLI are separate
options; the skills CLI is not a prerequisite.
@z

@x
## Claude Code {#claude-code}
@y
## Claude Code {#claude-code}
@z

@x
In Claude Code, add Docker's marketplace, then install its plugin:
@y
In Claude Code, add Docker's marketplace, then install its plugin:
@z

@x
```text
/plugin marketplace add docker/skills
/plugin install docker-skills@docker
```
@y
```text
/plugin marketplace add docker/skills
/plugin install docker-skills@docker
```
@z

@x
See [Claude Code's plugin
docs](https://code.claude.com/docs/en/discover-plugins) for marketplace setup.
@y
See [Claude Code's plugin
docs](https://code.claude.com/docs/en/discover-plugins) for marketplace setup.
@z

@x
<!-- vale off -->
## GitHub Copilot CLI {#github-copilot-cli}
<!-- vale on -->
@y
<!-- vale off -->
## GitHub Copilot CLI {#github-copilot-cli}
<!-- vale on -->
@z

@x
Add Docker's marketplace in the GitHub Copilot CLI, then install its plugin:
@y
Add Docker's marketplace in the GitHub Copilot CLI, then install its plugin:
@z

@x
```console
$ copilot plugin marketplace add docker/skills
$ copilot plugin install docker-skills@docker
```
@y
```console
$ copilot plugin marketplace add docker/skills
$ copilot plugin install docker-skills@docker
```
@z

@x
See [Copilot CLI's plugin
documentation](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing)
for marketplace setup.
@y
See [Copilot CLI's plugin
documentation](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing)
for marketplace setup.
@z

@x
## Cursor {#cursor}
@y
## Cursor {#cursor}
@z

@x
In Cursor, repository-backed marketplaces require a Teams or Enterprise plan
and someone with permission to add a team marketplace (an admin on Enterprise).
Ask that person to open **Dashboard → Plugins & MCPs → Team Marketplaces → Add
Marketplace**, choose **Import from Repo**, enter
`https://github.com/docker/skills`, add the Docker plugin to the marketplace,
and save its access settings. Once the marketplace is available to you, open
**Customize**, find `docker-skills`, select **Install**, and choose a project or
user scope. If your team can't import a marketplace, use the
[skills CLI](#skills-cli). See [Cursor's plugin
instructions](https://cursor.com/docs/plugins) for marketplace permissions and
installation modes.
@y
In Cursor, repository-backed marketplaces require a Teams or Enterprise plan
and someone with permission to add a team marketplace (an admin on Enterprise).
Ask that person to open **Dashboard → Plugins & MCPs → Team Marketplaces → Add
Marketplace**, choose **Import from Repo**, enter
`https://github.com/docker/skills`, add the Docker plugin to the marketplace,
and save its access settings. Once the marketplace is available to you, open
**Customize**, find `docker-skills`, select **Install**, and choose a project or
user scope. If your team can't import a marketplace, use the
[skills CLI](#skills-cli). See [Cursor's plugin
instructions](https://cursor.com/docs/plugins) for marketplace permissions and
installation modes.
@z

@x
## Codex {#codex}
@y
## Codex {#codex}
@z

@x
In Codex CLI, add Docker's repository as a plugin marketplace:
@y
In Codex CLI, add Docker's repository as a plugin marketplace:
@z

@x
```console
$ codex plugin marketplace add docker/skills
```
@y
```console
$ codex plugin marketplace add docker/skills
```
@z

@x
Enter `/plugins` in Codex CLI, find the `docker-skills` plugin in the Docker
marketplace, and install it through the plugin browser. Start a new session to
use its skills. Plugins are available in Codex CLI and the ChatGPT desktop app,
not the Codex IDE extension. If plugins aren't available in your client, use
the [skills CLI](#skills-cli). See the [Codex plugin
instructions](https://developers.openai.com/codex/plugins/) and
[marketplace setup](https://developers.openai.com/codex/plugins/build/).
@y
Enter `/plugins` in Codex CLI, find the `docker-skills` plugin in the Docker
marketplace, and install it through the plugin browser. Start a new session to
use its skills. Plugins are available in Codex CLI and the ChatGPT desktop app,
not the Codex IDE extension. If plugins aren't available in your client, use
the [skills CLI](#skills-cli). See the [Codex plugin
instructions](https://developers.openai.com/codex/plugins/) and
[marketplace setup](https://developers.openai.com/codex/plugins/build/).
@z

@x
## Gemini CLI {#gemini-cli}
@y
## Gemini CLI {#gemini-cli}
@z

@x
Install the repository as a Gemini CLI extension:
@y
Install the repository as a Gemini CLI extension:
@z

@x
```console
$ gemini extensions install https://github.com/docker/skills
```
@y
```console
$ gemini extensions install https://github.com/docker/skills
```
@z

@x
See the [Gemini CLI extension docs](https://geminicli.com/docs/extensions/)
for extension configuration.
@y
See the [Gemini CLI extension docs](https://geminicli.com/docs/extensions/)
for extension configuration.
@z

@x
## Google Antigravity {#google-antigravity}
@y
## Google Antigravity {#google-antigravity}
@z

@x
Antigravity reads standard `SKILL.md` directories from your workspace's
`.agents/skills/`. From the project directory, use the [skills CLI](#skills-cli)
and select Antigravity and the skills you need:
@y
Antigravity reads standard `SKILL.md` directories from your workspace's
`.agents/skills/`. From the project directory, use the [skills CLI](#skills-cli)
and select Antigravity and the skills you need:
@z

@x
```console
$ npx skills add docker/skills --agent antigravity
```
@y
```console
$ npx skills add docker/skills --agent antigravity
```
@z

@x
Alternatively, [clone a reviewed Docker Skills tag](#git-clone-or-manual-copy)
and copy each selected directory from its `skills/` folder into
`<workspace-root>/.agents/skills/<skill-folder>/`, keeping its `SKILL.md` and
supporting files together. See Google's [Antigravity agent skills
docs](https://antigravity.google/docs/skills) for other discovery locations.
The Gemini CLI extension is a separate installation method, not an Antigravity
plugin.
@y
Alternatively, [clone a reviewed Docker Skills tag](#git-clone-or-manual-copy)
and copy each selected directory from its `skills/` folder into
`<workspace-root>/.agents/skills/<skill-folder>/`, keeping its `SKILL.md` and
supporting files together. See Google's [Antigravity agent skills
docs](https://antigravity.google/docs/skills) for other discovery locations.
The Gemini CLI extension is a separate installation method, not an Antigravity
plugin.
@z

@x
## Other supported agents with the skills CLI {#skills-cli}
@y
## Other supported agents with the skills CLI {#skills-cli}
@z

@x
From your project directory, run the interactive installer:
@y
From your project directory, run the interactive installer:
@z

@x
```console
$ npx skills add docker/skills
```
@y
```console
$ npx skills add docker/skills
```
@z

@x
Select your supported agent and the skills you need when prompted. The default
installation is project-scoped; use `--global` for user scope. See the
[skills CLI docs](https://skills.sh/docs) for supported agents and options.
@y
Select your supported agent and the skills you need when prompted. The default
installation is project-scoped; use `--global` for user scope. See the
[skills CLI docs](https://skills.sh/docs) for supported agents and options.
@z

@x
## Docker Sandboxes {#docker-sandboxes}
@y
## Docker Sandboxes {#docker-sandboxes}
@z

@x
> [!NOTE]
> The `sbx skills` installer is experimental and may change or be removed.
> Check `sbx skills --help` in your installed release before automating it.
@y
> [!NOTE]
> The `sbx skills` installer is experimental and may change or be removed.
> Check `sbx skills --help` in your installed release before automating it.
@z

@x
Install from the repository into the shared sandbox skill store:
@y
Install from the repository into the shared sandbox skill store:
@z

@x
```console
$ sbx skills add docker/skills
```
@y
```console
$ sbx skills add docker/skills
```
@z

@x
For shared-store management, mounting behavior, and host imports, see
[Share agent skills](../sandboxes/workflows/agent-skills.md).
@y
For shared-store management, mounting behavior, and host imports, see
[Share agent skills](../sandboxes/workflows/agent-skills.md).
@z

@x
## Docker Agent {#docker-agent}
@y
## Docker Agent {#docker-agent}
@z

@x
Docker Agent consumes skills installed in its documented
[discovery paths](/ai/docker-agent/features/skills/); it doesn't install or
update them. Install with the [skills CLI](#skills-cli) or
[copy the selected skills](#git-clone-or-manual-copy) to one of those paths,
then select them in `agent.yaml`:
@y
Docker Agent consumes skills installed in its documented
[discovery paths](__SUBDIR__/ai/docker-agent/features/skills/); it doesn't install or
update them. Install with the [skills CLI](#skills-cli) or
[copy the selected skills](#git-clone-or-manual-copy) to one of those paths,
then select them in `agent.yaml`:
@z

@x
```yaml
agents:
  root:
    model: dmr/ai/qwen3
    instruction: Help with Docker development tasks.
    skills: true
    toolsets:
      - type: filesystem
```
@y
```yaml
agents:
  root:
    model: dmr/ai/qwen3
    instruction: Help with Docker development tasks.
    skills: true
    toolsets:
      - type: filesystem
```
@z

@x
`skills: true` includes all discovered skills; use a list of skill names to
limit the selection. See [Docker Agent skill
discovery](/ai/docker-agent/features/skills/) for paths and configuration.
@y
`skills: true` includes all discovered skills; use a list of skill names to
limit the selection. See [Docker Agent skill
discovery](__SUBDIR__/ai/docker-agent/features/skills/) for paths and configuration.
@z

@x
## Git clone or manual copy {#git-clone-or-manual-copy}
@y
## Git clone or manual copy {#git-clone-or-manual-copy}
@z

@x
When a managed installer doesn't fit your client, select a reviewed
[tagged revision](https://github.com/docker/skills/tags) of Docker Skills and
replace `vX.Y.Z` with that tag:
@y
When a managed installer doesn't fit your client, select a reviewed
[tagged revision](https://github.com/docker/skills/tags) of Docker Skills and
replace `vX.Y.Z` with that tag:
@z

@x
```console
$ git clone --branch vX.Y.Z --depth 1 https://github.com/docker/skills.git
```
@y
```console
$ git clone --branch vX.Y.Z --depth 1 https://github.com/docker/skills.git
```
@z

@x
Copy each selected directory under `skills/` into a discovery path documented
by your agent. Keep its `SKILL.md` and all supporting files together.
@y
Copy each selected directory under `skills/` into a discovery path documented
by your agent. Keep its `SKILL.md` and all supporting files together.
@z

@x
## Verify the installation
@y
## Verify the installation
@z

@x
First, check the installed-plugin or extension view, `npx skills list`, or
`sbx skills ls`, as appropriate. For a manual copy, check that the destination
contains a readable `SKILL.md` and its supporting files. This confirms the
files are installed, not that the agent loaded a skill.
@y
First, check the installed-plugin or extension view, `npx skills list`, or
`sbx skills ls`, as appropriate. For a manual copy, check that the destination
contains a readable `SKILL.md` and its supporting files. This confirms the
files are installed, not that the agent loaded a skill.
@z

@x
Start a new agent session and ask for a matching Docker task, such as “Review my
Dockerfile for cache efficiency and non-root execution. Tell me which installed
skill you loaded, and show its `SKILL.md` path.” If your client displays skill
activity, check that it loaded the expected file. Otherwise, ask for a specific
instruction from that file and compare it with the installed copy. If the
skill isn't available, check the installation path and scope.
@y
Start a new agent session and ask for a matching Docker task, such as “Review my
Dockerfile for cache efficiency and non-root execution. Tell me which installed
skill you loaded, and show its `SKILL.md` path.” If your client displays skill
activity, check that it loaded the expected file. Otherwise, ask for a specific
instruction from that file and compare it with the installed copy. If the
skill isn't available, check the installation path and scope.
@z

@x
## Update and troubleshoot
@y
## Update and troubleshoot
@z

@x
- Update native plugins and extensions with their client, CLI-managed skills
  with `npx skills update` in the matching scope (add `--global` for user scope),
  and repository-installed sandbox skills with `sbx skills update` when
  available. For host-imported sandbox skills, update the host files and run
  `sbx skills import` again, then restart the sandbox. Docker Agent relies on
  the installer that owns its discovered files.
- For a fixed snapshot, choose a [Docker Skills
  tag](https://github.com/docker/skills/tags) and use that tagged revision
  instead of a rolling repository URL. Manually copied directories don't
  update themselves; replace the complete directory when moving to another
  reviewed tag.
- If a plugin or extension doesn't appear, check that it is enabled in the
  intended scope and that your organization permits the repository.
- If the agent doesn't find an installed skill, check its discovery path and
  selected agent and scope, then start a new session. For Docker Agent, also
  check the `skills:` filter; for Sandboxes, check that the shared store is
  mounted and the skill was added or imported into it.
- If a link isn't followed or supporting files are missing, reinstall with a
  physical copy of the complete skill directory.
@y
- Update native plugins and extensions with their client, CLI-managed skills
  with `npx skills update` in the matching scope (add `--global` for user scope),
  and repository-installed sandbox skills with `sbx skills update` when
  available. For host-imported sandbox skills, update the host files and run
  `sbx skills import` again, then restart the sandbox. Docker Agent relies on
  the installer that owns its discovered files.
- For a fixed snapshot, choose a [Docker Skills
  tag](https://github.com/docker/skills/tags) and use that tagged revision
  instead of a rolling repository URL. Manually copied directories don't
  update themselves; replace the complete directory when moving to another
  reviewed tag.
- If a plugin or extension doesn't appear, check that it is enabled in the
  intended scope and that your organization permits the repository.
- If the agent doesn't find an installed skill, check its discovery path and
  selected agent and scope, then start a new session. For Docker Agent, also
  check the `skills:` filter; for Sandboxes, check that the shared store is
  mounted and the skill was added or imported into it.
- If a link isn't followed or supporting files are missing, reinstall with a
  physical copy of the complete skill directory.
@z
