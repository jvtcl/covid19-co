"
Downloads new CDPHE case data files from Google Drive.

Adapted from Jenny Bryan, RStudio
Source: https://community.rstudio.com/t/how-to-download-a-google-drives-contents-based-on-drive-id-or-url/16896/12
"

library(googledrive)
library(purrr)

## CDPHE case data folder (public link)
folder_url <- "https://drive.google.com/drive/folders/11ulhC5FwnRhiKqxDl6_9PnSMOjCWnLPB"

## identify this folder on Drive
## let googledrive know this is a file ID or URL, as opposed to file name
folder <- drive_get(as_id(folder_url))

## identify the csv files in that folder
csv_files_remote <- drive_ls(folder, type = "csv")

## get the list of local (already downloaded) CSV files
current_csv_files <- list.files('data')
current_csv_files <- current_csv_files[startsWith(current_csv_files, 'covid19_case_summary') & 
                                         endsWith(current_csv_files, '.csv')]

## remove the names of local CSV files
csv_files_remote[!csv_files_remote$name %in% current_csv_files,]
csv_files_target <- csv_files_remote[!csv_files_remote$name %in% current_csv_files,]

## download new files found, if any
if(nrow(csv_files_target) > 0){
  setwd('data')
  walk(csv_files_target$id, ~ drive_download(as_id(.x)))
  setwd('..')
}else{
  message('No new case data files available.')
}
