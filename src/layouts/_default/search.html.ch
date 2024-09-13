%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!doctype html>
<html lang="en">
@y
<!doctype html>
<html lang="en">
@z

@x
<head>
  {{ partial "head.html" . }}
</head>
@y
<head>
  {{ partial "head.html" . }}
</head>
@z

@x
<body class="flex min-h-screen flex-col bg-background-light text-base dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex justify-center">
    <div class="w-lvw overflow-clip p-6 pt-0 lg:w-[1200px]">
      <article class="prose max-w-none dark:prose-invert">
        <h1 class="py-4">{{ .Title }}</h1>
        {{ .Content }}
        <div class="not-prose">
          <div class="flex gap-4">
            <input type="search" id="search-page-input"
              class="ring-[1.5px] ring-gray-light-200 dark:ring-gray-dark-400 w-full max-w-xl rounded px-4 py-2 outline-none bg-white dark:bg-background-dark focus:ring-blue-light dark:focus:ring-blue-dark"
              placeholder="Search…" tabindex="0" />
            <button
              class="py-1 px-4 rounded open-kapa-widget flex w-fit gap-2 items-center hover:bg-gray-light-200 dark:hover:bg-gray-dark-200">
              <span>Ask&nbsp;AI</span>
              <img height="24px" width="24px" src="{{ (resources.Get "images/ai-stars.svg").Permalink }}"
                alt="AI sparkles!" />
            </button>
          </div>
          <hr class="border-divider-light dark:border-divider-dark">
          <div id="search-page-results">
            <!-- results -->
          </div>
        </div>
      </article>
    </div>
  </main>
  <footer class="mt-auto">{{ partialCached "footer.html" . }}</footer>
  <script type="module">
    // Global variable to hold the pagefind module
    let pagefind;
@y
<body class="flex min-h-screen flex-col bg-background-light text-base dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex justify-center">
    <div class="w-lvw overflow-clip p-6 pt-0 lg:w-[1200px]">
      <article class="prose max-w-none dark:prose-invert">
        <h1 class="py-4">{{ .Title }}</h1>
        {{ .Content }}
        <div class="not-prose">
          <div class="flex gap-4">
            <input type="search" id="search-page-input"
              class="ring-[1.5px] ring-gray-light-200 dark:ring-gray-dark-400 w-full max-w-xl rounded px-4 py-2 outline-none bg-white dark:bg-background-dark focus:ring-blue-light dark:focus:ring-blue-dark"
              placeholder="Search…" tabindex="0" />
            <button
              class="py-1 px-4 rounded open-kapa-widget flex w-fit gap-2 items-center hover:bg-gray-light-200 dark:hover:bg-gray-dark-200">
              <span>Ask&nbsp;AI</span>
              <img height="24px" width="24px" src="{{ (resources.Get "images/ai-stars.svg").Permalink }}"
                alt="AI sparkles!" />
            </button>
          </div>
          <hr class="border-divider-light dark:border-divider-dark">
          <div id="search-page-results">
            <!-- results -->
          </div>
        </div>
      </article>
    </div>
  </main>
  <footer class="mt-auto">{{ partialCached "footer.html" . }}</footer>
  <script type="module">
    // Global variable to hold the pagefind module
    let pagefind;
@z

@x
    // Initialize the pagefind module and fire a search if the query parameter exists
    window.addEventListener("load", async function () {
      // Hydrate pagefind
      pagefind = await import("/pagefind/pagefind.js");
@y
    // Initialize the pagefind module and fire a search if the query parameter exists
    window.addEventListener("load", async function () {
      // Hydrate pagefind
      pagefind = await import("/pagefind/pagefind.js");
@z

@x
      // Get the query parameter from the URL
      const urlParams = new URLSearchParams(window.location.search);
      const query = urlParams.get("q");
@y
      // Get the query parameter from the URL
      const urlParams = new URLSearchParams(window.location.search);
      const query = urlParams.get("q");
@z

@x
      // If no query parameter is set, return
      if (!query) {
        return;
      }
@y
      // If no query parameter is set, return
      if (!query) {
        return;
      }
@z

@x
      const searchInput = document.getElementById("search-page-input");
@y
      const searchInput = document.getElementById("search-page-input");
@z

@x
      // Set the value of the input field to the query parameter
      searchInput.value = query;
@y
      // Set the value of the input field to the query parameter
      searchInput.value = query;
@z

@x
      // Trigger the input event to simulate user typing
      const event = new Event("input", {
        bubbles: true,
        cancelable: true,
      });
      // Trigger the input event for the search input
      searchInput.dispatchEvent(event);
      searchInput.focus();
    });
@y
      // Trigger the input event to simulate user typing
      const event = new Event("input", {
        bubbles: true,
        cancelable: true,
      });
      // Trigger the input event for the search input
      searchInput.dispatchEvent(event);
      searchInput.focus();
    });
