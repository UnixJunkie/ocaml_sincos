
#define _GNU_SOURCE
#include <math.h>

/* https://v2.ocaml.org/manual/intfc.html */
#include "caml/alloc.h"
#include "caml/memory.h"

CAMLprim value caml_sincos_float(double f, value res) {
  sincos(f, (double*)res, 1+(double*)res);
  return Val_unit;
}
