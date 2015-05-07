# Read the source data
source_data <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
source_data$Date <- as.Date(source_data$Date, "%d/%m/%Y")
source_data$Time <- strptime(paste(source_data$Date, source_data$Time),"%Y-%m-%d %H:%M:%S")
data <- source_data[source_data$Date==as.Date("2007-02-01","%Y-%m-%d") | source_data$Date==as.Date("2007-02-02","%Y-%m-%d"),]

# Find the index where Thursday becomes Friday
fri_index <- sum(format(data$Date,"%w")==4)

# Build the plot file
png("./plot3.png", width = 480, height = 480)

# Plot the lines
plot(data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", axes=FALSE)
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")

# Fill in the axes
axis(side=1,at=c(1,fri_index,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
axis(2)
box()

# Legend
legend(x="topright",lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()