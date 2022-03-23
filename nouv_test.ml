print_int(1);;

let fibo n = match n with
  | n when n=1 || n=0 -> 1
  | n when n<0 -> failwith "fibo : n ne doit pas etre negatif"
  | n -> 
    let rec fi somme init i =
      if i=n then
        somme
      else
        fi (somme+init)(somme)(i+1)
      in fi 2 1 2;;

let fibo2 n = 
  if n=0 || n=1 then 1
  else
    let rec fibo var1 var2 i = match i with
        i when i=n -> var2
      | i -> fibo(var2)(var2+var1)(i+1) 
    in fibo 1 2 2;;

let rec reverse n str = match n with
    | n when n=0 -> str
    | n -> reverse(n/10)(str ^ string_of_int(n mod 10));;

let binaire n = 
  let rec division_rec n = match n with
    | (nbr) when nbr = 1 -> print_int(1)
    | (nbr) -> division_rec(nbr/2) ; print_int(nbr mod 2)
  in division_rec n ;;
(*
let rec binaire n = 
  let liste = division n 2 in 
  let rec binaire_rec liste = match liste with
    | [] -> ()
    | e::l when e=1 || e=0 -> print_int(e) ; binaire_rec l
    | e::l -> binaire_rec l
  in binaire_rec liste ;;*)

let factoriel n = 
  if n<0 then
    invalid_arg "factorial : n must be positive or null"
  else
    let rec factoriel_rec i = match i with 
      | i when i>n -> 1
      | i -> i*factoriel_rec (i+1) 
    in factoriel_rec 1;;

let perfect_number x = 
  let rec perfect sum n = 
    if sum>=x then
      sum=x
    else
      if (x mod n = 0) then
        perfect (sum+n) (n+1)
      else
        perfect (sum) (n+1)
  in perfect 0 1;;

let suite n =
  if n<0 then 
    invalid_arg "" 
  else
    let rec suite_ n = match n with
      0 -> 1
    | n -> 4 * suite_(n-1) + 2 
    in suite_ n;;

let suite_arithmetique n q =
  if n<0 then 
    invalid_arg "" 
  else
    let rec suite_ar n = match n with
      0 -> 1
    | n -> q*suite_ar(n-1)
  in suite_ar n ;;


let addition x y = 
  if x<0 || y<0 then
    invalid_arg "addition : only positive case"
  else
    let rec add x y = match (x,y) with
        (0,1) -> 1
      | (0,y) when y>1 -> 1+add x (y-1)
      | (x,y) -> 1 + add (x-1) y in
    add x y ;;

let multiplication x y =
  if y<0 then
    invalid_arg"multiplication : y must be positive"
  else
    let rec mult y = match y with
        0 -> 0
      | y -> x+mult(y-1) 
    in mult y;;

let move source destination =
  print_int source ;
  print_string " -> " ;
  print_int destination ;
  print_newline() ;;

let hanoi n =
  let rec play n source destination =
    if n=1 then 
      move source destination
    else
      let inter=6-destination-source in
      (
        play (n-1) source inter ;
        move source destination ;
        play (n-1) inter destination
      )
  in
  if n < 0 then
    invalid_arg "Hanoi: number of disks invalid"
  else
    play n 1 3;;