library(MASS)
library(RColorBrewer)
library(dplyr)
library(shiny)

vars <- c("mpg",  "cyl",  "disp", "hp",   "drat", "wt",   "qsec", "vs",   "am",   "gear", "carb")

cars <- select(mtcars, one_of(vars), -one_of(c("drat")))
cars <- filter(cars, mpg > 20 & mpg < 25)

parcoord(cars,col=brewer.pal(12, "Paired"), var.label=T)

library(shinyapps)
shinyapps::deployApp()

library(devtools)
install_github('slidify', 'ramnathv')
install_github('slidifyLibraries', 'ramnathv')
library(slidify)
author("mpgdeck")

slidify("index.Rmd")

browseURL("index.html") 

publish(title = 'mpgdeck', 'mpgdeck/index.html', host = 'rpubs')
publish(user = "steverowe", repo = "mpgparallel")
