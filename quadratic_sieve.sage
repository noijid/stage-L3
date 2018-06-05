def pgcd(a,b):
    if a<0 :
        return pgcd(-a,b)
    if a == 0 :
        return b
    if b<a :
        return pgcd(b,a)
    return pgcd(b%a,a)
    
def racine(f):
    """ renvoie la liste des racines de la fonction f"""
    return ()

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
n = 10**6
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
def eratosthene(f,I,J,P):
    L = [[]for k in range(J+1)]
    for p in P:
        def g(x):
            return f(x)%p
        R = racines(g)
        for j in range(len(R)):
            if R[j]%p >= I%p :
                i = I + (R[j]%p - I%p)
            else :
                i = I + p + (R[j]%p - I%p)
            while i<=J:
                L[i].append(p)
                i += p
    return L # L[i] contient les facteurs dans P de f(i)
    
def est_liee(V):
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

def quadratic_sieve(x,B=200,N=10):
    rac = int(x**0.5)
    V = []
    Q = []
    if(rac**2 == x):
        return rac
    u = 1
    v = 1
    racines = []
    P = factor_base(x,B)
    V2 = est_liee(V)
    l,c = V2.dimensions()
    while(l<N):
        l,c = V2.dimensions()
        a = len(V)
        V2 = est_liee(V)
        rac +=1
        vect,reussi = decomp_prem(rac**2-x,P)
        if reussi == 1:
            V.append(vect)
            Q.append(rac*rac - x)
            racines.append(rac)
            V2 = est_liee(V)
    l,c = V2.dimensions()
    for j in range(l):
        u = 1
        v = 1
        for i in range(c):
            u = u*racines[i]**V2[j][i] %x
            v = v*(Q[i]**V2[j][i])
        v = int(v**0.5)
        if pgcd(u-v,x)!=x and pgcd(u-v,x)!=1 :
            return pgcd(u-v,x)
    return 0
        
        
        
        
        
        
