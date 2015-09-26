source("cleaning.r")

png("plot2.png", width=480, height=480)

with(power, plot(Global_active_power~date.time, 
                 type="l",
                 ylab="Global Active Power (kilowatts)",
                 xlab=""
                 ))
     
dev.off()