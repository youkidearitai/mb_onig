/* This is a generated file, edit mb_onig.stub.php instead.
 * Stub hash: f062ccadb8593212659fe9cf62d4bc1802c37291 */

#if !defined(HAVE_MBREGEX)
ZEND_BEGIN_ARG_WITH_RETURN_TYPE_MASK_EX(arginfo_mb_regex_encoding, 0, 0, MAY_BE_STRING|MAY_BE_BOOL)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, encoding, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_ereg, 0, 2, _IS_BOOL, 0)
	ZEND_ARG_TYPE_INFO(0, pattern, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO(0, string, IS_STRING, 0)
	ZEND_ARG_INFO_WITH_DEFAULT_VALUE(1, matches, "null")
ZEND_END_ARG_INFO()

#define arginfo_mb_eregi arginfo_mb_ereg

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_MASK_EX(arginfo_mb_ereg_replace, 0, 3, MAY_BE_STRING|MAY_BE_FALSE|MAY_BE_NULL)
	ZEND_ARG_TYPE_INFO(0, pattern, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO(0, replacement, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO(0, string, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

#define arginfo_mb_eregi_replace arginfo_mb_ereg_replace

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_MASK_EX(arginfo_mb_ereg_replace_callback, 0, 3, MAY_BE_STRING|MAY_BE_FALSE|MAY_BE_NULL)
	ZEND_ARG_TYPE_INFO(0, pattern, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO(0, callback, IS_CALLABLE, 0)
	ZEND_ARG_TYPE_INFO(0, string, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_MASK_EX(arginfo_mb_split, 0, 2, MAY_BE_ARRAY|MAY_BE_FALSE)
	ZEND_ARG_TYPE_INFO(0, pattern, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO(0, string, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, limit, IS_LONG, 0, "-1")
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_ereg_match, 0, 2, _IS_BOOL, 0)
	ZEND_ARG_TYPE_INFO(0, pattern, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO(0, string, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_ereg_search, 0, 0, _IS_BOOL, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, pattern, IS_STRING, 1, "null")
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_MASK_EX(arginfo_mb_ereg_search_pos, 0, 0, MAY_BE_ARRAY|MAY_BE_FALSE)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, pattern, IS_STRING, 1, "null")
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

#define arginfo_mb_ereg_search_regs arginfo_mb_ereg_search_pos

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_ereg_search_init, 0, 1, _IS_BOOL, 0)
	ZEND_ARG_TYPE_INFO(0, string, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, pattern, IS_STRING, 1, "null")
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_MASK_EX(arginfo_mb_ereg_search_getregs, 0, 0, MAY_BE_ARRAY|MAY_BE_FALSE)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_ereg_search_getpos, 0, 0, IS_LONG, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_ereg_search_setpos, 0, 1, _IS_BOOL, 0)
	ZEND_ARG_TYPE_INFO(0, offset, IS_LONG, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_mb_regex_set_options, 0, 0, IS_STRING, 0)
	ZEND_ARG_TYPE_INFO_WITH_DEFAULT_VALUE(0, options, IS_STRING, 1, "null")
ZEND_END_ARG_INFO()
#endif

#if !defined(HAVE_MBREGEX)
ZEND_FUNCTION(mb_regex_encoding);
ZEND_FUNCTION(mb_ereg);
ZEND_FUNCTION(mb_eregi);
ZEND_FUNCTION(mb_ereg_replace);
ZEND_FUNCTION(mb_eregi_replace);
ZEND_FUNCTION(mb_ereg_replace_callback);
ZEND_FUNCTION(mb_split);
ZEND_FUNCTION(mb_ereg_match);
ZEND_FUNCTION(mb_ereg_search);
ZEND_FUNCTION(mb_ereg_search_pos);
ZEND_FUNCTION(mb_ereg_search_regs);
ZEND_FUNCTION(mb_ereg_search_init);
ZEND_FUNCTION(mb_ereg_search_getregs);
ZEND_FUNCTION(mb_ereg_search_getpos);
ZEND_FUNCTION(mb_ereg_search_setpos);
ZEND_FUNCTION(mb_regex_set_options);
#endif

static const zend_function_entry ext_functions[] = {
#if !defined(HAVE_MBREGEX)
	ZEND_FE(mb_regex_encoding, arginfo_mb_regex_encoding)
	ZEND_FE(mb_ereg, arginfo_mb_ereg)
	ZEND_FE(mb_eregi, arginfo_mb_eregi)
	ZEND_FE(mb_ereg_replace, arginfo_mb_ereg_replace)
	ZEND_FE(mb_eregi_replace, arginfo_mb_eregi_replace)
	ZEND_FE(mb_ereg_replace_callback, arginfo_mb_ereg_replace_callback)
	ZEND_FE(mb_split, arginfo_mb_split)
	ZEND_FE(mb_ereg_match, arginfo_mb_ereg_match)
	ZEND_FE(mb_ereg_search, arginfo_mb_ereg_search)
	ZEND_FE(mb_ereg_search_pos, arginfo_mb_ereg_search_pos)
	ZEND_FE(mb_ereg_search_regs, arginfo_mb_ereg_search_regs)
	ZEND_FE(mb_ereg_search_init, arginfo_mb_ereg_search_init)
	ZEND_FE(mb_ereg_search_getregs, arginfo_mb_ereg_search_getregs)
	ZEND_FE(mb_ereg_search_getpos, arginfo_mb_ereg_search_getpos)
	ZEND_FE(mb_ereg_search_setpos, arginfo_mb_ereg_search_setpos)
	ZEND_FE(mb_regex_set_options, arginfo_mb_regex_set_options)
#endif
	ZEND_FE_END
};

static void register_mb_onig_symbols(int module_number)
{
#if !defined(HAVE_MBREGEX)
	REGISTER_STRING_CONSTANT("MB_ONIGURUMA_VERSION", php_mb_oniguruma_version, CONST_PERSISTENT);
#endif
}
