# Read the household electric consumption data and subset data for dates 1/2/2007 and 2/2/2007
# Also add variable timeline by concatenating date and time columns and converting to datetime format using strptime function
Data<-read.table("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
InputData<-transform(subset(Data, Date == "1/2/2007" | Date == "2/2/2007"),Timeline=strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

# Open PNG file device for creating the plot in file plot3.png
png("plot3.png", width=480, height=480)

# Create the line plot for Sub_metering_1 with x and y axis and appropriate labels
with(InputData, plot(Timeline, Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l"))

# Add red line for Sub metering 2
with(InputData, lines(Timeline, Sub_metering_2, col="red"))

# Add blue line for Sub metering 3
with(InputData, lines(Timeline, Sub_metering_3, col="blue"))

# Add legend on top right
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close the png graphics file device
dev.off()
