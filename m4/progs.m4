CTIE=ctie/ctie$EXEEXT
AC_SUBST(CTIE)

ORIGDIR=../docs
AC_ARG_WITH(origdir,
[  --with-origdir=DIR      Specify ORIG sources directory [[DIR=../docs]]],
[
  if test -d "${with_origdir}" ; then
    ORIGDIR=${with_origdir}
  fi
]
)
AC_MSG_CHECKING([for the original files])
if test ! -f "${ORIGDIR}/content/get-docker.md"; then
  AC_MSG_RESULT([no])
  AC_MSG_ERROR([The original files not found in ${ORIGDIR}])
else
  AC_MSG_RESULT([ok])
fi
AC_SUBST(ORIGDIR)
absORIGDIR=`(cd $ORIGDIR && pwd)`
AC_SUBST(absORIGDIR)

abs_origdir=`(cd $ORIGDIR && pwd)`
AC_SUBST(abs_origdir)

HOSTURL=https://docs.docker.com
AC_ARG_WITH(hosturl,
[  --with-hosturl=URL      Specify host URL [[URL=https://docs.docker.com]]],
[
  if test "${with_hosturl}" ; then
    HOSTURL=${with_hosturl}
  fi
]
)
AC_SUBST(HOSTURL)

TARGETDIR=
AC_ARG_WITH(targetdir,
[  --with-targetdir=DIR    Specify install target dir [[TARGETDIR=]]],
[
  if test "${with_targetdir}" ; then
    TARGETDIR=${with_targetdir}
    if test ! -d "$TARGETDIR" ; then
      $MKDIR_P "$TARGETDIR"
    fi
  else
    AC_MSG_ERROR([Should be specified install target dir with --with-targetdir])
  fi
]
)
AC_SUBST(TARGETDIR)
abs_targetdir=`(cd $TARGETDIR && pwd)`
AC_SUBST(abs_targetdir)

PUBLISHURL=
AC_ARG_WITH(publishurl,
[  --with-publishurl=URL   Specify publish URL [[URL=https://docs.docker.com]]],
[
  if test "${with_publishurl}" ; then
    PUBLISHURL=${with_publishurl}
  fi
]
)
AC_SUBST(PUBLISHURL)

PUBLISHBASE=
AC_ARG_WITH(publishbase,
[  --with-publishbase=base   Specify publish base [[URL=]]],
[
  if test "${with_publishbase}" ; then
    PUBLISHBASE=${with_publishbase}
  fi
]
)
AC_SUBST(PUBLISHBASE)

PUBLISHDIR=
AC_ARG_WITH(publishdir,
[  --with-publishdir=DIR   Specify install publish dir [[PUBLISHDIR=]]],
[
  if test "${with_publishdir}" ; then
    PUBLISHDIR=${with_publishdir}
    if test ! -d "$PUBLISHDIR" ; then
      $MKDIR_P "$PUBLISHDIR"
    fi
  else
    AC_MSG_ERROR([Should be specified install publish dir with --with-publishdir])
  fi
]
)
AC_SUBST(PUBLISHDIR)
abs_publishdir=`(cd $PUBLISHDIR && pwd)`
AC_SUBST(abs_publishdir)
TARGETDIR=$PUBLISHDIR
AC_SUBST(TARGETDIR)

UPLOADDIR=
AC_ARG_WITH(uploaddir,
[  --with-uploaddir=DIR   Specify install upload dir [[UPLOADDIR=]]],
[
  if test "${with_uploaddir}" ; then
    UPLOADDIR=${with_uploaddir}
    if test ! -d "$UPLOADDIR" ; then
      $MKDIR_P "$UPLOADDIR"
    fi
  else
    AC_MSG_ERROR([Should be specified install upload dir with --with-uploaddir])
  fi
]
)
AC_SUBST(UPLOADDIR)
abs_uploaddir=`(cd $UPLOADDIR && pwd)`
AC_SUBST(abs_uploaddir)

UPLOADURL=
AC_ARG_WITH(uploadurl,
[  --with-uploadurl=URL   Specify upload URL [[URL=https://docs.docker.com]]],
[
  if test "${with_uploadurl}" ; then
    UPLOADURL=${with_uploadurl}
  fi
]
)
AC_SUBST(UPLOADURL)

UPLOADBASE=
AC_ARG_WITH(uploadbase,
[  --with-uploadbase=URL   Specify upload base [[URL=]]],
[
  if test "${with_uploadbase}" ; then
    UPLOADBASE=${with_uploadbase}
  fi
]
)
AC_SUBST(UPLOADBASE)

dnl SITEDESTDIR=$abs_publishdir/_site
dnl SITEDIR_DEFINED=no
dnl AC_ARG_WITH(sitedestdir,
dnl [  --with-sitedestdir=DIR   Specify install site dest dir [[SITEDESTDIR=_site]]],
dnl [
dnl   if test "${with_sitedestdir}" ; then
dnl     SITEDIR_DEFINED=yes
dnl     SITEDESTDIR=${with_sitedestdir}
dnl     if test ! -d "$SITEDESTDIR" ; then
dnl       $MKDIR_P "$SITEDESTDIR"
dnl     fi
dnl   else
dnl     AC_MSG_ERROR([Should be specified site dest with --with-sitedestdir])
dnl   fi
dnl ]
dnl )
dnl AC_SUBST(SITEDIR_DEFINED)
dnl AC_SUBST(SITEDESTDIR)
dnl abs_sitedestdir=`(cd $SITEDESTDIR && pwd)`
dnl AC_SUBST(abs_sitedestdir)

AC_ARG_ENABLE(production,
[AS_HELP_STRING([--enable-production],[Specify production build])],
enable_production=$enableval, enable_production=no)
AC_SUBST(enable_production)

if test x"${enable_production}" = x"yes"; then
  JEKYLL_ENV="production"
  CONFIG_YML="_config.yml,_config_production.yml"
else
  JEKYLL_ENV="development"
  CONFIG_YML="_config.yml"
fi
AC_SUBST(JEKYLL_ENV)
AC_SUBST(CONFIG_YML)
