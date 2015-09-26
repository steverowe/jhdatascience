summary(pml.training)

myfun <- function(x){sum(is.na(x))}
summarise_each(pml.training, funs(sum(is.na(.))))
