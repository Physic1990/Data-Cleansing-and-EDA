# Data-Cleansing-and-EDA

## Introduction

The process of data pre-processing and exploratory data analysis (EDA) conducted on the AAPL stock data from 2020 to 2021 is done here. 
The dataset was initially stored in an Excel file and transferred to a data frame in R for analysis. This report covers the logical and physical organization changes required for the transfer, steps taken for loading, transforming, and saving the dataset, features discovered in the EDA, and any difficulties encountered during the conversion process.

## Logical and Physical Organization

The logical organization of the data in Excel consisted of rows representing individual days and columns representing different attributes such as Date, Open, High, Low, Close, Adj Close, and Volume. When transferring the data to a data frame in R, the logical organization remained the same, with each row representing a single observation and each column representing a variable. However, the physical organization changed from a tabular format in Excel to a structured data frame format in R, facilitating easier manipulation and analysis.

## Loading, Transforming, and Saving the Dataset

The dataset was loaded into R using the `read_excel()` function from the `readxl` package. After loading, the 'Date' column was converted to Date format using the `as.Date()` function to enable time series analysis. The dataset was then saved as a CSV file using the `write.csv()` function to ensure compatibility with other software and ease of sharing.

## Exploratory Data Analysis (EDA)

During the EDA, several features of the dataset were discovered. Summary statistics revealed the range and distribution of closing prices and trading volumes. Histograms and boxplots provided visual insights into the distribution of closing prices and volumes, respectively. Time series analysis revealed trends and seasonal patterns in the stock prices over time. Additionally, correlation analysis highlighted the relationships between different variables in the dataset.

## Difficulties and Solutions

While the dataset did not contain any missing values (NA), one challenge encountered during the conversion process was the identification of seasonal patterns in the time series analysis. Adjusting the frequency parameter in the `ts()` function helped in identifying the appropriate seasonal periods for decomposition.

In conclusion, the data pre-processing and exploratory data analysis conducted on the AAPL stock data provided valuable insights into its characteristics and patterns. The logical and physical organization changes during the transfer to a data frame in R facilitated efficient analysis, while addressing challenges such as missing values and seasonal patterns enhanced the quality of the analysis.

# Output Sample

![Apple Stock Price Over Time](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/e7d46106-5764-4d19-8739-7c27a0c6df53)
![Histogram of Closing Prices](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/2f00a2af-5e3e-4649-879e-f73cbed204cd)
![Forecasts from ARIMA(0,1,1) with drift](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/e7706ea5-7768-48e9-aa5c-997058e69c26)
![Correlation Matrix](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/adfd412f-4903-4e91-8b16-421e973adac4)
![Boxplot of Volume](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/791d5cbd-f5b9-4b75-8d33-4b9e4c84387a)
![Volatility of Apple Returns Over Time](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/e7554b41-0e13-44fc-9878-5f586e588c4d)

<div style="text-align:center">
    <strong>Seasonal Decomposition</strong>
</div>

![Seasonal Decomposition](https://github.com/Physic1990/Data-Cleansing-and-EDA/assets/93368036/d70b6149-6161-49bc-aa03-3eb91f43b7ba)

