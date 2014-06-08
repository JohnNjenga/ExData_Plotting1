# read in the dataset
dataset=read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".", na="?",stringsAsFactors=FALSE)
#change the class of Date variable to "date"
dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")
# subset the dataset to get only the dates needed for the exercise
dataset2=dataset[(dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02"),]
#call the graphing device "PNG"
png(filename="plot1.png", width=480, height=480)
hist(dataset2$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red",border="black",breaks=12)
dev.off()
