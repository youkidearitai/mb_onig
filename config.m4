dnl Autotools config.m4 for PHP extension mb_onig

dnl Comments in this file start with the string 'dnl' (discard to next line).
dnl Remove where necessary.

dnl If extension references and depends on an external library package, use
dnl the '--with-mb_onig' configure option:
dnl PHP_ARG_WITH([mb_onig],
dnl   [for mb_onig support],
dnl   [AS_HELP_STRING([--with-mb_onig],
dnl     [Include mb_onig support])])

dnl Otherwise use the '--enable-mb_onig' configure option:
PHP_ARG_ENABLE([mb_onig],
  [whether to enable mb_onig support],
  [AS_HELP_STRING([--enable-mb_onig],
    [Enable mb_onig support])],
  [no])

AS_VAR_IF([PHP_MB_ONIG], [no],, [
  dnl This section is executed when extension is enabled with one of the above
  dnl configure options. Adjust and add tests here.

  dnl
  dnl Use and adjust this code block if extension depends on external library
  dnl package which supports pkg-config.
  dnl
  dnl Find library package with pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl
  dnl Or if you need to check for a particular library version with pkg-config,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])
  dnl
  dnl Add library compilation and linker flags to extension.
  dnl PHP_EVAL_INCLINE([$LIBFOO_CFLAGS])
  dnl PHP_EVAL_LIBLINE([$LIBFOO_LIBS], [MB_ONIG_SHARED_LIBADD])
  dnl
  dnl Check for library and symbol presence.
  dnl LIBNAME=mb_onig # you may want to change this
  dnl LIBSYMBOL=mb_onig # you most likely want to change this
  dnl
  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY([$LIBNAME], [$LIBSYMBOL],
  dnl   [AC_DEFINE([HAVE_MB_ONIG_FEATURE], [1],
  dnl     [Define to 1 if mb_onig has the 'FEATURE'.])],
  dnl   [AC_MSG_FAILURE([FEATURE not supported by your mb_onig library.])],
  dnl   [$LIBFOO_LIBS])
  dnl

  dnl
  dnl Or use and adjust this code block if extension depends on external library
  dnl package, which does not support pkg-config.
  dnl
  dnl Path to library package can be given as parameter (--with-mb_onig=<DIR>)
  dnl SEARCH_PATH="/usr/local /usr" # you might want to change this
  dnl SEARCH_FOR="/include/mb_onig.h" # you most likely want to change this
  dnl AS_IF([test -r $PHP_MB_ONIG/$SEARCH_FOR],
  dnl   [MB_ONIG_DIR=$PHP_MB_ONIG],
  dnl   [
  dnl     for i in $SEARCH_PATH; do
  dnl       AS_IF([test -r $i/$SEARCH_FOR],
  dnl         [MB_ONIG_DIR=$i; break;])
  dnl     done
  dnl   ])
  dnl
  dnl AC_MSG_CHECKING([for mb_onig library package])
  dnl AS_VAR_IF([MB_ONIG_DIR],, [
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the mb_onig library package])
  dnl ], [AC_MSG_RESULT([found in $MB_ONIG_DIR])])
  dnl
  dnl Add include flag where library package headers are located on the system.
  dnl PHP_ADD_INCLUDE([$MB_ONIG_DIR/include])
  dnl
  dnl Check for library and symbol presence.
  dnl LIBNAME=mb_onig # you may want to change this
  dnl LIBSYMBOL=mb_onig # you most likely want to change this
  dnl
  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY([$LIBNAME], [$LIBSYMBOL], [
  dnl     PHP_ADD_LIBRARY_WITH_PATH([$LIBNAME],
  dnl       [$MB_ONIG_DIR/$PHP_LIBDIR],
  dnl       [MB_ONIG_SHARED_LIBADD])
  dnl     AC_DEFINE([HAVE_MB_ONIG_FEATURE], [1],
  dnl       [Define to 1 if mb_onig has the 'FEATURE'.])
  dnl   ],
  dnl   [AC_MSG_FAILURE([FEATURE not supported by your mb_onig library.])],
  dnl   [-L$MB_ONIG_DIR/$PHP_LIBDIR -lm])
  dnl

  dnl Add linked libraries flags for shared extension to the generated Makefile.
  dnl PHP_SUBST([MB_ONIG_SHARED_LIBADD])

  dnl Define a preprocessor macro to indicate that this PHP extension can
  dnl be dynamically loaded as a shared module or is statically built into PHP.
  AC_DEFINE([HAVE_MB_ONIG], [1],
    [Define to 1 if the PHP extension 'mb_onig' is available.])

  if test "$PHP_MB_ONIG" != "no; then
    if test "$ext_shared" != "yes" && test "$enable_mbstring" != "yes"; then
      AC_MSG_WARN(Activating mbstring)
      enable_mbstring=yes
    fi
    AC_MSG_CHECKING(libmbfl headers)
    if test -f $abs_srcdir/ext/mbstring/libmbfl/mbfl/mbfilter.h; then
      dnl build in php-src tree
      AC_MSG_RESULT(found in $abs_srcdir/ext/mbstring)
    elif test -f $phpincludedir/ext/mbstring/libmbfl/mbfl/mbfilter.h; then
     dnl build alone
     AC_MSG_RESULT(found in $phpincludedir/ext/mbstring)
    else
     AC_MSG_ERROR(mbstring extension with libmbfl is missing)
    fi

    dnl Configure extension sources and compilation flags.
    PHP_NEW_EXTENSION([mb_onig],
      [mb_onig.c],
      [$ext_shared],,
      [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1])
    PHP_ADD_EXTENSION_DEP(mbstring)
    PHP_ADD_MAKEFILE_FRAGMENT
  fi
])

