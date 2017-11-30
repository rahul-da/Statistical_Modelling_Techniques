library(MASS)

train <- read.csv("Problem1_Input_Training.csv")
out <- read.csv("Problem2_Output_Training.csv")

x0 <- matrix(1 , nrow=50, ncol=1 )

d <- data.frame(x0,train$X1,train$X2)
df <- d
y <- data.frame(out)

xx <- as.matrix(d)
y <- as.matrix(out)

estimator <- ((ginv(t(xx)%*%xx))%*%t(xx))%*%(y)

dd <- data.frame(x0*estimator[1]+train$X1*estimator[2]+train$X2*estimator[3])
write.csv(dd,"abc.csv")

plot(dd$x0...estimator.1....train.X1...estimator.2....train.X2...estimator.3.-out$Y)



forget_factor <- 0.95  #To be added

real_time <- read.csv("Problem1_Input_Test.csv")
real_output <- read.csv("Problem2_Output_Test.csv")
dd <- data.frame(x0,real_time$X1,real_time$X2)
dd <- as.matrix(dd)

Mn <- ginv(t(xx)%*%(xx))
i=1
xx <- as.matrix(df)
Mn <- ginv(t(xx)%*%(xx))
d <- data.frame(x0,real_time$X1,real_time$X2)
mx <- as.matrix(d[i,])
estimator <- estimator +((Mn-(Mn%*%t(mx)%*%mx%*%Mn)/(1+mx%*%Mn%*%t(mx))[1])%*%t(mx))*(real_output[i,1]-mx%*%estimator)[1]
df <- rbind(df,c(1,real_time$X1[i],real_time$X2[i]))
print(estimator)
xn <- rbind(xx[1:50,],dd[1,])

for(i in 2:50)
{
  xx <- as.matrix(df)
  Mn <- ginv(forget_factor*t(xn)%*%(xn)+t(xx)%*%xx)
  d <- data.frame(x0,real_time$X1,real_time$X2)
  mx <- as.matrix(d[i,])
  estimator <- estimator +((Mn-(Mn%*%t(mx)%*%mx%*%Mn)/(1+mx%*%Mn%*%t(mx))[1])%*%t(mx))*(real_output[i,1]-mx%*%estimator)[1]
  df <- rbind(df,c(1,real_time$X1[i],real_time$X2[i]))
  xn <- rbind(xn,dd[i,])
  print(estimator)
}




