fun sum_fibs() = 
let fun fibs(x1::x2::xs) =
    if (x1 + x2 > 4000000) then x1::x2::xs
    else fibs(x1+x2::x1::x2::xs)
  | fibs _ = [];
  fun sum_them [] = 0
    | sum_them (x::xs) = 
    if (x mod 2 = 0) then x + sum_them xs
    else sum_them xs
in
  sum_them (fibs [1, 1])
end;

fun iterate(0) = ()
  | iterate(n) =
  (
    sum_fibs();
    iterate(n-1)
  );


val begn = Time.now();
iterate(10000000);
val ed = Time.now();
print ("sum fibs: "
  ^ Real.toString(Real.fromLargeInt(Time.toMilliseconds(Time.-(ed, begn))) / 1000.0)
  ^ " seconds / 10000000.\n");
