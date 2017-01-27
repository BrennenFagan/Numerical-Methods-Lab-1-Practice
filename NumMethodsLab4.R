#Lab 4:
forwardDifference <- function(f=function(x) 0, 
                              u0=function(x) 2*sin(2*pi*x), 
                              K=1, L=1, N=30, T=0.1, M=200) {
  # set up space grid
  h <- L/N
  x <- h*(1:(N-1))
  
  # set up time grid
  tau <- T/M
  t <- tau*(0:M)
  
  # set up vectors with initial condition and inhomogenous term
  w <- u0(x)
  F <- f(x)
  
  # Set up evolution matrix
  gamma <- K*tau/(h^2)
  A <- diag(1-2*gamma, N-1)
  for (k in 1:(N-2)) {
    A[k,k+1] <- gamma
    A[k+1,k] <- gamma
  }
  
  Temperature <- matrix(0, N-1, M+1)  # Matrix to hold the solution
  Temperature[ , 1] <- w  # Initial value
  # Loop over time steps
  for (j in 1:M) {
    w <- A %*% w + tau * F
    Temperature[ , j+1] <- w
  }
  
  # Return a list consisting of time grid, x grid and solution
  return(list(x=x, t=t, w=Temperature))
}

sol <- forwardDifference()
require("plot3Drgl")

persp3D(sol$x, sol$t, sol$w,
        xlab="x", ylab="t", zlab="w",
        ticktype="detailed", nticks=4)
plotrgl(smooth=TRUE, lighting = TRUE)


sol <- forwardDifference(f=function(x) {-25*sin(3*pi*x)},
                         u0=function(x) {-1.5*sin(2*pi*x)},
                         T=0.2, M=600
)
persp3D(sol$x, sol$t, sol$w,
        xlab="x", ylab="t", zlab="w",
        ticktype="detailed", nticks=4)
plotrgl(smooth=TRUE, lighting = TRUE)
