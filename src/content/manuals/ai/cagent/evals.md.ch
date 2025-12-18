%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Evals
description: Test your agents with saved conversations
keywords: [cagent, evaluations, testing, evals]
@y
title: Evals
description: Test your agents with saved conversations
keywords: [cagent, evaluations, testing, evals]
@z

@x
Evaluations (evals) help you track how your agent's behavior changes over time.
When you save a conversation as an eval, you can replay it later to see if the
agent responds differently. Evals measure consistency, not correctness - they
tell you if behavior changed, not whether it's right or wrong.
@y
Evaluations (evals) help you track how your agent's behavior changes over time.
When you save a conversation as an eval, you can replay it later to see if the
agent responds differently. Evals measure consistency, not correctness - they
tell you if behavior changed, not whether it's right or wrong.
@z

@x
## What are evals
@y
## What are evals
@z

@x
An eval is a saved conversation you can replay. When you run evals, cagent
replays the user messages and compares the new responses against the original
saved conversation. High scores mean the agent behaved similarly; low scores
mean behavior changed.
@y
An eval is a saved conversation you can replay. When you run evals, cagent
replays the user messages and compares the new responses against the original
saved conversation. High scores mean the agent behaved similarly; low scores
mean behavior changed.
@z

@x
What you do with that information depends on why you saved the conversation.
You might save successful conversations to catch regressions, or save failure
cases to document known issues and track whether they improve.
@y
What you do with that information depends on why you saved the conversation.
You might save successful conversations to catch regressions, or save failure
cases to document known issues and track whether they improve.
@z

@x
## Common workflows
@y
## Common workflows
@z

@x
How you use evals depends on what you're trying to accomplish:
@y
How you use evals depends on what you're trying to accomplish:
@z

@x
Regression testing: Save conversations where your agent performs well. When you
make changes later (upgrade models, update prompts, refactor code), run the
evals. High scores mean behavior stayed consistent, which is usually what you
want. Low scores mean something changed - examine the new behavior to see if
it's still correct.
@y
Regression testing: Save conversations where your agent performs well. When you
make changes later (upgrade models, update prompts, refactor code), run the
evals. High scores mean behavior stayed consistent, which is usually what you
want. Low scores mean something changed - examine the new behavior to see if
it's still correct.
@z

@x
Tracking improvements: Save conversations where your agent struggles or fails.
As you make improvements, run these evals to see how behavior evolves. Low
scores indicate the agent now behaves differently, which might mean you fixed
the issue. You'll need to manually verify the new behavior is actually better.
@y
Tracking improvements: Save conversations where your agent struggles or fails.
As you make improvements, run these evals to see how behavior evolves. Low
scores indicate the agent now behaves differently, which might mean you fixed
the issue. You'll need to manually verify the new behavior is actually better.
@z

@x
Documenting edge cases: Save interesting or unusual conversations regardless of
quality. Use them to understand how your agent handles edge cases and whether
that behavior changes over time.
@y
Documenting edge cases: Save interesting or unusual conversations regardless of
quality. Use them to understand how your agent handles edge cases and whether
that behavior changes over time.
@z

@x
Evals measure whether behavior changed. You determine if that change is good or
bad.
@y
Evals measure whether behavior changed. You determine if that change is good or
bad.
@z

@x
## Creating an eval
@y
## Creating an eval
@z

@x
Save a conversation from an interactive session:
@y
Save a conversation from an interactive session:
@z

@x
```console
$ cagent run ./agent.yaml
```
@y
```console
$ cagent run ./agent.yaml
```
@z

@x
Have a conversation with your agent, then save it as an eval:
@y
Have a conversation with your agent, then save it as an eval:
@z

@x
```console
> /eval test-case-name
Eval saved to evals/test-case-name.json
```
@y
```console
> /eval test-case-name
Eval saved to evals/test-case-name.json
```
@z

@x
The conversation is saved to the `evals/` directory in your current working
directory. You can organize eval files in subdirectories if needed.
@y
The conversation is saved to the `evals/` directory in your current working
directory. You can organize eval files in subdirectories if needed.
@z

@x
## Running evals
@y
## Running evals
@z

@x
Run all evals in the default directory:
@y
Run all evals in the default directory:
@z

@x
```console
$ cagent eval ./agent.yaml
```
@y
```console
$ cagent eval ./agent.yaml
```
@z

@x
Use a custom eval directory:
@y
Use a custom eval directory:
@z

@x
```console
$ cagent eval ./agent.yaml ./my-evals
```
@y
```console
$ cagent eval ./agent.yaml ./my-evals
```
@z

@x
Run evals against an agent from a registry:
@y
Run evals against an agent from a registry:
@z

@x
```console
$ cagent eval agentcatalog/myagent
```
@y
```console
$ cagent eval agentcatalog/myagent
```
@z

@x
Example output:
@y
Example output:
@z

@x
```console
$ cagent eval ./agent.yaml
--- 0
First message: tell me something interesting about kil
Eval file: c7e556c5-dae5-4898-a38c-73cc8e0e6abe
Tool trajectory score: 1.000000
Rouge-1 score: 0.447368
Cost: 0.00
Output tokens: 177
```
@y
```console
$ cagent eval ./agent.yaml
--- 0
First message: tell me something interesting about kil
Eval file: c7e556c5-dae5-4898-a38c-73cc8e0e6abe
Tool trajectory score: 1.000000
Rouge-1 score: 0.447368
Cost: 0.00
Output tokens: 177
```
@z