AC_DEFUN([PHP_MBSTRING_SETUP_MBREGEX], [
  PHP_MBSTRING_BUNDLED_ONIG=1

  if test "$PHP_MBSTRING_BUNDLED_ONIG" = "1"; then
    cp $ext_srcdir/oniguruma/src/oniguruma.h $ext_srcdir/oniguruma/oniguruma.h
  fi

  AC_CHECK_HEADERS([strings.h unistd.h sys/time.h sys/times.h limits.h])
  AC_CHECK_SIZEOF(int, 4)
  AC_CHECK_SIZEOF(short, 2)
  AC_CHECK_SIZEOF(long, 4)
  AC_FUNC_ALLOCA
  AC_CHECK_HEADER([stdarg.h], [
    AC_DEFINE([HAVE_STDARG_PROTOTYPES], [1], [Define to 1 if you have the <stdarg.h> header file.])
  ], [])
  AC_DEFINE([PHP_ONIG_BUNDLED], [1], [Define to 1 if the bundled oniguruma is used])
  AC_DEFINE([HAVE_ONIG], [1], [Define to 1 if the oniguruma library is available])
  PHP_MBSTRING_ADD_CFLAG([-DNOT_RUBY])
  PHP_MBSTRING_ADD_BUILD_DIR([oniguruma])
  PHP_MBSTRING_ADD_BUILD_DIR([oniguruma/src])
  PHP_MBSTRING_ADD_INCLUDE([oniguruma])
  PHP_MBSTRING_ADD_SOURCES([
    oniguruma/src/ascii.c
    oniguruma/src/big5.c
    oniguruma/src/cp1251.c
    oniguruma/src/euc_jp.c
    oniguruma/src/euc_jp_prop.c
    oniguruma/src/euc_kr.c
    oniguruma/src/euc_tw.c
    oniguruma/src/gb18030.c
    oniguruma/src/iso8859_1.c
    oniguruma/src/iso8859_10.c
    oniguruma/src/iso8859_11.c
    oniguruma/src/iso8859_13.c
    oniguruma/src/iso8859_14.c
    oniguruma/src/iso8859_15.c
    oniguruma/src/iso8859_16.c
    oniguruma/src/iso8859_2.c
    oniguruma/src/iso8859_3.c
    oniguruma/src/iso8859_4.c
    oniguruma/src/iso8859_5.c
    oniguruma/src/iso8859_6.c
    oniguruma/src/iso8859_7.c
    oniguruma/src/iso8859_8.c
    oniguruma/src/iso8859_9.c
    oniguruma/src/koi8.c
    oniguruma/src/koi8_r.c
    oniguruma/src/onig_init.c
    oniguruma/src/regcomp.c
    oniguruma/src/regenc.c
    oniguruma/src/regerror.c
    oniguruma/src/regexec.c
    oniguruma/src/regext.c
    oniguruma/src/reggnu.c
    oniguruma/src/regparse.c
    oniguruma/src/regposerr.c
    oniguruma/src/regposix.c
    oniguruma/src/regsyntax.c
    oniguruma/src/regtrav.c
    oniguruma/src/regversion.c
    oniguruma/src/sjis.c
    oniguruma/src/sjis_prop.c
    oniguruma/src/st.c
    oniguruma/src/unicode.c
    oniguruma/src/unicode_fold1_key.c
    oniguruma/src/unicode_fold2_key.c
    oniguruma/src/unicode_fold3_key.c
    oniguruma/src/unicode_unfold_key.c
    oniguruma/src/utf16_be.c
    oniguruma/src/utf16_le.c
    oniguruma/src/utf32_be.c
    oniguruma/src/utf32_le.c
    oniguruma/src/utf8.c
  ])
])
