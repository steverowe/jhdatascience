# draw a plot comparing total Baltimore vehicle emissions between 1999 and 2008

library(dplyr)
library(ggplot2)

#load the files (assumes files in working directory)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- left_join(NEI, SCC, by="SCC") %>% mutate(SCC = factor(SCC), Pollutant=factor(Pollutant), type = factor(type),
                                                 fips = factor(fips))

# Motor Vehicle is defined as all on or off highway vehicles/engines in SCC.Level.Two

vehicles <- pm25 %>% filter(grepl("Highway", SCC.Level.Two, ignore.case = T))
yearly = vehicles %>% group_by(year) %>% filter(fips == "24510")%>% summarize(total = sum(Emissions))
png("plot5.png", width = 400, height = 300)
qplot(year, total, data=yearly, geom="line", main="Total vehicle emissions in Baltimore")
dev.off()
