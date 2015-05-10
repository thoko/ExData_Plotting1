## Step 1: Load the dataset
data_main <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_main$Date <- as.Date(data_main$Date, format="%d/%m/%Y")

## Step 2: Subsetting the data & clean
data <- subset(data_main, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_main)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Step 3: Make the plot and save file
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()