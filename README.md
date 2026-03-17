# mbregex extension for PHP

Original Oniguruma was ended 2025. So I create [Unicode & Security only update version](https://github.com/youkidearitai/oniguruma).

This repository is extension for mbregex.

## How to compile

### static (--enable-mb\_onig)

```
cd /path/to/php-src/
cd ext
git clone https://github.com/youkidearitai/mb_onig
cd ..
./buildconf -f
./configure --enable-mbstring --disable-mbregex --enable-mb_onig
make
```

### dynamic (via phpize)

```
git clone https://github.com/youkidearitai/mb_onig
cd mb_onig
phpize
./configure
make
make install
vi /path/to/php.ini # add extension=/path/to/mb_onig.so
```

### Windows

See <https://wiki.php.net/internals/windows/stepbystepbuild_sdk_2>.

```
buildconf
configure --disable-all --enable-mbstring --enable-mb_onig[=shared]
nmake
```

buildconf

## LICENSE 

See LICENSE file.
