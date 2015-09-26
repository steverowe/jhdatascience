source("cleaning.r")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Global Active Power (kilowatts)

with(power, plot(Global_active_power~date.time, 
                 type="l",
                 ylab="Global Active Power (kilowatts)",
                 xlab=""
))

# Voltage

with(power, plot(Voltage~date.time, 
                 type="l",
                 xlab="datetime"
))

# Sub_metering

with(power, {
  plot(Sub_metering_1~date.time, 
         type="l",
         ylab="Energy sub metering",
         xlab=""
         )
  points(Sub_metering_2~date.time,
         type="l",
         col="red"
         )
  points(Sub_metering_3~date.time,
         type="l",
         col="blue"
  )
  legend("topright",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"),
         lty=c(1,1,1) # lines
         )
})

# Global Reactive Power

with(power, plot(Global_reactive_power~date.time, 
                 type="l",
                 xlab="datetime"
))
     
dev.off()