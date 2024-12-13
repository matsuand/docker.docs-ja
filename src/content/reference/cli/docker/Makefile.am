##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = builder buildx checkpoint compose config container context    \
	desktop image manifest network node plugin scout secret service \
	stack swarm system trust volume

bases = \
	README.md

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copyfiles = \
	_index.md       \
	build-legacy.md \
	debug.md        \
	init.md         \
	inspect.md      \
	login.md        \
	logout.md       \
	search.md       \
	version.md

include $(top_srcdir)/build-aux/copy.mk
