#!/bin/bash

assert() {
  expected="$1"
  input="$2"

  ./9cc "$input" >temp.s
  cc -o temp temp.s
  ./temp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
  fi
}

assert 41 " 12 + 34 - 5 "
assert 19 " 10-9 + 18"
echo OK
