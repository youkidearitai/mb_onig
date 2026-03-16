<?php

/**
 * @generate-class-entries
 * @undocumentable
 */

#ifndef HAVE_MBREGEX
/**
 * @var string
 * @cvalue php_mb_oniguruma_version
 */
const MB_ONIGURUMA_VERSION = UNKNOWN;

/** @refcount 1 */
function mb_regex_encoding(?string $encoding = null): string|bool {}

/** @param array $matches */
function mb_ereg(string $pattern, string $string, &$matches = null): bool {}

/** @param array $matches */
function mb_eregi(string $pattern, string $string, &$matches = null): bool {}

/** @refcount 1 */
function mb_ereg_replace(string $pattern, string $replacement, string $string, ?string $options = null): string|false|null {}

/** @refcount 1 */
function mb_eregi_replace(string $pattern, string $replacement, string $string, ?string $options = null): string|false|null {}

/** @refcount 1 */
function mb_ereg_replace_callback(string $pattern, callable $callback, string $string, ?string $options = null): string|false|null {}

/**
 * @return array<int, string>|false
 * @refcount 1
 */
function mb_split(string $pattern, string $string, int $limit = -1): array|false {}

function mb_ereg_match(string $pattern, string $string, ?string $options = null): bool {}

function mb_ereg_search(?string $pattern = null, ?string $options = null): bool {}

/**
 * @return array<int, int>|false
 * @refcount 1
 */
function mb_ereg_search_pos(?string $pattern = null, ?string $options = null): array|false {}

/**
 * @return array<int|string, string|false>|false
 * @refcount 1
 */
function mb_ereg_search_regs(?string $pattern = null, ?string $options = null): array|false {}

function mb_ereg_search_init(string $string, ?string $pattern = null, ?string $options = null): bool {}

/**
 * @return array<int|string, string|false>|false
 * @refcount 1
 */
function mb_ereg_search_getregs(): array|false {}

function mb_ereg_search_getpos(): int {}

function mb_ereg_search_setpos(int $offset): bool {}

/** @refcount 1 */
function mb_regex_set_options(?string $options = null): string {}
#endif

