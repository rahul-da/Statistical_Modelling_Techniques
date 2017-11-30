library(MASS)
train <- read.csv("Problem1_Input_Training.csv")
out <- read.csv("Problem1_Output_Training.csv")
df<- read.csv("Problem1_Input_Training.csv")
real_time_input <- read.csv("Problem1_Input_Test.csv")
y<- read.csv("Problem3_Output_Training.csv")
real_time_output <- read.csv("Problem3_Output_Test.csv")

vi<-diag(50)

x0 <- matrix(1 , nrow=50, ncol=1 )

d <- data.frame(x0,train$X1,train$X2)
df <- d
y <- data.frame(out)

xx <- as.matrix(d)
y <- as.matrix(out)

estimator <- ((ginv(t(xx)%*%xx))%*%t(xx))%*%(y)

dd <- data.frame(x0*estimator[1]+train$X1*estimator[2]+train$X2*estimator[3])
write.csv(dd,"abc.csv")

plot(dd$x0...estimator.1....train.X1...estimator.2....train.X2...estimator.3.-out$Y) #Shows residual are normally distributed


#Part 1
#Heaviside Unit Step Function
result <- vector("list",50)
for(i in 1:50)
{
  rr<-diag(50)
  for(j in 1:50)
  {
    if(((train$X1[j]-real_time_input$X1[i])^2+(train$X2[j]-real_time_input$X2[i])^2)<1)
      rr[j,j]=1
    else 
      rr[j,j]=0;
  }
  estimator <- ((ginv(t(xx)%*%ginv(rr)%*%xx))%*%t(xx))%*%ginv(rr)%*%(y)
  print(estimator[1,1]*1+estimator[2,1]*real_time_input$X1[i]+estimator[3,1]*real_time_input$X2[i])
  result[i]<-(estimator[1,1]*1+estimator[2,1]*real_time_input$X1[i]+estimator[3,1]*real_time_input$X2[i])

}
plot(y,result)
#Part 2
#wi=e^-di^2/2
for(i in 1:50)
{
  rr<-diag(50)
  for(j in 1:50)
  {
      x<-exp((-((train$X1[j]-real_time_input$X1[i])^2+(train$X2[j]-real_time_input$X2[i])^2))/2)
      rr[j,j]<-x
  }
  estimator <- ((ginv(t(xx)%*%ginv(rr)%*%xx))%*%t(xx))%*%ginv(rr)%*%(y)
  print(estimator[1,1]*1+estimator[2,1]*real_time_input$X1[i]+estimator[3,1]*real_time_input$X2[i])
  result[i]<-(estimator[1,1]*1+estimator[2,1]*real_time_input$X1[i]+estimator[3,1]*real_time_input$X2[i])
}
plot(y,result)
#Part 3
#Inverse Function
for(i in 1:50)
{
  rr<-diag(50)
  for(j in 1:50)
  {
    if((train$X1[j]-real_time_input$X1[i])^2+(train$X2[j]-real_time_input$X2[i])^2==0){
      rr[j,j]=10
    }
    else{
      x<-sqrt((train$X1[j]-real_time_input$X1[i])^2+(train$X2[j]-real_time_input$X2[i])^2)
      rr[j,j]=1/x;
    }
  }
  estimator <- ((ginv(t(xx)%*%ginv(rr)%*%xx))%*%t(xx))%*%ginv(rr)%*%(y)
  print(estimator[1,1]*1+estimator[2,1]*real_time_input$X1[i]+estimator[3,1]*real_time_input$X2[i])
  result[i]<-(estimator[1,1]*1+estimator[2,1]*real_time_input$X1[i]+estimator[3,1]*real_time_input$X2[i])
}
plot(y,result)