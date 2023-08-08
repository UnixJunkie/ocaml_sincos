#!/bin/bash

dune build @all

_build/default/src/test_no_regr.exe

for i in `seq 1 5`; do
    _build/default/src/test_sin_cos.exe
done

for i in `seq 1 5`; do
    _build/default/src/test_sincos.exe
done
