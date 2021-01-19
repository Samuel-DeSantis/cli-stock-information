
require 'nokogiri'
require 'open-uri'
require 'pry'

google_finance_url = "https://www.google.com/finance" # Remember to add "/quote/#####:NASDAQ"

requested_symbol = "MSFT"

url_suffix = ":NASDAQ"

requested_url = google_finance_url + "/quote/" + requested_symbol + url_suffix

get_stock = Nokogiri::HTML(open(requested_url))

stock_hash = {}

info = []

stock_details = get_stock.css(".eYanAe")

#puts stock_details.css(".iYuiXc")

x = stock_details.css(".iYuiXc")
y = stock_details.css(".P6K39c")

keys = []

x.each { |key_stat| keys << key_stat.text.strip }

#puts keys

values = []

y.each { |value| values << value.text.strip }

#puts values

pairs = {}

keys.each.with_index { |k, v| pairs[k] = values[v] }

pairs.each { |key, value| puts "#{key}: #{value}" }

#puts get_stock.css(".eYanAe")

#keys = stock_details.css(".iYuiXc").first.text
#values = stock_details.css(".P6K39c").text
#puts keys
