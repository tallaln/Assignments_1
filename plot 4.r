household_power_consumption <- read.csv("D:/Tallal/Dropbox/Thesis/Material for R/working directory/household_power_consumption.txt", sep=";")
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

hpc$V1<-as.Date(as.character(hpc$V1),"%d/%m/%Y")
hpc$V2<-strptime(hpc$V2,"%T")
rm (household_power_consumption)

# installs the package reshape since all the vaiable had been reassigned names 
#such as  v1, v2, V3,etc
#install.packages("reshape")

# rename interactively 
#fix(hpc) # results are saved on close 

# rename programmatically,
library(reshape)
# you can re-enter all the variable names in order
# changing the ones you need to change.the limitation
# is that you need to enter all of them!
names(hpc) <- c("Date","Time","Global_active_power", "Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")

png ('plot4.png')
par (mar = c(2,4,1,2))
par (mfrow = c(2,2))
plot (Time, Voltage, type = "l")
plot (Time, Global_active_power, type = "l")
plot (Time, Sub_metering_1,type= "s", xaxt= "n", main = "", xlab = "Time ",ylab= "Sub Metering" )
lines (Time,Sub_metering_1, type="s",col="red")
lines (Time,Sub_metering_2, type="s",col="Orange" )
lines (Time,Sub_metering_3, type="s",col="blue" )
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("red","orange","blue"),lty=1,lwd=2)
plot (Time, Global_reactive_power, type = "l")
