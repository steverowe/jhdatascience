library(MASS)
library(RColorBrewer)
library(dplyr)

vars <- c("mpg",  "cyl",  "disp", "hp",   "drat", "wt",   "qsec", "vs",   "am",   "gear", "carb")

cars <- select(mtcars, one_of(vars), -one_of(c("drat")))
cars <- filter(cars, mpg > 20 & mpg < 25)

parcoord(cars,col=brewer.pal(12, "Paired"), var.label=T)
