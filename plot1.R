if(!file.exists("./Electric")){dir.create("./Electric")}
unzip("household_power_consumption.zip")

library(dplyr)
data<-read.table("household_power_consumption.txt",header=TRUE,nrows=70000,sep=";",
                 na.strings="?")

##Convert the Date variable to Date classes in R.
data$Date<-as.Date(data$Date,"%d/%m/%Y")

##Select two days
#datos<-filter(data,Date=="2007-02-01"| Date=="2007-02-02") Este funciona pero
#no parece correcto. Mejor:
datos<-filter(data, Date>="2007-02-01" & Date<="2007-02-01")


##Make histogram
with(datos,hist(Global_active_power,col="red",main="Global Active Power",
                xlab="Global Active Power (kilowatts)"))

##Copy the histogram in a png file:
dev.copy(png, file="plot1.png")
dev.off()