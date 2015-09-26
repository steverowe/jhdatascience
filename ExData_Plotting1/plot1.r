source("cleaning.r")

png("plot1.png", width=480, height=480)

with(power, hist(Global_active_power,
                 breaks=16,
                 main="Global Active Power",
                 xlab="Global Active Power (kilowatts)",
                 col="red",
                 xlim=c(0,6),
                 ylim=c(0,1200)
                 ))
dev.off()