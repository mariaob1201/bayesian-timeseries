###########################################################
###### Sample ar(1)
###########################################################

#example
# sample 2 ar(1) and plot their ACF and PACF functions

set.seed(2021)
T=500 #num of time points

#sample ar(1) with coeff phi=0.9
# and variance 1
v = 1
sd = sqrt(v)
phi1 = 0.9
yt1 = arima.sim(n=T, model=list(ar=phi1), sd=sd)

#sample ar(1) with coeff phi -0.9
# and variance 1
phi2 = -.9 #or coeff
yt2 = arima.sim(n=T, model=list(ar=phi2), sd=sd)

plot(yt1,main=expression(phi=-.9))
plot(yt2,main=expression(phi=-.9))

par(mfrow=c(2,1), cex.lab = 1.3)
lag.max = 50

#plot true ACF
cov_0 = (sd*sd)/(1-phi2^2) #ACF at 0
cov_h = phi2^(0:lag.max)*cov_0 #auto covariance at h
plot(0:lag.max, cov_h/cov_0, pch=1,
     type='h', col='red',
     ylab='true ACF',
     xlab='Lag',
     ylim=c(-1,1),
     main=expression(phi==-.9))

#plot sample ACF
acf(yt1, lag.mx=lag.max, type='correlation', ylab='sample ACF',
    lty =1, ylim=c(-1,1), main="")
acf(yt2, lag.max = lag.max, type='correlation', ylab='sample ACF',
    lty =1, ylim=c(-1,1), main="") 

#sample PACFs
# What we know here is that because these are simulated observations from an AR1 process. 
# What should happen with the partial autocorrelation function is that any lag after the first one should be zero or should be negligible 
# in this case for the sample PACF. 
pacf(yt1, lag.ma = lag.max, ylab='sample YT1',
     ylim=c(-1,1), main="")
pacf(yt2, lag.ma = lag.max, ylab='sample YT2',
     ylim=c(-1,1), main="")