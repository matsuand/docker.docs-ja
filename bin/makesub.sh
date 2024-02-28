#!/bin/bash

# $1	Makefile name
# $2	directory where the merge files will be created in
# $3	list for merge files

makename=$1
dirname=$2
list=${@:3:($#-2)}

rm -f $makename
echo "# $makename">$makename

for f in $list; do
    echo "$dirname/$f: \$(abs_origdir)/$f \$(srcdir)/$f.ch">>$makename
    echo "	@echo Processing $f...">>$makename
    echo "	@\$(top_builddir)/\$(CTIE) -m \$@ \$(abs_origdir)/$f \$(srcdir)/$f.ch >/dev/null">>$makename
    echo "	@sed -i -e \"s|__SUBDIR__|/docker.docs-ja|g\" -e \"s|__HOSTURL__|\$(HOSTURL)|g\" \$@">>$makename
done
