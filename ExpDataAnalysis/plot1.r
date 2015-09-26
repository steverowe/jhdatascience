# draw a plot comparing total U.S. emissions between 1999 and 2008

library(dplyr)

#load the files (assumes files in working directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- left_join(NEI, SCC, by="SCC") %>% mutate(SCC = factor(SCC), Pollutant=factor(Pollutant), type = factor(type))

# draw the plot

yearly = pm25 %>% group_by(year) %>% summarize(total = sum(Emissions))
png("plot1.png", width = 400, height = 300)
with(yearly, plot(year, total, type="b", main="Total emissions in U.S."))
dev.off()
