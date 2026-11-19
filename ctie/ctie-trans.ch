%%
%% This is change file for simple CWEB building.
%%

@x [3]
main(argc, argv)
@y
int main(argc, argv)
@z

@x [5]
@<Predecl...@>=
extern int strlen(); /* length of string */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
extern char *strerror();
@y
@z

@x [6]
@d buf_size 1024 /* maximum length of one input line */
@y
@d buf_size 8192 /* maximum length of one input line */
@z

@x [8]
#include <stdio.h>
@y
#include <stdio.h>
#include <ctype.h>
#include <string.h>
@z

@x [19] Ignore @i
    if (do_includes)
        @<Check for \.{@@i} in newly read line, |goto restart| if
            include fails@>@;
@y
@z

@x [35] l.697
void pfatal_error();
@y
void pfatal_error (const char *, const char *);
@z

@x [36] l.700
void pfatal_error(s, t)
char *s, *t;
@y
void pfatal_error (const char *s, const char *t)
@z

@x [44] Ignore @i
    if (ccode=='y' || ccode=='z' || ccode=='i') {
@y
    if (ccode=='y' || ccode=='z') {
@z
