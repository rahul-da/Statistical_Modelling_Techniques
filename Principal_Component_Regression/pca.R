library(MASS)
x0 <- matrix(1 , nrow=100, ncol=1 )
x1 <- read.csv("x1train.csv")
x2 <- read.csv("x2train.csv")
x3 <- read.csv("x3train.csv")
x4 <- read.csv("x4train.csv")
y <- read.csv("ytrain.csv")
xx0 <- matrix(1 , nrow=100, ncol=1 )
xx1 <- read.csv("x1test.csv")
xx2 <- read.csv("x2test.csv")
xx3 <- read.csv("x3test.csv")
xx4 <- read.csv("x4test.csv")
yy <- read.csv("ytest.csv")

d <- data.frame( x0, x1 , x2 , x3 , x4 )
XX <- data.frame( xx0, xx1 , xx2 , xx3 , xx4 )
XX <- data.matrix(XX)

X=data.matrix(d, rownames.force = NA)
xx <- X
Y=data.matrix(yy)

estimator <- ((ginv(t(xx)%*%xx))%*%t(xx))%*%Y

matrix(data=d)
X=data.matrix(d, rownames.force = NA)
dim(Y)
e=(ginv((t(X) %*% X)) %*% t(X) %*% Y)
before<-XX%*%e
print(e)

q<-svd(X)
#We will use the first three parameters as they are explaining 98% of the variance in the model

rr<-q$v[,c(1,2,3)]
w<-X%*%rr
estimator <- ((ginv(t(w)%*%w))%*%t(w))%*%Y
after<-XX%*%rr%*%estimator
sum((after-Y)^2)
sum((before-yy)*(before-yy))
