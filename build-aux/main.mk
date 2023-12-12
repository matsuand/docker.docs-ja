##
## This is part of Japanese translation version for Docker's Documantation.
##

changes = $(bases:=.ch) # change files
transes = $(bases:=.md) # translated files
EXTRA_DIST = $(changes)

.PHONY: all
all: $(transes)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/makesub.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/makesub.sh . $(transes)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(abs_thisdir)/, $(changes))
@MAINT@$(addprefix $(abs_thisdir)/, $(changes)):
@MAINT@	@if test ! -f $@; then \
@MAINT@	  $(top_srcdir)/bin/buildch.perl `echo $@ | \
@MAINT@	    sed -e "s|^$(abs_thisdir)|$(abs_origdir)|" \
@MAINT@	    -e "s|\.ch$$|.md|"` $@; \
@MAINT@	fi
