/* mb_onig extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_mb_onig.h"
#include "php_mbregex.h"

/* mb_onig always provides mb_ereg* regardless of the PHP build's mbregex
 * support.  The arginfo header guards everything with #if !defined(HAVE_MBREGEX),
 * so temporarily suppress the macro so the function table is populated. */
#ifdef HAVE_MBREGEX
# define MB_ONIG_HAD_MBREGEX
# undef HAVE_MBREGEX
#endif
#include "mb_onig_arginfo.h"
#ifdef MB_ONIG_HAD_MBREGEX
# define HAVE_MBREGEX 1
# undef MB_ONIG_HAD_MBREGEX
#endif

ZEND_DECLARE_MODULE_GLOBALS(mb_onig)

PHP_INI_BEGIN()
	PHP_INI_ENTRY("mbstring.regex_stack_limit", "100000", PHP_INI_ALL, NULL)
	PHP_INI_ENTRY("mbstring.regex_retry_limit", "1000000", PHP_INI_ALL, NULL)
PHP_INI_END()

static PHP_GINIT_FUNCTION(mb_onig)
{
#if defined(COMPILE_DL_MB_ONIG) && defined(ZTS)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif
	mb_onig_globals->mb_regex_globals = php_mb_regex_globals_alloc();
}

static PHP_GSHUTDOWN_FUNCTION(mb_onig)
{
	php_mb_regex_globals_free(mb_onig_globals->mb_regex_globals);
}

PHP_MINIT_FUNCTION(mb_onig)
{
	if (PHP_MINIT(mb_regex)(INIT_FUNC_ARGS_PASSTHRU) != SUCCESS) {
		return FAILURE;
	}
	REGISTER_INI_ENTRIES();
	register_mb_onig_symbols(module_number);
	return SUCCESS;
}

PHP_RINIT_FUNCTION(mb_onig)
{
#if defined(ZTS) && defined(COMPILE_DL_MB_ONIG)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif
	return PHP_RINIT(mb_regex)(INIT_FUNC_ARGS_PASSTHRU);
}

PHP_MSHUTDOWN_FUNCTION(mb_onig)
{
	UNREGISTER_INI_ENTRIES();
	return PHP_MSHUTDOWN(mb_regex)(SHUTDOWN_FUNC_ARGS_PASSTHRU);
}

PHP_MINFO_FUNCTION(mb_onig)
{
	php_info_print_table_start();
	php_info_print_table_row(2, "mb_onig support", "enabled");
	php_info_print_table_row(2, "Oniguruma version", php_mb_oniguruma_version);
	php_info_print_table_end();
}

zend_module_entry mb_onig_module_entry = {
	STANDARD_MODULE_HEADER_EX,
	NULL,
	NULL,
	"mb_onig",					/* Extension name */
	ext_functions,				/* zend_function_entry */
	PHP_MINIT(mb_onig),			/* PHP_MINIT - Module initialization */
	PHP_MSHUTDOWN(mb_onig),		/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(mb_onig),			/* PHP_RINIT - Request initialization */
	PHP_RSHUTDOWN(mb_regex),	/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(mb_onig),			/* PHP_MINFO - Module info */
	PHP_MB_ONIG_VERSION,		/* Version */
	PHP_MODULE_GLOBALS(mb_onig),
	PHP_GINIT(mb_onig),
	PHP_GSHUTDOWN(mb_onig),
	NULL,
	STANDARD_MODULE_PROPERTIES_EX
};

#ifdef COMPILE_DL_MB_ONIG
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(mb_onig)
#endif
