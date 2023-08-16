#!/bin/bash

dune build @all

_build/default/src/test_no_regr.exe

hyperfine \
  _build/default/src/test_sin_cos.exe \
  _build/default/src/test_sincos.exe
