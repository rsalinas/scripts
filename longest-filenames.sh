#! /bin/sh -eu

ls "$@" |awk '{print length($0) " " $0 }'|sort -g

