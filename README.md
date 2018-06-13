# stage-L3

Semaine 1 :

Jour 1 : 
Présentation du travail à effectuer, et d'articles de recherches.
Lectures de ces articles.
Début du code du quadratic sieve

Jour 2 :
Ecriture d'une version primitive du quadratic sieve. Il calcul assez bien jusqu'aux nombres ayant 10 ou 11 chiffres un facteur du nombre. Il a 2 paramètre à ajuster et à trouver à tatons... Essayons d'améliorer ça
écriture d'une version légèrement amélioré, toujours le problème des 2 paramètres, ne renvoie que très rarement la solution...

Jour 3 : 
Correction de la plupart des bugs, version beaucoup plus rapide (présentée dans Tale of 2 sieve) (peut trouver un facteur d'un nombre ayant jusqu'à 13 chiffres). on a toujours le problème d'un paramètre, l'autre est calculé par l'algorithme.
Ecriture de la méthode itérative, constat qu'il est plus rapide sur des entrées ayant jusqu'à 20 chiffres...
Je ne comprends toujours pas pourquoi l'algorithme  peut donner 25 vecteurs dans le ker et tous vérifient gcd(u,x)=1 et gcd(u-v,x)=1 ou x... (1/2^25 ça fait faible comme probabilité)
Problème réglé (ouf), on peut monter jusqu'à 20 chiffres environ.

Jour 4 : 
Présentations de d'algorithme du quadratic Sieve à L.Grémy.
Présentation rapide de NFS
Présentation sur les problèmes SVP (shortest vector problem) et CVP (closest vector problem) 
Présentation sur les isogénies et courbes élipitques (trop compliqué pour être parfaitement comprise)
apprentissage de quelques outils latex (nottement références).
écriture du début du rapport.

Jour 5 :
Présentation sur un autre système de cryptographie basé sur les isogeny.
Lecture de l'article de Pollard "Factoring with cubic integers" et d'une partie de la thèse "Améliorations de la multiplication et de la factorisation d’entier" d'Alexander Kruppa. début de compréhension de NFS.
Relecture du début de rapport, quelques ajouts et correction de fautes d'orthographes.

Semaine 2 :

Jour 1 :
Lecture d'articles sur RSA, et sur l'algorithme polynomial sur la factorisation d'entier sur ordinateur quantique.
Lecture d'articles sur la factorisation d'entier et leur utilitée en crypto (comment attaquer RSA).
Relecture d'articles sur NFS, quelques question reste sur la factorisation de nombres de Z[alpha]... passer par la norme me semble compliquer (la quantité de nombre de Z[alpha] de norme divisant la norme du nombre que l'on recherche peut être grand ?)
J'ai assisté à une soutenance de stage de M2 sur les jeux stochastiques simples.

Jour2 :
Réunion avec Laurent et Guillaume. Retour sur QS, éclaircissement de certains points pas très clair à son sujet.
L'algorithme doit être amélioré. (j'y ai consacré le reste de la journée) : maintenant le crible gère les entiers "presque smooth" (tous les facteurs plus petit que B sauf 1). 
d'ailleurs N et B sont devenus des paramètres de l'algorithme. il est maintenant instantané ou presque sur F6 (avec B = 2000 et N = 100.000). Il a factorisé un nombre de 30 chiffres en environ 30 secondes (quadratic_sieve(next_prime(10**15)*previous_prime(10**15),10000, 300000) a renvoyé le bon résultat)
Explications de certains points de NFS.

Jour3 :
Installation de la machine Requiem, cela me permets de faire des tests plus poussés.
Ajout de quelques lignes, pour avoir des informations sur les calculs
Premier nombre à 40 chiffres factorisé : 
"fact(next_prime(10**20)*previous_prime(10**20),15000,1000000)
nombre de vecteur du ker : 1
temps de calcul : 273 secondes
99999999999999999989"
Il va falloir commencé à optimiser l'algorithme, gagner ne serait-ce qu'un facteur 2 en temps peut être intéressant.
F7 quand a lui n'est pas encore factorié :/
familiarisation avec Ubuntu et git (pour pouvoir pull mon repertoire sur requiem)
Lancement d'un gros calcul sur requiem (qui durera surement au moins jusqu'à demain) pour savoir comment choisir de manière optimale B et N.
Amélioration du rapport.
