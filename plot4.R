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
png(filename="plot3.png", width=480, height=480)
plot(dataset3$newdate,dataset3$value, type="n",ylab="Energy Sub Metering", xlab="")
points(dataset3$newdate[dataset3$variable=="Sub_metering_3"],dataset3$value[dataset3$variable=="Sub_metering_3"], type="l", col="blue")
points(dataset3$newdate[dataset3$variable=="Sub_metering_2"],dataset3$value[dataset3$variable=="Sub_metering_2"], type="l", col="red")
points(dataset3$newdate[dataset3$variable=="Sub_metering_1"],dataset3$value[dataset3$variable=="Sub_metering_1"], type="l", col="black")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
dev.off()
