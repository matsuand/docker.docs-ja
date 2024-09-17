%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<a href="/search" class="sm:hidden">
@y
<a href="__SUBDIR__/search" class="sm:hidden">
@z

@x
    @keyup.enter.prevent="window.location.href = '/search/?q=' + $event.target.value;"
@y
    @keyup.enter.prevent="window.location.href = '__SUBDIR__/search/?q=' + $event.target.value;"
@z

@x
            resultsHTML += `<div class="w-fit ml-auto px-4 py-2"><a href="/search/?q=${query}" class="link">Show all results</a></div>`;
@y
            resultsHTML += `<div class="w-fit ml-auto px-4 py-2"><a href="__SUBDIR__/search/?q=${query}" class="link">Show all results</a></div>`;
@z
