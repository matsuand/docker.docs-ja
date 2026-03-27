##
## This is part of Japanese translation version for Docker's Documantation.
##
bases = \
	_index.md         \
	create-project.md \
	run-tests.md

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

all: write-tests.md
write-tests.md: write-tests.md.orig $(srcdir)/write-tests.md.ch
	@echo Processing write-tests.md...
	@$(top_builddir)/$(CTIE) -m $@ write-tests.md.orig $(srcdir)/write-tests.md.ch >/dev/null
	@sed -i -e "s|__SUBDIR__|/docker.docs-ja|g" \
	 -e "s|__HOSTURL__|$(HOSTURL)|g" -e "s/__IMPORT__/@Import/g" $@
write-tests.md.orig: $(abs_origdir)/write-tests.md
	@sed -e 's/^@Import/__IMPORT__/g' $< > $@
