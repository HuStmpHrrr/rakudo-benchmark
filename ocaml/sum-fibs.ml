open Unix

let rec sum_fibs() =
let rec fibs = function x1::x2::xs ->
		if (x1 + x2 > 4000000) then x1::x2::xs
		else fibs(x1+x2::x1::x2::xs) 
	| _ -> [] in
let rec sum_them = function [] -> 0
	| x::xs -> if (x mod 2 = 0) then x + sum_them xs
			   else sum_them xs in
	sum_them (fibs [1; 1]);;

let rec iterate = function 0 -> ()
	| n -> 
	begin
		ignore (sum_fibs ());
		iterate (n - 1)
	end;;

let begn = Unix.gettimeofday();;
iterate 1000000;;
let ed = Unix.gettimeofday();;

Printf.printf "sum fibs: %.4f seconds / 1000000.\n" (ed -. begn);;
	
