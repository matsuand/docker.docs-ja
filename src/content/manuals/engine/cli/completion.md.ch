%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Completion
@y
title: 補完
@z

@x
description: Set up your shell to get autocomplete for Docker commands and flags
keywords: cli, shell, fish, bash, zsh, completion, options
@y
description: Set up your shell to get autocomplete for Docker commands and flags
keywords: cli, shell, fish, bash, zsh, completion, options
@z

@x
You can generate a shell completion script for the Docker CLI using the `docker
completion` command. The completion script gives you word completion for
commands, flags, and Docker objects (such as container and volume names) when
you hit `<Tab>` as you type into your terminal.
@y
You can generate a shell completion script for the Docker CLI using the `docker
completion` command. The completion script gives you word completion for
commands, flags, and Docker objects (such as container and volume names) when
you hit `<Tab>` as you type into your terminal.
@z

@x
You can generate completion scripts for the following shells:
@y
You can generate completion scripts for the following shells:
@z

@x
- [Bash](#bash)
- [Zsh](#zsh)
- [fish](#fish)
@y
- [Bash](#bash)
- [Zsh](#zsh)
- [fish](#fish)
@z

@x
## Bash
@y
## Bash
@z

@x
To get Docker CLI completion with Bash, you first need to install the
`bash-completion` package which contains a number of Bash functions for shell
completion.
@y
To get Docker CLI completion with Bash, you first need to install the
`bash-completion` package which contains a number of Bash functions for shell
completion.
@z

@x
```bash
# Install using APT:
sudo apt install bash-completion
@y
```bash
# Install using APT:
sudo apt install bash-completion
@z

@x
# Install using Homebrew (Bash version 4 or later):
brew install bash-completion@2
# Homebrew install for older versions of Bash:
brew install bash-completion
@y
# Install using Homebrew (Bash version 4 or later):
brew install bash-completion@2
# Homebrew install for older versions of Bash:
brew install bash-completion
@z

@x
# With pacman:
sudo pacman -S bash-completion
```
@y
# With pacman:
sudo pacman -S bash-completion
```
@z

@x
After installing `bash-completion`, source the script in your shell
configuration file (in this example, `.bashrc`):
@y
After installing `bash-completion`, source the script in your shell
configuration file (in this example, `.bashrc`):
@z

@x
```bash
# On Linux:
cat <<EOT >> ~/.bashrc
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
EOT
@y
```bash
# On Linux:
cat <<EOT >> ~/.bashrc
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
EOT
@z

@x
# On macOS / with Homebrew:
cat <<EOT >> ~/.bash_profile
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
EOT
```
@y
# On macOS / with Homebrew:
cat <<EOT >> ~/.bash_profile
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
EOT
```
@z

@x
And reload your shell configuration:
@y
And reload your shell configuration:
@z

% snip command...

@x
Now you can generate the Bash completion script using the `docker completion` command:
@y
Now you can generate the Bash completion script using the `docker completion` command:
@z

% snip command...

@x
## Zsh
@y
## Zsh
@z

@x
The Zsh [completion system](http://zsh.sourceforge.net/Doc/Release/Completion-System.html)
takes care of things as long as the completion can be sourced using `FPATH`.
@y
The Zsh [completion system](http://zsh.sourceforge.net/Doc/Release/Completion-System.html)
takes care of things as long as the completion can be sourced using `FPATH`.
@z

@x
If you use Oh My Zsh, you can install completions without modifying `~/.zshrc`
by storing the completion script in the `~/.oh-my-zsh/completions` directory.
@y
If you use Oh My Zsh, you can install completions without modifying `~/.zshrc`
by storing the completion script in the `~/.oh-my-zsh/completions` directory.
@z

% snip command...

@x
If you're not using Oh My Zsh, store the completion script in a directory of
your choice and add the directory to `FPATH` in your `.zshrc`.
@y
If you're not using Oh My Zsh, store the completion script in a directory of
your choice and add the directory to `FPATH` in your `.zshrc`.
@z

% snip command...

@x
## Fish
@y
## Fish
@z

@x
fish shell supports a [completion system](https://fishshell.com/docs/current/#tab-completion) natively.
To activate completion for Docker commands, copy or symlink the completion script to your fish shell `completions/` directory:
@y
fish shell supports a [completion system](https://fishshell.com/docs/current/#tab-completion) natively.
To activate completion for Docker commands, copy or symlink the completion script to your fish shell `completions/` directory:
@z

% snip command...
