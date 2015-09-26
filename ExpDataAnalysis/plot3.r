# draw a plot comparing total Baltimore emissions between 1999 and 2008

library(dplyr)
library(ggplot2)

#load the files (assumes files in working directory)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- left_join(NEI, SCC, by="SCC") %>% mutate(SCC = factor(SCC), Pollutant=factor(Pollutant), type = factor(type),
                                                 fips = factor(fips))

# draw the plot

yearly = pm25 %>% group_by(type, year) %>% filter(fips == "24510")%>% summarize(total = sum(Emissions))
png("plot3.png", width = 400, height = 300)
qplot(year, total, data=yearly, col=type, geom="line", main="Total emissions in Baltimore, by type")
dev.off()
