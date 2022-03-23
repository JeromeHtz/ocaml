let crack_the_code x = match x with
  | n when (n<0 || (n<1000 || n>9999)) ->
    invalid_arg "crack the code : x must be a 4-digit number"
  | n -> 
      (
        if (n/1000 + (n/100) mod 10 + (n/10) mod 10 + n mod 10)=13 && 
          ((n/1000))=(2*((n mod 10) mod 10)) && 
          ((n/100) mod 10)=(3*((n/10) mod 10)) then 
            true
        else
          false
      );;

let plate x = match x with
    n when (n<0 || (n<1000 || n>9999)) ->
    invalid_arg "plate : x must be a 4-digit number"
  | n -> 
    if n/1000=(n/100) mod 10 && (n/10) mod 10 = n mod 10 then
      let sqr = sqrt(float_of_int n) in let number = int_of_float(sqr) in
      number mod 1 = 0
    else
      false ;;

let surface n =
  if n<0 then invalid_arg "surface : negative parameter, cannot be a surface area"
  else
    let et_1 = n-5000 in
    if et_1>999 || n<100 then
      false
    else
      let et_2 = et_1 * 1000 + et_1 in
      let et_3 = et_2/7 - 7*(et_2 mod 7) in
      let et_4 = et_3/11 - 11*(et_3 mod 11) in
      let et_5 = et_4/13 - 13*(et_4 mod 13) in 
      et_5 = 555 ;;

let _strtoint i x y= 
  let rec strtoint i x y = match i with 
    | i when i = (String.length x) || x.[i]='/' -> y
    | i -> strtoint (i+1)(x)(y^(Char.escaped(x.[i]))) 
  in int_of_string(strtoint i x "");;

let tomorrow x = 
  let jour = _strtoint 0 x "" in
  let y = 4 in
  let mois  = _strtoint y x "" in
  let annee = _strtoint (y+2) x "" in
  let lendemain d m y = match (d,m,y) with 
    | (d,m,y) when ((m>12 || m<1) || (y mod 4 = 1 && m=2 && d>28) || (y mod 4 = 0 && m=2 && d>29) || (d>30 && (m=4 || m=6 || m=9 || m=11))) ->
        failwith "tomorrow : invalid date"
    | (d,m,y) when ((y mod 4) = 0 && (d = 29 && m = 2)) ->
        string_of_int 1 ^ "/" ^ string_of_int (m+1) ^ "/" ^ string_of_int y
    | (d,m,y) when ((y mod 4) <> 0 && (d = 28 && m = 2)) ->
        string_of_int 1 ^ "/" ^ string_of_int (m+1) ^ "/" ^ string_of_int y
    | (d,m,y) when (d=30 && (m=4 || m=6 || m=9 || m=11)) ->
        string_of_int 1 ^ "/" ^ string_of_int (m+1) ^ "/" ^ string_of_int y
    | (d,m,y) when (d=31 && (m=1 || m=3 || m=5 || m=7 || m=8 || m=10)) ->
        string_of_int 1 ^ "/" ^ string_of_int (m+1) ^ "/" ^ string_of_int y
    | (d,m,y) when (d=31 && m=12) ->
        string_of_int 1 ^ "/" ^ string_of_int (m+1) ^ "/" ^ string_of_int (y+1)
    | (d,m,y) -> string_of_int (d+1) ^ "/" ^ string_of_int m ^ "/" ^ string_of_int y 
  in lendemain jour mois annee;;