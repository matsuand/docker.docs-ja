##
## This is part of Japanese translation version for Docker's Documantation.
##

include $(top_srcdir)/build-aux/common.mk

htmlbases = \
	index

ch_htmls = $(htmlbases:=.htmlch)
tr_htmls = $(htmlbases:=.html)
EXTRA_DIST = $(ch_htmls)

.PHONY: all
all: $(tr_htmls)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/makesub.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/makesub.sh . $(tr_htmls)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(abs_thisdir)/, $(ch_htmls))
@MAINT@$(addprefix $(abs_thisdir)/, $(ch_htmls)):
@MAINT@	@if test ! -f $@; then \
@MAINT@	  $(top_srcdir)/bin/buildch.perl `echo $@ | \
@MAINT@	    sed -e "s|^$(abs_thisdir)|$(abs_origdir)|" \
@MAINT@	    -e "s|\.htmlch$$|.html|"` $@; \
@MAINT@	fi
