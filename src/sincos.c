
#define _GNU_SOURCE
#include <math.h>

/* https://v2.ocaml.org/manual/intfc.html */
#include "caml/alloc.h"
#include "caml/memory.h"

/* CAMLprim value caml_modf_float(value f) */
/* { */
/*   CAMLparam0 (); */
/*   CAMLlocal2 (quo, rem); */
/*   value res; */
/*   double frem; */

/*   quo = caml_copy_double(modf (Double_val(f), &frem)); */
/*   rem = caml_copy_double(frem); */
/*   res = caml_alloc_small(2, 0); */
/*   Field(res, 0) = quo; */
/*   Field(res, 1) = rem; */
/*   CAMLreturn (res); */
/* } */

/* CAMLprim value caml_sincos_float(value f) */
/* { */
/*   CAMLparam0 (); */
/*   CAMLlocal2 (sine, cosine); */
/*   value res; */
/*   double x, y; */

/*   sincos(Double_val(f), &x, &y); */

/*   sine = caml_copy_double(x); */
/*   cosine = caml_copy_double(y); */
/*   res = caml_alloc_small(2, 0); */
/*   Field(res, 0) = sine; */
/*   Field(res, 1) = cosine; */
/*   CAMLreturn (res); */
/* } */

/* trying to store the result in an already allocated array */
CAMLprim value caml_sincos_float(value f, value res) {
  CAMLparam2 (f, res);
  double x;
  double y;

  sincos(Double_val(f), &x, &y);

  Store_double_flat_field(res, 0, x);
  Store_double_flat_field(res, 1, y);

  CAMLreturn (Val_unit);
}
