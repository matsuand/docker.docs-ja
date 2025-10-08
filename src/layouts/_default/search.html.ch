%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
  <h1 class="py-4">{{ .Title }}</h1>
@y
  <h1 class="py-4">検索</h1>
@z

@x
        placeholder="Search…"
@y
        placeholder="検索中…"
@z

@x
          Not finding what you're looking for? Try
@y
          検索では見つかりませんでしたか？ こちらをどうぞ
@z

@x
          <span>Ask&nbsp;AI</span>
@y
          <span>AI&nbsp;に質問</span>
@z

@x
    pagefind = await import("/pagefind/pagefind.js");
@y
    pagefind = await import("__SUBDIR__/pagefind/pagefind.js");
@z

@x
        searchPageResults.innerHTML = `<div class="p-4">No results found</div>`;
@y
        searchPageResults.innerHTML = `<div class="p-4">見つかりませんでした。</div>`;
@z

@x
      let resultsHTML = `<div class="text-gray-400 dark:text-gray-500 p-2">${resultsLength} results</div>`;
@y
      let resultsHTML = `<div class="text-gray-400 dark:text-gray-500 p-2">${resultsLength} 件</div>`;
@z

@x
                 <a href="/search/?q=${query}&page=${i}" class="pagination-link bg-gray-200 dark:bg-gray-800 dark:text-gray-200">${i}</a>
@y
                 <a href="__SUBDIR__/search/?q=${query}&page=${i}" class="pagination-link bg-gray-200 dark:bg-gray-800 dark:text-gray-200">${i}</a>
@z

@x
                <a href="/search/?q=${query}&page=${i}" class="pagination-link bg-gray-100 dark:bg-gray-900 dark:text-gray-400">${i}</a>
@y
                <a href="__SUBDIR__/search/?q=${query}&page=${i}" class="pagination-link bg-gray-100 dark:bg-gray-900 dark:text-gray-400">${i}</a>
@z
