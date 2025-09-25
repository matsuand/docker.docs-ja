%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
      <span class="admonition-title">
        {{ printf "%s%s" (upper (substr $.AlertType 0 1)) (substr $.AlertType 1) }}
      </span>
@y
      <span class="admonition-title">
        {{ printf "%s" (T .AlertType) }}
      </span>
@z
