
(* external sincos: float -> float * float = "caml_sincos_float" *)

(* using an already allocated struct to hold the result *)
type sincos_res = { mutable sin: float ;
                    mutable cos: float }

external sincos: float -> sincos_res -> unit = "caml_sincos_float"
