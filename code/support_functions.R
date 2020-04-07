lq <- function(dat){
    
    "
    Computes location quotient of case counts for a dataset.
    "
    
    with(dat, (value / sum(value)) / (pop / sum(pop)))
    
}

rate <- function(dat, norm = 100000){
    
    "
    Computes rate of case counts for a dataset.

    `norm`: normalization amount (defaults to 
        rate per 100,000 people).
    "
    
    with(dat, value / (pop / norm))
    
}

