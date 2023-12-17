##
## This is part of Japanese translation version for Docker's Documantation.
##

.PHONY: all
all: $(copyfiles)

-include copyfiles.sub
copyfiles.sub: $(top_srcdir)/bin/makecp.sh $(srcdir)/Makefile.am $(top_builddir)/config.log
	@$(top_srcdir)/bin/makecp.sh copyfiles . $(copyfiles)
