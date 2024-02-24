%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% Add suffix .ch and subdir src to github edit page

@x Add suffix .ch to github edit page
    href="{{ site.Params.repo }}/edit/main/content/{{ .Path }}">{{ T "editPage" }}
@y
    href="{{ site.Params.repo }}/edit/main/src/content/{{ .Path }}.ch">{{ T "editPage" }}
@z
