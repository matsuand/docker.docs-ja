%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: RAG
description: How RAG gives your cagent agents access to codebases and documentation
keywords: [cagent, rag, retrieval, embeddings, semantic search]
@y
title: RAG
description: How RAG gives your cagent agents access to codebases and documentation
keywords: [cagent, rag, retrieval, embeddings, semantic search]
@z

@x
When you configure a RAG source in cagent, your agent automatically gains a
search tool for that knowledge base. The agent decides when to search, retrieves
only relevant information, and uses it to answer questions or complete tasks -
all without you manually managing what goes in the prompt.
@y
When you configure a RAG source in cagent, your agent automatically gains a
search tool for that knowledge base. The agent decides when to search, retrieves
only relevant information, and uses it to answer questions or complete tasks -
all without you manually managing what goes in the prompt.
@z

@x
This guide explains how cagent's RAG system works, when to use it, and how to
configure it effectively for your content.
@y
This guide explains how cagent's RAG system works, when to use it, and how to
configure it effectively for your content.
@z

@x
> [!NOTE]
> RAG is an advanced feature that requires configuration and tuning. The defaults
> work well for getting started, but tailoring the configuration to your specific
> content and use case significantly improves results.
@y
> [!NOTE]
> RAG is an advanced feature that requires configuration and tuning. The defaults
> work well for getting started, but tailoring the configuration to your specific
> content and use case significantly improves results.
@z

@x
## The problem: too much context
@y
## The problem: too much context
@z

@x
Your agent can work with your entire codebase, but it can't fit everything in
its context window. Even with 200K token limits, medium-sized projects are too
large. Finding relevant code buried in hundreds of files wastes context.
@y
Your agent can work with your entire codebase, but it can't fit everything in
its context window. Even with 200K token limits, medium-sized projects are too
large. Finding relevant code buried in hundreds of files wastes context.
@z

@x
Filesystem tools help agents read files, but the agent has to guess which files
to read. It can't search by meaning, only by filename. Ask "find the retry
logic" and the agent reads files hoping to stumble on the right code.
@y
Filesystem tools help agents read files, but the agent has to guess which files
to read. It can't search by meaning, only by filename. Ask "find the retry
logic" and the agent reads files hoping to stumble on the right code.
@z

@x
Grep finds exact text matches but misses related concepts. Searching
"authentication" won't find code using "auth" or "login." You either get
hundreds of matches or zero, and grep doesn't understand code structure - it
just matches strings anywhere they appear.
@y
Grep finds exact text matches but misses related concepts. Searching
"authentication" won't find code using "auth" or "login." You either get
hundreds of matches or zero, and grep doesn't understand code structure - it
just matches strings anywhere they appear.
@z

@x
RAG indexes your content ahead of time and enables semantic search. The agent
searches pre-indexed content by meaning, not exact words. It retrieves only
relevant chunks that respect code structure. No wasted context on exploration.
@y
RAG indexes your content ahead of time and enables semantic search. The agent
searches pre-indexed content by meaning, not exact words. It retrieves only
relevant chunks that respect code structure. No wasted context on exploration.
@z

@x
## How RAG works in cagent
@y
## How RAG works in cagent
@z

@x
Configure a RAG source in your cagent config:
@y
Configure a RAG source in your cagent config:
@z

@x
```yaml
rag:
  codebase:
    docs: [./src, ./pkg]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./code.db
@y
```yaml
rag:
  codebase:
    docs: [./src, ./pkg]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./code.db
@z

@x
agents:
  root:
    model: openai/gpt-5
    instruction: You are a coding assistant. Search the codebase when needed.
    rag: [codebase]
```
@y
agents:
  root:
    model: openai/gpt-5
    instruction: You are a coding assistant. Search the codebase when needed.
    rag: [codebase]
```
@z

@x
When you reference `rag: [codebase]`, cagent:
@y
When you reference `rag: [codebase]`, cagent:
@z

@x
1. **At startup** - Indexes your documents (first run only, blocks until complete)
2. **During conversation** - Gives the agent a search tool
3. **When the agent searches** - Retrieves relevant chunks and adds them to context
4. **On file changes** - Automatically re-indexes modified files
@y
1. **At startup** - Indexes your documents (first run only, blocks until complete)
2. **During conversation** - Gives the agent a search tool
3. **When the agent searches** - Retrieves relevant chunks and adds them to context
4. **On file changes** - Automatically re-indexes modified files
@z

