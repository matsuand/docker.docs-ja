##
## This is part of Japanese translation version for Docker's Documantation.
##

copyfiles = \
	en.yaml

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/copy.mk

all: ja.yaml
ja.yaml: $(abs_srcdir)/ja.yaml.in
	@if test "$(abs_srcdir)" != "$(abs_builddir)"; then \
	  cp -p $^ $@; \
	fi
