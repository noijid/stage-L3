# stage-L3 semaine 1

semaine 1 :

Jour 1 : Présentation du travail à effectuer, et d'articles de recherches.
Lectures de ces articles.
Début du code du quadratic sieve

Jour 2 : écriture d'une version primitive du quadratic sieve. Il calcul assez bien jusqu'aux nombres ayant 10 ou 11 chiffres un facteur du nombre. Il a 2 paramètre à ajuster et à trouver à tatons... Essayons d'améliorer ça
écriture d'une version légèrement amélioré, toujours le problème des 2 paramètres, ne renvoie que très rarement la solution...

Jour 3 : Correction de la plupart des bugs, version beaucoup plus rapide (présentée dans Tale of 2 sieve) (peut trouver un facteur d'un nombre ayant jusqu'à 13 chiffres). on a toujours le problème d'un paramètre, l'autre est calculé par l'algorithme.
Ecriture de la méthode itérative, constat qu'il est plus rapide sur des entrées ayant jusqu'à 20 chiffres...
Je ne comprends toujours pas pourquoi l'algorithme  peut donner 25 vecteurs dans le ker et tous vérifient gcd(u,x)=1 et gcd(u-v,x)=1 ou x... (1/2^25 ça fait faible comme probabilité)
Problème réglé (ouf), on peut monter jusqu'à 20 chiffres environ.

Jour 4 : Présentations de d'algorithme du quadratic Sieve à L.Grémy.
Présentation rapide de NFS
Présentation sur les problèmes SVP (shortest vector problem) et CVP (closest vector problem) 
Présentation sur les isogénies et courbes élipitques (trop compliqué pour être parfaitement comprise)
apprentissage de quelques outils latex (nottement références).
écriture du début du rapport.
