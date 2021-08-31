# 21-8-30
# Kai
# basic and plot

# This code is to achieve basic analysis for score report!
# It includes mean median sd var pass_rate and so on.
# Then we will get a total distribution for all.This distribution
# is to cut the score by "bad" "normal" "good" .

library(dplyr)
library(ggplot2)
library(reshape2)

source("CoreFun.R")

# score report's file path.
filep = "chengjidan.csv"

rt = read.csv(filep)
allpeople = dim(rt)[1]
rt = arrange(rt,desc(totalscore))

# basic values
# In the future,we will have more values to assess score for students.
DfBasicValue = GetBasic(rt)

# !!!!!!!!!!!!!!!!!
# Jige values (in this section ,we only get the math!!!)
# In the future,we will give a value to choose subject.
JGAndYX = GetJiGe(rt,allpeople)
rt = cbind(rt,JGAndYX$type)
colnames(rt)[length(rt)] = "MathScoreType"

# Sbuject Score Order
Mathsort = GetOrder(rt,allpeople)
rt = cbind(rt,Mathsort)

# !OUT PART
DfBasicValue$MathScoreType = "-"
DfBasicValue$Mathsort = -1
outd = rbind(rt,DfBasicValue)
write.csv(outd,"OutTable.csv")

of = file("report.txt",'w')
writeLines(c(
  "教师帮助程序v1.0 开发者:KaiLi 版本:1.0 ",
  "本人水平有限 欢迎使用者批评指正和提出新的创意和想法!\n\n",
  paste("本次排名共",allpeople,"人。",sep = ""),
  paste("本次考试数学成绩及格率为",JGAndYX$jgrate,"%。",sep = ""),
  paste("本次考试数学成绩优秀率为",JGAndYX$yxrate,"%。",sep = ""),
  paste("本次考试的总成绩第一名为",rt[1,1],",分数是",rt[1,2],"。",sep = ""),
  paste("本次考试数学成绩的第一名为",rt$name[rt$Mathsort == 1],
        ",分数是",rt$math[rt$Mathsort == 1],sep = ""),
  "\n\n各科成绩均值,中位数,方差,极差,以及数学成绩分级,数学成绩排名见输出表格"
),of)
close(of)



# plot This is a buiding part,do not try to run it!
# I think you do not like its result!
mrt = melt(rt[,c("name","totalscore","math")],
           id = "name")
amrt = arrange(group_by(mrt,variable),value)
str(mrt)
gp = ggplot(data = amrt,aes(x = name,y = value,fill = variable)) + 
  geom_bar(stat  = 'identity') + facet_grid(variable ~ .)
gp

