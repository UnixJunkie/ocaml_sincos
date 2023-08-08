module A = Float.Array

let pi = 4.0 *. atan 1.0

let main () =
  let datalen = 1000 in
  let alphas = A.init datalen (fun i -> float i *. pi /. float datalen) in
  let n = 30_000 in
  let t0 = Unix.gettimeofday () in
  let res = Sincos.{ sin = 0.0; cos = 0.0 } in
  for _ = 1 to n do
    for i = 0 to datalen - 1 do
      let x = A.unsafe_get alphas i in
      Sincos.sincos x res;
    done;
  done;
  let t1 = Unix.gettimeofday () in
  Printf.printf "sincos_: %f\n" (t1 -. t0)

let () = main ()
