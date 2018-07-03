# stage-L3

# Semaine 1 :

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

# Semaine 2 :

Jour 1 :
Lecture d'articles sur RSA, et sur l'algorithme polynomial sur la factorisation d'entier sur ordinateur quantique.
Lecture d'articles sur la factorisation d'entier et leur utilitée en crypto (comment attaquer RSA).
Relecture d'articles sur NFS, quelques question reste sur la factorisation de nombres de Z[alpha]... passer par la norme me semble compliquer (la quantité de nombre de Z[alpha] de norme divisant la norme du nombre que l'on recherche peut être grand ?)
J'ai assisté à une soutenance de stage de M2 sur les jeux stochastiques simples.

Jour 2 :
Réunion avec Laurent et Guillaume. Retour sur QS, éclaircissement de certains points pas très clair à son sujet.
L'algorithme doit être amélioré. (j'y ai consacré le reste de la journée) : maintenant le crible gère les entiers "presque smooth" (tous les facteurs plus petit que B sauf 1). 
d'ailleurs N et B sont devenus des paramètres de l'algorithme. il est maintenant instantané ou presque sur F6 (avec B = 2000 et N = 100.000). Il a factorisé un nombre de 30 chiffres en environ 30 secondes (quadratic_sieve(next_prime(10**15)*previous_prime(10**15),10000, 300000) a renvoyé le bon résultat)
Explications de certains points de NFS.

Jour 3 :
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

Jour 4 :
Relecture de a Joy of factoring (partie sur NFS), et de Factoring with cubic Integers.
Lecture d'un diapo de Razvan Barbulescu sur NFS.
Compréhension approximative de l'algorithme`.
Rédaction d'une partie du rapport sur NFS
Création du makefile pour compiler le latex et supprimer les fichiers auxiliaires crés lors de la compilations

Jour 5 :
Entetiens avec Laurent pour parler me présenter small NFS,
lecture et compéhension (approximative) du code fourni
Début du code du lattice sieve. des problèmes étranges apparaissent.




# Semaine 3 :
Jour 0 (dimanche) : 
Réception du code envoyé par Laurent, test, erreur dû à une assert dans le main, même en retirant le lattice sieve. J'essaie de comprendre, surement un problème du à notre modifiaction de l'entrée. Sinon, les sorties des lattice sieve et linear sieve sont différentes, à voir avec Laurent.

Jour 1 : 
Réunion avec Laurent et Guillaume, présentation de l'amélioration du quadratic sieve et discussion autour de small NFS.
preuve de la complexité de l'algorithme par Guillaume.
retour au code de NFS, correction du problème avec la lattice sieve. Un problème apparaît pour la seconde entrée au niveau de l'algèbre linéaire. Je tente de comprendre pourquoi (pas pratique les 13 minutes de calculs avant d'arriver à cette erreur)
lecture d'articles sur NFS pour moins voir FK comme une boite noire.

Jour 2 : 
Un problème dans le code de NFS a été signalé à Laurent hier, le problème n'étant pas réglé, il m'a invité à rédiger une la partie concernant NFS de mon rapport
Laurent m'a retroué un code fonctionnel. J'y ajoute le lattice sieve que j'ai écrit et la nouvelle version de reduce q_lattice
je regarde combien on peut gagner en temps dessus. Résultats peu probant, le temps gagné est ridicule (quelques seconde sur plusieurs minutes de calculs). Des modifications du code ont été effectués pour comprendre pourquoi.
Il semblerait qu'avec l'entrée utilisé pour les calculs, le lattice sieve ne gagne pas car en moyenne le réseau est encore trop dense, même pour les plus grosses valeurs de p. Donc la différence entre lattice et linear sieve ne se voient pas.
PS : Un calcul de fond sur le crible quadratique a montré que mon algorithme pouvait factoriser le 6e nombre de Fermat avec seulement une facto base de taille 1000. pas besoins de monter à 15.000 comme je l'avais fais précédement.

Jour 3 :
Légère amélioration du rapport,
on poursuit les tests pour comparer les vitesses des lattice sieve et linear sieve. On gagne 4 minutes sur un calcul d'une heure avec certains paramètres... 
J'essayais de comprendre pourquoi l'algorithme gagnait si peu, en ajoutant des étapes pour mesurer le temps, le temps de crible est négligeable devant le temps total de recherche de relation. C'est ici que l'algo doit être optimisé (une vingtaine de secondes contre 9 minutes).
En pratique, le crible par maille fait gagner un facteur 1,3 sur le temps de crible total.
Les étapes les plus longues de l'algorithme sont les précalculs des normes et la cofactorisation.
J'y ai jeté un oeil, mais puisque je commence demain le travail avec plusieurs spécial Q, je ne me sens pas de reprendre intégralement cette partie du code.

