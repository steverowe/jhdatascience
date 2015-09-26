library(dplyr)
setwd("C:/Users/strowe/onedrive/git/coursera/ExpDataAnalysis/exdata-data-NEI_data")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25 <- left_join(NEI, SCC, by="SCC") %>% mutate(SCC = factor(SCC), Pollutant=factor(Pollutant), type = factor(type))

