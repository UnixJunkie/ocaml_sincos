
module A = Array

let pi = 4.0 *. atan 1.0

let main () =
  let n = 30_000_000 in
  let alphas = A.init n (fun i -> (float i) *. pi /. (float n)) in
  let t0 = Unix.gettimeofday () in
  let res = Sincos.{ sin = 0.0; cos = 0.0 } in  
  for i = 0 to n - 1 do
    let a = A.unsafe_get alphas i in
    Sincos.sincos a res
  done;
  let t1 = Unix.gettimeofday () in
  Printf.printf "sincos_: %f\n" (t1 -. t0)

let () = main ()