@x
The agent decides when to search based on the conversation. You don't manage
what goes in context - the agent does.
@y
The agent decides when to search based on the conversation. You don't manage
what goes in context - the agent does.
@z

@x
### The indexing process
@y
### The indexing process
@z

@x
On first run, cagent:
@y
On first run, cagent:
@z

@x
- Reads files from configured paths
- Respects `.gitignore` patterns (can be disabled)
- Splits documents into chunks
- Creates searchable representations using your chosen strategy
- Stores everything in a local database
@y
- Reads files from configured paths
- Respects `.gitignore` patterns (can be disabled)
- Splits documents into chunks
- Creates searchable representations using your chosen strategy
- Stores everything in a local database
@z

@x
Subsequent runs reuse the index. If files change, cagent detects this and
re-indexes only what changed, keeping your knowledge base up to date without
manual intervention.
@y
Subsequent runs reuse the index. If files change, cagent detects this and
re-indexes only what changed, keeping your knowledge base up to date without
manual intervention.
@z

@x
## Retrieval strategies
@y
## Retrieval strategies
@z

@x
Different content requires different retrieval approaches. cagent supports
three strategies, each optimized for different use cases. The defaults work
well, but understanding the trade-offs helps you choose the right approach.
@y
Different content requires different retrieval approaches. cagent supports
three strategies, each optimized for different use cases. The defaults work
well, but understanding the trade-offs helps you choose the right approach.
@z

@x
### Semantic search (chunked-embeddings)
@y
### Semantic search (chunked-embeddings)
@z

@x
Converts text to vectors that represent meaning, enabling search by concept
rather than exact words:
@y
Converts text to vectors that represent meaning, enabling search by concept
rather than exact words:
@z

@x
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    vector_dimensions: 1536
    database: ./docs.db
    chunking:
      size: 1000
      overlap: 100
```
@y
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    vector_dimensions: 1536
    database: ./docs.db
    chunking:
      size: 1000
      overlap: 100
```
@z

@x
During indexing, documents are split into chunks and each chunk is converted
to a 1536-dimensional vector by the embedding model. These vectors are
essentially coordinates in a high-dimensional space where similar concepts are
positioned close together.
@y
During indexing, documents are split into chunks and each chunk is converted
to a 1536-dimensional vector by the embedding model. These vectors are
essentially coordinates in a high-dimensional space where similar concepts are
positioned close together.
@z

@x
When you search for "how do I authenticate users?", your query becomes a vector
and the database finds chunks with nearby vectors using cosine similarity
(measuring the angle between vectors). The embedding model learned that
"authentication," "auth," and "login" are related concepts, so searching for
one finds the others.
@y
When you search for "how do I authenticate users?", your query becomes a vector
and the database finds chunks with nearby vectors using cosine similarity
(measuring the angle between vectors). The embedding model learned that
"authentication," "auth," and "login" are related concepts, so searching for
one finds the others.
@z

@x
Example: The query "how do I authenticate users?" finds both "User
authentication requires a valid API token" and "Token-based auth validates
requests" despite different wording. It won't find "The authentication tests
are failing" because that's a different meaning despite containing the word.
@y
Example: The query "how do I authenticate users?" finds both "User
authentication requires a valid API token" and "Token-based auth validates
requests" despite different wording. It won't find "The authentication tests
are failing" because that's a different meaning despite containing the word.
@z

@x
This works well for documentation where users ask questions using different
terminology than your docs. The downside is it may miss exact technical terms
and sometimes you want literal matches, not semantic ones. Requires embedding
API calls during indexing.
@y
This works well for documentation where users ask questions using different
terminology than your docs. The downside is it may miss exact technical terms
and sometimes you want literal matches, not semantic ones. Requires embedding
API calls during indexing.
@z

@x
### Keyword search (BM25)
@y
### Keyword search (BM25)
@z

@x
Statistical algorithm that matches and ranks by term frequency and rarity:
@y
Statistical algorithm that matches and ranks by term frequency and rarity:
@z

@x
```yaml
strategies:
  - type: bm25
    database: ./bm25.db
    k1: 1.5
    b: 0.75
    chunking:
      size: 1000
      overlap: 100
```
@y
```yaml
strategies:
  - type: bm25
    database: ./bm25.db
    k1: 1.5
    b: 0.75
    chunking:
      size: 1000
      overlap: 100
```
@z

