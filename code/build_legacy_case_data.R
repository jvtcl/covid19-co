"
DEPRECATED

Builds legacy CDPHE case data files from Google Drive.

This should ONLY be used if you wish to manually rebuid 
the legacy data! Otherwise runs from existing data when
`notebooks/cases_by_county.Rmd` refreshes.
"

#### Fetch files from CDPHE Google Drive ####

"
Adapted from Jenny Bryan, RStudio
Source: https://community.rstudio.com/t/how-to-download-a-google-drives-contents-based-on-drive-id-or-url/16896/12
"

library(googledrive)
library(purrr)
setwd('../')

## CDPHE case data folder (public link)
# folder_url <- "https://drive.google.com/drive/folders/11ulhC5FwnRhiKqxDl6_9PnSMOjCWnLPB"
folder_url <- "https://drive.google.com/drive/folders/1bBAC7H-pdEDgPxRuU_eR36ghzc0HWNf1"

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
  walk(csv_files_target$id, ~ drive_download(as_id(.x), 
                                             overwrite = T))
  # setwd('..')
}else{
  message('No new case data files available.')
}

#### Build current daily cases by county data ####

# all filenames in the `data` folder
# legacy files (CSV from google drive)
setwd('../')
data_files <- list.files('data')

# filenames for all (legacy) covid19 case data files
covid_sf <- data_files[startsWith(data_files, 'covid19')]

## build daily case data
daily_cases_cty <- lapply(covid_sf, function(covx){
  
  # full path to the file
  path.covx <- file.path('data', covx)
  
  # extract date info from filename
  date.covx <- gsub('covid19_case_summary_', '', covx) # strip prefix
  date.covx <- gsub('.csv', '', date.covx) # strip file extension
  
  # read in file
  data.covx <- read.csv(path.covx, stringsAsFactors = F)
  
  # subset to counties
  cty.covx <- data.covx[data.covx$description %in% c('Case Counts by County', 'Colorado Case Counts by County') & data.covx$metric == 'Cases',] 
  
  # append date 
  cty.covx <- data.frame(date = date.covx, cty.covx, stringsAsFactors = F)
  
  # convert date from text to date/time
  cty.covx$date <- lubridate::date(cty.covx$date) - 1
  
  # ensure `value` column is numeric
  cty.covx$value <- as.numeric(cty.covx$value)
  
  # strip `County` prefix if it exists 
  cty.covx$attribute <- gsub(' County', '', cty.covx$attribute)
  
  # ensure county names in alphabetical order
  cty.covx <- cty.covx[match(sort(cty.covx$attribute), cty.covx$attribute),]
  
  cty.covx[,c('attribute', 'date', 'value')]
  
})

# combine results into a single data frame
daily_cases_cty <- do.call(rbind, daily_cases_cty)

# save result
fn <- paste0(paste('daily_cases_by_county', (Sys.Date() - 1), sep = '_'), '.RData')
path <- file.path('data', 'legacy', fn)
save(daily_cases_cty, file = path)
