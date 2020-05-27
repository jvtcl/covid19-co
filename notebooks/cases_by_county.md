---
title: 'COVID-19 Confirmed Cases by Colorado County'
author: 'Joseph Tuccillo, University of Colorado-Boulder Department of Geography'
date: "27 May, 2020"
output: pdf_document
---



## Daily Cases by Colorado County






```
## [1] "Feature Layer"
## [1] "esriGeometryPolygon"
```

```
## Error in rbind(deparse.level, ...): numbers of columns of arguments do not match
```










### Raw Cases per 100,000 People by County





```
## Error: Faceting variables must have at least one value
```

![plot of chunk daily-cases-100k](figs/daily-cases-100k-1.pdf)

### Log-Transformed Cases per 100,000 People by County


```
## Error: Faceting variables must have at least one value
```

![plot of chunk daily-cases-100k-log](figs/daily-cases-100k-log-1.pdf)


```
## Error: Faceting variables must have at least one value
```

```
## Error: Faceting variables must have at least one value
```


\newpage
## County Confirmed Case Trajectories (Experimental)


### Methodology

Use Affinity Propagation clustering to group daily reports of confirmed cases by county based on two criteria:

1. The current rate of confirmed cases per 100,000 people.
2. The change in confirmed cases per 100,000 people since the previous day.

- March 19, 2020 is used as the intial date, since it is the first day at which the change in cases/100k people by county can be measured (3/18/2020 marks the first day in which all counties were reporting). (_**NOTE** that the data is published with a one-day lag._)

- From the ensemble of daily clusterings, measure the percentage of days to date that any two counties shared a cluster label.
    - **EXPERIMENTAL**: the similarities are now upweighted by more recent dates. This is subject to change.

- Perform a final clustering (also using Affinity Propagation) to group the change trajectories from 3/19/2020 to present.







```
## Error in dimnames(x) <- dn: length of 'dimnames' [1] not equal to array extent
```




```
## Error in ncol(ens): object 'ens' not found
```

```
## Error in Reduce(es, f = "+"): object 'es' not found
```


```
## Error in apcluster(es): object 'es' not found
```


```
## Error in clust_vec(apce): object 'apce' not found
```

```
## Error in sprintf("%02d", clust): object 'clust' not found
```

```
## Error in rownames(es): object 'es' not found
```

```
## Error in eval(expr, envir, enclos): object 'clust' not found
```


```
## Error in match(names(clust), counties$NAME): object 'clust' not found
```


```
## Error in factor(clust): object 'clust' not found
```






```
## Error in unique(clust[clust != "No Confirmed Cases"]): object 'clust' not found
```



```
## Error in is_missing(values): object 'pal' not found
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
## Error in FUN(X[[i]], ...): object 'cases_100k' not found
```

### Log-transformed Cases per 100,000 people by cluster


```
## Error in cowplot::plot_grid(mapplot, trjplot_log, ncol = 1): object 'mapplot' not found
```

```
## Error in eval(expr, envir, enclos): object 'clsplt2' not found
```

```
## Error in FUN(X[[i]], ...): object 'cases_100k' not found
```

## Save New Data



