%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use-case guides
keywords: guide, use-case
description: Learn how to accomplish tasks with Docker.
@y
title: Use-case guides
keywords: guide, use-case
description: Learn how to accomplish tasks with Docker.
@z

% grid_genai:

@x
- title: PDF analysis and chat
  description: Learn how to containerize a GenAI app that analyzes PDFs.
  icon: article
  link: /guides/use-case/genai-pdf-bot/
@y
- title: PDF analysis and chat
  description: Learn how to containerize a GenAI app that analyzes PDFs.
  icon: article
  link: __SUBDIR__/guides/use-case/genai-pdf-bot/
@z

@x
- title: Video transcription and chat
  description: Explore a video transcription app that lets you ask questions about videos.
  icon: play_circle
  link: /guides/use-case/genai-video-bot/
@y
- title: Video transcription and chat
  description: Explore a video transcription app that lets you ask questions about videos.
  icon: play_circle
  link: __SUBDIR__/guides/use-case/genai-video-bot/
@z

% grid_nlp:

@x
- title: Language translation
  description: Build and run an app to translate languages.
  link: /guides/use-case/nlp/language-translation/
  icon: translate
@y
- title: Language translation
  description: Build and run an app to translate languages.
  link: __SUBDIR__/guides/use-case/nlp/language-translation/
  icon: translate
@z

@x
- title: Named entity recognition
  description: Explore an app that can identify named entities, like people, organizations, or locations.
  link: /guides/use-case/nlp/named-entity-recognition/
  icon: badge
@y
- title: Named entity recognition
  description: Explore an app that can identify named entities, like people, organizations, or locations.
  link: __SUBDIR__/guides/use-case/nlp/named-entity-recognition/
  icon: badge
@z

@x
- title: Sentiment analysis
  description: Learn how to analyze text for sentiment, like positive, negative, or neutral.
  link: /guides/use-case/nlp/sentiment-analysis/
  icon: sentiment_very_satisfied
@y
- title: Sentiment analysis
  description: Learn how to analyze text for sentiment, like positive, negative, or neutral.
  link: __SUBDIR__/guides/use-case/nlp/sentiment-analysis/
  icon: sentiment_very_satisfied
@z

@x
- title: Text classification
  description: Build a text classification app and analyze the precision of your model.
  link: /guides/use-case/nlp/text-classification/
  icon: text_snippet
@y
- title: Text classification
  description: Build a text classification app and analyze the precision of your model.
  link: __SUBDIR__/guides/use-case/nlp/text-classification/
  icon: text_snippet
@z

@x
- title: Text summarization
  description: Explore an app that can summarize text.
  link: /guides/use-case/nlp/text-summarization/
  icon: summarize
@y
- title: Text summarization
  description: Explore an app that can summarize text.
  link: __SUBDIR__/guides/use-case/nlp/text-summarization/
  icon: summarize
@z

@x
Explore this collection of use-case guides designed to help you leverage Docker
for a variety of advanced applications. From generative AI to security, discover
how Docker can streamline your projects and workflows.
@y
Explore this collection of use-case guides designed to help you leverage Docker
for a variety of advanced applications. From generative AI to security, discover
how Docker can streamline your projects and workflows.
@z

@x
## Generative AI
@y
## Generative AI
@z

@x
{{< grid items="grid_genai" >}}
@y
{{< grid items="grid_genai" >}}
@z

@x
## Natural language processing
@y
## Natural language processing
@z

@x
{{< grid items="grid_nlp" >}}
@y
{{< grid items="grid_nlp" >}}
@z

@x
## Data science
@y
## Data science
@z

@x
{{< card
  title="Data science with JupyterLab"
  icon=analytics
  link=/guides/use-case/jupyter/
  description="Set up a JupyterLab environment to conduct and share data science research, making your projects more reproducible and scalable."
>}}
@y
{{< card
  title="Data science with JupyterLab"
  icon=analytics
  link=__SUBDIR__/guides/use-case/jupyter/
  description="Set up a JupyterLab environment to conduct and share data science research, making your projects more reproducible and scalable."
>}}
@z

@x
## Security
@y
## Security
@z

@x
{{< card
  title="Suppress CVEs with VEX"
  icon=verified_user
  link=/scout/guides/vex/
  description="Learn how to suppress non-applicable or fixed vulnerabilities found in your images."
>}}
@y
{{< card
  title="Suppress CVEs with VEX"
  icon=verified_user
  link=__SUBDIR__/scout/guides/vex/
  description="Learn how to suppress non-applicable or fixed vulnerabilities found in your images."
>}}
@z
