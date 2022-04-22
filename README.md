## important
    (je ne mets pas les accents pour ne pas generer de problemes au niveau des caracteres)
    pour tester les fonctions sur un ordinateur de l'EPITA,
    sachant que les ordinateurs de l'EPITA sont sous l'environnement linux.
    avec emacs :
        Ouvrir un terminal ocaml : C-c-s
        Tester une fonction : placer le temoin sur le code a tester et taper C-c-e
##

## petite introduction
    pour les listes, seulement l'operateur (::) est utilise
    sauf pour comparer avec l'operateur @ qui est plus lourd

    nous sommes egalement en possession d'une fonction time qui calcule le temps en secondes que prend l'execution d'une fonction.
##

## 1) le tri par insertion
    On part du principe qu'une liste vide est triee
    ici ; l'algorithme consiste a inserer une valeur dans une liste triee ; et on repete cette action recursivement a l'aide d'une nouvelle liste initialement vide et la liste de base.
    temps d'execution sur une liste de 100000 elements strictement decroissante : 284.274000 secondes
##

## 2) le tri par selection
    Nous avons besoin de trois fonctions. 
    La premiere aura comme role de chercher le max dans la liste de depart.
    La deuxieme va supprimer le max trouve.
    Et la troisieme va appeler les 2 autres fonctions recursivement en affectant la valeur de la liste modifiee a la liste de depart.
    Il faut egalement savoir que le tri par selection a une complexite plus grande que le tri par insertion.
    temps d'execution sur une liste de 100000 elements strictement decroissante : 388.614000 secondes
##


