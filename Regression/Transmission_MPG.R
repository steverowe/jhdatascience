# Context
# 
# You work for Motor Trend, a magazine about the automobile industry. Looking at a data set of a collection of cars, they are interested in exploring the relationship between a set of variables and miles per gallon (MPG) (outcome). They are particularly interested in the following two questions:
#   
#   “Is an automatic or manual transmission better for MPG”
# "Quantify the MPG difference between automatic and manual transmissions"
# 
# Question
# 
# Take the mtcars data set and write up an analysis to answer their question using regression models and exploratory data analyses.
# 
# Your report must be:
#   
#   Written as a PDF printout of a compiled (using knitr) R markdown document.
# Brief. Roughly the equivalent of 2 pages or less for the main text. Supporting figures in an appendix can be included up to 5 total pages including the 2 for the main report. The appendix can only include figures.
# Include a first paragraph executive summary.

library(dplyr)
summary(lm(mpg~., data=mtcars))
#note that none of the p-values are < 0.05
summary(lm(mpg~am, data=mtcars))

summary(lm(mpg~., data=mtcars))
pairs(mtcars)

#nested modeling
fit1 <- lm(mpg~cyl, data=mtcars)
fit3 <- update(fit1, mpg~cyl+disp+hp)
fit5 <- update(fit1, mpg~cyl+disp+hp+drat+wt)
fit7 <- update(fit1, mpg~cyl+disp+hp+drat+wt+qsec+vs)
fit9 <- update(fit1, mpg~cyl+disp+hp+drat+wt+qsec+vs+am+gear)
fit10 <- update(fit1, mpg~cyl+disp+hp+drat+wt+qsec+vs+am+gear+carb)
anova(fit1, fit3, fit5, fit7, fit9, fit10)

# I think this does the same thing
fit <- lm(mpg~., data=mtcars)
anova(fit)
library(car)
vif(fit)

cor(mtcars, use="complete.obs", method="kendall") 
cor(mtcars)

library(Hmisc)
rcorr(as.matrix(mtcars)) 

fit.final <- lm(mpg~cyl+disp+wt+am, data=mtcars)
summary(fit.final)


fit.bwd <- step(fit, direction = "backward", trace=FALSE ) 
summary(fit.bwd)

lm(mpg~., data=mtcars)$coef
sqrt(vif(fit.bwd))
