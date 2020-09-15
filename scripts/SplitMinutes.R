# Libraries
library(tidyverse)
library(lubridate)


# Load the data
council <- read_csv("data/city_counsil_minutes_1940-1945.csv")
head(council)

# Transform the dates
council <- council %>% 
  mutate(year=year(date_of_meeting)) %>% 
  mutate(month=month(date_of_meeting)) %>% 
  mutate(day=day(date_of_meeting))

# Check all (dates) look as expected 
data = council
typeof(data)
unique(data$year) 
unique(data$month)

# The loop to explode into years and months
ifelse(!dir.exists("output_data"),dir.create("output_data"),FALSE) # create a director for results

years <- 1940:1945  # sort the years, so you don't end up looping over each line in the csv
months <- 1:12  # same for months
for (y in years){
  for (i in months){
  output <- subset(data, year == y & month == i)
  write.table(output, file = paste0("output_data/",y,"_",i,"_minutes.txt"), sep = "\t")
  }
 }
