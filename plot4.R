getx<-function(){
	charx<-paste(data$Date,data$Time,sep=" ")
	x<-strptime(charx,"%d/%m/%Y %H:%M:%S")
}

gety1<-function(){
	y1<-as.numeric(as.character(data$Global_active_power))      
}

gety2_1<-function(){
	y2_1<-as.numeric(as.character(data$Sub_metering_1))      
}

gety2_2<-function(){
	y2_2<-as.numeric(as.character(data$Sub_metering_2))      
}

gety2_3<-function(){
	y2_3<-as.numeric(as.character(data$Sub_metering_3))      
}

gety3<-function(){
	y3<-as.numeric(as.character(data$Voltage))      
}

gety4<-function(){
	y4<-as.numeric(as.character(data$Global_reactive_power))      
}

display<-function(x,y1,y2_1,y2_2,y2_3,y3,y4){
	legendtext=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
	color=c("black","red","blue")
	labelx=c("","","datetime","datetime")
	labely=c("Global Active Power","Energy sub metering","Voltage","Global_Reactive Power")
	

	png(filename="plot4.png")

	par(mfcol=c(2,2))

	plot(x,y1,type="n",xlab=labelx[1],ylab=labely[1])
	lines(x,y1)

	plot(x,y2_1,type="n",xlab=labelx[2],ylab=labely[2])
	legend("topright",legend=legendtext, lty=1, col=color, bty="n", cex=0.9)

	lines(x,y2_1,col=color[1])
	lines(x,y2_2,col=color[2])
	lines(x,y2_3,col=color[3])
	

	plot(x,y3,type="n",xlab=labelx[3],ylab=labely[3])
	lines(x,y3)

	plot(x,y4,type="n",xlab=labelx[4],ylab=labely[4])
	lines(x,y4)

	dev.off()
}

alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
index<-alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"
data<-alldata[index,]
display(getx(),gety1(),gety2_1(),gety2_2(),gety2_3(),gety3(),gety4())
	