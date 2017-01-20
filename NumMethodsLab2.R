#Lab 2:
#Recreating function from previous Lab
function_circle <- function(NumberOfPoints, Radius, Colors = "default"){
  t <- (1:NumberOfPoints)/NumberOfPoints
  A <- list(x = Radius*sin(2*pi*t), y = Radius*cos(2*pi*t))
  par(pty="s")
  coloring <- rgb(0,0,0)
  if(Colors == "RG_Pretty"){
    coloring <- rgb(x*.5+.5,y*.5+.5,0)
  }else if(Colors == "GB_Pretty"){
    coloring <- rgb(0,x*.5+.5,y*.5+.5)
  }else if(Colors == "RB_Pretty"){
    coloring <- rgb(x*.5+.5,0,y*.5+.5,0)
  }
  plot(x, y, main="A circle", xlab="X", ylab="Y", col = coloring)
}

function_circle(100,2, "GB_Pretty")
