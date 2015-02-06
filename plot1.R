#Plot One
#read in the giant data set

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household_power_consumption$Date<-strptime(household_power_consumption$Date,"%d/%m/%Y") #convert characther to POSIXlx and POSIXct
household_power_consumption$Date<-as.Date(household_power_consumption$Date) #convert to date
class(household_power_consumption$Date) #make sure class is date!
Data.one<-subset(household_power_consumption, Date == c("2007-02-01")) #February 1st, 2007 data
Data.two<-subset(household_power_consumption, Date == c("2007-02-02")) #Februrary 2nd, 2007 Data
Data<-rbind(Data.one,Data.two) #February 1 & 2, 2007 data
rm(household_power_consumption) #remove giant data set..

Data$Global_active_power<-as.numeric(Data$Global_active_power) #convert from character to numeric

#plot one
par(bg=NA) #set background as NA so when we save it wont be white
hist(Data[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col=2) #red histogram
dev.copy(png,file="plot1.png",width=480,height=480) #saving as plot1.png 480x480 in working directory
dev.off() #closing the writing of the file
