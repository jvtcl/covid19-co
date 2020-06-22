# library(esri2sf)
library(rjson)
library(lubridate)
source('code/support_functions.R')
r
## REST API Connection
# url <- 'https://services3.arcgis.com/66aUo8zsujfVXRIT/arcgis/rest/services/CDPHE_COVID19_CountyLevel_Open_Data_Repository/FeatureServer/0/'

# url <- "https://opendata.arcgis.com/datasets/1456d8d43486449292e5784dcd9ce4a7_0.geojson?q=Metric:Cases" # not working
# url <- "https://opendata.arcgis.com/datasets/1456d8d43486449292e5784dcd9ce4a7_0.geojson?&Metric=Cases" # not working
url <- "https://opendata.arcgis.com/datasets/1456d8d43486449292e5784dcd9ce4a7_0.geojson"

## Get daily cases by county
# daily_cases_cty <- esri2sf(url = url,
#                            outFields = c('LABEL', 'Date', 'Value', 'POP'),
#                            where = "Metric = 'Cases'")

daily_cases_cty <- read_json(url, simplifyDataFrame = T, flatten = T)

# hacky stuff, because the JSON query isn't working...
daily_cases_cty <- daily_cases_cty$features
names(daily_cases_cty) <- gsub('properties.', '', names(daily_cases_cty)) 
daily_cases_cty <- daily_cases_cty[daily_cases_cty$Metric == 'Cases',]
daily_cases_cty <- daily_cases_cty[,c('LABEL', 'Date', 'Value', 'POP')]

# ## strip geometry
# st_geometry(daily_cases_cty) <- NULL

## format date
# offset to account for one-day lag in reporting
daily_cases_cty$Date <- mdy(daily_cases_cty$Date) - 1

## rename cols
names(daily_cases_cty) <- c('attribute', 'date', 'value', 'pop')

## sort by date, then by county
cty_pop <- unique(daily_cases_cty[,c('attribute', 'pop')])
cty_pop <- cty_pop[order(cty_pop$attribute),]
cty_pop <- cty_pop[!cty_pop$attribute %in% c('Grand Total County', 'Unknown Or Pending County'),]

daily_cases_cty <- split(daily_cases_cty, daily_cases_cty$date)

daily_cases_cty <- lapply(daily_cases_cty, function(x){
  x <- x[match(cty_pop$attribute, x$attribute),]
  x$attribute <- cty_pop$attribute
  x$pop <- cty_pop$pop[match(cty_pop$attribute, x$attribute)]
  x$value[is.na(x$value)] <- 0 # non-reporting counties
  x$date <- unique(x)$date[1] # pad dates
  x
})
daily_cases_cty <- do.call(rbind, daily_cases_cty)
rownames(daily_cases_cty) <- NULL

## append case rates
daily_cases_cty$cases_100k <- rate(daily_cases_cty)

## check date for naming file
date_check <- as.numeric(Sys.Date() - max(daily_cases_cty$date))

if(date_check > 1){ # rebuilding before new data released
  
  fn <- paste0(paste('daily_cases_by_county', (Sys.Date() - 1), sep = '_'), '.RData')
  
}else{ # rebuilding day-of, after new data released
  
  fn <- paste0(paste('daily_cases_by_county', Sys.Date(), sep = '_'), '.RData')
  
}

path <- file.path('data', 'legacy', fn)
save(daily_cases_cty, file = path)
