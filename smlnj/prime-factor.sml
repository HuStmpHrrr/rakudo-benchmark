datatype 'a lazy = stream of 'a * 'a generator
and 'a generator = thunk of unit -> 'a lazy

fun gen_candidates() =
let fun rest next () = stream (next, thunk (rest (next+2)))
in
  stream (Int.toLarge 2, thunk (rest (Int.toLarge 3)))
end

fun largest_prime_factor n =
let fun outer_iterate ni (stream (i, thunk func)) =
  let fun inner_iterate n1 =
    if (n1 mod i = 0) then
      let val n2 = n1 div i
      in if (i > n2) then i
         else inner_iterate n2
      end
    else
      outer_iterate n1 (func ())
  in
    inner_iterate ni
  end
in
  outer_iterate n (gen_candidates())
end

fun iterate(0) = ()
  | iterate(n) =
  (
    largest_prime_factor 600851475143;
    iterate(n-1)
  );

val begn = Time.now();
iterate(1000);
val ed = Time.now();
print ("prime factor: "
  ^ Real.toString(Real.fromLargeInt(Time.toMilliseconds(Time.-(ed, begn))) / 1000.0)
  ^ " seconds / 1000.\n");
