# Differencing and filtering via moving averages
data(co2) 

# Take first differences to remove the trend 
co2_1stdiff=diff(co2,differences=1)

# Filter via moving averages to remove the seasonality 
co2_ma=filter(co2,filter=c(1/24,rep(1/12,11),1/24),sides=2)

par(mfrow=c(3,1), cex.lab=1.2,cex.main=1.2)
plot(co2) # plot the original data 
plot(co2_1stdiff) # plot the first differences (removes trend, highlights seasonality)
plot(co2_ma) # plot the filtered series via moving averages (removes the seasonality, highlights the trend)


#
# Simulate data with no temporal structure (white noise)
#
set.seed(2021)
T=200
t =1:T
y_white_noise=rnorm(T, mean=0, sd=1)
#
# Define a time series object in R: 
# Assume the data correspond to annual observations starting in January 1960 
#
yt=ts(y_white_noise, start=c(1960), frequency=1)
#
# plot the simulated time series, their sample ACF and their sample PACF
#
par(mfrow = c(1, 3), cex.lab = 1.3, cex.main = 1.3)
yt=ts(y_white_noise, start=c(1960), frequency=1)
plot(yt, type = 'l', col='red', xlab = 'time (t)', ylab = "Y(t)")
acf(yt, lag.max = 20, xlab = "lag",
    ylab = "Sample ACF",ylim=c(-1,1),main="")
pacf(yt, lag.max = 20,xlab = "lag",
     ylab = "Sample PACF",ylim=c(-1,1),main="")