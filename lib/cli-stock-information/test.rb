
require 'nokogiri'
require 'open-uri'
require 'pry'

GOOGLE_FINANCE_URL = "https://www.google.com/finance/quote/"
SUFFIX = [":NASDAQ", ":NYSE", ":NYSEARCA"] #=> Auction Markets Scalable 
CSS_SELECTORS = [".eYanAe", ".iYuiXc", ".P6K39c"]

@symbol = "F"

market_list = []



def requested_url(suffix)
    GOOGLE_FINANCE_URL + @symbol + suffix
end

def scrape_key_stats
    keys = []
    values = []
    key_stats = {}  
    SUFFIX.each do |market|
        scraper = Nokogiri::HTML(open(requested_url(market)))
        unless scraper.css(".hCClyc").text == "No results foundarrow_backBack to Google Finance" #=> Correct Page
            puts "Correct Page"
            raw_data = scraper

            data_table = raw_data.css(CSS_SELECTORS[0])
            table_keys = data_table.css(CSS_SELECTORS[1])
            table_values = data_table.css(CSS_SELECTORS[2])

            table_keys.each { |key| keys << key.text.strip }
            table_values.each { |value| values << value.text.strip }
            keys.each.with_index { |k, v| key_stats[k] = values[v] }
            key_stats   
        else
            puts "Incorrect Page"
        end
    end
    key_stats
end

'''
    def scrape_key_stats
        keys = []
        values = []
        key_stats = {}

        raw_data = Nokogiri::HTML(open(requested_url(":NYSE")))

        data_table = raw_data.css(CSS_SELECTORS[0])
        table_keys = data_table.css(CSS_SELECTORS[1])
        table_values = data_table.css(CSS_SELECTORS[2])

        table_keys.each { |key| keys << key.text.strip }
        table_values.each { |value| values << value.text.strip }
        keys.each.with_index { |k, v| key_stats[k] = values[v] }
        key_stats
    end
'''

'''
#aw_data = Nokogiri::HTML(open(requested_url(":NASDAQ")))

data_table = raw_data.css(CSS_SELECTORS[0])
table_keys = data_table.css(CSS_SELECTORS[1])
table_values = data_table.css(CSS_SELECTORS[2])

table_keys.each { |key| keys << key.text.strip }
table_values.each { |value| values << value.text.strip }
keys.each.with_index { |k, v| key_stats[k] = values[v] }
key_stats
'''
binding.pry

'''
SUFFIX.each do |market|
    scrape_info = Nokogiri::HTML(open(requested_url(market))).css(CSS_SELECTORS[0])
    if scrape_info[0] != nil
        x = scrape_info
        answer << x
    end
end
'''

'''
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
'''