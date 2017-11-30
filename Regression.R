parameters <- read.csv("data.csv")
result <- read.csv("ytest.csv")
test <- read.csv("test.csv")

x0<- matrix(1,nrow=100,ncol=1)
parameters= data.frame(x0,parameters)
dp <- as.matrix(parameters)
dpi <- ginv(dp)
dpt <- t(dp)
rt <- as.matrix(result)

estimator <-  ginv( dpt %*% dp ) %*% dpt %*% rt

#Check for multicollinearity

U <- svd(dp)
Ux <- U$u
Uy <- U$v
Ud <- U$d

s1 <- (113.42317141) / (113.42317141+ 24.05464528+ 11.19925489+  1.78846992 + 0.05692491)
s2 <-(113.42317141+ 24.05464528) / (113.42317141+ 24.05464528+ 11.19925489+  1.78846992 + 0.05692491)
s3 <- (113.42317141+ 24.05464528+ 11.19925489) / (113.42317141+ 24.05464528+ 11.19925489+  1.78846992 + 0.05692491)
s4 <-(113.42317141+ 24.05464528+ 11.19925489+  1.78846992) / (113.42317141+ 24.05464528+ 11.19925489+  1.78846992 + 0.05692491)

#clearly 91.335% of variance is explained by first and second variable 
#Hence multicollinearity is present.
################Normal Regression#############
A = matrix(c(1,-0.939483791208873,9.3173232705508,-6.00296918207748,-6.93345280018626),nrow=1,ncol=5)
x0<- matrix(1,nrow=100,ncol=1)
test= data.frame(x0,test)
dp <- as.matrix(test)
dpi <- ginv(dp)
dpt <- t(dp)
rt <- as.matrix(result)


plot(test$x2,dp%*%estimator)
#plot(result)


###############Using Principal Component Analysis#######