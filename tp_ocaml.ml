let build_line n str = match n with
  | n when n<0 -> failwith "build_line : n must be positive"
  | n -> 
    let rec build_line_rec n = match n with
      | 0 -> ()
      | n -> 
        print_string(str) ;
        build_line_rec(n-1)
    in build_line_rec n;;

let square n str = 
  let rec square_rec n m str = match n with
    | 0 -> ()
    | n -> 
      build_line m str ; 
      print_newline() ;
      square_rec (n-1) m str
  in square_rec n n str;;
  
let square2 n (str1,str2) = 
  let str = str1 ^ str2 in
  square n str ;;

let rec triangle n str = match n with
  | 0 -> ()
  | n -> 
    triangle(n-1)(str) ;
    build_line n str ;
    print_newline() ;;

let pyramid n (str1,str2) = 
  let m = n in
  let rec pyramid_rec n t = match (n,t) with
    | (0,t) when t>m -> ()
    | (n,t) when n=0 -> build_line(2*t)(str2) ; pyramid_rec 0 (t+1)
    | (n,t) ->
      build_line (n-1)(str1) ; build_line(2*t)(str2) ;
      build_line(n-1)(str1) ; print_newline() ;
      pyramid_rec(n-1)(t+1) 
  in pyramid_rec n 1;; 


                  