@x
During indexing, documents are tokenized and the algorithm calculates how often
each term appears (term frequency) and how rare it is across all documents
(inverse document frequency). The scoring index is stored in a local SQLite
database.
@y
During indexing, documents are tokenized and the algorithm calculates how often
each term appears (term frequency) and how rare it is across all documents
(inverse document frequency). The scoring index is stored in a local SQLite
database.
@z

@x
When you search for "HandleRequest function", the algorithm finds chunks
containing these exact terms and scores them based on term frequency, term
rarity, and document length. Finding "HandleRequest" is scored as more
significant than finding common words like "function". Think of it as grep with
statistical ranking.
@y
When you search for "HandleRequest function", the algorithm finds chunks
containing these exact terms and scores them based on term frequency, term
rarity, and document length. Finding "HandleRequest" is scored as more
significant than finding common words like "function". Think of it as grep with
statistical ranking.
@z

@x
Example: Searching "HandleRequest function" finds `func HandleRequest(w
http.ResponseWriter, r *http.Request)` and "The HandleRequest function
processes incoming requests", but not "process HTTP requests" despite that
being semantically similar.
@y
Example: Searching "HandleRequest function" finds `func HandleRequest(w
http.ResponseWriter, r *http.Request)` and "The HandleRequest function
processes incoming requests", but not "process HTTP requests" despite that
being semantically similar.
@z

@x
The `k1` parameter (default 1.5) controls how much repeated terms matter -
higher values emphasize repetition more. The `b` parameter (default 0.75)
controls length normalization - higher values penalize longer documents more.
@y
The `k1` parameter (default 1.5) controls how much repeated terms matter -
higher values emphasize repetition more. The `b` parameter (default 0.75)
controls length normalization - higher values penalize longer documents more.
@z

@x
This is fast, local (no API costs), and predictable for finding function names,
class names, API endpoints, and any identifier that appears verbatim. The
trade-off is zero understanding of meaning - "RetryHandler" and "retry logic"
won't match despite being related. Essential complement to semantic search.
@y
This is fast, local (no API costs), and predictable for finding function names,
class names, API endpoints, and any identifier that appears verbatim. The
trade-off is zero understanding of meaning - "RetryHandler" and "retry logic"
won't match despite being related. Essential complement to semantic search.
@z

@x
### LLM-enhanced semantic search (semantic-embeddings)
@y
### LLM-enhanced semantic search (semantic-embeddings)
@z

@x
Generates semantic summaries with an LLM before embedding, enabling search by
what code does rather than what it's called:
@y
Generates semantic summaries with an LLM before embedding, enabling search by
what code does rather than what it's called:
@z

@x
```yaml
strategies:
  - type: semantic-embeddings
    embedding_model: openai/text-embedding-3-small
    chat_model: openai/gpt-5-mini
    vector_dimensions: 1536
    database: ./code.db
    ast_context: true
    chunking:
      size: 1000
      code_aware: true
```
@y
```yaml
strategies:
  - type: semantic-embeddings
    embedding_model: openai/text-embedding-3-small
    chat_model: openai/gpt-5-mini
    vector_dimensions: 1536
    database: ./code.db
    ast_context: true
    chunking:
      size: 1000
      code_aware: true
```
@z

@x
During indexing, code is split using AST structure (functions stay intact),
then the `chat_model` generates a semantic summary of each chunk. The summary
gets embedded, not the raw code. When you search, your query matches against
these summaries, but the original code is returned.
@y
During indexing, code is split using AST structure (functions stay intact),
then the `chat_model` generates a semantic summary of each chunk. The summary
gets embedded, not the raw code. When you search, your query matches against
these summaries, but the original code is returned.
@z

@x
This solves a problem with regular embeddings: raw code embeddings are
dominated by variable names and implementation details. A function called
`processData` that implements retry logic won't semantically match "retry". But
when the LLM summarizes it first, the summary explicitly mentions "retry
logic," making it findable.
@y
This solves a problem with regular embeddings: raw code embeddings are
dominated by variable names and implementation details. A function called
`processData` that implements retry logic won't semantically match "retry". But
when the LLM summarizes it first, the summary explicitly mentions "retry
logic," making it findable.
@z

@x
Example: Consider this code:
@y
Example: Consider this code:
@z

@x
```go
func (c *Client) Do(req *Request) (*Response, error) {
    for i := 0; i < 3; i++ {
        resp, err := c.attempt(req)
        if err == nil { return resp, nil }
        time.Sleep(time.Duration(1<<i) * time.Second)
    }
    return nil, errors.New("max retries exceeded")
}
```
@y
```go
func (c *Client) Do(req *Request) (*Response, error) {
    for i := 0; i < 3; i++ {
        resp, err := c.attempt(req)
        if err == nil { return resp, nil }
        time.Sleep(time.Duration(1<<i) * time.Second)
    }
    return nil, errors.New("max retries exceeded")
}
```
@z

