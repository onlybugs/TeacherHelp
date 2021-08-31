# 8-31
# Kai
# Core Fun

GetBasic = function(df)
{
  brt <- rt[,2:ncol(rt)]
  name = c('mean','median','Jicha','sd')
  mea <- as.data.frame(lapply(brt, mean))
  media <- as.data.frame(lapply(brt, median))
  
  jc <- as.data.frame(lapply(brt, max)) - as.data.frame(lapply(brt, min))
  sd <- as.data.frame(lapply(brt, sd))
  
  r <- round(rbind(mea,media,jc,sd),2)
  r <- cbind(name,r)
}

GetJiGe = function(df,ap)
{
  brt <- rt[,2:ncol(rt)]
  brt$type <- ifelse(brt$math < 90,"bad",
                     ifelse(brt$math < 120,"normal",'good'))
  
  jgrate <- round((ap-table(brt$type)['bad'])/ap * 100,2)
  yxrate <- round(table(brt$type)['good']/ap * 100,2)
  
  list(jgrate = jgrate,yxrate = yxrate,type = brt$type)
}

GetOrder = function(df,ap)
{
  brt <- df
  brt$or <- 1:ap
  brt$mathorder <- order(brt$math,decreasing = T)
  for (i in 1:ap) {
    sor <- brt$or[brt$mathorder == i]
    brt[i,"mathsort"] <- sor
  }
  brt$or <- NULL
  brt$mathorder <- NULL
  brt$mathsort
}

