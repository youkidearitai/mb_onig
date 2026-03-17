dnl Autotools config.m4 for PHP extension mb_onig

PHP_ARG_ENABLE([mb_onig],
  [whether to enable mb_onig support],
  [AS_HELP_STRING([--enable-mb_onig],
    [Enable mb_onig support (bundles oniguruma)])],
  [no])

AS_VAR_IF([PHP_MB_ONIG], [no],, [
  dnl mb_onig requires mbstring; activate it if not already done.
  if test "$ext_shared" != "yes" && test "$enable_mbstring" != "yes"; then
    AC_MSG_NOTICE([mb_onig: activating mbstring])
    enable_mbstring=yes
  fi

  dnl Verify libmbfl headers are available (provided by mbstring).
  AC_MSG_CHECKING([libmbfl headers])
  if test -f "$abs_srcdir/ext/mbstring/libmbfl/mbfl/mbfilter.h"; then
    AC_MSG_RESULT([found in $abs_srcdir/ext/mbstring])
  elif test -f "$phpincludedir/ext/mbstring/libmbfl/mbfl/mbfilter.h"; then
    AC_MSG_RESULT([found in $phpincludedir/ext/mbstring])
  else
    AC_MSG_ERROR([mbstring extension with libmbfl is missing; please enable --enable-mbstring])
  fi

  dnl ---------------------------------------------------------------
  dnl Bundled oniguruma setup
  dnl ---------------------------------------------------------------
  dnl Copy oniguruma.h from src/ to the top-level oniguruma/ dir so
  dnl that #include <oniguruma.h> works.
  AC_MSG_NOTICE([mb_onig: using bundled oniguruma])

  AC_CHECK_HEADERS([strings.h unistd.h sys/time.h sys/times.h limits.h])
  AC_CHECK_SIZEOF([int], [4])
  AC_CHECK_SIZEOF([short], [2])
  AC_CHECK_SIZEOF([long], [4])
  AC_FUNC_ALLOCA
  AC_CHECK_HEADER([stdarg.h], [
    AC_DEFINE([HAVE_STDARG_PROTOTYPES], [1],
      [Define to 1 if you have the <stdarg.h> header file.])
  ])

  AC_DEFINE([PHP_ONIG_BUNDLED], [1],
    [Define to 1 if the bundled oniguruma is used.])
  AC_DEFINE([HAVE_ONIG], [1],
    [Define to 1 if the oniguruma library is available.])
  AC_DEFINE([HAVE_MBREGEX], [1],
    [Define to 1 if mbstring has multibyte regex support enabled.])
  AC_DEFINE([HAVE_MB_ONIG], [1],
    [Define to 1 if the PHP extension 'mb_onig' is available.])

  dnl Build dirs for oniguruma (needed so make creates them).
  PHP_ADD_BUILD_DIR([$ext_builddir/oniguruma])
  PHP_ADD_BUILD_DIR([$ext_builddir/oniguruma/src])

  dnl Include dirs: bundled oniguruma headers.
  PHP_ADD_INCLUDE([$ext_srcdir/oniguruma])
  PHP_ADD_INCLUDE([$ext_builddir/oniguruma])
  PHP_ADD_INCLUDE([$ext_srcdir/oniguruma/src])
  PHP_ADD_INCLUDE([$phpincludedir/ext/mbstring])

  dnl Include dirs: mbstring (for libmbfl/config.h used by php_mbregex.c).
  PHP_ADD_INCLUDE([$abs_srcdir/ext/mbstring])
  PHP_ADD_INCLUDE([$abs_builddir/ext/mbstring])

  dnl ---------------------------------------------------------------
  dnl Declare the extension with all required source files.
  dnl ---------------------------------------------------------------
  PHP_NEW_EXTENSION([mb_onig],
    [mb_onig.c
     php_mbregex.c
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
     oniguruma/src/utf8.c],
    [$ext_shared],,
    [-DNOT_RUBY -DONIG_ESCAPE_UCHAR_COLLISION=1 -DUChar=OnigUChar
     -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1])

  dnl mb_onig depends on mbstring (for libmbfl).
  PHP_ADD_EXTENSION_DEP([mb_onig], [mbstring])

  PHP_ADD_MAKEFILE_FRAGMENT
])

dnl ---------------------------------------------------------------------------
dnl Override PHP_MBSTRING_SETUP_MBREGEX so that when mbstring is built together
dnl with mb_onig it uses the bundled oniguruma instead of the system library.
dnl
dnl NOTE: This override must be defined AFTER mbstring's own config.m4 has been
dnl processed (mbstring < mb_onig alphabetically — mb_onig wins the last
dnl AC_DEFUN for this name).  If the ordering ever changes, wrap the body with
dnl an AS_VAR_IF([PHP_MB_ONIG], [no],, [...]) guard.
dnl ---------------------------------------------------------------------------
AC_DEFUN([PHP_MBSTRING_SETUP_MBREGEX], [
  dnl Only apply the bundled-oniguruma setup when mb_onig is enabled.
  AS_VAR_IF([PHP_MB_ONIG], [no], [
    dnl mb_onig is not enabled — fall back to system oniguruma for mbstring.
    PKG_CHECK_MODULES([ONIG], [oniguruma])
    PHP_EVAL_LIBLINE([$ONIG_LIBS], [MBSTRING_SHARED_LIBADD])
    PHP_EVAL_INCLINE([$ONIG_CFLAGS])

    AC_CACHE_CHECK([if oniguruma has an invalid entry for KOI8 encoding],
      [php_cv_lib_onig_invalid_koi8],
      [save_old_LIBS=$LIBS
        LIBS="$LIBS $MBSTRING_SHARED_LIBADD"
        save_old_CFLAGS=$CFLAGS
        CFLAGS="$CFLAGS $ONIG_CFLAGS"
        AC_LINK_IFELSE([AC_LANG_PROGRAM([
          #include <stdint.h>
          #include <oniguruma.h>
        ],
        [return (intptr_t)(ONIG_ENCODING_KOI8 + 1);])],
        [php_cv_lib_onig_invalid_koi8=no],
        [php_cv_lib_onig_invalid_koi8=yes])
        LIBS=$save_old_LIBS
        CFLAGS=$save_old_CFLAGS])
    AS_VAR_IF([php_cv_lib_onig_invalid_koi8], [yes],
      [AC_DEFINE([PHP_ONIG_BAD_KOI8_ENTRY], [1],
        [Define to 1 if oniguruma has an invalid entry for KOI8 encoding.])])

    PHP_MBSTRING_ADD_CFLAG([-DONIG_ESCAPE_UCHAR_COLLISION=1])
    PHP_MBSTRING_ADD_CFLAG([-DUChar=OnigUChar])

    AC_DEFINE([HAVE_MBREGEX], [1],
      [Define to 1 if mbstring has multibyte regex support enabled.])

    PHP_MBSTRING_ADD_BASE_SOURCES([php_mbregex.c])
    PHP_INSTALL_HEADERS([ext/mbstring], [php_mbregex.h php_onig_compat.h])
  ], [
    dnl mb_onig is enabled — bundled oniguruma is compiled as part of mb_onig.
    dnl mbstring itself does not need to link oniguruma; mb_onig provides it.
    AC_DEFINE([HAVE_MBREGEX], [1],
      [Define to 1 if mbstring has multibyte regex support enabled.])
  ])
])
