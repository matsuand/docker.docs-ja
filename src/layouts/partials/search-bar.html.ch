%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
    @keyup.enter.prevent="window.location.href = '/search/?q=' + $event.target.value;"
@y
    @keyup.enter.prevent="window.location.href = '__SUBDIR__/search/?q=' + $event.target.value;"
@z

@x
    @click="window.location.href = '/search/?q=' + $refs.searchBarInput.value;"
@y
    @click="window.location.href = '__SUBDIR__/search/?q=' + $refs.searchBarInput.value;"
@z

        <button onclick="askAI('search-bar-input')" class="link">AI に質問</button
@x
        Start typing to search or try
@y
        Start typing to search or try
@z
@x
        " class="link">Ask AI</button>.
@y
        " class="link">AI に質問</button>.
@z

@x
      const pagefind = await import("/pagefind/pagefind.js");
@y
      const pagefind = await import("__SUBDIR__/pagefind/pagefind.js");
@z

@x
  resultsHTML += `<div class="w-fit ml-auto px-4 py-2"><a href="/search/?q=${query}" class="link">Show all results</a></div>`;
@y
  resultsHTML += `<div class="w-fit ml-auto px-4 py-2"><a href="__SUBDIR__/search/?q=${query}" class="link">Show all results</a></div>`;
@z
