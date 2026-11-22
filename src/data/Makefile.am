##
## This is part of Japanese translation version for Docker's Documantation.
##

SUBDIRS = cli docsarchive sbx_cli

bases = \
	custom_role_permissions.yaml \
	desktop_release.yaml         \
	frontmatter.yaml             \
	redirects.yml                \
	summary.yaml                 \
	tags.yaml                    \
	whats-new.json

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copyfiles = \
	api-reference.json

include $(top_srcdir)/build-aux/copy.mk

copydirs = \
	navigation

_copydirs:
	@for d in $(copydirs); do \
	  if test ! -d $$d; then \
	    cp -pR $(absORIGDIR)/$$d .; \
	  fi \
	done
