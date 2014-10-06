getx<-function(){
	charx<-paste(data$Date,data$Time,sep=" ")
	x<-strptime(charx,"%d/%m/%Y %H:%M:%S")
}
gety1<-function(){
	y1<-as.numeric(as.character(data$Sub_metering_1))      
}
gety2<-function(){
	y2<-as.numeric(as.character(data$Sub_metering_2))      
}
gety3<-function(){
	y3<-as.numeric(as.character(data$Sub_metering_3))      
}

display<-function(x,y1,y2,y3){
	legendtext=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
	color=c("black","red","blue")
	labelx=c("","","datetime","datetime")
	labely=c("Global Active Power","Energy sub metering","Voltage","Global_Reactive Power")


	plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
	lines(x,y1,col=color[1])
	lines(x,y2,col=color[2])
	lines(x,y3,col=color[3])
	
	legend("topright", legend=legendtext, lty=1, col=color)

	dev.copy(png, file="plot3.png")
	dev.off()
}

alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
index<-alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"
data<-alldata[index,]
display(getx(),gety1(),gety2(),gety3())
	