Jour 4 :
Relecture du code de Laurent, particulièrement de la partie sur les spécials Q en prévision de la réunion avec lui de l'après midi
Entretiens avec Laurent, pour préparer le travail sur le multi spécial Q.
Commentaire des résultats précédents et des temps d'execution de l'algorithme : temps de cofactorisation trop long. J'essaie avec un thresh plus petit (B^2 au lieu de B^3), on obtient toujours assez de relation pour continuer et le temps de cofactorisation devient équivalent à celui de crible. Cela semble être un bon compromis.
Travail sur le théorème des restes chinois. But : résoudre a0+a1h0 = 0 mod q0 et a0 + a1h1 = 0 mod q1.
si q0 = q1, trivial : si h0 =h1 une seule equation, on sait faire, sinon il faut a1 = 0 mod q.
si q0 != q1, on a (a0 a1) = c0 b0 + c1 b1 avec b0 = (q0q1, 0) et b1 = (-h1u1q1 - h0u0q0, 1) avec u0, u1 les coefficitents de bezout tel que q0u0+q1u1 = 1.

Jour 5 :
On commence à implémenter la solution trouvée hier. (on ne traite pas les cas gênant q0 = q1)
J'ai refais quelques tests à la main de la solution trouvé hier, elle semble être la bonne.
Suite à un problème de typage, je ne peux pas faire de test informatiquement pour l'instant. J'essaierai de corriger ça et de faire ça la semaine prochaine.




# semaine 4:

Jour 1 :
Relecture du code avec la thèse de Laurent, modifiations pour que le code s'execute. On trouve sur des entrées plus ou moins aléatoire (au niveau du choix des spécial Q) anormalement beaucoup de relations que l'on doit jetter, je ne sais toujours pas si l'implémentation est correcte ou pas

Jour 2 : Réunion avec Laurent et Guillaume, présentation du travail de la semaine précédente et de ce qui reste à faire.
Enfin, une version fonctionnelle de la recherche de relation pour le multi spécial Q. Il manque plus que le choix des spécial Q et on sera bon. (Je pensais pas réussir à débugger aussi vite) Modification du programme pour gérer les 2 spécials-Q ( qrange1 et 2) 

Jour 3 : On essaie la version enfin fonctionnelle du multi spécial Q. Les résultats étaient étrange mais après 2 heures de tests, je réalise que j'ia inversé les côtés 1, et 2. Les résultats sont beaucoup plus intéressants. Je commence à les noter dans le rapport.

Comparaison smallnfs et multi special Q
load("smallnfs.sage")
temps 1 : 1.4514529705
temps recherche : 1439.10991096
nombre d'utilisation du lattice sieve 67276
(3802, 564, 624)
pour l'instant on s'arrete la
premier test :  5 116 660  deuxieme test :  5533
nombre de reseau observe :  421


load("nfs_multi_specialQ.sage")
temps 1 : 1.39958906174
temps recherche : 1030.35505009
nombre d'utilisation du lattice sieve 35872
(980, 564, 624)
pour l'instant on s'arrete la
premier test :  315 254  deuxieme test :  2764
nombre de reseau observe :  225

J'en ai parlé à Laurent, le reste de ma semaine servira à décrire plus proprement ces algorithmes. J'ai donc téléchargé un  package latex pour les algos en français. Je commit ces nouveaux fichiers.


Jour 4 :
Ecriture du rapport, grosse partie de NFS avec 2 spécial Q en pseudo code.

Jour 5 : 
Fin de l'écriture de NFS avec 2 spécial Q sur le rapport. Présentation rapide de cado NFS par Laurent

# Semaine 5

Jour 1 : Réunion avec Laurent et Guillaume présentation du travail de la semaine précédente et de ce qui doit être fait cette semaine : finir l'implémentation de nfs avec 2 special Q pour l'incorporer au reste de l'algorithme avec cado NFS. Correction du rapport.
Lancement de l'algorithme avec 2 spécials-Qs et des polynômes obtenus par CADO-NFS sur un C30.
Avancement du rapport.

Jour 2 : Lancement d'un calcul (qui va surement prendre une vingtaine d'heure), correction du code ( pour ne plus avoir le problème lorsque l'on divise un nombre 2 fois par q). amélioration du rapport.
