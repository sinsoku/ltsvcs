#!/bin/bash

# $1: ISO 8601 format time
iso2touch() {
  t=$1
  t=${t%:*}
  t=${t// /}
  t=${t//-/}
  t=${t//:/}
  echo $t
}

# $1: file name
adjust_ts() {
  t=`git log $new_sha --format=%ci -n 1 -- "$1"`
  t=`iso2touch "$t"`
  touch -t $t "$1"
}
