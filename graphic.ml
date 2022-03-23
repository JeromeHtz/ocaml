#load "graphics.cma";;
(*#use "topfind";; 
  #require "graphics";;*)
open Graphics;;
open_graph " 1200x800 ";;

draw_rect 110 110 200 200;;


(* ########### DEFINITION DES VARIABLES ########### *)

let color = red ;;
let x = 310 and y = 310;;
let z = 210 and t = 210;;

(* ######## FONCTIONS GRAPHICS PREDEFINIES ######## *)

clear_graph () (* supprime un graph *);;
set_color color (* definit une couleur color *);;
draw_rect x y side side (* dessine un carre non plein *);;
fill_rect (x+310) y side side (* dessine un carre plein *);;
lineto x y;; (* trace une ligne de la position au
                point (x,y) *);;
moveto z t;; (* trace une ligne de la position au
                point (z,t) *);;
rlineto x y;; (* deplace la position du point courant
                 par le vecteur (x,y) *);;
rmoveto z t;; (* deplace la position du point courant
                 par le vecteur (z,t) *);;

(* ################### EXERCICES ################## *)

clear_graph () ;;

let cell_color e = match e with
  | 0 -> white
  | _ -> black;;


let rec length liste = match liste with
  | [] -> 0
  | e::l -> 1+length l;;

let draw_board board size = let x=0 and y=0 and step = 4 in let c = size + step in
  let rec draw_board_1 (x,y) board size = match board with
    |[] -> () 
    |e::b ->
        (let rec draw_board_2 (x,y) e size = match e with
           | [] -> ()
           | elt::e -> set_color (cell_color elt) ; fill_rect x y size size ; draw_board_2 (x,y+c) e size 
         in draw_board_2 (x,y) e size) ; draw_board_1 (x+c,y) b size 
  in draw_board_1 (x,y) board size ;;

let rec multiplication x y = match y with
  | 0 -> 0
  | _ -> x+multiplication(x)(y-1) ;;

let f x = x+x;;