@x
## Understanding results
@y
## Understanding results
@z

@x
For each eval, cagent shows:
@y
For each eval, cagent shows:
@z

@x
- **First message** - The initial user message from the saved conversation
- **Eval file** - The UUID of the eval file being run
- **Tool trajectory score** - How similarly the agent used tools (0-1 scale,
  higher is better)
- **[ROUGE-1](https://en.wikipedia.org/wiki/ROUGE_(metric)) score** - Text
  similarity between responses (0-1 scale, higher is better)
- **Cost** - The cost for this eval run
- **Output tokens** - Number of tokens generated
@y
- **First message** - The initial user message from the saved conversation
- **Eval file** - The UUID of the eval file being run
- **Tool trajectory score** - How similarly the agent used tools (0-1 scale,
  higher is better)
- **[ROUGE-1](https://en.wikipedia.org/wiki/ROUGE_(metric)) score** - Text
  similarity between responses (0-1 scale, higher is better)
- **Cost** - The cost for this eval run
- **Output tokens** - Number of tokens generated
@z

@x
Higher scores mean the agent behaved more similarly to the original recorded
conversation. A score of 1.0 means identical behavior.
@y
Higher scores mean the agent behaved more similarly to the original recorded
conversation. A score of 1.0 means identical behavior.
@z

@x
### What the scores mean
@y
### What the scores mean
@z

@x
**Tool trajectory score** measures whether the agent called the same tools in
the same order as the original conversation. Lower scores might indicate the
agent found a different approach to solve the problem, which isn't necessarily
wrong but worth investigating.
@y
**Tool trajectory score** measures whether the agent called the same tools in
the same order as the original conversation. Lower scores might indicate the
agent found a different approach to solve the problem, which isn't necessarily
wrong but worth investigating.
@z

@x
**Rouge-1 score** measures how similar the response text is to the original.
This is a heuristic measure - different wording might still be correct, so use
this as a signal rather than absolute truth.
@y
**Rouge-1 score** measures how similar the response text is to the original.
This is a heuristic measure - different wording might still be correct, so use
this as a signal rather than absolute truth.
@z

@x
### Interpreting your results
@y
### Interpreting your results
@z

@x
Scores close to 1.0 mean your changes maintained consistent behavior - the
agent is using the same approach and producing similar responses. This is
generally good; your changes didn't break existing functionality.
@y
Scores close to 1.0 mean your changes maintained consistent behavior - the
agent is using the same approach and producing similar responses. This is
generally good; your changes didn't break existing functionality.
@z

@x
Lower scores mean behavior changed compared to the saved conversation. This
could be a regression where the agent now performs worse, or it could be an
improvement where the agent found a better approach.
@y
Lower scores mean behavior changed compared to the saved conversation. This
could be a regression where the agent now performs worse, or it could be an
improvement where the agent found a better approach.
@z

@x
When scores drop, examine the actual behavior to determine if it's better or
worse. The eval files are stored as JSON in your evals directory - open the
file to see the original conversation. Then test your modified agent with the
same input to compare responses. If the new response is better, save a new
conversation to replace the eval. If it's worse, you found a regression.
@y
When scores drop, examine the actual behavior to determine if it's better or
worse. The eval files are stored as JSON in your evals directory - open the
file to see the original conversation. Then test your modified agent with the
same input to compare responses. If the new response is better, save a new
conversation to replace the eval. If it's worse, you found a regression.
@z

@x
The scores guide you to what changed. Your judgment determines if the change is
good or bad.
@y
The scores guide you to what changed. Your judgment determines if the change is
good or bad.
@z

@x
## When to use evals
@y
## When to use evals
@z

@x
Evals help you track behavior changes over time. They're useful for catching
regressions when you upgrade models or dependencies, documenting known failure
cases you want to fix, and understanding how edge cases evolve as you iterate.
@y
Evals help you track behavior changes over time. They're useful for catching
regressions when you upgrade models or dependencies, documenting known failure
cases you want to fix, and understanding how edge cases evolve as you iterate.
@z

@x
Evals aren't appropriate for determining which agent configuration works best -
they measure similarity to a saved conversation, not correctness. Use manual
testing to evaluate different configurations and decide which works better.
@y
Evals aren't appropriate for determining which agent configuration works best -
they measure similarity to a saved conversation, not correctness. Use manual
testing to evaluate different configurations and decide which works better.
@z

@x
Save conversations worth tracking. Build a collection of important workflows,
interesting edge cases, and known issues. Run your evals when making changes to
see what shifted.
@y
Save conversations worth tracking. Build a collection of important workflows,
interesting edge cases, and known issues. Run your evals when making changes to
see what shifted.
@z

@x
## What's next
@y
## What's next
@z

@x
- Check the [CLI reference](reference/cli.md#eval) for all `cagent eval`
  options
- Learn [best practices](best-practices.md) for building effective agents
- Review [example configurations](https://github.com/docker/cagent/tree/main/examples)
  for different agent types
@y
- Check the [CLI reference](reference/cli.md#eval) for all `cagent eval`
  options
- Learn [best practices](best-practices.md) for building effective agents
- Review [example configurations](https://github.com/docker/cagent/tree/main/examples)
  for different agent types
@z
