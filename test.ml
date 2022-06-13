#load "graphics.cma";;
(*#use "topfind";; 
  #require "graphics";;*)
open Graphics;;
open_graph " 1200x800";;

draw_rect 110 110 200 200;;


(* ########### DEFINITION DES VARIABLES ########### *)

let color = red ;;
let x = 310 and y = 310;;
let z = 210 and t = 210;;

(* ######## FONCTIONS GRAPHICS PREDEFINIES ######## *)

clear_graph () (* supprime un graph *);;
set_color color (* definit une couleur color *);;
draw_rect x y z z (* dessine un carre non plein *);;
fill_rect (x+310) y z z (* dessine un carre plein *);;
lineto x y;; (* trace une ligne de la position au
                point (x,y) *)
moveto z t;; (* trace une ligne de la position au
                point (z,t) *)
rlineto x y;; (* deplace la position du point courant
                 par le vecteur (x,y) *)
rmoveto z t;; (* deplace la position du point courant
                 par le vecteur (z,t) *)

let xmax = 1200 and ymax=800;;
let xorg = 0 and yorg = 0;;
let xmiddle = 600 and ymiddle = 400;;
let rayon = 5;;
let hauteur = 14;;

let rec x_graduation n (x,y) = if n<0 then failwith "on ne fait pas maintenant les negatifs" else 
match n with
0 -> ()
| n -> set_color black ; moveto x (y-(hauteur/2)) ; lineto x (y+(hauteur/2)) ; x_graduation (n-1)(x+100,y);;

let rec y_graduation n (x,y) = 
  if n<0 then failwith "on ne fait pas maintenant les negatifs" else 
  match n with
    0 -> ()
    | n -> set_color black ; moveto (x-(hauteur/2)) y ; lineto (x+(hauteur/2)) y ; y_graduation (n-1)(x,y+100);;




let tests = 
  moveto xorg ymiddle;
  lineto xmax ymiddle;
  moveto xorg ymiddle;
  x_graduation 13 (xorg,ymiddle);
  moveto xmiddle yorg;
  lineto xmiddle ymax;
  moveto yorg xmiddle;

  y_graduation 9 (xmiddle,yorg);
  fill_circle xmiddle ymiddle rayon;;

  moveto (xmiddle+100) (ymiddle+100);;
  lineto xmiddle ymiddle;;
