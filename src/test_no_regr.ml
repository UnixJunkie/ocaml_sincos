
module A = Array

let pi = 4.0 *. atan 1.0
let two_pi = 2.0 *. pi

let main () =
  let n = 1000 in
  let alphas = A.init n (fun i -> ((float i) *. two_pi) /. (float n)) in
  let sin_cos = A.map (fun a -> sin a, cos a) alphas in
  let sincos = A.map Sincos.sincos alphas in
  (* check they compute the exact same thing *)
  assert(sin_cos = sincos)
  
let () = main ()
