# Read the household electric consumption data and subset data for dates 1/2/2007 and 2/2/2007
# Also add variable timeline by concatenating date and time columns and converting to datetime format using strptime function
Data<-read.table("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
InputData<-transform(subset(Data, Date == "1/2/2007" | Date == "2/2/2007"),Timeline=strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

# Open PNG file device for creating the plot in file plot2.png
png("plot2.png", width=480, height=480)

# Create the line plot on the input data along with appropriate title and axis labels
with(InputData, plot(Timeline, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))

# Close the png graphics file device
dev.off()
