%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
    pagefind = await import("pagefind/pagefind.js");
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
