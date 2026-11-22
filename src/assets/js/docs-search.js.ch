%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
    if (!this.results.length) this.status = "Searching…";
@y
    if (!this.results.length) this.status = "検索中…";
@z

@x
      pagefind ??= import("/pagefind/pagefind.js")
@y
      pagefind ??= import("__SUBDIR__/pagefind/pagefind.js")
@z

@x
        ? `Showing ${this.results.length} of ${this.matches.length} results`
        : "No results. Try another search or ask Docker.";
@y
        ? `${this.matches.length} 件中 ${this.results.length} 件表示`
        : "該当なし。検索し直すか Docker に質問してください。";
@z

@x
        ? `Showing ${this.results.length} of ${this.matches.length} results`
        : "No results. Try another search or ask Docker.";
@y
        ? `${this.matches.length} 件中 ${this.results.length} 件表示`
        : "該当なし。検索し直すか Docker に質問してください。";
@z
