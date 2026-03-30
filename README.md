# Portfolio Risk Analysis (R)

## Overview
This project focuses on analyzing an equal-weight stock portfolio using R, with emphasis on risk measurement and performance evaluation. The workflow includes historical data collection, return calculation, portfolio construction, risk metric computation, and visualization of key performance indicators.  

## Dataset
- Source: Yahoo Finance via `quantmod`
- Period: From January 1, 2020
- Tickers: AAPL, MSFT, GOOG

## Tasks
- Collect historical stock and market data using `quantmod`.
- Calculate daily returns based on adjusted closing prices.
- Construct an equal-weight portfolio.
- Compute risk and performance metrics including Sharpe ratio, maximum drawdown, CVaR, alpha, and beta.
- Perform market comparison and regression analysis.
- Visualize rolling volatility, cumulative returns, and return distribution.

## Main steps
### 1. Data Collection
Historical price data for AAPL, MSFT, GOOG, and SPY were downloaded starting from 2020-01-01 using `getSymbols()`.

### 2. Return Calculation
Daily returns were calculated from adjusted closing prices to account for corporate actions such as dividends and stock splits.

### 3. Portfolio Construction
An equal-weight portfolio was created with the following allocation:

- AAPL: 33.3%
- MSFT: 33.3%
- GOOG: 33.3%

### 4. Risk and Performance Metrics
Key metrics computed include:

- Annualized Sharpe Ratio
- Maximum Drawdown
- Conditional Value at Risk (CVaR / Expected Shortfall)
- Alpha (annualized)
- Beta relative to SPY

### 5. Visualization
Generated charts include:

- 20-day rolling volatility
- Cumulative return curve
- Daily return distribution histogram

## Results
Based on the analysis period, the portfolio metrics are as follows:

- **Annualized Sharpe Ratio**: 0.7692
- **Maximum Drawdown**: 0.3517
- **95% CVaR**: -0.0367
- **Annualized Alpha**: 0.0624
- **Beta**: 1.1576

**Observations:**

- The portfolio exhibits moderate risk-adjusted returns.
- Maximum drawdown indicates periods of significant downside risk.
- Beta above 1 implies higher sensitivity to market movements than the benchmark.
- Rolling volatility and return distribution highlight time-varying portfolio risk.

## How to Reproduce
- R (latest version recommended)
- RStudio
- Required packages:
  - quantmod
  - PerformanceAnalytics
  - ggplot2
  - zoo

### Steps
1. Clone this repository.
2. Open `Portfolio_Risk.R` in RStudio.
3. Install required packages: `install.packages(c("quantmod", "PerformanceAnalytics", "ggplot2","zoo"))`
4. Run the script. 

## Future Work
- Extending the backtesting period
- Including additional stocks and alternative weighting schemes
- Calculating additional risk metrics such as VaR and Sortino Ratio
- Portfolio optimization and risk contribution analysis
- Benchmarking against multiple market indices
- Convert to Python version
