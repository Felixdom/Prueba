if(!file.exists("./Electric")){dir.create("./Electric")}
unzip("household_power_consumption.zip")

library(dplyr)
data<-read.table("household_power_consumption.txt",header=TRUE,nrows=70000,sep=";",
                 na.strings="?")

##Convert the Date variable to Date classes in R.
data$Date<-as.Date(data$Date,"%d/%m/%Y")

##Select two days
#datos<-filter(data,Date=="2007-02-01"| Date=="2007-02-02") Este funciona y debe
#ser correcto, pero... Mejor:
datos<-filter(data, Date>="2007-02-01" & Date<="2007-02-01")

datos$datetime<-as.POSIXct(paste(datos$Date, datos$Time), format="%Y-%m-%d %H:%M:%S")

#Make plot
with(datos,plot(datetime, Global_active_power,type="l",ylab="Global active power 
                (kilowatts)",xlab=""))

##Copy the plot in a png file.
dev.copy(png, file="plot2.png")
dev.off()
