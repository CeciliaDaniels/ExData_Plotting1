#Exploratory Data Analysis: Course Project 1
#plot1.R
#Due Date: 8/09/2015
#C.Daniels
#
#install/include packages
library(datasets)

#My personal location for this project. If not specified, files and output  
#will be placed in the user's current working directory.
#setwd("C:/Users/Cecilia/Documents/GitHub/Coursera-ExpDataAnalysis/ExData_Plotting1")

#
#Get data and unzip 
zipURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipLocal <- "./proj1.zip"

if (!file.exists(zipLocal)) {
    download.file(zipURL, zipLocal)
    unzip(zipLocal)
}
#
#read the household_power_consumption.txt - 
nSkip <-  0  ## use 21996 to start at first record of 1/1/2007
nRead <- -1  ## use alt value (i.e. 10000 to limit # of lines read), -1 reads all
fdata <-read.csv("./household_power_consumption.txt", na.strings= "?",
                 skip= nSkip, nrows= nRead, sep=";")

#next three rows were added just to check that data was read in as expected
#head(fdata, n=100)  ##take a look at input data
#nrow(fdata)  ## number of rows read - entire dataset contains 2,075,259
#ncol(fdata)  ## should be 9

#subset data to chose only data from Feb 1, 2007 and Feb 2, 2007
fdata2 <- subset.data.frame(fdata, Date == "1/2/2007"| Date == "2/2/2007")
#fdata2$DateTime <- as.POSIXlt(paste(as.Date(fdata2$Date, "%d/%m/%Y"), fdata2$Time)) 
#print(head(fdata2)) ##Check to make sure new column is correct
#
#Function: Plot1PNG - Opens a PNG device and outputs the chart 
#This output copied to my GITHUB repo for grading
Plot1PNG <- function() {
    png(filename = "plot1.png", width = 480, height = 480, units = "px")
    PlotChart1()
    dev.off()
}
#
#Function: Plot4Copy - Displays chart in a window, then copies it to a PNG file
#This output not submitted for grading
Plot1Copy <- function() {
    windows()
    PlotChart1()
    dev.copy(png, file = "plot1_copy.png")
    dev.off()
}

#
#Function: PlotChart1 - This code prepares the chart
PlotChart1 <- function() {
    hist(fdata2$Global_active_power, col="RED", 
         xlab="Global Active Power (kilowatts)", main = "Global Active Power")
}

#execute the functions to create output
Plot1PNG()  #creates output that will be posetd to GITHUB repo
Plot1Copy() 

