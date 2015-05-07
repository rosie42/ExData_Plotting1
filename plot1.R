# Read the source data
source_data <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
source_data$Date <- as.Date(source_data$Date, "%d/%m/%Y")
source_data$Time <- strptime(paste(source_data$Date, source_data$Time),"%Y-%m-%d %H:%M:%S")
data <- source_data[source_data$Date==as.Date("2007-02-01","%Y-%m-%d") | source_data$Date==as.Date("2007-02-02","%Y-%m-%d"),]

#build the plot file
png("./plot1.png", width = 480, height = 480)
hist(data$Global_active_power, breaks=12, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()