# Read the household electric consumption data and 
# subset data for dates 1/2/2007 and 2/2/2007
Data<-read.table("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
InputData<-subset(Data, Date == "1/2/2007" | Date == "2/2/2007")

# Open PNG file device for creating the plot in file plot1.png
png("plot1.png", width=480, height=480)

# Create the histogram along with appropriate title and axis labels
hist(InputData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Close the png graphics file device
dev.off()