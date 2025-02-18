phi1=.8
yt1 = arima.sim(n=T, model=list(ar=phi1), sd=sd)
pacf(yt1, lag.ma = lag.max, ylab='sample YT1',
     ylim=c(-1,1), main="")