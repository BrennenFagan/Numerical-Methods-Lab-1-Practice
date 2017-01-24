#Lab 2:
#Recreating function from previous Lab
function_circle <- function(NumberOfPoints, Radius, Colors = "default"){
  t <- (1:NumberOfPoints)/NumberOfPoints
  x <- sin(2*pi*t)
  y <- cos(2*pi*t)
  A <- list(x, y)
  par(pty="s")
  coloring <- rgb(0,0,0)
  if(Colors == "RG_Pretty"){
    coloring <- rgb(x*.5+.5,y*.5+.5,0)
  }else if(Colors == "GB_Pretty"){
    coloring <- rgb(0,x*.5+.5,y*.5+.5)
  }else if(Colors == "RB_Pretty"){
    coloring <- rgb(x*.5+.5,0,y*.5+.5,0)
  }
  A <- lapply(A,"*",Radius)
  plot(A[[1]], A[[2]], main="A circle", xlab="X", ylab="Y", col = coloring)
  par(pty="m")
  return (A)
}

function_circle(100,2, "GB_Pretty")

coords <- function_circle(7,3)
par(pty="s")
plot(coords[[1]], coords[[2]], main = "A septagon", xlab = "X", ylab="Y", type = "l")
lines(c(coords[[1]][7], coords[[1]][1]), c(coords[[2]][7], coords[[2]][1]))

function_ngon <- function(n, Radius){
  coords <- function_circle(n, Radius)
  par(pty="s")
  plot(coords[[1]], coords[[2]], main = toString(paste("A", n, "-gon")), xlab = "X", ylab="Y", type = "l")
  lines(c(tail(coords[[1]],1), coords[[1]][1]), c(tail(coords[[2]],1), coords[[2]][1]))
  par(pty="m")
  return (coords)
}

function_ngon(50, 5)

function_calc_shifted_circle <- function(NumberOfPoints, Radius#, Colors = "default"
                                         ){
  t <- (1:NumberOfPoints)/NumberOfPoints
  x <- sin(2*pi*t)
  y <- cos(2*pi*t)
  A <- list(x, y)
  #par(pty="s")
  # coloring <- rgb(0,0,0)
  # if(Colors == "RG_Pretty"){
  #   coloring <- rgb(x*.5+.5,y*.5+.5,0)
  # }else if(Colors == "GB_Pretty"){
  #   coloring <- rgb(0,x*.5+.5,y*.5+.5)
  # }else if(Colors == "RB_Pretty"){
  #   coloring <- rgb(x*.5+.5,0,y*.5+.5,0)
  # }
  A <- lapply(A,"*",Radius)
  #plot(A[[1]] + SHIFT, A[[2]], main="A circle", xlab="X", ylab="Y", col = coloring)
  #par(pty="m")
  return (A <- list(x = A[[1]]+ SHIFT, y = A[[2]]))
}

SHIFT <- 1
par(pty = "s")
plot(function_calc_shifted_circle(100, 2)$x,function_calc_shifted_circle(100, 2)$y)
SHIFT <- 2
points(function_calc_shifted_circle(100, 1)$x,function_calc_shifted_circle(100, 1)$y)
par(pty="m")