@x
The LLM summary is: "Implements exponential backoff retry logic for HTTP
requests, attempting up to 3 times with delays of 1s, 2s, 4s before failing."
@y
The LLM summary is: "Implements exponential backoff retry logic for HTTP
requests, attempting up to 3 times with delays of 1s, 2s, 4s before failing."
@z

@x
Searching "retry logic exponential backoff" now finds this code, despite the
code never using those words. The `ast_context: true` option includes AST
metadata in prompts for better understanding. The `code_aware: true` chunking
prevents splitting functions mid-implementation.
@y
Searching "retry logic exponential backoff" now finds this code, despite the
code never using those words. The `ast_context: true` option includes AST
metadata in prompts for better understanding. The `code_aware: true` chunking
prevents splitting functions mid-implementation.
@z

@x
This approach excels at finding code by behavior in large codebases with
inconsistent naming. The trade-off is significantly slower indexing (LLM call
per chunk) and higher API costs (both chat and embedding models). Often
overkill for well-documented code or simple projects.
@y
This approach excels at finding code by behavior in large codebases with
inconsistent naming. The trade-off is significantly slower indexing (LLM call
per chunk) and higher API costs (both chat and embedding models). Often
overkill for well-documented code or simple projects.
@z

@x
## Combining strategies with hybrid retrieval
@y
## Combining strategies with hybrid retrieval
@z

@x
Each strategy has strengths and weaknesses. Combining them captures both
semantic understanding and exact term matching:
@y
Each strategy has strengths and weaknesses. Combining them captures both
semantic understanding and exact term matching:
@z

@x
```yaml
rag:
  knowledge:
    docs: [./documentation, ./src]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./vector.db
        limit: 20
@y
```yaml
rag:
  knowledge:
    docs: [./documentation, ./src]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./vector.db
        limit: 20
@z

@x
      - type: bm25
        database: ./bm25.db
        limit: 15
@y
      - type: bm25
        database: ./bm25.db
        limit: 15
@z

@x
    results:
      fusion:
        strategy: rrf
        k: 60
      deduplicate: true
      limit: 5
```
@y
    results:
      fusion:
        strategy: rrf
        k: 60
      deduplicate: true
      limit: 5
```
@z

@x
### How fusion works
@y
### How fusion works
@z

