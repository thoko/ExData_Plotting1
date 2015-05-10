## Step 1: Load dataset
data_main <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_main$Date <- as.Date(data_main$Date, format="%d/%m/%Y")

## Step 2: Subset the data and clean
data <- subset(data_main, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_main)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Step 3: Make the plot and save file
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()