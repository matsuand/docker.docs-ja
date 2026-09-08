%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "RAG Tool"
description: "Give your agents access to document knowledge bases with background indexing, multiple retrieval strategies, and hybrid search."
keywords: docker agent, ai agents, tools, toolsets, rag tool
linkTitle: "RAG"
@y
title: "RAG Tool"
description: "Give your agents access to document knowledge bases with background indexing, multiple retrieval strategies, and hybrid search."
keywords: docker agent, ai agents, tools, toolsets, rag tool
linkTitle: "RAG"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/rag/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/rag/
@z

@x
_Give your agents access to document knowledge bases with background indexing, multiple retrieval strategies, and hybrid search._
@y
_Give your agents access to document knowledge bases with background indexing, multiple retrieval strategies, and hybrid search._
@z

@x
## Overview
@y
## Overview
@z

@x
The `rag` toolset lets agents search through your documents to find relevant information before responding. Knowledge bases are declared once at the top of the config under `rag:` and then referenced from any agent via `type: rag, ref: <name>`. Docker Agent supports:
@y
The `rag` toolset lets agents search through your documents to find relevant information before responding. Knowledge bases are declared once at the top of the config under `rag:` and then referenced from any agent via `type: rag, ref: <name>`. Docker Agent supports:
@z

@x
- **Background indexing** — Files are indexed automatically and re-indexed on change
- **Multiple strategies** — Semantic embeddings, BM25 keyword search, and LLM-enhanced search
- **Hybrid search** — Combine strategies with result fusion for best results
- **Reranking** — Re-score results with specialized models for improved relevance
@y
- **Background indexing** — Files are indexed automatically and re-indexed on change
- **Multiple strategies** — Semantic embeddings, BM25 keyword search, and LLM-enhanced search
- **Hybrid search** — Combine strategies with result fusion for best results
- **Reranking** — Re-score results with specialized models for improved relevance
@z