@x
Both strategies run in parallel, each returning its top candidates (20 and 15
in this example). Fusion combines results using rank-based scoring, removes
duplicates, and returns the top 5 final results. Your agent gets results that
work for both semantic queries ("how do I...") and exact term searches ("find
`configure_auth` function").
@y
Both strategies run in parallel, each returning its top candidates (20 and 15
in this example). Fusion combines results using rank-based scoring, removes
duplicates, and returns the top 5 final results. Your agent gets results that
work for both semantic queries ("how do I...") and exact term searches ("find
`configure_auth` function").
@z

@x
### Fusion strategies
@y
### Fusion strategies
@z

@x
RRF (Reciprocal Rank Fusion) is recommended. It combines results based on rank
rather than absolute scores, which works reliably when strategies use different
scoring scales. No tuning required.
@y
RRF (Reciprocal Rank Fusion) is recommended. It combines results based on rank
rather than absolute scores, which works reliably when strategies use different
scoring scales. No tuning required.
@z

@x
For weighted fusion, you give more importance to one strategy:
@y
For weighted fusion, you give more importance to one strategy:
@z

@x
```yaml
fusion:
  strategy: weighted
  weights:
    chunked-embeddings: 0.7
    bm25: 0.3
```
@y
```yaml
fusion:
  strategy: weighted
  weights:
    chunked-embeddings: 0.7
    bm25: 0.3
```
@z

@x
This requires tuning for your content. Use it when you know one approach works
better for your use case.
@y
This requires tuning for your content. Use it when you know one approach works
better for your use case.
@z

@x
Max score fusion takes the highest score across strategies:
@y
Max score fusion takes the highest score across strategies:
@z

@x
```yaml
fusion:
  strategy: max
```
@y
```yaml
fusion:
  strategy: max
```
@z

@x
This only works if strategies use comparable scoring scales. Simple but less
sophisticated than RRF.
@y
This only works if strategies use comparable scoring scales. Simple but less
sophisticated than RRF.
@z

@x
## Improving retrieval quality
@y
## Improving retrieval quality
@z

@x
### Reranking results
@y
### Reranking results
@z

@x
Initial retrieval optimizes for speed. Reranking rescores results with a more
sophisticated model for better relevance:
@y
Initial retrieval optimizes for speed. Reranking rescores results with a more
sophisticated model for better relevance:
@z

@x
```yaml
results:
  reranking:
    model: openai/gpt-5-mini
    threshold: 0.3
    criteria: |
      When scoring relevance, prioritize:
      - Official documentation over community content
      - Recent information over outdated material
      - Practical examples over theoretical explanations
      - Code implementations over design discussions
  limit: 5
```
@y
```yaml
results:
  reranking:
    model: openai/gpt-5-mini
    threshold: 0.3
    criteria: |
      When scoring relevance, prioritize:
      - Official documentation over community content
      - Recent information over outdated material
      - Practical examples over theoretical explanations
      - Code implementations over design discussions
  limit: 5
```
@z

@x
The `criteria` field is powerful - use it to encode domain knowledge about what
makes results relevant for your specific use case. The more specific your
criteria, the better the reranking.
@y
The `criteria` field is powerful - use it to encode domain knowledge about what
makes results relevant for your specific use case. The more specific your
criteria, the better the reranking.
@z

@x
Trade-off: Significantly better results but adds latency and API costs (LLM
call for scoring each result).
@y
Trade-off: Significantly better results but adds latency and API costs (LLM
call for scoring each result).
@z

@x
### Chunking configuration
@y
### Chunking configuration
@z

@x
How you split documents dramatically affects retrieval quality. Tailor chunking
to your content type. Chunk size is measured in characters (Unicode code
points), not tokens.
@y
How you split documents dramatically affects retrieval quality. Tailor chunking
to your content type. Chunk size is measured in characters (Unicode code
points), not tokens.
@z

@x
For documentation and prose, use moderate chunks with overlap:
@y
For documentation and prose, use moderate chunks with overlap:
@z

@x
```yaml
chunking:
  size: 1000
  overlap: 100
  respect_word_boundaries: true
```
@y
```yaml
chunking:
  size: 1000
  overlap: 100
  respect_word_boundaries: true
```
@z

@x
Overlap preserves context at chunk boundaries. Respecting word boundaries
prevents cutting words in half.
@y
Overlap preserves context at chunk boundaries. Respecting word boundaries
prevents cutting words in half.
@z

@x
For code, use larger chunks with AST-based splitting:
@y
For code, use larger chunks with AST-based splitting:
@z

@x
```yaml
chunking:
  size: 2000
  code_aware: true
```
@y
```yaml
chunking:
  size: 2000
  code_aware: true
```
@z

@x
This keeps functions intact. The `code_aware` setting uses tree-sitter to
respect code structure.
@y
This keeps functions intact. The `code_aware` setting uses tree-sitter to
respect code structure.
@z

@x
> [!NOTE] <!-- TODO: update this when we add support for more languages. -->
> Currently only Go is supported; support for additional languages is planned.
@y
> [!NOTE] <!-- TODO: update this when we add support for more languages. -->
> Currently only Go is supported; support for additional languages is planned.
@z

@x
For short, focused content like API references:
@y
For short, focused content like API references:
@z

@x
```yaml
chunking:
  size: 500
  overlap: 50
```
@y
```yaml
chunking:
  size: 500
  overlap: 50
```
@z

@x
Brief sections need less overlap since they're naturally self-contained.
@y
Brief sections need less overlap since they're naturally self-contained.
@z

@x
Experiment with these values. If retrieval misses context, increase chunk size
or overlap. If results are too broad, decrease chunk size.
@y
Experiment with these values. If retrieval misses context, increase chunk size
or overlap. If results are too broad, decrease chunk size.
@z

@x
## Making decisions about RAG
@y
## Making decisions about RAG
@z

@x
### When to use RAG
@y
### When to use RAG
@z

@x
Use RAG when:
@y
Use RAG when:
@z

@x
- Your content is too large for the context window
- You want targeted retrieval, not everything at once
- Content changes and needs to stay current
- Agent needs to search across many files
@y
- Your content is too large for the context window
- You want targeted retrieval, not everything at once
- Content changes and needs to stay current
- Agent needs to search across many files
@z

@x
Don't use RAG when:
@y
Don't use RAG when:
@z

@x
- Content is small enough to include in agent instructions
- Information rarely changes (consider prompt engineering instead)
- You need real-time data (RAG uses pre-indexed snapshots)
- Content is already in a searchable format the agent can query directly
@y
- Content is small enough to include in agent instructions
- Information rarely changes (consider prompt engineering instead)
- You need real-time data (RAG uses pre-indexed snapshots)
- Content is already in a searchable format the agent can query directly
@z

@x
### Choosing retrieval strategies
@y
### Choosing retrieval strategies
@z

@x
Use semantic search (chunked-embeddings) for user-facing documentation, content
with varied terminology, and conceptual searches where users phrase questions
differently than your docs.
@y
Use semantic search (chunked-embeddings) for user-facing documentation, content
with varied terminology, and conceptual searches where users phrase questions
differently than your docs.
@z

@x
Use keyword search (BM25) for code identifiers, function names, API endpoints,
error messages, and any content where exact term matching matters. Essential
for technical jargon and proper nouns.
@y
Use keyword search (BM25) for code identifiers, function names, API endpoints,
error messages, and any content where exact term matching matters. Essential
for technical jargon and proper nouns.
@z

@x
Use LLM-enhanced semantic (semantic-embeddings) for code search by
functionality, finding implementations by behavior rather than name, or complex
technical content requiring deep understanding. Choose this when accuracy
matters more than indexing speed.
@y
Use LLM-enhanced semantic (semantic-embeddings) for code search by
functionality, finding implementations by behavior rather than name, or complex
technical content requiring deep understanding. Choose this when accuracy
matters more than indexing speed.
@z

@x
Use hybrid (multiple strategies) for general-purpose search across mixed
content, when you're unsure which approach works best, or for production
systems where quality matters most. Maximum coverage at the cost of complexity.
@y
Use hybrid (multiple strategies) for general-purpose search across mixed
content, when you're unsure which approach works best, or for production
systems where quality matters most. Maximum coverage at the cost of complexity.
@z

@x
### Tuning for your project
@y
### Tuning for your project
@z

@x
Start with defaults, then adjust based on results.
@y
Start with defaults, then adjust based on results.
@z

@x
If retrieval misses relevant content:
@y
If retrieval misses relevant content:
@z

@x
- Increase `limit` in strategies to retrieve more candidates
- Adjust `threshold` to be less strict
- Increase chunk `size` to capture more context
- Add more retrieval strategies
@y
- Increase `limit` in strategies to retrieve more candidates
- Adjust `threshold` to be less strict
- Increase chunk `size` to capture more context
- Add more retrieval strategies
@z

@x
If retrieval returns irrelevant content:
@y
If retrieval returns irrelevant content:
@z

@x
- Decrease `limit` to fewer candidates
- Increase `threshold` to be more strict
- Add reranking with specific criteria
- Decrease chunk `size` for more focused results
@y
- Decrease `limit` to fewer candidates
- Increase `threshold` to be more strict
- Add reranking with specific criteria
- Decrease chunk `size` for more focused results
@z

@x
If indexing is too slow:
@y
If indexing is too slow:
@z

@x
- Increase `batch_size` for fewer API calls
- Increase `max_embedding_concurrency` for parallelism
- Consider BM25 instead of embeddings (local, no API)
- Use smaller embedding models
@y
- Increase `batch_size` for fewer API calls
- Increase `max_embedding_concurrency` for parallelism
- Consider BM25 instead of embeddings (local, no API)
- Use smaller embedding models
@z

@x
If results lack context:
@y
If results lack context:
@z

@x
- Increase chunk `overlap`
- Increase chunk `size`
- Use `return_full_content: true` to return entire documents
- Add neighboring chunks to results
@y
- Increase chunk `overlap`
- Increase chunk `size`
- Use `return_full_content: true` to return entire documents
- Add neighboring chunks to results
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Configuration reference](reference/config.md#rag) - Complete RAG options and
  parameters
- [RAG examples](https://github.com/docker/cagent/tree/main/examples/rag) -
  Working configurations for different scenarios
- [Tools reference](reference/toolsets.md) - How RAG search tools work in agent workflows
@y
- [Configuration reference](reference/config.md#rag) - Complete RAG options and
  parameters
- [RAG examples](https://github.com/docker/cagent/tree/main/examples/rag) -
  Working configurations for different scenarios
- [Tools reference](reference/toolsets.md) - How RAG search tools work in agent workflows
@z
