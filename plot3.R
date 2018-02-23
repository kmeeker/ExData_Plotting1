df <- read.table('household_power_consumption.txt',sep=';',header=TRUE,stringsAsFactors = FALSE)

df$DateTime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df <- df[which(df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02")),]
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)

png(file="plot3.png",width=480,height=480)
plot(df$DateTime,df[,7], type="l",xlab="",ylab="Energy sub metering")
lines(df$DateTime,df[,8],col="red")
lines(df$DateTime,df[,9],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
