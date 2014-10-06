getx<-function(){
	charx<-paste(data$Date,data$Time,sep=" ")
	x<-strptime(charx,"%d/%m/%Y %H:%M:%S")

}

gety<-function(){
	y<-as.numeric(as.character(data$Global_active_power))      
}

display<-function(x,y){
	plot(x,y,type="n",ylab="Global Active Power (kilowatts)",xlab="")
	lines(x,y)
	dev.copy(png, file="plot2.png")
	dev.off()
}

alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
index<-alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"
data<-alldata[index,]
display(getx(),gety())
	