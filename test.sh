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

assert 21 "5+20-4"
assert 50 "10+10+10+20+10-10"

echo OK
