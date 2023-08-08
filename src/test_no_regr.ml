
module A = Array

let pi = 4.0 *. atan 1.0
let two_pi = 2.0 *. pi

let main () =
  let n = 1000 in
  let alphas = A.init n (fun i -> ((float i) *. two_pi) /. (float n)) in
  let sin_cos = A.map (fun a -> sin a, cos a) alphas in
  let res = Sincos.{ sin = 0.0; cos = 0.0 } in  
  let sincos =
    A.map (fun a -> Sincos.sincos a res; (res.sin, res.cos)) alphas in
  (* check they compute the same thing *)
  for i = 0 to n - 1 do
    let sin, cos = sin_cos.(i) in
    let sin', cos' = sincos.(i) in
    let eps = sin -. sin' in
    let eps' = cos -. cos' in
    if eps <> 0.0 then
      Printf.eprintf "sin diff of %g at %d\n" eps i;
    if eps' <> 0.0 then
      Printf.eprintf "cos diff of %g at %d\n" eps' i
  done

let () = main ()