@x
RAG is the strategy to reach for when a document collection is too large to inline directly, or gets queried repeatedly across turns/sessions — see [Choosing a Large-Input Strategy](../../guides/headless/index.md#choosing-a-large-input-strategy) for how it compares to `@`/`/attach` attachments and prompt files.
@y
RAG is the strategy to reach for when a document collection is too large to inline directly, or gets queried repeatedly across turns/sessions — see [Choosing a Large-Input Strategy](../../guides/headless/index.md#choosing-a-large-input-strategy) for how it compares to `@`/`/attach` attachments and prompt files.
@z

@x
## Quick Start
@y
## Quick Start
@z

@x
```yaml
rag:
  my_docs:
    tool:
      description: "Technical documentation"
    docs: [./documents, ./some-doc.md]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        database: ./docs.db
        vector_dimensions: 1536
@y
```yaml
rag:
  my_docs:
    tool:
      description: "Technical documentation"
    docs: [./documents, ./some-doc.md]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        database: ./docs.db
        vector_dimensions: 1536
@z

@x
agents:
  root:
    model: openai/gpt-4o
    instruction: |
      You have access to a knowledge base. Use it to answer questions.
    toolsets:
      - type: rag
        ref: my_docs
```
@y
agents:
  root:
    model: openai/gpt-4o
    instruction: |
      You have access to a knowledge base. Use it to answer questions.
    toolsets:
      - type: rag
        ref: my_docs
```
@z

@x
## Retrieval Strategies
@y
## Retrieval Strategies
@z

@x
### Chunked Embeddings (Semantic Search)
@y
### Chunked Embeddings (Semantic Search)
@z

@x
Uses embedding models to find semantically similar content. Best for understanding intent, synonyms, and paraphrasing.
@y
Uses embedding models to find semantically similar content. Best for understanding intent, synonyms, and paraphrasing.
@z

@x
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    database: ./vector.db
    vector_dimensions: 1536
    similarity_metric: cosine_similarity
    threshold: 0.5
    limit: 10
    embedding_batch_size: 50
    chunking:
      size: 1000
      overlap: 100
```
@y
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    database: ./vector.db
    vector_dimensions: 1536
    similarity_metric: cosine_similarity
    threshold: 0.5
    limit: 10
    embedding_batch_size: 50
    chunking:
      size: 1000
      overlap: 100
```
@z

@x
### Semantic Embeddings (LLM-Enhanced)
@y
### Semantic Embeddings (LLM-Enhanced)
@z

@x
Uses an LLM to generate semantic summaries of each chunk before embedding, capturing meaning and intent. Best for code search and understanding implementations.
@y
Uses an LLM to generate semantic summaries of each chunk before embedding, capturing meaning and intent. Best for code search and understanding implementations.
@z

@x
```yaml
strategies:
  - type: semantic-embeddings
    embedding_model: openai/text-embedding-3-small
    vector_dimensions: 1536
    chat_model: openai/gpt-4o-mini
    database: ./semantic.db
    ast_context: true # include AST metadata
    chunking:
      size: 1000
      code_aware: true # AST-aware chunking
```
@y
```yaml
strategies:
  - type: semantic-embeddings
    embedding_model: openai/text-embedding-3-small
    vector_dimensions: 1536
    chat_model: openai/gpt-4o-mini
    database: ./semantic.db
    ast_context: true # include AST metadata
    chunking:
      size: 1000
      code_aware: true # AST-aware chunking
```
@z

@x
> [!NOTE]
> **Trade-offs**
>
> Semantic embeddings provide higher quality retrieval but slower indexing (LLM call per chunk) and additional API costs.
@y
> [!NOTE]
> **Trade-offs**
>
> Semantic embeddings provide higher quality retrieval but slower indexing (LLM call per chunk) and additional API costs.
@z

@x
### BM25 (Keyword Search)
@y
### BM25 (Keyword Search)
@z

@x
Traditional keyword matching using the BM25 algorithm. Best for exact terms, technical jargon, and code identifiers.
@y
Traditional keyword matching using the BM25 algorithm. Best for exact terms, technical jargon, and code identifiers.
@z

@x
```yaml
strategies:
  - type: bm25
    database: ./bm25.db
    k1: 1.5 # term frequency saturation
    b: 0.75 # length normalization
    threshold: 0.3
    limit: 10
    chunking:
      size: 1000
      overlap: 100
```
@y
```yaml
strategies:
  - type: bm25
    database: ./bm25.db
    k1: 1.5 # term frequency saturation
    b: 0.75 # length normalization
    threshold: 0.3
    limit: 10
    chunking:
      size: 1000
      overlap: 100
```
@z

@x
## Hybrid Search
@y
## Hybrid Search
@z

@x
Combine multiple strategies for best results. Strategies run in parallel and results are fused together:
@y
Combine multiple strategies for best results. Strategies run in parallel and results are fused together:
@z

@x
```yaml
rag:
  hybrid:
    docs: [./docs]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        database: ./vector.db
        vector_dimensions: 1536
        limit: 20
        chunking: { size: 1000, overlap: 100 }
      - type: bm25
        database: ./bm25.db
        limit: 15
        chunking: { size: 1000, overlap: 100 }
    results:
      fusion:
        strategy: rrf # Reciprocal Rank Fusion
        k: 60
      deduplicate: true
      limit: 5
```
@y
```yaml
rag:
  hybrid:
    docs: [./docs]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        database: ./vector.db
        vector_dimensions: 1536
        limit: 20
        chunking: { size: 1000, overlap: 100 }
      - type: bm25
        database: ./bm25.db
        limit: 15
        chunking: { size: 1000, overlap: 100 }
    results:
      fusion:
        strategy: rrf # Reciprocal Rank Fusion
        k: 60
      deduplicate: true
      limit: 5
```
@z

@x
## Fusion Strategies
@y
## Fusion Strategies
@z

@x
| Strategy   | Best For                          | Description                                                        |
| ---------- | --------------------------------- | ------------------------------------------------------------------ |
| `rrf`      | General use (recommended)         | Reciprocal Rank Fusion — rank-based, no score normalization needed |
| `weighted` | Known performance characteristics | Weight strategies differently (e.g., embeddings: 0.7, BM25: 0.3)   |
| `max`      | Same scoring scale                | Takes the maximum score from any strategy                          |
@y
| Strategy   | Best For                          | Description                                                        |
| ---------- | --------------------------------- | ------------------------------------------------------------------ |
| `rrf`      | General use (recommended)         | Reciprocal Rank Fusion — rank-based, no score normalization needed |
| `weighted` | Known performance characteristics | Weight strategies differently (e.g., embeddings: 0.7, BM25: 0.3)   |
| `max`      | Same scoring scale                | Takes the maximum score from any strategy                          |
@z

@x
## Reranking
@y
## Reranking
@z

@x
Re-score retrieved documents with a specialized model to improve relevance:
@y
Re-score retrieved documents with a specialized model to improve relevance:
@z

@x
```yaml
results:
  reranking:
    model: openai/gpt-4o-mini
    top_k: 10 # only rerank top 10
    threshold: 0.3 # minimum score after reranking
    criteria: |
      Prioritize official documentation over blog posts.
      Prefer recent information and practical examples.
  limit: 5
```
@y
```yaml
results:
  reranking:
    model: openai/gpt-4o-mini
    top_k: 10 # only rerank top 10
    threshold: 0.3 # minimum score after reranking
    criteria: |
      Prioritize official documentation over blog posts.
      Prefer recent information and practical examples.
  limit: 5
```
@z

@x
Supported reranking providers: **DMR** (native `/rerank` endpoint), **OpenAI**, **Anthropic**, **Gemini**.
@y
Supported reranking providers: **DMR** (native `/rerank` endpoint), **OpenAI**, **Anthropic**, **Gemini**.
@z

@x
## Code-Aware Chunking
@y
## Code-Aware Chunking
@z

@x
For source code, enable AST-based chunking to keep functions and methods intact:
@y
For source code, enable AST-based chunking to keep functions and methods intact:
@z

@x
```yaml
chunking:
  size: 2000
  code_aware: true # Uses tree-sitter for AST-based chunking
```
@y
```yaml
chunking:
  size: 2000
  code_aware: true # Uses tree-sitter for AST-based chunking
```
@z

@x
> [!NOTE]
> **Language Support**
>
> Currently supports Go (`.go`) files. More languages will be added. Falls back to plain text chunking for unsupported file types.
@y
> [!NOTE]
> **Language Support**
>
> Currently supports Go (`.go`) files. More languages will be added. Falls back to plain text chunking for unsupported file types.
@z

@x
## Debugging RAG
@y
## Debugging RAG
@z

@x
Enable debug logging to see retrieval details:
@y
Enable debug logging to see retrieval details:
@z

@x
```bash
$ docker agent run config.yaml --debug --log-file debug.log
```
@y
```bash
$ docker agent run config.yaml --debug --log-file debug.log
```
@z

@x
Look for log tags: `[RAG Manager]`, `[Chunked-Embeddings Strategy]`, `[BM25 Strategy]`, `[RRF Fusion]`, `[Reranker]`.
@y
Look for log tags: `[RAG Manager]`, `[Chunked-Embeddings Strategy]`, `[BM25 Strategy]`, `[RRF Fusion]`, `[Reranker]`.
@z

@x
**Permanent model errors abort early.** If the embedding model, semantic-LLM model, or reranking model returns a permanent error (HTTP 400, 401, 404, or 429 — invalid config, bad auth, unknown model, or rate limit), Docker Agent treats the model configuration as invalid and stops immediately rather than retrying doomed requests:
@y
**Permanent model errors abort early.** If the embedding model, semantic-LLM model, or reranking model returns a permanent error (HTTP 400, 401, 404, or 429 — invalid config, bad auth, unknown model, or rate limit), Docker Agent treats the model configuration as invalid and stops immediately rather than retrying doomed requests:
@z

@x
- **Indexing** — the entire indexing run is aborted after the first permanent failure (including 429). The error is surfaced in the logs so you know immediately if a model name or API key is wrong, rather than silently producing incomplete results.
- **Reranking** — a permanent error (including 429) permanently disables the reranker for the lifetime of the manager. Subsequent queries fall back to un-reranked results. Only transient errors (5xx, timeouts) fall back and retry on the next query.
@y
- **Indexing** — the entire indexing run is aborted after the first permanent failure (including 429). The error is surfaced in the logs so you know immediately if a model name or API key is wrong, rather than silently producing incomplete results.
- **Reranking** — a permanent error (including 429) permanently disables the reranker for the lifetime of the manager. Subsequent queries fall back to un-reranked results. Only transient errors (5xx, timeouts) fall back and retry on the next query.
@z

@x
> [!TIP]
> **Examples**
>
> See the [RAG examples](https://github.com/docker/docker-agent/tree/main/examples/rag) in the GitHub repo for complete, runnable configurations.
@y
> [!TIP]
> **Examples**
>
> See the [RAG examples](https://github.com/docker/docker-agent/tree/main/examples/rag) in the GitHub repo for complete, runnable configurations.
@z

@x
## Configuration Reference
@y
## Configuration Reference
@z

@x
### Top-Level RAG Fields
@y
### Top-Level RAG Fields
@z

@x
| Field         | Type     | Default | Description                                                    |
| ------------- | -------- | ------- | -------------------------------------------------------------- |
| `docs`        | []string | —       | Document paths/directories (shared across strategies)          |
| `description` | string   | —       | Human-readable description of this RAG source                  |
| `respect_vcs` | boolean  | `true`  | Respect `.gitignore` files when indexing documents             |
| `strategies`  | []object | —       | Array of retrieval strategy configurations                     |
| `results`     | object   | —       | Post-processing: fusion, reranking, deduplication, final limit |
@y
| Field         | Type     | Default | Description                                                    |
| ------------- | -------- | ------- | -------------------------------------------------------------- |
| `docs`        | []string | —       | Document paths/directories (shared across strategies)          |
| `description` | string   | —       | Human-readable description of this RAG source                  |
| `respect_vcs` | boolean  | `true`  | Respect `.gitignore` files when indexing documents             |
| `strategies`  | []object | —       | Array of retrieval strategy configurations                     |
| `results`     | object   | —       | Post-processing: fusion, reranking, deduplication, final limit |
@z

@x
### Chunked-Embeddings Strategy
@y
### Chunked-Embeddings Strategy
@z

@x
| Field                       | Type   | Default             | Description                                                  |
| --------------------------- | ------ | ------------------- | ------------------------------------------------------------ |
| `embedding_model`           | string | —                   | **Required.** Embedding model reference                      |
| `database`                  | string | —                   | Path to local SQLite database                                |
| `vector_dimensions`         | int    | —                   | Embedding dimensions (e.g., 1536 for text-embedding-3-small) |
| `similarity_metric`         | string | `cosine_similarity` | Similarity metric                                            |
| `threshold`                 | float  | `0.5`               | Minimum similarity score (0–1)                               |
| `limit`                     | int    | `5`                 | Max results from this strategy                               |
| `embedding_batch_size`      | int    | `50`                | Chunks per embedding request                                 |
| `max_embedding_concurrency` | int    | `3`                 | Max concurrent embedding requests                            |
| `chunking.size`             | int    | `1500`              | Chunk size in characters (`4000` when `code_aware` is set)   |
| `chunking.overlap`          | int    | `75`                | Overlap between chunks in characters                         |
| `chunking.code_aware`       | bool   | `false`             | AST-based chunking (Go files only)                           |
@y
| Field                       | Type   | Default             | Description                                                  |
| --------------------------- | ------ | ------------------- | ------------------------------------------------------------ |
| `embedding_model`           | string | —                   | **Required.** Embedding model reference                      |
| `database`                  | string | —                   | Path to local SQLite database                                |
| `vector_dimensions`         | int    | —                   | Embedding dimensions (e.g., 1536 for text-embedding-3-small) |
| `similarity_metric`         | string | `cosine_similarity` | Similarity metric                                            |
| `threshold`                 | float  | `0.5`               | Minimum similarity score (0–1)                               |
| `limit`                     | int    | `5`                 | Max results from this strategy                               |
| `embedding_batch_size`      | int    | `50`                | Chunks per embedding request                                 |
| `max_embedding_concurrency` | int    | `3`                 | Max concurrent embedding requests                            |
| `chunking.size`             | int    | `1500`              | Chunk size in characters (`4000` when `code_aware` is set)   |
| `chunking.overlap`          | int    | `75`                | Overlap between chunks in characters                         |
| `chunking.code_aware`       | bool   | `false`             | AST-based chunking (Go files only)                           |
@z

@x
### Semantic-Embeddings Strategy
@y
### Semantic-Embeddings Strategy
@z

@x
| Field                      | Type   | Default    | Description                                                        |
| -------------------------- | ------ | ---------- | ------------------------------------------------------------------ |
| `embedding_model`          | string | —          | **Required.** Embedding model reference                            |
| `chat_model`               | string | —          | **Required.** LLM for generating semantic summaries                |
| `vector_dimensions`        | int    | —          | **Required.** Embedding dimensions                                 |
| `database`                 | string | —          | Path to local SQLite database                                      |
| `semantic_prompt`          | string | (built-in) | Custom prompt template (`${path}`, `${content}`, `${ast_context}`) |
| `ast_context`              | bool   | `false`    | Include tree-sitter AST metadata in prompts                        |
| `threshold`                | float  | `0.5`      | Minimum similarity score (0–1)                                     |
| `limit`                    | int    | `5`        | Max results                                                        |
| `max_indexing_concurrency` | int    | `3`        | Max concurrent file indexing                                       |
| `chunking.size`            | int    | `1500`     | Chunk size in characters (`4000` when `code_aware` is set)         |
| `chunking.overlap`         | int    | `75`       | Overlap between chunks                                             |
| `chunking.code_aware`      | bool   | `false`    | AST-based chunking                                                 |
@y
| Field                      | Type   | Default    | Description                                                        |
| -------------------------- | ------ | ---------- | ------------------------------------------------------------------ |
| `embedding_model`          | string | —          | **Required.** Embedding model reference                            |
| `chat_model`               | string | —          | **Required.** LLM for generating semantic summaries                |
| `vector_dimensions`        | int    | —          | **Required.** Embedding dimensions                                 |
| `database`                 | string | —          | Path to local SQLite database                                      |
| `semantic_prompt`          | string | (built-in) | Custom prompt template (`${path}`, `${content}`, `${ast_context}`) |
| `ast_context`              | bool   | `false`    | Include tree-sitter AST metadata in prompts                        |
| `threshold`                | float  | `0.5`      | Minimum similarity score (0–1)                                     |
| `limit`                    | int    | `5`        | Max results                                                        |
| `max_indexing_concurrency` | int    | `3`        | Max concurrent file indexing                                       |
| `chunking.size`            | int    | `1500`     | Chunk size in characters (`4000` when `code_aware` is set)         |
| `chunking.overlap`         | int    | `75`       | Overlap between chunks                                             |
| `chunking.code_aware`      | bool   | `false`    | AST-based chunking                                                 |
@z

@x
### BM25 Strategy
@y
### BM25 Strategy
@z

@x
| Field              | Type   | Default | Description                                     |
| ------------------ | ------ | ------- | ----------------------------------------------- |
| `database`         | string | —       | Path to local SQLite database                   |
| `k1`               | float  | `1.5`   | Term frequency saturation (1.2–2.0 recommended) |
| `b`                | float  | `0.75`  | Length normalization (0–1)                      |
| `threshold`        | float  | `0.0`   | Minimum BM25 score                              |
| `limit`            | int    | `5`     | Max results                                     |
| `chunking.size`    | int    | `1500`  | Chunk size in characters                        |
| `chunking.overlap` | int    | `75`    | Overlap between chunks                          |
@y
| Field              | Type   | Default | Description                                     |
| ------------------ | ------ | ------- | ----------------------------------------------- |
| `database`         | string | —       | Path to local SQLite database                   |
| `k1`               | float  | `1.5`   | Term frequency saturation (1.2–2.0 recommended) |
| `b`                | float  | `0.75`  | Length normalization (0–1)                      |
| `threshold`        | float  | `0.0`   | Minimum BM25 score                              |
| `limit`            | int    | `5`     | Max results                                     |
| `chunking.size`    | int    | `1500`  | Chunk size in characters                        |
| `chunking.overlap` | int    | `75`    | Overlap between chunks                          |
@z

@x
### Results (Post-Processing)
@y
### Results (Post-Processing)
@z

@x
| Field                 | Type   | Default | Description                                                 |
| --------------------- | ------ | ------- | ----------------------------------------------------------- |
| `fusion.strategy`     | string | `rrf`   | Fusion method: `rrf`, `weighted`, or `max`                  |
| `fusion.k`            | int    | `60`    | RRF rank constant                                           |
| `deduplicate`         | bool   | `true`  | Remove duplicate results                                    |
| `limit`               | int    | `15`    | Final number of results                                     |
| `include_score`       | bool   | `false` | Include relevance scores in results                         |
| `return_full_content` | bool   | `false` | Return full document content instead of just matched chunks |
| `reranking.model`     | string | —       | Reranking model reference                                   |
| `reranking.top_k`     | int    | (`limit`) | Only rerank top K results. Defaults to the results `limit` when set.  |
| `reranking.threshold` | float  | `0.5`   | Minimum relevance score after reranking                     |
| `reranking.criteria`  | string | —       | Custom relevance guidance for the reranking model           |
@y
| Field                 | Type   | Default | Description                                                 |
| --------------------- | ------ | ------- | ----------------------------------------------------------- |
| `fusion.strategy`     | string | `rrf`   | Fusion method: `rrf`, `weighted`, or `max`                  |
| `fusion.k`            | int    | `60`    | RRF rank constant                                           |
| `deduplicate`         | bool   | `true`  | Remove duplicate results                                    |
| `limit`               | int    | `15`    | Final number of results                                     |
| `include_score`       | bool   | `false` | Include relevance scores in results                         |
| `return_full_content` | bool   | `false` | Return full document content instead of just matched chunks |
| `reranking.model`     | string | —       | Reranking model reference                                   |
| `reranking.top_k`     | int    | (`limit`) | Only rerank top K results. Defaults to the results `limit` when set.  |
| `reranking.threshold` | float  | `0.5`   | Minimum relevance score after reranking                     |
| `reranking.criteria`  | string | —       | Custom relevance guidance for the reranking model           |
@z
