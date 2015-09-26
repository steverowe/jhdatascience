# draw a plot comparing total Baltimore vehicle emissions between 1999 and 2008

library(dplyr)
library(ggplot2)

#load the files (assumes files in working directory)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- left_join(NEI, SCC, by="SCC") %>% mutate(SCC = factor(SCC), Pollutant=factor(Pollutant), type = factor(type),
                                                 fips = factor(fips))

# Motor Vehicle is defined as all on or off highway vehicles/engines in SCC.Level.Two
# change over time is the percentage increase or reduction from the initial position of each city

vehicles <- pm25 %>% filter(grepl("Highway", SCC.Level.Two, ignore.case = T)) 
cities <- vehicles %>% filter(fips == "24510" | fips == "06037") %>% mutate(city = ifelse(fips == "24510", "Baltimore", "Los Angeles"))
yearly <- cities %>% group_by(city, year) %>% summarize(total = sum(Emissions))
deltas <- yearly %>% group_by(city) %>% mutate(delta = total/total[1] - 1)
png("plot6.png", width = 400, height = 300)
qplot(year, delta, data=deltas, col=city, geom="line", main="Relative Vehicle Emissions in Baltimore and L.A.")
dev.off()
