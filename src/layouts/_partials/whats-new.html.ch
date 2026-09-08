%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
          What's new
@y
          更新情報
@z

@x
              >{{ .published | time.Format "Jan 2" }}</time
@y
              >{{ .published | time.Format "01/02" }}</time
@z

@x
                  >{{ .published | time.Format "Jan 2" }}</time
@y
                  >{{ .published | time.Format "01/02" }}</time
@z

@x
          <span x-text="expanded ? 'Show less' : 'Show more'">Show more</span>
@y
          <span x-text="expanded ? 'Show less' : 'Show more'">詳細</span>
@z
