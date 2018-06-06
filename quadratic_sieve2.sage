def pgcd(a,b):
    if a<0 :
        return pgcd(-a,b)
    if a == 0 :
        return b
    if b<a :
        return pgcd(b,a)
    return pgcd(b%a,a)

def racine(N,p):
    """ renvoie les 2 racines de la fonction f(x)%p =0 avec f de la forme x**2 - N"""
    t = N%p
    for i in range(1,p):
        if (i*i)%p==t:
            return [i,p-i]
    return []

def puiss(a,b,p):
    """ calcul a^b mod p"""
    if b==0 or a==1:
        return 1
    if b==1:
        return a%p
    if b%2==1 :
        return a*puiss(a*a%p,b//2,p)%p
    else :
        return puiss(a*a%p,b//2,p)



#Pour calculer les nombres premiers jusqu'à n
n = 10**4
aux = [1 for i in range(n+1)]
premier = []
for i in range(2,int(n)):
    j = 2*i
    if(aux[i] == 1):
        premier.append(i)
        while(j<n):
            aux[j] = 0
            j = j+i

# Serivra plus tard, on commence par une version plus simple
def eratosthene(N,I,J,P):
    L = [[]for k in range(J-I+1)]
    for p in P:
        R = racine(N,p) #R contien x et y avec (x**2-N)%p =0 et (y**2-N)%p=0
        for j in range(len(R)):
            if R[j]%p >= I%p :
                i = I + (R[j]%p - I%p)
            else :
                i = I + p + (R[j]%p - I%p)
            while i<=J:
                L[i-I].append(p)
                i += p
    return L # L[i] contient les facteurs dans P de i*i-N

def ker(V):
    """renvoie une base de ker V"""
    A = matrix(V)
    K = A.kernel().basis_matrix()
    return  K

def decomp_prem(x,P):
    """ renvoie les puissances des nombres premiers divisant x modulo 2 dans P"""
    fact = [False]*len(P)
    i = 0
    while(x!=1 and i<len(P)):
        while(x%P[i]==0):
            fact[i] = not fact[i]
            x = x//P[i]
            i +=1
    if(x==1):
        return fact,1
    else :
        return fact,0

def factor_base(N,B):
    i = 1
    res = [2]
    while(premier[i]<B):
        p = premier[i]
        a = puiss(N,(p-1)//2,p)
        if a==1:
            res.append(premier[i])
        i +=1
    return res

def est_smooth(n,li,P, aux,i,j):
    if n==1:
        return aux
    if li == []:
        return []
    if(P[j]>li[-1]):
        return est_smooth(n,li,P,aux,i-1,j-1)
    if n%li[-1]==0:
        aux[i] +=1
        return est_smooth(n/li[-1],li,P, aux, i,j)
    li.pop()
    return est_smooth(n,li,P,aux ,i-1,j-1)

def quadratic_sieve(x,B=200,N=1000):
    rac = int(x**0.5)
    V = []
    Q = []
    racines = []
    if(rac**2 == x):
        return rac
    P = factor_base(x,B)
    fact = eratosthene(x,rac,rac+N,P)
    for i in range(N):
        aux =(rac+i)**2 - x
        aux2 = rac + i
        col = est_smooth(aux,fact[i],P, [0 for i in range(len(P))],len(P)-1,len(P)-1)
        if len(col)>0:
            Q.append(aux)
            racines.append(aux2)
            V.append(col)
    M = MatrixSpace(GF(2),len(V),len(V[0]))
    A = M(V)
    V2 = ker(A)
    l,c = V2.dimensions()
    for j in range(l):
        u = 1
        v = 1
        for i in range(c):
            if V2[j][i] :
                u = u*racines[i]
                v = v*Q[i]
        v = int(v**0.5)%x
        u = u%x
        if pgcd(u-v,x)!=x and pgcd(u-v,x)!=1 :
            return pgcd(u-v,x)
    return "echec"








