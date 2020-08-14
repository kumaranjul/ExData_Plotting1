library(lubridate)
df<-read.delim(file="household_power_consumption.txt",header=TRUE,sep=";")
df$dt<-paste(df$Date,df$Time,sep=" ")
df$dt<-strptime(x=df$dt,format = "%d/%m/%Y %H:%M:%S")
df<-subset(df,date(df$dt)=="2007-02-02"|date(df$dt)=="2007-02-01")
png(file="Plot1.png")
hist(as.numeric(df$Global_active_power),
     col="orange",
     xlab = "Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()
