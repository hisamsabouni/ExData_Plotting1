#Plot Four
#read in the data set
household_power_consumption <- read.csv("~/Desktop/R/Exploratory data analysis/untitled folder/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household_power_consumption$Date<-strptime(household_power_consumption$Date,"%d/%m/%Y") #convert characther to POSIXlx and POSIXct
household_power_consumption$Date<-as.Date(household_power_consumption$Date) #convert to date
class(household_power_consumption$Date) #make sure class is date!
Data.one<-subset(household_power_consumption, Date == c("2007-02-01")) #February 1st, 2007 data
Data.two<-subset(household_power_consumption, Date == c("2007-02-02")) #Februrary 2nd, 2007 Data
Data<-rbind(Data.one,Data.two) #February 1 & 2, 2007 data
rm(household_power_consumption) #remove giant data set..

#prep data for Global_active_power
Data$Global_active_power<-as.numeric(Data$Global_active_power) #convert from character to numeric
#prep data for sub_meterings
for (i in 7:9){
  Data[,i]<-as.numeric(Data[,i]) #convert all three sub_meterings into numeric from character
}

#prep data for voltage plot
Data[,5]<-as.numeric(Data[,5]) #convert voltage to numeric 

#prep data for Global_reactive_plot
Data[,4]<-as.numeric(Data[,4]) #convert Global_reactive_power to numeric

#Set the layout for four graphs and set margins
par(mfcol=c(2,2),mar=c(4,4,2,2),bg=NA)
#topleft plot (same as plot two)
plot(Data[,3],type='l',xaxt='n',ylab="Global Active Power (kilowatts)",xlab="",cex.lab=.75) #line plot 
axis(1,at=1,c("Thu")) #x axis
axis(1,at=2880/2,c("Fri")) #x axis
axis(1,at=2880,c("Sat")) #x axis
#bottomleft plot(same as plot three)
plot(Data[,7],type='l',xaxt='n',ylab="Energy sub metering",xlab="",col=1,cex.lab=.75) #plotting sub_metering one color = black
lines(Data[,8],typ='l',col=2) #adding in sub_metering_2 color= red
lines(Data[,9],typ='l',col=4) #adding in sub_metering_3 color= blue
axis(1,at=1,c("Thu")) #x axis 
axis(1,at=2880/2,c("Fri")) #x axis
axis(1,at=2880,c("Sat")) #x axis
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1), cex=.5,bty="n") #setting legend with colors and lines also adjusting size
#topright plot
plot(Data[,5],type='l',xaxt='n',ylab="Voltage",xlab="datetime",col=1,cex.lab=.75)
axis(1,at=1,c("Thu")) #x axis 
axis(1,at=2880/2,c("Fri")) #x axis
axis(1,at=2880,c("Sat")) #x axis
#bottomright plot
plot(Data[,4],type='l',xaxt='n',ylab="Global_reactive_power",xlab="datetime",ylim=c(0.0,0.5),col=1,cex.lab=.75)
axis(1,at=1,c("Thu")) #x axis 
axis(1,at=2880/2,c("Fri")) #x axis
axis(1,at=2880,c("Sat")) #x axis
#Save the plot
dev.copy(png,file="plot4.png",width=480,height=480)#saving as plot3.png 480x480 in working directory
dev.off() #closing the writing of the file




