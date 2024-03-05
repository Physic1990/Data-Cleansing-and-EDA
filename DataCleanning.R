#Load the required libraries
library(readxl)
library(ggplot2)
library(forecast)
library(reshape2)

#Load the dataset from the Excel file
AAPL_2020_2021 <- read_excel("/AAPL_2020-2021.xlsx")

#Convert the 'Date' column to Date format
AAPL_2020_2021$Date <- as.Date(AAPL_2020_2021$Date)

#Save the dataset as a CSV file
write.csv(AAPL_2020_2021, "AAPL_2020_2021.csv", row.names = FALSE)

#Perform exploratory data analysis

#Summary statistics (handling NA values)
summary(AAPL_2020_2021$Close, na.rm = TRUE)
summary(AAPL_2020_2021$Volume, na.rm = TRUE)

#Histogram of Closing Prices
hist(AAPL_2020_2021$Close, main = "Histogram of Closing Prices", xlab = "Close Price")

#Boxplot of Volume
boxplot(AAPL_2020_2021$Volume, main = "Boxplot of Volume")

#Add metadata to the data frame

# Description
attr(AAPL_2020_2021, "description") <- "Apple stock data from 2020 to 2021"

# Source
attr(AAPL_2020_2021, "source") <- "Yahoo Finance API call"

# Author
attr(AAPL_2020_2021, "author") <- "Shashwot Niraula"

# Time Series Analysis
ggplot(data = AAPL_2020_2021, aes(x = Date, y = Close)) +
  geom_line() +
  labs(title = "Apple Stock Prices Over Time", x = "Date", y = "Close Price")

# Correlation Analysis
correlation_matrix <- cor(AAPL_2020_2021[, c("Open", "High", "Low", "Close", "Adj Close", "Volume")], use = "complete.obs")
print(correlation_matrix)
ggplot(data = melt(correlation_matrix), aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2() +
  labs(title = "Correlation Matrix", x = "Variables", y = "Variables")

# Volatility Analysis
AAPL_2020_2021$Returns <- c(NA, diff(log(AAPL_2020_2021$Close)))

ggplot(data = AAPL_2020_2021, aes(x = Date, y = Returns)) +
  geom_line() +
  labs(title = "Volatility of Apple Stock Returns Over Time", x = "Date", y = "Returns")

# Regression Analysis
lm_model <- lm(Close ~ Volume, data = AAPL_2020_2021, na.action = na.exclude)
summary(lm_model)

# Seasonal Decomposition
# Displays four subplots: the original time series, the trend component, the seasonal component, and the remainder (residuals).
AAPL_ts <- ts(AAPL_2020_2021$Close, frequency = 7)  # Assuming weekly seasonality
AAPL_decompose <- stl(AAPL_ts, s.window = "periodic")
plot(AAPL_decompose)

# Outlier Detection
outliers <- boxplot.stats(AAPL_2020_2021$Close)$out
print(outliers)

# Forecasting
AAPL_ts <- ts(AAPL_2020_2021$Close, frequency = 365)
AAPL_forecast <- forecast(auto.arima(AAPL_ts))
plot(AAPL_forecast)

