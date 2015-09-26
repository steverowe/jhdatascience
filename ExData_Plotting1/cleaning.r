library(dplyr)
library(lubridate)
library(readr)

#assumes the power consumption file is in the working directory
#original source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

power <- read_csv2("household_power_consumption.txt", na="?")

power <- filter(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

power <- mutate(power, date.time = dmy_hms(paste(Date, Time)), Date = dmy(Date), Time = hms(Time) )

