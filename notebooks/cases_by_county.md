---
title: 'COVID-19 Confirmed Cases by Colorado County'
author: 'Joseph Tuccillo, University of Colorado-Boulder Department of Geography'
date: "20 April, 2020"
output: pdf_document
---



## Daily Cases by Colorado County




```
## Error in readChar(con, 5L, useBytes = TRUE): cannot open the connection
```








```
## Error in unique(daily_cases_cty$attribute): object 'daily_cases_cty' not found
```


```
## Error in match(daily_cases_cty$attribute, cases_new$attribute): object 'daily_cases_cty' not found
```


```
## Error in rbind(daily_cases_cty, cases_new): object 'daily_cases_cty' not found
```


```
## Error in eval(expr, envir, enclos): object 'daily_cases_cty' not found
```




```
## Error in with(dat, value/(pop/norm)): object 'daily_cases_cty' not found
```


```
## Error in eval(expr, envir, enclos): object 'daily_cases_cty' not found
```


### Raw Cases per 100,000 People by County


```
## Error in ggplot(data = daily_cases_cty_viz, aes(x = date, y = cases_100k, : object 'daily_cases_cty_viz' not found
```

```
## Error in eval(expr, envir, enclos): object 'trjplt1' not found
```

### Log-Transformed Cases per 100,000 People by County


```
## Error in ggplot(data = daily_cases_cty_viz, aes(x = date, y = cases_100k, : object 'daily_cases_cty_viz' not found
```

```
## Error in eval(expr, envir, enclos): object 'trjplt2' not found
```


```
## Error in grid.draw(plot): object 'trjplt1' not found
```

```
## Error in grid.draw(plot): object 'trjplt2' not found
```


\newpage
## County Confirmed Case Trajectories (Experimental)


### Methodology

Use Affinity Propagation clustering to group daily reports of confirmed cases by county based on two criteria:

1. The current rate of confirmed cases per 100,000 people.
2. The change in confirmed cases per 100,000 people since the previous day.

- March 19, 2020 is used as the intial date, since it is the first day at which the change in cases/100k people by county can be measured (3/18/2020 marks the first day in which all counties were reporting). (_**NOTE** that the data is published with a one-day lag._)

- From the ensemble of daily clusterings, measure the percentage of days to date that any two counties shared a cluster label.

- Perform a final clustering (also using Affinity Propagation) to group the change trajectories from 3/19/2020 to present.


```
## Error in split(daily_cases_cty, daily_cases_cty$date): object 'daily_cases_cty' not found
```


```
## Error in eval(expr, envir, enclos): object 'daily_cases_split' not found
```

```
## Error in eval(expr, envir, enclos): object 'current_cases' not found
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
## Error in eval(expr, envir, enclos): object 'excl' not found
```

```
## Error in eval(expr, envir, enclos): object 'excl' not found
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
## Error in match(daily_cases_cty$attribute, counties$NAME): object 'daily_cases_cty' not found
```

```
## Error in match(daily_cases_cty_viz$attribute, counties$NAME): object 'daily_cases_cty_viz' not found
```




```
## Error in unique(clust[clust != "No Confirmed Cases"]): object 'clust' not found
```



```
## Error in is_missing(values): object 'pal' not found
```


```
## Error in ggplot(data = daily_cases_cty_viz[daily_cases_cty_viz$date >= : object 'daily_cases_cty_viz' not found
```


```
## Error in ggplot(data = daily_cases_cty_viz[daily_cases_cty_viz$date >= : object 'daily_cases_cty_viz' not found
```

### Raw Cases per 100,000 people by cluster


```
## Error in cowplot::plot_grid(mapplot, trjplot, ncol = 1): object 'mapplot' not found
```

```
## Error in eval(expr, envir, enclos): object 'clsplt1' not found
```

```
## Error in FUN(X[[i]], ...): object 'cluster' not found
```

### Log-transformed Cases per 100,000 people by cluster


```
## Error in cowplot::plot_grid(mapplot, trjplot_log, ncol = 1): object 'mapplot' not found
```

```
## Error in eval(expr, envir, enclos): object 'clsplt2' not found
```

```
## Error in FUN(X[[i]], ...): object 'cluster' not found
```

## Save New Data


```
## Error in eval(expr, envir, enclos): object 'daily_cases_cty' not found
```

```
## Error in save(daily_cases_cty, file = fnx): object 'daily_cases_cty' not found
```

