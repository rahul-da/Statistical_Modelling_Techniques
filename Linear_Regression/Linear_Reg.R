#load packages car MASS foreign earth
library("earth");
library("MASS");
library("foreign");
library("car");


# we can run this --> ameotrain <- read.csv("D:/data/train.csv", na.strings = "")
## the above line makes all blanks NA, but from the data we should realized that 
## all missing values have been coded as -1, so change that...

ameotrain <- read.csv("/Users/akshaykhatter/Desktop/GitHub/Statistical_Modelling_Techniques/Linear_Regression/train_clean.csv", na.strings = "-1")
ameotest <- read.csv("/Users/akshaykhatter/Desktop/GitHub/Statistical_Modelling_Techniques/Linear_Regression/test_clean.csv", na.strings = "-1")

attach (ameotrain) #so that we do not have to type the $ sign every time when calling a variable

## step 1 is always data cleaning. To begin with, lets get the feel of the data.

dim(ameotrain)
names(ameotrain)
summary(ameotrain)

##are there missing values?

sum(is.na(ameotrain$Domain))

## if there are missing values, you can replace them by mean for numerics

for(i in 1:ncol(ameotrain)){
  ameotrain[is.na(ameotrain[,i]), i] <- mean(ameotrain[,i], na.rm = TRUE)
}

for(i in 1:ncol(ameotest)){
  ameotest[is.na(ameotest[,i]), i] <- mean(ameotest[,i], na.rm = TRUE)
}

## are some variables related?

pairs(~ Salary + X10percentage + collegeGPA + X12percentage + GraduationYear, data = ameotrain)

## observe that according to this plot and the data dictionary College GPA is out of 100 or out of 10. Need a single scale
## for all GPA <= 10, multiply by 10

ameotrain$collegeGPA[ameotrain$collegeGPA<10] = ameotrain$collegeGPA*10
ameotest$collegeGPA[ameotest$collegeGPA<10] = ameotest$collegeGPA*10

salreg <- lm(Salary ~ X10percentage + collegeGPA + X12percentage + GraduationYear, data = ameotrain)

vif(salreg)

## terrible model - R-2 = 0.04!

salreg1 <- lm(Salary ~ X10percentage + collegeGPA + GraduationYear, data = ameotrain)

salreg2 <- lm(Salary ~ X10percentage + collegeGPA + GraduationYear + Gender, data = ameotrain)

salreg3 <- lm(Salary ~ X10percentage + collegeGPA + Gender + JobCity, data = ameotrain)

## jobcity matters but I just noticed iy is not there in the test data... :P (little cheating) :P

## lets be clever and try the numerical ones first and keep gender

salreg4 <- lm(Salary ~ X10percentage + X12percentage + Gender + CollegeCityTier + English + Logical + Quant + Domain, data = ameotrain)

##still less than 10% but at least the college location is irrelevant

salreg5 <- lm(Salary ~ X10percentage + X12percentage + Gender + CollegeCityTier + English + Logical + Quant + Domain + conscientiousness + agreeableness + extraversion + nueroticism + openess_to_experience, data = ameotrain)

pred5 <- predict(salreg5, ameotest)

write.table(pred5, "/Users/akshaykhatter/Documents/Rfiles/result5.csv", col.names = TRUE)

## so the geeks seem to be safe - extraversion does not matter
## the neurotics should be a bit careful though

salreg6 <- lm(Salary ~ X10percentage + X12percentage + X12graduation + Gender + CollegeCityTier + English + Logical + Quant + Domain + conscientiousness + agreeableness + extraversion + nueroticism + openess_to_experience, data = ameotrain)

salreg7 <- lm(Salary ~ X10percentage + X12percentage + X12graduation + Gender + CollegeTier + English + Logical + Quant + Domain + conscientiousness + agreeableness + extraversion + nueroticism + openess_to_experience, data = ameotrain)

salreg8 <- lm(Salary ~ X10percentage + Degree + X12percentage + X12graduation + Gender + CollegeTier + English + Logical + Quant + Domain + conscientiousness + agreeableness + extraversion + nueroticism + openess_to_experience, data = ameotrain)


vif(salreg8)

ameotrain$Degree[ameotrain$Degree == "M.Sc. (Tech.)"] = "M.Tech./M.E."
ameotest$Degree[ameotest$Degree == "M.Sc. (Tech.)"] = "M.Tech./M.E."

salreg9 <- lm(Salary ~ X10percentage + X12board + Specialization + X12percentage + X12graduation + Gender + CollegeTier + English + Logical + Quant + Domain + conscientiousness + agreeableness + extraversion + nueroticism + openess_to_experience, data = ameotrain)

vif(salreg9)

pred9 <- predict(salreg9, ameotest)
write.table(pred9, "/Users/akshaykhatter/Documents/Rfiles/result9.csv", col.names = TRUE)

##at this point we do have a good model , but we can still test for further improvment


spl1 <- earth(Salary ~ X10percentage + X12board + Specialization + X12percentage + X12graduation + Gender + CollegeTier + English + Logical + Quant + conscientiousness + agreeableness + extraversion + nueroticism + openess_to_experience, data = ameotrain)
predspl1 <-predict(spl1, ameotest)
write.table(predspl1, "/Users/akshaykhatter/Desktop/GitHub/Statistical_Modelling_Techniques/Linear_Regression/resultspl1.csv", col.names = TRUE)

##Finally we get the output in resultspl1.csv in our wd