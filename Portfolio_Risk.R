# PORTFOLIO RISK PROJECT

# Packages
# install.packages("quantmod", "PerformanceAnalytics","ggplot2","zoo")

library(quantmod)
library(PerformanceAnalytics)
library(ggplot2)
library(zoo)

# ---- 1. Parameters ----
tickers <- c("AAPL", "MSFT", "GOOG")
benchmark <- "SPY"
start_date <- "2020-01-01"
weights <- c(1/3, 1/3, 1/3)

# ---- 2. Load data ----
getSymbols(c(tickers, benchmark), from = start_date)

# Adjusted prices 
prices <- merge(Ad(AAPL), Ad(MSFT), Ad(GOOG), Ad(SPY))
colnames(prices) <- c("AAPL", "MSFT", "GOOG", "SPY")

# ---- 3. Returns calculation ----
returns <- na.omit(Return.calculate(prices))

stock_ret <- returns[, 1:3]
spy_ret <- returns[, 4]

# ---- 4. Portfolio ----
portf_ret <- Return.portfolio(stock_ret, weights = weights)

# Merge portfolio and benchmark
comp_ret <- na.omit(merge(portf_ret, spy_ret))
colnames(comp_ret) <- c("Portfolio", "SPY")

# ---- 5. Risk and Return Metrics Comparison ----
# Annualized return, volatility, Sharpe
print("Annualized Performance")
print(table.AnnualizedReturns(comp_ret))

# Drawdowns
print("Drawdown Analysis")
print(table.Drawdowns(comp_ret))

# Downside risk (VaR, CVaR)
print("Downside Risk")
print(table.DownsideRisk(comp_ret))

# ---- 6. Beta and alpha ----
reg_model <- lm(Portfolio ~ SPY, data = comp_ret)

alpha_daily <- coef(reg_model)[1]
beta <- coef(reg_model)[2]
alpha_annual <- alpha_daily * 252

cat("CAPM Results")
cat("Annualized Alpha = ", alpha_annual)
cat("Beta = ", beta)

# ---- 7. Rolling volatility (20-day) ----
# Rolling volatility
rolling_volatility <- runSD(portf_ret, n = 20) * sqrt(252)

# Plot
vol_data <- na.omit(data.frame(
  date = index(rolling_volatility),
  vol = as.numeric(rolling_volatility)
))

ggplot(vol_data, aes(x = date, y = vol)) +
  geom_line() +
  labs(title = "Rolling Volatility")

# ---- 8. Plots ----
# Return Distribution
ret_df <- data.frame(
  Return = as.numeric(portf_ret)
)

ggplot(ret_df, aes(x = Return)) +
  geom_histogram(bins = 50, fill = "steelblue", color = "black") +
  labs(title = "Portfolio Return Distribution",
       x = "Daily Return",
       y = "Frequency") +
  theme_minimal()

# Cumulative return comparison
cum_ret <- cumprod(1 + comp_ret) - 1

cum_df <- data.frame(
  date = index(cum_ret),
  Portfolio = as.numeric(cum_ret$Portfolio),
  SPY = as.numeric(cum_ret$SPY)
)

ggplot(cum_df, aes(x = date)) +
  geom_line(aes(y = Portfolio, color = "Portfolio")) +
  geom_line(aes(y = SPY, color = "SPY")) +
  labs(title = "Cumulative Return: Portfolio vs SPY",
       x = NULL,
       y = "Cumulative Return",
       color = "") +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  theme_minimal()

# Drawdown comparison
Sys.setlocale("LC_TIME", "C")
dd_portfolio <- Drawdowns(comp_ret$Portfolio)
dd_spy <- Drawdowns(comp_ret$SPY)

dd_df <- data.frame(
  date = index(dd_portfolio),
  Portfolio = as.numeric(dd_portfolio),
  SPY = as.numeric(dd_spy)
)

ggplot(dd_df, aes(x = date)) +
  geom_line(aes(y = Portfolio, color = "Portfolio"), linewidth = 0.8) +
  geom_line(aes(y = SPY, color = "SPY"), linewidth = 0.8) +
  labs(
    title = "Drawdown: Portfolio vs SPY",
    x = NULL,
    y = "Drawdown",
    color = ""
  ) +
  scale_x_date(date_labels = "%b %Y", date_breaks = "6 months") +
  theme_minimal()

# Monthly return comparison
monthly_ret <- apply.monthly(comp_ret, Return.cumulative)

month_df <- data.frame(
  date = index(monthly_ret),
  Portfolio = as.numeric(monthly_ret$Portfolio),
  SPY = as.numeric(monthly_ret$SPY)
)

month_long <- data.frame(
  date = rep(month_df$date, 2),
  return = c(month_df$Portfolio, month_df$SPY),
  series = rep(c("Portfolio", "SPY"), each = nrow(month_df))
)

ggplot(month_long, aes(x = date, y = return, fill = series)) +
  geom_col(position = "dodge") +
  labs(
    title = "Monthly Return: Portfolio vs SPY",
    x = NULL,
    y = "Monthly Return",
    fill = ""
  ) +
  scale_x_date(date_labels = "%b %Y", date_breaks = "1 year") +
  theme_minimal()

