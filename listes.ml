let count x liste = 
  let rec count_rec i liste = match (liste,i) with
      ([],i) -> i
    | (e::l,i) when e=x -> count_rec (i+1) l
    | (_::l,i) -> count_rec i l 
  in count_rec 0 liste;;

let find i liste = match i with
    i when i<=0 -> invalid_arg "find : i has to be positive"
  | i -> 
    let rec find_rec j liste = match (j,liste) with
      | (j,e::l) when j=i -> e
      | (_,[]) -> failwith "find : list too short"
      | (j,_::l) -> find_rec (j+1) l 
    in find_rec 0 liste ;;

let find_max liste = match liste with
    [] -> invalid_arg "find_max : empty list"
  | liste -> 
    let rec max m liste = match (m,liste) with
        (m,[]) -> m
      | (m,e::l) when e>m -> max e l
      | (m,_::l) -> max m l 
    in max 0 liste ;;

let arith_list n a r = 
  let rec arithmetique m a liste = match (m,liste) with
      (m,l) when m=n -> l
    | (m,l) -> a::arithmetique (m+1) (a+r) l
  in arithmetique 0 a [] ;;