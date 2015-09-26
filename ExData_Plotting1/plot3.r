source("cleaning.r")

png("plot3.png", width=480, height=480)

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
     
dev.off()