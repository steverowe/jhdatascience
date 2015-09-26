library(dplyr)
library(readr)

#StormData <- read_csv("C:/Users/strowe/Desktop/jhds/RepData_Project2/repdata-data-StormData.csv")
StormData <- read.csv("C:/Users/strowe/Desktop/jhds/RepData_Project2/repdata-data-StormData.csv", stringsAsFactors = F)

StormData <- mutate(StormData, CROPDMGEXP = factor(CROPDMGEXP), PROPDMGEXP = factor(PROPDMGEXP))

# clean up evtype


# remove all non-damaging events
damage <- StormData %>% filter(FATALITIES != 0 | INJURIES != 0 | PROPDMG != 0 | CROPDMG != 0)

#remove items which are not events or are unidentifiable
damage <- damage %>% filter(EVTYPE !="?" & EVTYPE !="Other" & EVTYPE !="OTHER" & EVTYPE !="URBAN SMALL" & 
                            EVTYPE != "APACHE COUNTY" & EVTYPE != "HIGH" & EVTYPE != "TSTMW")

#consolidate events
damage <- mutate(damage, EVTYPE = ifelse(grepl("winter", EVTYPE, ignore.case=T), "Winter Weather", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("tornado|torndao|funnel|dustnado|dust devil|gustnado", EVTYPE, ignore.case=T), "Tornado", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("blizzard", EVTYPE, ignore.case=T), "Blizzard", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("winter storm|wintry", EVTYPE, ignore.case=T), "Winter Storm", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("thunder", EVTYPE, ignore.case=T), "Thunder Storm", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("wind", EVTYPE, ignore.case=T), "Wind", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("tropical", EVTYPE, ignore.case=T), "Tropical Storm", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("wind", EVTYPE, ignore.case=T), "High Wind", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("flood|high water|fld|rising water", EVTYPE, ignore.case=T), "Flooding", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("high tide|surge|swell|wave|surf", EVTYPE, ignore.case=T), "Storm Surge/Tide", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("snow", EVTYPE, ignore.case=T), "Snow", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("freezing rain", EVTYPE, ignore.case=T), "Freezing Rain", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("rain|precip|burst|shower", EVTYPE, ignore.case=T), "Rain", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("cold|hypothermia|low temp|freeze|exposure", EVTYPE, ignore.case=T), "Cold", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("fire", EVTYPE, ignore.case=T), "Wildfire", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("hail", EVTYPE, ignore.case=T), "Hail", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("heat|warm", EVTYPE, ignore.case=T), "Excessive Heat", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("ice|icy|frost|freezing drizzle|sleet", EVTYPE, ignore.case=T), "Ice", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("landslide|mud|landslump", EVTYPE, ignore.case=T), "Landslide", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("hurricane|typhoon|tsunami", EVTYPE, ignore.case=T), "Hurricane", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("fog", EVTYPE, ignore.case=T), "Fog", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("avalanche|rock slide|avalance", EVTYPE, ignore.case=T), "Avalanche", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("lightning|lighting|ligntning", EVTYPE, ignore.case=T), "Lightning", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("drown|Marine accident|marine mishap|rough seas|heavy seas", EVTYPE, ignore.case=T), "Marine Accident", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("coastal.*storm", EVTYPE, ignore.case=T), "Marine Accident", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("lightning", EVTYPE, ignore.case=T), "Lightning", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("waterspout", EVTYPE, ignore.case=T), "Waterspout", EVTYPE))
damage <- mutate(damage, EVTYPE = ifelse(grepl("rip", EVTYPE, ignore.case=T), "Rip Current", EVTYPE))


# fix economic costs
damage$CROPDMG[damage$CROPDMGEXP=="B"]<- damage$CROPDMG[damage$CROPDMGEXP=="B"]*1000000000
damage$CROPDMG[damage$CROPDMGEXP=="m"]<- damage$CROPDMG[damage$CROPDMGEXP=="m"]*1000000
damage$CROPDMG[damage$CROPDMGEXP=="M"]<- damage$CROPDMG[damage$CROPDMGEXP=="M"]*1000000
damage$CROPDMG[damage$CROPDMGEXP=="k"]<- damage$CROPDMG[damage$CROPDMGEXP=="k"]*1000
damage$CROPDMG[damage$CROPDMGEXP=="K"]<- damage$CROPDMG[damage$CROPDMGEXP=="K"]*1000
damage$CROPDMG[damage$CROPDMGEXP=="h"]<- damage$CROPDMG[damage$CROPDMGEXP=="h"]*100
damage$CROPDMG[damage$CROPDMGEXP=="H"]<- damage$CROPDMG[damage$CROPDMGEXP=="H"]*100


damage$PROPDMG[damage$PROPDMGEXP=="B"]<- damage$PROPDMG[damage$PROPDMGEXP=="B"]*1000000000
damage$PROPDMG[damage$PROPDMGEXP=="m"]<- damage$PROPDMG[damage$PROPDMGEXP=="m"]*1000000
damage$PROPDMG[damage$PROPDMGEXP=="M"]<- damage$PROPDMG[damage$PROPDMGEXP=="M"]*1000000
damage$PROPDMG[damage$PROPDMGEXP=="k"]<- damage$PROPDMG[damage$PROPDMGEXP=="k"]*1000
damage$PROPDMG[damage$PROPDMGEXP=="K"]<- damage$PROPDMG[damage$PROPDMGEXP=="K"]*1000
damage$PROPDMG[damage$PROPDMGEXP=="h"]<- damage$PROPDMG[damage$PROPDMGEXP=="h"]*100
damage$PROPDMG[damage$PROPDMGEXP=="H"]<- damage$PROPDMG[damage$PROPDMGEXP=="H"]*100


library(ggplot2)
library(tidyr)
popdmg <- damage %>% filter(FATALITIES != 0 | INJURIES != 0) %>% gather(type, count, FATALITIES:INJURIES) %>%
  group_by(EVTYPE, type) %>% summarize (total = sum(count))
ggplot(data=popdmg, aes(x=EVTYPE, y=total, fill=type)) + geom_bar(stat="identity") + coord_flip()


econdmg <- damage %>% filter(CROPDMG != 0 | PROPDMG != 0) 
econdmg <- gather(econdmg, type, count, c(CROPDMG, PROPDMG)) %>% group_by(EVTYPE, type) %>% summarize (total = sum(count))

ggplot(data=econdmg, aes(x=EVTYPE, y=total, fill=type)) + geom_bar(stat="identity") + coord_flip()


unique(damage$EVTYPE)

table(damage$EVTYPE)

levels(damage$EVTYPE)

search <- function(text) {
  unique(damage$EVTYPE)[grep(text,unique(damage$EVTYPE), ignore.case=T)]
}


# remove all summary events?
