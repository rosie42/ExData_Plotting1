# Read the source data
source_data <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
source_data$Date <- as.Date(source_data$Date, "%d/%m/%Y")
source_data$Time <- strptime(paste(source_data$Date, source_data$Time),"%Y-%m-%d %H:%M:%S")
data <- source_data[source_data$Date==as.Date("2007-02-01","%Y-%m-%d") | source_data$Date==as.Date("2007-02-02","%Y-%m-%d"),]

# Find the index where Thursday becomes Friday
fri_index <- sum(format(data$Date,"%w")==4)

# Build the plot file
png("./plot2.png", width = 480, height = 480)
plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", axes=FALSE)
axis(side=1,at=c(1,fri_index,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off()