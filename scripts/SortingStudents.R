# Who needs Access to Shared Drive

library(tidyverse)


Friday <- read_csv2("data/FridayList.csv") # last week's table
Wednesday <- read_csv2("data/WednesdayList.csv") # this week's table


# Select the new students in this weeks table for addition to Shared Drive
new <- Tuesday %>% 
  anti_join(Friday, by = 'Username') 
write.csv2(new, "data/new.csv")  


Zoom <- rep(seq_along(1:20), 6)
length(Zoom)
