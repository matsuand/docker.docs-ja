%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- search button, mobile (link off to the search page for now) -->
<a href="/search" class="sm:hidden">
  <span class="icon-svg">{{ partialCached "icon" "search" "search" }}</span>
</a>
<!-- search button -->
<div x-ref="searchBarRef" x-data="{ open: false, focus: false }" @focus="open = true;" @click.outside="open = false;"
  @keyup.escape.window="open = false" id="search-bar"
  class="hidden sm:flex relative bg-white/10 rounded items-center p-2 sm:w-full xl:w-[400px]">
  {{ (resources.Get "images/search-ai.svg").Content | safeHTML }}
  <input x-ref="searchBarInput" type="search" id="search-bar-input" @click="open = true" @focus="open = true;"
    @blur.window.capture="$refs.searchBarRef.contains($event.relatedTarget) || (open = false);"
    @keyup.enter.prevent="window.location.href = '/search/?q=' + $event.target.value;"
    @keyup.escape.prevent="open = false;" @keydown.window="(e) => {
          switch(e.key) {
          case 'k':
            if (e.metaKey || e.ctrlKey) {
              e.preventDefault();
              $el.focus();
              open = true;
            }
            break;
          }
        }" class="flex-grow px-2 bg-transparent text-white placeholder:text-white outline-none" placeholder="Search"
    tabindex="0" />
  <div x-cloak :class="open && 'hidden'" class="border px-1 text-sm border-white rounded flex items-center">
    <div class="-mt-0.5">
      <span x-show="navigator.platform == 'MacIntel'" class="icon-svg icon-sm">{{ partialCached "icon" "keyboard_command_key" "keyboard_command_key" }}</span>
      <span x-show="navigator.platform != 'MacIntel'" class="icon-svg icon-sm">{{ partialCached "icon" "keyboard_control_key" "keyboard_control_key" }}</span>
    </div>
    <span>K</span>
  </div>
  <div x-cloak :class="open || 'hidden'">
    <button tabindex="-1" @click="$refs.searchBarInput.value = ''; open = false" class="text-white hover:text-white">
      <span class="icon-svg">{{ partialCached "icon" "close" "close" }}</span>
    </button>
  </div>
  <div x-show="open" x-cloak
    class="absolute px-6 py-4 right-0 w-screen max-w-xl top-full bg-background-light dark:bg-background-dark rounded shadow-lg z-50">
    <button @click="open = false"
      class="text-black dark:text-white py-1 px-2 rounded w-full open-kapa-widget flex justify-between items-center hover:bg-gray-light-200 dark:hover:bg-gray-dark-200">
      <div class="flex gap-1 items-center">
        <img src="{{ (resources.Get "images/ai-stars.svg").Permalink }}" alt="AI Stars" />
        <span>Ask AI</span>
      </div>
      <span>→</span>
    </button>
    <hr class="mt-2 border-b border-divider-light dark:border-divider-dark">
    <div id="search-bar-results">
      <div class="p-2 text-gray-light dark:text-gray-dark">Start typing to search…</div>
      <!-- results -->
    </div>
  </div>
  <script type="module">
    window.addEventListener("load", async function () {
      const pagefind = await import("/pagefind/pagefind.js");
@y
<!-- search button, mobile (link off to the search page for now) -->
<a href="/search" class="sm:hidden">
  <span class="icon-svg">{{ partialCached "icon" "search" "search" }}</span>
</a>
<!-- search button -->
<div x-ref="searchBarRef" x-data="{ open: false, focus: false }" @focus="open = true;" @click.outside="open = false;"
  @keyup.escape.window="open = false" id="search-bar"
  class="hidden sm:flex relative bg-white/10 rounded items-center p-2 sm:w-full xl:w-[400px]">
  {{ (resources.Get "images/search-ai.svg").Content | safeHTML }}
  <input x-ref="searchBarInput" type="search" id="search-bar-input" @click="open = true" @focus="open = true;"
    @blur.window.capture="$refs.searchBarRef.contains($event.relatedTarget) || (open = false);"
    @keyup.enter.prevent="window.location.href = '/search/?q=' + $event.target.value;"
    @keyup.escape.prevent="open = false;" @keydown.window="(e) => {
          switch(e.key) {
          case 'k':
            if (e.metaKey || e.ctrlKey) {
              e.preventDefault();
              $el.focus();
              open = true;
            }
            break;
          }
        }" class="flex-grow px-2 bg-transparent text-white placeholder:text-white outline-none" placeholder="Search"
    tabindex="0" />
  <div x-cloak :class="open && 'hidden'" class="border px-1 text-sm border-white rounded flex items-center">
    <div class="-mt-0.5">
      <span x-show="navigator.platform == 'MacIntel'" class="icon-svg icon-sm">{{ partialCached "icon" "keyboard_command_key" "keyboard_command_key" }}</span>
      <span x-show="navigator.platform != 'MacIntel'" class="icon-svg icon-sm">{{ partialCached "icon" "keyboard_control_key" "keyboard_control_key" }}</span>
    </div>
    <span>K</span>
  </div>
  <div x-cloak :class="open || 'hidden'">
    <button tabindex="-1" @click="$refs.searchBarInput.value = ''; open = false" class="text-white hover:text-white">
      <span class="icon-svg">{{ partialCached "icon" "close" "close" }}</span>
    </button>
  </div>
  <div x-show="open" x-cloak
    class="absolute px-6 py-4 right-0 w-screen max-w-xl top-full bg-background-light dark:bg-background-dark rounded shadow-lg z-50">
    <button @click="open = false"
      class="text-black dark:text-white py-1 px-2 rounded w-full open-kapa-widget flex justify-between items-center hover:bg-gray-light-200 dark:hover:bg-gray-dark-200">
      <div class="flex gap-1 items-center">
        <img src="{{ (resources.Get "images/ai-stars.svg").Permalink }}" alt="AI Stars" />
        <span>Ask AI</span>
      </div>
      <span>→</span>
    </button>
    <hr class="mt-2 border-b border-divider-light dark:border-divider-dark">
    <div id="search-bar-results">
      <div class="p-2 text-gray-light dark:text-gray-dark">Start typing to search…</div>
      <!-- results -->
    </div>
  </div>
  <script type="module">
    window.addEventListener("load", async function () {
      const pagefind = await import("/pagefind/pagefind.js");
@z

@x
      const searchBarInput = document.querySelector("#search-bar-input");
      const searchBarResults = document.querySelector(
        "#search-bar-results",
      );
@y
      const searchBarInput = document.querySelector("#search-bar-input");
      const searchBarResults = document.querySelector(
        "#search-bar-results",
      );
@z

@x
      async function search(e) {
        const query = e.target.value;
        if (query === "") {
          searchBarResults.innerHTML = `<div class="p-2 text-gray-light dark:text-gray-dark">Start typing to search…</div>`;
          return;
        }
        const search = await pagefind.debouncedSearch(query);
        if (search === null) {
          return;
        } else {
          const resultsLength = search.results.length
          const resultsData = await Promise.all(search.results.slice(0, 5).map(r => r.data()));
          const results = resultsData.map((item, index) => ({...item, index: index + 1}));
@y
      async function search(e) {
        const query = e.target.value;
        if (query === "") {
          searchBarResults.innerHTML = `<div class="p-2 text-gray-light dark:text-gray-dark">Start typing to search…</div>`;
          return;
        }
        const search = await pagefind.debouncedSearch(query);
        if (search === null) {
          return;
        } else {
          const resultsLength = search.results.length
          const resultsData = await Promise.all(search.results.slice(0, 5).map(r => r.data()));
          const results = resultsData.map((item, index) => ({...item, index: index + 1}));
@z

@x
          if (query) {
            searchBarResults.classList.remove("hidden");
          } else {
            searchBarResults.classList.add("hidden");
          }
@y
          if (query) {
            searchBarResults.classList.remove("hidden");
          } else {
            searchBarResults.classList.add("hidden");
          }
@z

@x
          let resultsHTML = `<div class="p-2 text-gray-light dark:text-gray-dark">${resultsLength} results</div>`;
          resultsHTML += results
            .map((item) => {
              return `<div class="p-2">
              <div class="flex flex-col">
                <a class="link" href="${item.url}" data-query="${query}" data-index="${item.index}">${item.meta.title}</a>
                <p class="text-black dark:text-white overflow-hidden">…${item.excerpt}…</p>
              </div>
              </div>`;
            })
            .join("");
          if (resultsLength > 5) {
            resultsHTML += `<div class="w-fit ml-auto px-4 py-2"><a href="/search/?q=${query}" class="link">Show all results</a></div>`;
          }
@y
          let resultsHTML = `<div class="p-2 text-gray-light dark:text-gray-dark">${resultsLength} results</div>`;
          resultsHTML += results
            .map((item) => {
              return `<div class="p-2">
              <div class="flex flex-col">
                <a class="link" href="${item.url}" data-query="${query}" data-index="${item.index}">${item.meta.title}</a>
                <p class="text-black dark:text-white overflow-hidden">…${item.excerpt}…</p>
              </div>
              </div>`;
            })
            .join("");
          if (resultsLength > 5) {
            resultsHTML += `<div class="w-fit ml-auto px-4 py-2"><a href="/search/?q=${query}" class="link">Show all results</a></div>`;
          }
@z

@x
          searchBarResults.innerHTML = resultsHTML;
        }
      }
@y
          searchBarResults.innerHTML = resultsHTML;
        }
      }
@z

@x
      searchBarInput.addEventListener("input", search);
@y
      searchBarInput.addEventListener("input", search);
@z

@x
      // Event delegation for tracking link clicks
      if (window.heap !== undefined) {
        searchBarResults.addEventListener('click', function (event) {
          if (event.target.tagName === 'A' && event.target.closest('.link')) {
            const searchQuery = event.target.getAttribute('data-query');
            const resultIndex = event.target.getAttribute('data-index');
            const url = new URL(event.target.href);
            const properties = {
              docs_search_target_path: url.pathname,
              docs_search_target_title: event.target.textContent,
              docs_search_query_text: searchQuery,
              docs_search_target_index: resultIndex,
              docs_search_source_path: window.location.pathname,
              docs_search_source_title: document.title,
            };
            heap.track("Docs - Search - Click - Result Link", properties);
          }
        });
      }
    });
  </script>
</div>
@y
      // Event delegation for tracking link clicks
      if (window.heap !== undefined) {
        searchBarResults.addEventListener('click', function (event) {
          if (event.target.tagName === 'A' && event.target.closest('.link')) {
            const searchQuery = event.target.getAttribute('data-query');
            const resultIndex = event.target.getAttribute('data-index');
            const url = new URL(event.target.href);
            const properties = {
              docs_search_target_path: url.pathname,
              docs_search_target_title: event.target.textContent,
              docs_search_query_text: searchQuery,
              docs_search_target_index: resultIndex,
              docs_search_source_path: window.location.pathname,
              docs_search_source_title: document.title,
            };
            heap.track("Docs - Search - Click - Result Link", properties);
          }
        });
      }
    });
  </script>
</div>
@z
