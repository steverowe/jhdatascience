# draw a plot comparing total U.S. emissions between 1999 and 2008

library(dplyr)
library(ggplot2)

#load the files (assumes files in working directory)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- left_join(NEI, SCC, by="SCC") %>% mutate(SCC = factor(SCC), Pollutant=factor(Pollutant), type = factor(type),
                                                 fips = factor(fips))

# Coal combustion is defined as anything using combustion in SCC.Level.One and coal in SCC.Level.Three or Four

coal <- pm25 %>% filter(grepl("Combustion", SCC.Level.One)) %>% filter(grepl("Coal", SCC.Level.Three) | grepl("Coal", SCC.Level.Four))
yearly <- coal %>% group_by(year) %>% summarize(total = sum(Emissions))
png("plot4.png", width = 400, height = 300)
qplot(year, total, data=yearly, geom="line", main="Total coal emissions in U.S.")
dev.off()
