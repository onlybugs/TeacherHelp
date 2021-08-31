# 21-8-30
# Kai
# Generate Random Score Report

# This code is not enough,you only could generate a
# easy and rubbish score report!And this report's only
# usefulion is to be a example data to use this pro.

# total num of persons
mp = 20

# If you like,you can change the Xing and Ming which
# is in vetors(x,y1,y2).
x = c('赵','钱','孙','李','周','吴','郑','王')
y1 = c("倩","桂","潇",'楠','帅','琳','佳','明')
y3 = c("","潇",'莹','丽',"","凯","","")
nam = paste(x[round(runif(mp,1,8),0)],y1[round(runif(mp,1,8),0)],
            y3[round(runif(mp,1,8),0)],sep = "")

# This section is to generate score of each subject.
s1 = round(runif(mp,52,150),0)
s2 = round(runif(mp,60,140),0)
s3 = round(runif(mp,80,150),0)
all = s1 + s2 + s3

# save and output
score_d = data.frame(name = nam,totalscore = all,chinese = s1,
                     math = s2,english = s3)
# table(table(score_d$name) > 1)
write.csv(score_d,file = 'chengjidan.csv',
          row.names = F)




