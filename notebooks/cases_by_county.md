---
title: 'COVID-19 Confirmed Cases by Colorado County'
author: 'Joseph Tuccillo, University of Colorado-Boulder Department of Geography'
date: "15 April, 2020"
output: pdf_document
---



## Daily Cases by Colorado County
























```
## Error in rbind(deparse.level, ...): numbers of columns of arguments do not match
```










### Raw Cases per 100,000 People by County

![plot of chunk daily-cases-100k](figs/daily-cases-100k-1.pdf)

### Log-Transformed Cases per 100,000 People by County

![plot of chunk daily-cases-100k-log](figs/daily-cases-100k-log-1.pdf)




\newpage
## County Confirmed Case Trajectories (Experimental)


### Methodology

Use Affinity Propagation clustering to group daily reports of confirmed cases by county based on two criteria:

1. The current rate of confirmed cases per 100,000 people.
2. The change in confirmed cases per 100,000 people since the previous day.

- March 20, 2020 is used as the intial date, since it is the first day at which the change in cases/100k people by county can be measured (3/19/2020 marks the first day in which all counties were reporting).

- From the ensemble of daily clusterings, measure the percentage of days to date that any two counties shared a cluster label.

- Perform a final clustering (also using Affinity Propagation) to group the change trajectories from 3/20/2020 to present.

































### Raw Cases per 100,000 people by cluster

![plot of chunk county-clusters-raw](figs/county-clusters-raw-1.pdf)

### Log-transformed Cases per 100,000 people by cluster

![plot of chunk county-clusters--log](figs/county-clusters--log-1.pdf)

## Save New Data



