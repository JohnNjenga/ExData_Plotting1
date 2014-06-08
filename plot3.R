# read in the dataset
dataset=read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".", na="?",stringsAsFactors=FALSE)
#change the class of Date variable to "date"
dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")
# subset the dataset to get only the dates needed for the exercise
dataset2=dataset[(dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02"),]
# get a new variable by combining Date and Time
dataset2$newdate=paste(dataset2$Date,dataset2$Time)
dataset2$newdate=strptime(dataset2$newdate, "%Y-%m-%d %H:%M:%S")
#Reshape the data
install.packages("reshape")
library(reshape)
dataset3=melt(dataset2, id=newdate, measure.vars=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#call the graphing device "PNG"
png(filename="plot2.png", width=480, height=480)
plot(x=dataset2$newdate,y=dataset2$Global_active_power, pch=14,xlab="",ylab="Global Active Power(kilowatts)",cex=1)
dev.off()
