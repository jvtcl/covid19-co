## helper functions for use with apcluster ##
library(apcluster)

clust_vec = function(apc, labels = NULL){
  
  k = length(apc@clusters)
  clust = rep(NA, k)
  for(i in 1:k){
    
    if(!is.null(labels)){
      clust[apc@clusters[[i]]] = labels[i]
    }else{
      clust[apc@clusters[[i]]] = i
    }
    
    
  }
  
  return(clust)
  
}

cut_clusters = function(x, apcex, k){
  
  kclust = cutree(apcex,k)
  
  clust = rep(NA, nrow(x))
  for(i in 1:k){
    
    clust[kclust@clusters[[i]]] = i
    
  }
  
  return(clust)
  
}