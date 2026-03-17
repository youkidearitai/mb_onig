# mbregex extension for PHP

Original Oniguruma was ended 2025. So I create [Unicode & Security only update version](https://github.com/youkidearitai/oniguruma).

This repository is extension for mbregex.

## How to compile

```
cd /path/to/php-src/
cd ext
git clone https://github.com/youkidearitai/mb_onig
cd ..
./buildconf -f
./configure --enable-mbstring --disable-mbregex --enable-mb_onig
make
```

I tried Linux only for now.

## LICENSE 

See LICENSE file.
