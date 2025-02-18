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
yt2=arima.sim(n=T, model=list(ar=phi2), sd=sd)
