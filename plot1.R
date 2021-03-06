df <- read.table('household_power_consumption.txt',sep=';',header=TRUE,stringsAsFactors = FALSE)

df$DateTime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df <- df[which(df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02")),]
df$Global_active_power <- as.numeric(df$Global_active_power)

png(file="plot1.png",width=480,height=480)
hist(df$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()