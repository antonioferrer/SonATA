#!/bin/sh
pathconfgnu="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
pathconf=`dirname "$pathconfgnu"`
$pathconf/configure
