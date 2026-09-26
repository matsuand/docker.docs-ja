##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = cli docsarchive sbx_cli

bases = \
	desktop_release.yaml \
	frontmatter.yaml     \
	redirects.yml        \
	samples.yaml         \
	summary.yaml         \
	tags.yaml            \
	whats-new.json

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copyfiles = \
	api-reference.json

include $(top_srcdir)/build-aux/copy.mk
