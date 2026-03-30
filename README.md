# Portfolio Risk Analysis (R)

## Overview
This project focuses on analyzing an equal-weight stock portfolio using R, with emphasis on risk measurement and performance evaluation. The workflow includes historical data collection, return calculation, portfolio construction, risk metric computation, and visualization of key performance indicators.  

## Dataset
- Source: Yahoo Finance via `quantmod`
- Period: From January 1, 2020
- Tickers: AAPL, MSFT, GOOG

## Project Objectives
The project focuses on three main things:

- Measure the risk and return of each stock individually
- Build an equal-weight portfolio and evaluate its performance
- Compare the portfolio with the market benchmark using beta and alpha

The idea was not to build something overly complicated, but to go through the core risk metrics that are commonly used in portfolio and risk analysis.

## Main steps
### 1. Data Collection
Historical price data for AAPL, MSFT, GOOG, and SPY were downloaded starting from 2020-01-01 using `getSymbols()`.

### 2. Return Calculation
Daily returns were calculated from adjusted close prices to account for corporate actions such as dividends and stock splits, and missing values were removed.

### 3. Individual metrics
For each stock, the following metrics were calculated:

- Annualized return
- Annualized volatility
- Historical VaR (95%)
- Historical CVaR (95%)

### 4. Portfolio Analysis
An equal-weight portfolio was created with the following allocation:

- AAPL: 33.3%
- MSFT: 33.3%
- GOOG: 33.3%

For the portfolio, the following metrics were calculated:
- Annualized return
- Annualized volatility
- VaR (95%)
- CVaR (95%)
- Sharpe ratio
- Maximum drawdown

### 5. Beta and Alpha
A simple linear regression of portfolio returns against SPY returns was run to estimate:

- Daily alpha
- Annualized alpha
- Beta

This helps show how sensitive the portfolio is to market movements.

### 6. Visualization
The project includes the following charts:

Risk vs. return scatter plot
Cumulative portfolio return
Portfolio return distribution
20-day rolling volatility

These charts make it easier to understand the relationship between return, risk, and drawdown.

## Results
### Individual Stock Metrics

| Ticker | Annualized Return | Annualized Volatility | VaR (95%) | CVaR (95%) |
|--------|-------------------|----------------------|-----------|------------|
| AAPL   | 0.2197            | 0.3157               | 0.0307    | 0.0444     |
| MSFT   | 0.1470            | 0.2971               | 0.0277    | 0.0420     |
| GOOG   | 0.2518            | 0.3202               | 0.0305    | 0.0453     |

### Portfolio Metrics

| Metric | Value |
|--------|-------|
| Annualized Return | 0.2102 |
| Annualized Volatility | 0.2733 |
| VaR (95%) | 0.0254 |
| CVaR (95%) | 0.0388 |
| Sharpe Ratio | 0.7692 |
| Maximum Drawdown | 0.3517 |

### Market Exposure

- Daily alpha: 0.0002475  
- Annualized alpha: 0.06237  
- Beta: 1.1576  

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
5. The script will:

- download historical price data
- calculate daily returns
- construct an equal-weight portfolio
- compute risk metrics
- generate charts for volatility, cumulative return, and return distribution

## Future Work
- Extending the backtesting period
- Including additional stocks and alternative weighting schemes
- Portfolio optimization and risk contribution analysis
- Benchmarking against multiple market indices
- Convert to Python version
