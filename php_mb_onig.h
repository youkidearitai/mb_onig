/* mb_onig extension for PHP */

#ifndef PHP_MB_ONIG_H
# define PHP_MB_ONIG_H

extern zend_module_entry mb_onig_module_entry;
# define phpext_mb_onig_ptr &mb_onig_module_entry

# define PHP_MB_ONIG_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_MB_ONIG)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_MB_ONIG_H */
