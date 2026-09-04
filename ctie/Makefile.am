#
# This is NOT part of the original CTIE distribution.
#
##
## This is part of LFSbookja package.
##
noinst_PROGRAMS=ctie
ctie_SOURCES=ctie.c
EXTRA_DIST=ChangeLog Makefile.orig README ctie-k.c ctie-k.ch      \
	ctie-slim.ch ctie.1 ctie.orig ctie.cf1 ctie.cf2 ctie.cf3  \
	ctie.chf.gen ctie.inc ctie.inc1 ctie.inc2 ctie.master.gen \
	ctie.tie ctie.w ctiedoc.tex

all: ctie$(EXEEXT)
ctie$(EXEEXT): ctie.o
	$(CC) $(CFLAGS) $^ -o $@
ctie.o: $(srcdir)/ctie.c
	$(CC) $(CFLAGS) -c $^

@MAINT@$(srcdir)/ctie.c: $(srcdir)/ctie.w $(srcdir)/ctie-slim.ch
@MAINT@	(cd $(srcdir); ctangle ctie.w ctie-slim.ch ctie.c)
