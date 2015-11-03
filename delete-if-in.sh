#! /bin/bash -eu

## Removes files from this directory if they are md5-equal to those in the 
## specified directory

reference=$1
shift

find "$@" -type f -print0 |( cd "$reference" && xargs -0r md5sum ) | LANG=C md5sum -c |sed -n 's/: OK$//p'|tr '\n' '\0'| xargs -0r rm -v
