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