n <- 10000 
means <- cumsum(rnorm(n))/(1:n) 
library(ggplot2) 
g <- ggplot(data.frame(x = 1:n, y = means), aes(x = x, y = y)) 
g <- g + geom_hline(yintercept = 0) + geom_line(size = 2) 
g <- g + labs(x = "Number of obs", y = "Cumulative mean") 
g


nosim <- 1000
cfunc <- function(x, n) 2 * sqrt(n) * (mean(x) - 0.5) 
dat <- data.frame(
  x = c(apply(matrix(sample(0:1, nosim * 10, replace = TRUE), 
                     nosim), 1, cfunc, 10),
        apply(matrix(sample(0:1, nosim * 20, replace = TRUE), 
                     nosim), 1, cfunc, 20),
        apply(matrix(sample(0:1, nosim * 30, replace = TRUE), 
                     nosim), 1, cfunc, 30)
  ),
  size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)

hist(runif(1000))

# the distribution of 1000 averages of 40 random uniforms

mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)


tmp = NULL
for (i in 1:40) tmp$fourty <- c(tmp$fourty, mean(rexp(40, lambda)))
for (i in 1:400) tmp$fourhundred <- c(tmp$fourty, mean(rexp(40, lambda)))
for (i in 1:1000) tmp$thousand <- c(tmp$fourty, mean(rexp(40, lambda)))
ggplot(tmp, aes(tmp$fourty)) + geom_histogram((aes(y="..density.."))) + geom_density(alpha=.2, fill="#FF6666")                                


#exponential
lambda = 0.2
nosim = 1000

exps <- rexp(40, lambda)
hist(exps)
mean(exps)
sd(exps)

mydata = data.frame(means =1:nosim)
for (i in 1:nosim) mydata$means[i]= mean(rexp(40, lambda))
hist(mydata$means)

ggplot(mydata, aes(x=means)) + 
  geom_histogram(aes(y = ..density..), binwidth=.5, color="black", fill="white") + 
  stat_function(fun=dnorm, color="blue", args=list(mean=1/lambda, sd=sd(mydata$means))) + 
  geom_vline(aes(xintercept=1/lambda), color="red", linetype="dashed", size=1)

mean(mydata$means)
