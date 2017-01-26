#Lab 3:
#ROD
N <- 30            #Number of Divisions Of Rod
L <- 1             #Length of Rod
h <- L/N           #Segments Lengths of Rod
x <- h*(1:(N-1))   #Segments of Rod
w <- 2*sin(2*pi*x) #Initial Heat Distribution at segments

#TIME
T <- .1            #Length of Time
M <- 200           #Number of Segments of Time
tau <- T/M         #Length of Time Segments
t <- tau*(0:M)     #Time Segments

#HEAT DISPERSION PARAMETER
K <- 1

#Resultant EVALUATION PARAMETER
gamma <- K*tau/(h^2)

#Time Step Matrix
A <- diag(1-2*gamma, N-1)
for (k in 1:(N-2)){
  A[k, k+1] <- gamma -> A[k+1,k]
}