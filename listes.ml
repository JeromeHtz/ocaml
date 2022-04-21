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

let inverser liste =
  let rec invers list elt = match list with
      [] -> elt
    | e::l -> invers l (e::elt)
  in invers liste [];;

let rec invers list = match list with
    [] -> []
  | e::l -> invers l@[e];;

let rec equals l1 l2 = match (l1,l2) with
  | ([],[]) -> true
  | ([],_) | (_,[]) -> false
  | (e::l1,e1::l2) -> e=e1 && equals l1 l2 (t+1);;

let retourner liste = 
  let rec return list res = match list with
      [] -> res
    | e::l -> return l (e::res) 
  in return liste [];;

(* tri par insertion *)
let insert x list =
  let rec insert_rec list booleen = match (list,booleen) with
      ([],true) -> []
    | ([],false) -> x::[]
    | (e::l,b) when e>x && b=false -> x::e::insert_rec l (true)
    | (e::l,b) -> e::insert_rec l b 
  in insert_rec list false;;

let insertion_sort list = 
  let rec insertion_rec list res = match list with
      [] -> res
    | e::l -> let res = insert e res in insertion_rec l res 
  in insertion_rec list [];;

(* tri par selection *)
let get_max list =
  let e::rest = list in
    let rec max elt liste = match liste with
        [] -> elt
      | e::l when e>elt -> max e l
      | e::l -> max elt l
     in max e rest ;;

let remove x liste = 
  let rec remove_rec liste res booleen = match (liste,res,booleen) with
      ([],_,false) -> invalid_arg "remove : impossible de supprimer"
    | ([],r,true) -> r
    | (e::l,r,b) when x=e && b<>true -> remove_rec l r (true)
    | (e::l,r,b) -> e::remove_rec l r b 
  in remove_rec liste [] false;;

let selection_sort list = 
  let rec selection_sort_rec liste res = match liste with
      [] -> res
    | liste -> let max = get_max liste in selection_sort_rec (remove max liste)(max::res)
  in selection_sort_rec list [];;

(* insertion d'une valeur dans une liste de listes *)
let rec insert_nth (x,y) v list = match (x,list) with
    (x,_) when x<0 -> invalid_arg "insert_nth : invalid index"
  | (0,[]) -> []
  | (x,[]) -> [v]::[]
  | (0,e::li) -> let rec insert y liste = match (y,liste) with
              (0,l) -> v::l
            | (y,[]) -> v::[]
            | (y,e::l) -> e::insert(y-1) l 
          in insert y e :: insert_nth (0,y) v li 
  | (x,e::li) -> e::insert_nth (x-1,y) v li;; 
    
let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "Execution time: %fs\n" (Sys.time() -. t);
  fx ;;


let rec generer_liste n = match n with
      0 -> []
    | i -> i::generer_liste(i-1);;

(* email principal changement *)