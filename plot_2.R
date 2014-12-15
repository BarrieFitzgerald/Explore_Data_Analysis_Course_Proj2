## Reading the data file
SCC <- readRDS("data/Source_Classification_Code.rds")
NEI <- readRDS("data/summarySCC_PM25.rds")

## Question 2: 
## Have total emissions from PM2.5 decreased in the 
## Baltimore City, Maryland (fips == "24510") from 1999 
## to 2008? Use the base plotting system to make a plot 
## answering this question.

## Sample Data of NEI
NEI_sample <- NEI[sample(nrow(NEI), size = 100, replace = FALSE),]

## Subsetting the data
MD <- subset(NEI, fips == '24510')

## Plotting and saving the data graph
png(filename = 'plot_2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), 
        main = 'Total Emission in Baltimore City, MD', 
        xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()
