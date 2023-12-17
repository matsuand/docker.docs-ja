##
## This is part of Japanese translation version for Docker's Documantation.
##

changes = $(bases:=.ch) # change files
transes = $(bases)      # translated files
EXTRA_DIST = $(changes)

.PHONY: all
all: $(transes)

submakename ?= Makefile.sub

-include $(submakename)
$(submakename): $(top_srcdir)/bin/makesub.sh $(srcdir)/Makefile.am $(top_builddir)/config.log
	@$(top_srcdir)/bin/makesub.sh $(submakename) . $(transes)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(abs_thisdir)/, $(changes))
@MAINT@$(addprefix $(abs_thisdir)/, $(changes)):
@MAINT@	@if test ! -f $@; then \
@MAINT@	  $(top_srcdir)/bin/buildch.perl `echo $@ | \
@MAINT@	    sed -e "s|^$(abs_thisdir)|$(abs_origdir)|" \
@MAINT@	    -e "s|\.ch$$||"` $@; \
@MAINT@	fi
