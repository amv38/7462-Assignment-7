library(tidyverse)
library(data.table) ## For the fread function
library(lubridate)
library(googledrive)
library(googlesheets4)

df <- makeSepsisDataset()

# We have to write the file to disk first, then upload it
df %>% write_csv("sepsis_data_temp.csv")

# Uploading happens here
sepsis_file <- drive_put(media = "sepsis_data_temp.csv", 
                         path = "https://drive.google.com/drive/folders/1qbUCGdFgUDzipeupj2iNQsEPHRKm732W",
                         name = "sepsis_data.csv")

# Set the file permissions so anyone can download this file.
sepsis_file %>% drive_share_anyone()


