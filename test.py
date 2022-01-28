def init(l,c,val) :
    L=[]
    for i in range(l) :
        L1 = []
        for j in range(c) :
            L1.append(val)
        L.append(L1)
    return L

def str2intlist(s) :
    L,string = [],""
    i=0
    string_1 = ""
    while i<len(s) and string_1 != "\\n" :
        if s[i] != " " and s[i]!='\\' and s[i]!='n' :
            string = string + s[i]
        elif s[i]=='\\' :
            string_1 += s[i]
        elif string_1 == "\\" :
            if s[i]=='n' :
                string_1 += s[i]
            else :
                raise Exception ("after \\ it has to be 'n'")   
        else:
            L.append(int(string))
            string = ""
        i+=1
    if s[i-1]!='n' :
        L.append(int(s[i-1]))
    return L

def load(filename) :
    f = open(filename)
    L = f.readlines()
    M = []
    for x in L :
        li = str2intlist(x)
        M.append(li)
    f.close()
    return M

def add_matrices(A,B) :
    if len(A)!=len(B) :
        raise Exception ("Les matrices ne sont pas de meme taille.")
    else :
        for i in range(len(A)) :
            if len(A[i])!=len(B[i]) :
                raise Exception ("Les matrices ne sont pas de meme taille.")
            else :
                for j in range(len(A[i])) :
                    A[i][j] += B[i][j]
        return A

def mult_matrices(A,B) :
    if len(A[0])!=len(B) :
        raise Exception("error")
    M = []
    p,n = len(B[0]),len(B)
    for i in range(len(A)) :
        line = []
        for j in range(p) :
            s = 0
            for k in range(n) :
                s+=A[i][k]*B[k][j]
            line.append(s)
        M.append(line)
    return M

def gaplist(L) :
    maxi, mini = L[0], L[0]
    for i in range(1,len(L)) :
        maxi,mini = max(maxi,L[i]),min(mini,L[i]) 
    return maxi-mini

def maxgap(M) :
    maxgap = gaplist(M[0])
    for i in range(1,len(M)) :
        maxgap = max(maxgap,gaplist(M[i]))
    return maxgap
print(maxgap([[1,10,3],[-1,0,1,8],[10,9,14,1]]))





"""
resultat = int

# 1)
resultat = c*nbr
print (resultat)

def f(c):
    resultat2 = c*nbr
    return resultat2
print(f(c))
"""
# 2)
"""
resultat = int#(input("saisir un nombre : "))
"""



