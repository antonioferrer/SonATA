#!/bin/sh

# updates Makefile infrastructure


echo "libtoolize..."
libtoolize --force --automake 

echo "aclocal..."
aclocal

echo "autoconf..."
autoconf

echo "autoheader..."
autoheader

echo "automake..."
automake -a


