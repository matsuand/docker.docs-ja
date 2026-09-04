@x [6]
@d buf_size 1024 /* maximum length of one input line */
@y
@d buf_size 8192 /* maximum length of one input line */
@z

@x [19] Ignore @i
    if (do_includes)
        @<Check for \.{@@i} in newly read line, |goto restart| if
            include fails@>@;
@y
@z

@x [44] Ignore @i
    if (ccode=='y' || ccode=='z' || ccode=='i') {
@y
    if (ccode=='y' || ccode=='z') {
@z
