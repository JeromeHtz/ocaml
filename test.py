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
print(load("C:/Users/rejom/Documents/test.txt"))

def add_matrices(A,B) :
    #liste1,liste2 = [],[]
    if len(A)!=len(B) :
        raise Exception ("ceci n'est pas une matrice")
    else :
        for i in range(len(A)) :
            if len(A[i])!=len(B[i]) :
                raise Exception ("ceci n'est pas une matrice")
            else :
                for j in range(len(A[i])) :
                    A[i][j] += B[i][j]
        return A

def mult_matrices(A,B) :
    liste = []
    b = 0
    for i in range(len(A)) :
        a = 0
        res = 0
        res1 = 0
        for j in range(len(B)) :
            res += A[i][j]*B[a][b]
            if i==0 :
                res1 += A[i+1][j]*B[a][b]
            a+=1
        b+=1
        liste.append(res1)
    return liste






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



