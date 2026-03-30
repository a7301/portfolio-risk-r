# Portfolio Risk Analysis (R)

## Overview
This project is a basic portfolio risk analysis built in R， using three large-cap US stocks (`AAPL`, `MSFT`, `GOOG`) to form an equal-weight portfolio and comparing it with `SPY` as a benchmark. The main goal is to understand how the portfolio performs in terms of return, volatility, drawdown, downside risk, and market sensitivity.

## Dataset
- Stocks: `AAPL`, `MSFT`, `GOOG`
- Benchmark: `SPY`
- Start date: `2020-01-01`
- Portfolio weights: equal weight (1/3 each)

Data is retrieved using the `quantmod` package, based on adjusted closing prices.

## Project Objectives
- Build a simple equity portfolio and evaluate its performance
- Compare portfolio performance against a market benchmark
- Analyze both return and risk from multiple perspectives
- Apply commonly used risk metrics in practice
- Present results in a clear and interpretable way

## Main steps
### 1. Data Processing
- Download and clean historical price data
- Align time series and calculate daily returns

### 2. Portfolio Analysis
Construct equal-weight portfolio using `Return.portfolio()` with the following allocation:

- AAPL: 33.3%
- MSFT: 33.3%
- GOOG: 33.3%

**Risk & Performance Metrics**
- Annualized return, volatility, Sharpe ratio
- Drawdown analysis
- Downside risk (VaR, CVaR)
- CAPM regression (alpha, beta)

### 3. Visualization
- Return distribution 
- Cumulative return (Portfolio vs SPY)
- Drawdown comparison
- Monthly return comparison
- 20-day rolling volatility

## Results
### Annualized Performance

| Metric | Portfolio | SPY |
|---|---:|---:|
| Annualized Return | 0.2103 | 0.1301 |
| Annualized Std Dev | 0.2732 | 0.2051 |
| Annualized Sharpe Ratio | 0.7696 | 0.6346 |

The portfolio achieved higher return and higher Sharpe ratio compared to SPY, but also showed higher volatility.

### Drawdown

The worst drawdown in the portfolio was:

- **Depth:** -35.17%
- **From:** 2021-12-28
- **Trough:** 2023-01-05
- **Recovery:** 2023-07-28

This shows the portfolio experienced significant stress periods and slow recovery, which is important from a risk perspective. Other large drawdowns also happened during the COVID period and later market corrections.

### Downside Risk

- VaR (95%): -2.54% (vs -1.79% for SPY)
- Expected Shortfall (95%): -3.88% (vs -3.08% for SPY)

The portfolio has heavier downside risk compared to the benchmark, meaning larger potential losses in extreme scenarios.

### CAPM 

- **Annualized Alpha:** 0.0621
- **Beta:** 1.16

The beta above 1 means the portfolio moved more aggressively than the market.  
The positive alpha suggests the portfolio performed better than what would be expected.

## Key Takeaways

- Higher returns were achieved at the cost of higher volatility and downside risk
- Benchmark comparison is necessary to evaluate whether performance is meaningful
- Drawdown analysis provides a more realistic view of risk than volatility alone
- Beta and VaR help explain how the portfolio behaves under market stress

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
5. The script will output key risk metrics and generate several plots.

## Outputs
The project produces:

Portfolio vs benchmark return comparison
Risk and performance summary tables
Drawdown analysis
Downside risk metrics
CAPM alpha and beta
Rolling volatility over time

## Future Work
- Extending the backtesting period
- Including additional stocks and alternative weighting schemes
- Portfolio optimization and risk contribution analysis
- Benchmarking against multiple market indices
- Convert to Python version
