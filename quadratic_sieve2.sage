from time import time

N = 13290059

def racine(a, p):
    """
    Square root modulo prime number
    Solve the equation
        x^2 = a mod p
    and return list of x solution
    http://en.wikipedia.org/wiki/Tonelli-Shanks_algorithm
    this code comes from the following website, but it's noth the most important part of the algorithm, si i just copy pasted it
    https://codereview.stackexchange.com/questions/43210/tonelli-shanks-algorithm-implementation-of-prime-modular-square-root
    """
    a %= p

    # Simple case
    if a == 0:
        return [0]
    if p == 2:
        return [a]
    # Simple case

    if p % 4 == 3:
        x = power_mod(a, (p + 1)//4, p)
        return [x, p-x]

    # Factor p-1 on the form q * 2^s (with Q odd)
    q, s = p - 1, 0

    while q % 2 == 0:
        s += 1
        q //= 2
    # Select a z which is a quadratic non resudue modulo p
    z = 1
    while power_mod(z, (p-1)//2,p) != p-1:
        z += 1
    c = power_mod(z, q, p)

    # Search for a solution
    x = power_mod(a, (q + 1)//2, p)

    t = power_mod(a, q, p)

    m = s
    while t != 1:
        # Find the lowest i such that t^(2^i) = 1
        i, e = 0, 2
        for i in xrange(1, m):
            if power_mod(t, e, p) == 1:
                break
            e *= 2

        # Update next value to iterate
        b = power_mod(c, 2**(m - i - 1), p)
        x = (x * b) % p
        t = (t * b * b) % p
        c = (b * b) % p
        m = i

    return [x, p-x]

#list of prime numbers
n = 10**6
premier = [i for i in range(2,n) if ZZ(i).is_prime()]

#Sieve to compute prime factors of f(x) where f(x) = x**2-N%P for x in [I,J]
def eratosthene(N,I,J,P):
    L = [k*k-N for k in range(I,J+1)]
    factors = [[0 for i in range(len(P))]for k in range(J-I+1)]
    for k in range(len(P)):
        p = P[k]
        ip = I%p
        R = racine(N,p) #R {x,y} where (x**2-N)%p =0 and (y**2-N)%p=0
        for j in range(len(R)):
            rp = R[j]%p
            if rp >= ip :
                i = I + (rp - ip)
            else :
                i = I + p + (rp - ip)
            while i<=J:
                while L[i-I]%p==0:
                    L[i-I] = L[i-I]/p
                    factors[i-I][k] +=1
                i += p
    L2 = [i+I for i in range(J-I+1) if L[i]<P[-1]**2]
    cof = [L[i] for i in range(J-I+1) if L[i]<P[-1]**2]
    Q = [L2[i]*L2[i] - N for i in range(len(L2)) ]
    factors2 = [factors[i] for i in range(J-I+1) if L[i]<P[-1]**2]
    i = 0
    while i< len(cof):
        if cof[i] !=1:
            for j in range(i+1,len(cof)):
                if(cof[j] == cof[i]):
                    cof.pop(j)
                    a =L2.pop(j)
                    cof[i]=1
                    Q[i] = Q[i]*Q[j]
                    Q.pop(j)

                    L2[i] *=a
                    factors2[i] = [factors2[i][k]+factors2[j][k] for k in range(len(P))]
                    factors2.pop(j)
                    break
        i+=1
    L2 = [L2[i] for i in range(len(cof)) if cof[i]==1]
    Q = [Q[i] for i in range(len(cof)) if cof[i]==1]

    factors2 = [factors2[i] for i in range(len(cof)) if cof[i]==1]
    return L2,factors2, Q # L2[i]**2-N is a smooth number and factors[i] is his factorisation

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

def quadratic_sieve(x,B,N):
    rac = int(x**0.5)
    V = []
    Q = []
    racines = []
    if(rac**2 == x):
        return rac
    P = factor_base(x,B)
    racines, V, Q = eratosthene(x,rac+1,rac+N,P)
    print len(V)
    M = MatrixSpace(GF(2),len(V),len(V[0]))
    V = M(V)
    V = ker(V)

    l,c = V.dimensions()
    print "nombre de vecteur du ker :", l
    for j in range(l):
        u = 1
        v = 1
        for i in range(c):
            if V[j][i]==1 :
                u = u*racines[i]
                v = v*Q[i]
                
        v = int(sqrt(v))
        if gcd(u-v,x)!=x and gcd(u-v,x)!=1 :
            return gcd(u-v,x), l
    return -1, l

def fact(x,B,N):
    t0 = int(time())
    if iterativ(x)==-1:
        res, l = quadratic_sieve(x,B,N)
        t1 = int(time())
        print "temps de calcul :", t1-t0, "secondes"
        return res, l, t1-t0
    else :
        return iterativ(x)

def F(n):
    return 2**(2**n) +1




def max(M):
    a = 0
    b = 0
    n = len(M)
    for i in range(n):
        for j in range(n):
            if M[i][j]>M[a][b]:
                a = i
                b = j
                
Res = [[[0for i in range(100)]for j in range(100)]for k in range(6)]
def tonight():
    for i in range(10,16):
        for j in range(100):
            for k in range(100):
                n = previous_prime(10**i)*next_prime(10**i)
                res, l, t = fact(n, j*100,k*5000)
                if res != -1 :
                    Res[i][j][k] = l/t
                else:
                    Res[i][j][k] = -1
    print Res