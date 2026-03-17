$(builddir)/oniguruma/oniguruma.h: $(srcdir)/oniguruma/src/oniguruma.h
	@test -d $(builddir)/oniguruma || mkdir -p $(builddir)/oniguruma
	cp $(srcdir)/oniguruma/src/oniguruma.h $(builddir)/oniguruma/oniguruma.h

# Also place oniguruma.h directly in the extension build dir so that
# #include <oniguruma.h> in mb_onig sources resolves to the bundled version
# via the -Iext/mb_onig/ flag, before any system or lexbor headers.
$(builddir)/oniguruma.h: $(srcdir)/oniguruma/src/oniguruma.h
	cp $(srcdir)/oniguruma/src/oniguruma.h $(builddir)/oniguruma.h

$(builddir)/mb_onig.lo: $(builddir)/oniguruma/oniguruma.h $(builddir)/oniguruma.h
$(builddir)/php_mbregex.lo: $(builddir)/oniguruma.h
