#
# This is NOT part of the original CTIE distribution.
#

noinst_PROGRAMS=ctie
ctie_SOURCES=ctie.c
EXTRA_DIST=ChangeLog Makefile.orig README ctie-k.c ctie-k.ch      \
	ctie-trans.ch ctie.1 ctie.orig ctie.cf1 ctie.cf2 ctie.cf3  \
	ctie.chf.gen ctie.inc ctie.inc1 ctie.inc2 ctie.master.gen \
	ctie.tie ctie.w ctiedoc.tex

all: ctie$(EXEEXT)
ctie$(EXEEXT): ctie.o
	$(CC) $(LDLAGS) $^ -o $@
ctie.o: $(srcdir)/ctie.c
	$(CC) $(CFLAGS) -c $^

@MAINT@$(srcdir)/ctie.c: $(srcdir)/ctie.w $(srcdir)/ctie-trans.ch
@MAINT@	(cd $(srcdir); ctangle ctie.w ctie-trans.ch ctie.c)
