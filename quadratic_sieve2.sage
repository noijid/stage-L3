def racine(N,p):
    """ return the roots of f(x)%p =0 where f(x) = x**2 - N"""
    t = N%p
    for i in range(1,p):
        if (i*i)%p==t:
            return [i,p-i]
    return []

#list of prime numbers
n = 10**6
premier = [i for i in range(2,n) if ZZ(i).is_prime()]

#Sieve to compute prime factors of f(x) where f(x) = x**2-N%P for x in [I,J]
def eratosthene(N,I,J,P):
    L = [k*k-N for k in range(I,J+1)]
    factors = [[0 for i in range(len(P))]for k in range(J-I+1)]
    for k in range(len(P)):
        p = P[k]
        R = racine(N,p) #R contien x et y avec (x**2-N)%p =0 et (y**2-N)%p=0
        for j in range(len(R)):
            if R[j]%p >= I%p :
                i = I + (R[j]%p - I%p)
            else :
                i = I + p + (R[j]%p - I%p)
            while i<=J:
                while L[i-I]%p==0:
                    L[i-I] = L[i-I]/p
                    factors[i-I][k] +=1
                i += p
    L2 = [i+I for i in range(J-I+1) if L[i]==1]
    factors2 = [factors[i] for i in range(J-I+1) if L[i]==1]
    return L2,factors2 # L2[i] is a smooth number and factors[i] is his factorisation

def ker(V):
    """return a basis of ker V"""
    A = matrix(V)
    K = A.kernel().basis_matrix()
    return  K

def factor_base(N,B):
    i = 1
    res = [2]
    while(premier[i]<B):
        p = premier[i]
        a = power_mod(N,(p-1)//2,p)
        if a==1:
            res.append(premier[i])
        i +=1
    return res

def iterativ(x):
    r = int(sqrt(x))
    n = int(log(x))
    i = 2
    while i<=min(r,n):
        if x%i==0 :
            return i
        i +=1
    return -1

def quadratic_sieve(x):
    B = 2*int(exp(.5*sqrt(log(x)*log(log(x))))) +2
    N = 16*int(exp(sqrt(ln(x)/ln(ln(x))))) * B

    print(N,B)
    rac = int(x**0.5)
    V = []
    Q = []
    racines = []
    if(rac**2 == x):
        return rac
    P = factor_base(x,B)
    fact, factors = eratosthene(x,rac,rac+N,P)
    for i in range(len(fact)) :
        aux = fact[i]
        decomp = factors[i]
        Q.append(aux*aux - x)
        racines.append(aux)
        V.append(decomp)
#        print(aux, decomp, factor(fact[i]**2-x))

    M = MatrixSpace(GF(2),len(V),len(V[0]))
    A = M(V)
    V2 = ker(A)
    l,c = V2.dimensions()
#    for i in range(len(Q)):
#        print (Q[i]-racines[i]*racines[i])%x
    for j in range(l):
        u = 1
        v = 1
        for i in range(c):
            if V2[j][i]==1 :
                u = u*racines[i]*racines[i]
                v = v*Q[i]
        v = int(sqrt(v))
        u = int(sqrt(u))
        print((u*u-v*v)%x)
        if gcd(u-v,x)!=x and gcd(u-v,x)!=1 :
            return gcd(u-v,x)
    return -1

def fact(x):
    if iterativ(x)==-1:
        return quadratic_sieve(x)
    else :
        return iterativ(x)






