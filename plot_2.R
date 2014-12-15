## Reading the data file
setwd("C:/Users/bdfitzgerald/Desktop/Data Science Specialist/exploratory_data_analysis/course_project_2/data/data")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

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
setwd("C:/Users/bdfitzgerald/Desktop/Data Science Specialist/
      exploratory_data_analysis/course_project_2")
png(filename = 'plot_2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), 
        main = 'Total Emission in Baltimore City, MD', 
        xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()
