# cli-stock-information
Summary: Provides information for the requested NASDAQ stock symbol(s).
Youtube Demo: https://youtu.be/C-1KEEZMEZw

![Flow Chart](https://github.com/Samuel-DeSantis/cli-stock-information/blob/main/flow_chart.PNG)

## Scraping Stock Information: Google Finance
Stock information scraped from [Google Finance](https://www.google.com/finance).

To look up a particular stock in Google Finance, all you need is the stock symbol
and the auction market. The Google Finance stock listing can be found by changing
.../finance/quote/<stock symbol>:<auction market>. I decided to
isolate the stock range to the NASDAQ market since the majority of users will
probably go for a big name company like Apple or Microsoft, which are both in the 
NASDAQ market.

## Creating a Stock Class
