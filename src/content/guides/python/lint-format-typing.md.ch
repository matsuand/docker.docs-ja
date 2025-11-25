%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Linting, formatting, and type checking for Python
linkTitle: Linting and typing
@y
title: Linting, formatting, and type checking for Python
linkTitle: Linting and typing
@z

@x
keywords: Python, linting, formatting, type checking, ruff, pyright
description: Learn how to set up linting, formatting and type checking for your Python application.
@y
keywords: Python, linting, formatting, type checking, ruff, pyright
description: Learn how to set up linting, formatting and type checking for your Python application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Develop your app](develop.md).
@y
Complete [Develop your app](develop.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up code quality tools for your Python application. This includes:
@y
In this section, you'll learn how to set up code quality tools for your Python application. This includes:
@z

@x
- Linting and formatting with Ruff
- Static type checking with Pyright
- Automating checks with pre-commit hooks
@y
- Linting and formatting with Ruff
- Static type checking with Pyright
- Automating checks with pre-commit hooks
@z

@x
## Linting and formatting with Ruff
@y
## Linting and formatting with Ruff
@z

@x
Ruff is an extremely fast Python linter and formatter written in Rust. It replaces multiple tools like flake8, isort, and black with a single unified tool.
@y
Ruff is an extremely fast Python linter and formatter written in Rust. It replaces multiple tools like flake8, isort, and black with a single unified tool.
@z

@x
Before using Ruff, install it in your Python environment:
@y
Before using Ruff, install it in your Python environment:
@z

% snip command...

@x
If you're using a virtual environment, make sure it is activated so the `ruff` command is available when you run the commands below.
@y
If you're using a virtual environment, make sure it is activated so the `ruff` command is available when you run the commands below.
@z

@x
Create a `pyproject.toml` file:
@y
Create a `pyproject.toml` file:
@z

@x
```toml
[tool.ruff]
target-version = "py312"
@y
```toml
[tool.ruff]
target-version = "py312"
@z

@x
[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "ARG001", # unused arguments in functions
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "W191",  # indentation contains tabs
    "B904",  # Allow raising exceptions without from e, for HTTPException
]
```
@y
[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "ARG001", # unused arguments in functions
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "W191",  # indentation contains tabs
    "B904",  # Allow raising exceptions without from e, for HTTPException
]
```
@z

@x
### Using Ruff
@y
### Using Ruff
@z

@x
Run these commands to check and format your code:
@y
Run these commands to check and format your code:
@z

@x
```bash
# Check for errors
ruff check .
@y
```bash
# Check for errors
ruff check .
@z

@x
# Automatically fix fixable errors
ruff check --fix .
@y
# Automatically fix fixable errors
ruff check --fix .
@z

@x
# Format code
ruff format .
```
@y
# Format code
ruff format .
```
@z

@x
## Type checking with Pyright
@y
## Type checking with Pyright
@z

@x
Pyright is a fast static type checker for Python that works well with modern Python features.
@y
Pyright is a fast static type checker for Python that works well with modern Python features.
@z

@x
Add `Pyright` configuration in `pyproject.toml`:
@y
Add `Pyright` configuration in `pyproject.toml`:
@z

@x
```toml
[tool.pyright]
typeCheckingMode = "strict"
pythonVersion = "3.12"
exclude = [".venv"]
```
@y
```toml
[tool.pyright]
typeCheckingMode = "strict"
pythonVersion = "3.12"
exclude = [".venv"]
```
@z

@x
### Running Pyright
@y
### Running Pyright
@z

@x
To check your code for type errors:
@y
To check your code for type errors:
@z

@x
```bash
pyright
```
@y
```bash
pyright
```
@z

@x
## Setting up pre-commit hooks
@y
## Setting up pre-commit hooks
@z

@x
Pre-commit hooks automatically run checks before each commit. The following `.pre-commit-config.yaml` snippet sets up Ruff:
@y
Pre-commit hooks automatically run checks before each commit. The following `.pre-commit-config.yaml` snippet sets up Ruff:
@z

@x
```yaml
  https: https://github.com/charliermarsh/ruff-pre-commit
  rev: v0.2.2
  hooks:
    - id: ruff
      args: [--fix]
    - id: ruff-format
```
@y
```yaml
  https: https://github.com/charliermarsh/ruff-pre-commit
  rev: v0.2.2
  hooks:
    - id: ruff
      args: [--fix]
    - id: ruff-format
```
@z

@x
To install and use:
@y
To install and use:
@z

@x
```bash
pre-commit install
git commit -m "Test commit"  # Automatically runs checks
```
@y
```bash
pre-commit install
git commit -m "Test commit"  # Automatically runs checks
```
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to:
@y
In this section, you learned how to:
@z

@x
- Configure and use Ruff for linting and formatting
- Set up Pyright for static type checking
- Automate checks with pre-commit hooks
@y
- Configure and use Ruff for linting and formatting
- Set up Pyright for static type checking
- Automate checks with pre-commit hooks
@z

@x
These tools help maintain code quality and catch errors early in development.
@y
These tools help maintain code quality and catch errors early in development.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Configure GitHub Actions](configure-github-actions.md) to run these checks automatically
- Customize linting rules to match your team's style preferences
- Explore advanced type checking features
@y
- [Configure GitHub Actions](configure-github-actions.md) to run these checks automatically
- Customize linting rules to match your team's style preferences
- Explore advanced type checking features
@z
