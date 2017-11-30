#Code Describing ideas of Point Estimator and Confidence Interval
u=0
W=integer(length=100)
for(l in 1:100)
{
  k<-0
  for(i in 1:1000)  
  {  
    n<-100                              #Sample Size
    x<-rnorm(n, mean = 0, sd = 1)       #Sample from Gaussian Distribution
    mn<-mean(x)                         #Value of Test Statistic for mean Estimation
    #print(mn)
    confidence<-0.99                    #confidence interval
    a<-qnorm((confidence+1)/2,0,1)               
    if(mn>-1*(a/sqrt(n)) && mn<a/sqrt(n))           
    {
      k<-k+1
    }
  }
  u=u+k
  #print(k)
  W[l]=(k*100/1000)
}
print(u/1000)
hist(W)
