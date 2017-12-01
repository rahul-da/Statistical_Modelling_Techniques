About This Project:
Regression Modeling Techniques
(Fixed Modelling, Real Time Modelling and Modeling Based on Test Data)

Fixed Model: Here, once the model parameters are estimated from the training data, the model parameters do not change with time. They remain constant as we continue to use the model with time.

1. Linear Regression: y = f(x1,x2,…,xn) where the model is assumed to be linear in each xi, with coefficients which are unknown and are the model parameters. Once we get the training data we estimate the parameters using the Least Squares Estimator.  

2. Polynomial Regression: An extension of the linear regression technique in which if we wish to add quadratic, cubic and other powers of the controllable factors, we take some xp equal to the needed power term and compute its coefficient using the same above least squares approach. 

Enhancing the process of extracting the most useful parameters which actually affect the target variable.

3. Principal Component Regression (Biased Estimation): Some of the controllable factors may be (approximate) linear combination of some other dominating controllable factors which leads to rank loss, thus creating computation difficulty and deteriorating the quality of estimators by shooting up their variance. To avoid the above problem, we take the Singular Value Decomposition (SVD) of the matrix of controllable factors and based upon the values of the diagonal matrix we decide how many parameters to consider. This technique is called the Principal Component Analysis.

Real Time Model: Here, the model once it is trained from the training data, the model parameters do not remain the same. The model continue to learn from the mistakes it commits in estimating the target variable as the experiment is carried out. We even add a forgetting factor to it which helps it slowly forget the past and give more priority to the data obtained now. Very nearly as we think, isn't it.

4. Recursive Least Squares (Real time estimation of parameters): We are given an initial set of data. Using the data we estimate the model parameters. Now when the model is put into action, it estimates the target value based upon the values previous value of estimators and after that when one cycle is complete and realization is done, the estimators update themselves thus the model is said to learn from mistake committed in estimating the target variable. This technique is called the Recursive Least Squares Parameters estimation.

Building Model as we obtain the Test Data: In this modelling technique, as you will see, when we get the training data, we do nothing bcoz we are Lazy. Once we get test data, we assign all points in the training data, weights based on their priorities. Then we build the regression model and then estimate the target variable.
Observation: When you add the forgetting factor to the Real Time Modeling, see that it is a special case of Lazy Learning. Priority given w.r.t time.

5. Lazy Learning(Locally Weighted Regression): One of the simplest and computationally most demanding techniques of modeling, Lazy Learning which is actually based on the following idea. Once you  get the test data, based on certain criteria(weight function), you start assigning weights to the training points. Based upon the weights assigned or priority wise you estimate the model parameters.


