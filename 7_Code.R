library(tidyverse)
library(data.table) ## For the fread function
library(lubridate)

source("sepsis_monitor_functions.R")

library(tictoc)

x <- c(50, 100, 150)
a <- 1
time_fread <- NULL

for(i in x){
tic()
makeSepsisDataset(i, "fread")

toclist <- toc()

time_fread[a] <- as.list(toclist$callback_msg)

a <- a+1
}

a <- 1
time_delim <- NULL
for(i in x){
  tic()
  makeSepsisDataset(i, "read_delim")
  
  toclist <- toc()
  
  time_delim[a] <- as.list(toclist$callback_msg)
  
  a <- a+1
}

library(gt)

library(googledrive)
