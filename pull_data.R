## Setting the working directory and downloading the data
        ## Working Directory
setwd("C:/Users/bdfitzgerald/Desktop/Data Science Specialist/exploratory_data_analysis")
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        ## Downloading the Data
if(!file.exists("course_project_2")){dir.create("course_project_2")}
if(!file.exists("course_project_2/data")){dir.create("course_project_2/data")}
download.file(file_url, destfile = file_path, mode = "wb")
data_downloaded <- date()
print(data_downloaded)
setwd("C:/Users/bdfitzgerald/Desktop/Data Science Specialist/exploratory_data_analysis/course_project_2/data")
unzip("data.zip", exdir = "./data")