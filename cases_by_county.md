---
title: 'COVID-19 Confirmed Cases by Colorado County'
author: 'Joseph Tuccillo, University of Colorado-Boulder Department of Geography'
date: "11 April, 2020"
output: pdf_document
---



## Daily Cases by Colorado County


```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```


```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```


```
## Error in file(file, "rt"): cannot open the connection
```

```
## Error in eval(expr, envir, enclos): object 'co_sxa' not found
```

```
## Error in names(co_pop)[2] <- "pop": object 'co_pop' not found
```



```
## Error in gsub(" County", "", co_pop$Geo_NAME): object 'co_pop' not found
```














### Raw Cases per 100,000 People by County


```
## Error: At least one layer must contain all faceting variables: `attribute`.
## * Plot is missing `attribute`
## * Layer 1 is missing `attribute`
```

![plot of chunk daily-cases-100k](figs/daily-cases-100k-1.pdf)

### Log-Transformed Cases per 100,000 People by County


```
## Error: At least one layer must contain all faceting variables: `attribute`.
## * Plot is missing `attribute`
## * Layer 1 is missing `attribute`
```

![plot of chunk daily-cases-100k-log](figs/daily-cases-100k-log-1.pdf)


```
## Error in grid.newpage(): could not open file 'figs//daily-cases-raw.png'
```

```
## Error in grid.newpage(): could not open file 'figs//daily-cases-log.png'
```


\newpage
## County Confirmed Case Trajectories (Experimental)


### Methodology

Use Affinity Propagation clustering to group daily reports of confirmed cases by county based on two criteria:

1. The current rate of confirmed cases per 100,000 people.
2. The change in confirmed cases per 100,000 people since the previous day.

- March 20, 2020 is used as the intial date, since it is the first day at which the change in cases/100k people by county can be measured (3/19/2020 marks the first day in which all counties were reporting).

- From the ensemble of daily clusterings, measure the percentage of days to date that any two counties shared a cluster label.

- Perform a final clustering (also using Affinity Propagation) to group the change trajectories from 3/20/2020 to present.


```
## Error in split.default(daily_cases_cty, daily_cases_cty$date): first argument must be a vector
```


```
## Error in eval(expr, envir, enclos): object 'daily_cases_split' not found
```

```
## Error in eval(expr, envir, enclos): object 'current_cases' not found
```



```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```

```
## Error in lapply(X = X, FUN = FUN, ...): object 'daily_cases_split' not found
```


```
## Error in ncol(ens): object 'ens' not found
```

```
## Error in Reduce(ed, f = "+"): object 'ed' not found
```

```
## Error in eval(expr, envir, enclos): object 'ed' not found
```


```
## Error in eval(expr, envir, enclos): object 'ed' not found
```


```
## Error in apcluster(es): could not find function "apcluster"
```


```
## Error in clust_vec(apce): could not find function "clust_vec"
```

```
## Error in sprintf("%02d", clust): object 'clust' not found
```

```
## Error in rownames(es): object 'es' not found
```

```
## Error in eval(expr, envir, enclos): object 'excl' not found
```

```
## Error in eval(expr, envir, enclos): object 'excl' not found
```

```
## Error in eval(expr, envir, enclos): object 'clust' not found
```


```
## Error: Cannot open "data"; The file doesn't seem to exist.
```

```
## Error in eval(expr, envir, enclos): object 'counties' not found
```

```
## Error in eval(expr, envir, enclos): object 'counties' not found
```


```
## Error in factor(clust): object 'clust' not found
```


```
## Error in eval(expr, envir, enclos): object 'counties' not found
```

```
## Error in eval(expr, envir, enclos): object 'counties' not found
```


```
## Error in st_centroid(counties): object 'counties' not found
```

```
## Error in data.frame(GEOID = counties$NAME, county_labels): object 'counties' not found
```


```
## Error in unique(clust[clust != "No Confirmed Cases"]): object 'clust' not found
```



```
## Error in fortify(data): object 'counties' not found
```


```
## Error in is_missing(values): object 'pal' not found
```


```
## Error in is_missing(values): object 'pal' not found
```

### Raw Cases per 100,000 people by cluster


```
## Error in cowplot::plot_grid(mapplot, trjplot, ncol = 1): object 'mapplot' not found
```

```
## Error in eval(expr, envir, enclos): object 'clsplt1' not found
```

```
## Error in grid.newpage(): could not open file 'figs//county-clusters-raw.png'
```

### Log-transformed Cases per 100,000 people by cluster


```
## Error in cowplot::plot_grid(mapplot, trjplot_log, ncol = 1): object 'mapplot' not found
```

```
## Error in eval(expr, envir, enclos): object 'clsplt2' not found
```

```
## Error in grid.newpage(): could not open file 'figs//county-clusters-log.png'
```