@z

@x
    const searchPageInput = document.querySelector("#search-page-input");
    const searchPageResults = document.querySelector("#search-page-results");
@y
    const searchPageInput = document.querySelector("#search-page-input");
    const searchPageResults = document.querySelector("#search-page-results");
@z

@x
    // onPageSearch returns 10 results per query
    async function onPageSearch(e) {
      pagefind.init();
      const query = e.target.value;
@y
    // onPageSearch returns 10 results per query
    async function onPageSearch(e) {
      pagefind.init();
      const query = e.target.value;
@z

@x
      // Set the query parameter in the URL
      const params = new URLSearchParams(document.location.search);
      params.set("q", query);
@y
      // Set the query parameter in the URL
      const params = new URLSearchParams(document.location.search);
      params.set("q", query);
@z

@x
      // Default the current page to 1
      let currentPage = 1;
@y
      // Default the current page to 1
      let currentPage = 1;
@z

@x
      // Check if the page parameter exists
      const page = params.get("page");
      // Calculate the range start based on the page parameter
      if (page) {
        currentPage = parseInt(page);
      }
      const rangeStart = (currentPage - 1) * 10;
      const rangeEnd = rangeStart + 10;
@y
      // Check if the page parameter exists
      const page = params.get("page");
      // Calculate the range start based on the page parameter
      if (page) {
        currentPage = parseInt(page);
      }
      const rangeStart = (currentPage - 1) * 10;
      const rangeEnd = rangeStart + 10;
@z

@x
      // Execute the search
      const search = await pagefind.debouncedSearch(query);
      // If no search results are found, exit
      if (search === null) {
        return;
      } else {
        // total number of results
        const resultsLength = search.results.length;
        // Get the data for the search results
        // Slice the results based on the range start + 10
        const resultsData = await Promise.all(
          search.results.slice(rangeStart, rangeEnd).map((r) => r.data()),
        );
        // If the range does not have any results, display a message
        if (resultsData.length === 0) {
          searchPageResults.innerHTML = `<div class="p-4">No results found</div>`;
          return;
        }
        // Add an index to the results, for heap tracking
        const results = resultsData.map((item, index) => ({
          ...item,
          index: index + 1,
        }));
@y
      // Execute the search
      const search = await pagefind.debouncedSearch(query);
      // If no search results are found, exit
      if (search === null) {
        return;
      } else {
        // total number of results
        const resultsLength = search.results.length;
        // Get the data for the search results
        // Slice the results based on the range start + 10
        const resultsData = await Promise.all(
          search.results.slice(rangeStart, rangeEnd).map((r) => r.data()),
        );
        // If the range does not have any results, display a message
        if (resultsData.length === 0) {
          searchPageResults.innerHTML = `<div class="p-4">No results found</div>`;
          return;
        }
        // Add an index to the results, for heap tracking
        const results = resultsData.map((item, index) => ({
          ...item,
          index: index + 1,
        }));
@z

@x
        // If the query is not empty, display the search results container
        if (query) {
          searchPageResults.classList.remove("hidden");
        } else {
          searchPageResults.classList.add("hidden");
        }
@y
        // If the query is not empty, display the search results container
        if (query) {
          searchPageResults.classList.remove("hidden");
        } else {
          searchPageResults.classList.add("hidden");
        }
@z

@x
        // Generate the search results HTML
        let resultsHTML = `<div class="text-gray-light dark:text-gray-dark p-2">${resultsLength} results</div>`;
@y
        // Generate the search results HTML
        let resultsHTML = `<div class="text-gray-light dark:text-gray-dark p-2">${resultsLength} results</div>`;
@z

@x
        // Map results to HTML
        resultsHTML += results
          .map((item) => {
            return `<div class="p-4">
         <div class="flex flex-col">
           <span class="text-gray-light dark:texty-gray-dark text-sm">${item.meta.breadcrumbs}</span>
           <a class="link" href="${item.url}" data-query="${query}" data-index="${item.index}">${item.meta.title}</a>
           <p class="text-black dark:text-white overflow-hidden">…${item.excerpt}…</p>
         </div>
       </div>`;
          })
          .join("");
        // If the results length is greater than 10, display links to show more results
        if (resultsLength > 10) {
          resultsHTML += `<hr class="border-divider-light dark:border-divider-dark">`
          resultsHTML += `<ul class="flex flex-wrap gap-1 pt-4 pb-8 justify-center text-sm">`;
          for (let i = 1; i <= resultsLength / 10; i++) {
            if (i == currentPage) {
              resultsHTML += `<li class="text-center text-white">
                <a href="/search/?q=${query}&page=${i}" class="block h-6 w-6 rounded-sm bg-blue-light dark:bg-blue-dark">${i}</a>
              </li>`;
            } else {
              resultsHTML += `<li class="text-center text-gray-light dark:text-gray-dark">
                <a href="/search/?q=${query}&page=${i}" class="block h-6 w-6 rounded-sm bg-gray-light-200 dark:bg-gray-dark-200">${i}</a>
              </li>`;
            }
          }
          resultsHTML += `</ul>`;
        }
@y
        // Map results to HTML
        resultsHTML += results
          .map((item) => {
            return `<div class="p-4">
         <div class="flex flex-col">
           <span class="text-gray-light dark:texty-gray-dark text-sm">${item.meta.breadcrumbs}</span>
           <a class="link" href="${item.url}" data-query="${query}" data-index="${item.index}">${item.meta.title}</a>
           <p class="text-black dark:text-white overflow-hidden">…${item.excerpt}…</p>
         </div>
       </div>`;
          })
          .join("");
        // If the results length is greater than 10, display links to show more results
        if (resultsLength > 10) {
          resultsHTML += `<hr class="border-divider-light dark:border-divider-dark">`
          resultsHTML += `<ul class="flex flex-wrap gap-1 pt-4 pb-8 justify-center text-sm">`;
          for (let i = 1; i <= resultsLength / 10; i++) {
            if (i == currentPage) {
              resultsHTML += `<li class="text-center text-white">
                <a href="/search/?q=${query}&page=${i}" class="block h-6 w-6 rounded-sm bg-blue-light dark:bg-blue-dark">${i}</a>
              </li>`;
            } else {
              resultsHTML += `<li class="text-center text-gray-light dark:text-gray-dark">
                <a href="/search/?q=${query}&page=${i}" class="block h-6 w-6 rounded-sm bg-gray-light-200 dark:bg-gray-dark-200">${i}</a>
              </li>`;
            }
          }
          resultsHTML += `</ul>`;
        }
@z

@x
        searchPageResults.innerHTML = resultsHTML;
      }
    }
@y
        searchPageResults.innerHTML = resultsHTML;
      }
    }
@z

@x
    searchPageInput.addEventListener("input", (e) => onPageSearch(e));
@y
    searchPageInput.addEventListener("input", (e) => onPageSearch(e));
@z

@x
    // Event delegation for tracking link clicks
    if (window.heap !== undefined) {
      searchPageResults.addEventListener("click", function (event) {
        if (event.target.tagName === "A" && event.target.closest(".link")) {
          const searchQuery = event.target.getAttribute("data-query");
          const resultIndex = event.target.getAttribute("data-index");
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
  </script>
</body>
@y
    // Event delegation for tracking link clicks
    if (window.heap !== undefined) {
      searchPageResults.addEventListener("click", function (event) {
        if (event.target.tagName === "A" && event.target.closest(".link")) {
          const searchQuery = event.target.getAttribute("data-query");
          const resultIndex = event.target.getAttribute("data-index");
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
  </script>
</body>
@z

@x
</html>
@y
</html>
@z
