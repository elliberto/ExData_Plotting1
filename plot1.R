data<-function(){
	alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
	index<-alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"
	data<-alldata$Global_active_power[index]
	data<-as.numeric(levels(data))[data]         
}

display<-function(data){
	hist(data, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
	dev.copy(png, file="plot1.png")
	dev.off()
}

display(data())
	

	
