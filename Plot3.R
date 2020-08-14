df<-read.delim(file="household_power_consumption.txt",header=TRUE,sep=";")
df$dt<-paste(df$Date,df$Time,sep=" ")
df$dt<-strptime(x=df$dt,format = "%d/%m/%Y %H:%M:%S")
df<-subset(df,date(df$dt)=="2007-02-02"|date(df$dt)=="2007-02-01")
png(file="Plot3.png")
plot(x=df$dt,
     y=as.numeric(df$Sub_metering_1),
     col="black",
     main="",
     ylab="Energy sub metering",
     xlab="",
     type="l")
lines(x=df$dt,
      y=as.numeric(df$Sub_metering_2),
      col="red")
lines(x=df$dt,
      y=as.numeric(df$Sub_metering_3),
      col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)
dev.off()
