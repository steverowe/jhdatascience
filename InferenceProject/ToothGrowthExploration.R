data("ToothGrowth")
library("dplyr")
library("ggplot2")
head(ToothGrowth)
table(ToothGrowth$supp, ToothGrowth$dose)
hist(ToothGrowth$len)

ToothGrowth <- group_by(ToothGrowth, supp, dose)

summarize(ToothGrowth, avglen = mean(len))

#histograms of each
g <- ggplot(ToothGrowth, aes(len)) + 
  geom_histogram(binwidth=3) + 
  facet_grid(. ~ supp + dose) +
  theme_bw() + 
  ggtitle("Compmaring Vitamin C Treatments") + 
  xlab("Tooth Length")
g

x <- group_by(ToothGrowth, supp) %>% select(len = len)


x <- split(ToothGrowth, ToothGrowth$supp)
split(x$OJ, x$OJ$dose)
split(x$VC, x$VC$dose)

trials = NULL
for(i in split(ToothGrowth, ToothGrowth$supp)) 
  trials <- c(trials, split(i, i$dose))

# compare drugs across doses
for(i in split(ToothGrowth, ToothGrowth$dose)) 
{
  tmp <- split(i, i$supp)
  print(i[1,]$dose)
  #cat(i[1,]$dose, t.test(tmp[[1]]$len, tmp[[2]]$len)$p.value)
  print(t.test(tmp[[1]]$len, tmp[[2]]$len)$p.value)
}

t.test(trials[[1]]$len, trials[[4]]$len)$p.value

library(tidyr)
library(dplyr)
myDF %>% group_by(Group) %>% mutate(rowname=1:n())%>% 
    spread(Group, X) %>% 
    group_by(Name) %>%
    do(b = t.test(.$control, .$treatment)) %>%  
    mutate(
      treatment = round(b[['estimate']][[2]], digits = 4),
      control = round(b[['estimate']][[1]], digits = 4),
      CI = paste0("(", paste(b[['conf.int']], collapse=", "), ")"),
      pvalue = b[['p.value']]
    )

x <- ToothGrowth %>% group_by(dose) %>% spread(dose, supp)

for(i in split(ToothGrowth, ToothGrowth$supp)) 
{
  tmp <- split(i, i$dose)
  print(levels(i[1,]$supp)[i[1,]$supp])
  print("0.5 vs 1.0")
  print(t.test(tmp[[1]]$len, tmp[[2]]$len)$p.value)
  print("1.0 vs 2.0")
  print(t.test(tmp[[2]]$len, tmp[[3]]$len)$p.value)
}

for(i in split(ToothGrowth, ToothGrowth$supp)) 
{
  tmp <- split(i, i$dose)
  cat(sprintf("Supplement: %s", i[1,]$supp))
  print(sprintf("p-value: %f", t.test(tmp[[1]]$len, tmp[[2]]$len)$p.value))
  print(sprintf("p-value: %f", t.test(tmp[[2]]$len, tmp[[3]]$len)$p.value))
}
