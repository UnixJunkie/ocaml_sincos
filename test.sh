#!/bin/bash

dune build @all

for i in `seq 1 5`; do
    _build/default/src/test_sin_cos.exe
done

for i in `seq 1 5`; do
    _build/default/src/test_sincos.exe
done
