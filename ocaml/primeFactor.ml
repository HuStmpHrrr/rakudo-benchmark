open Unix

type 'a infstream = Stream of 'a * 'a generator
and 'a generator = Thunk of (unit -> 'a infstream);;

type result = Result of int
            | Outer of int * int infstream;;

let rec gen_candidates() =
    let rec res next () = Stream (next, Thunk (res (next+2))) in
        Stream (2, Thunk (res 3));;

let rec largest_prime_factor n =
    let rec outer_iter ni = function (Stream (i, Thunk func)) ->
        let rec inner_iter n1 =
            if (n1 mod i = 0) then
                let n2 = n1 / i in
                if (i > n2) then Result i else inner_iter n2
            else Outer (n1, func ()) in
            match inner_iter ni with
            | Result i -> i
            | Outer (n1, strm) -> outer_iter n1 strm in
        outer_iter n (gen_candidates ());;

let rec iterate = function 0 -> ()
    | n ->
    begin
        ignore (largest_prime_factor 600851475143);
        iterate (n - 1)
    end;;

let begn = Unix.gettimeofday();;
iterate 1000;;
let ed = Unix.gettimeofday();;

Printf.printf "prime factor: %.4f seconds / 1000.\n" (ed -. begn);;
