require 'nokogiri'
require 'open-uri'
require 'pry'

class GoogleFinance
    attr_reader :symbol

    GOOGLE_FINANCE_URL = "https://www.google.com/finance/quote/"
    SUFFIX = ":NASDAQ"
    CSS_SELECTORS = [".eYanAe", ".iYuiXc", ".P6K39c"]

    @@all = []

    def initialize(symbol)
        @symbol = symbol.upcase
        save
    end

    def requested_url
        GOOGLE_FINANCE_URL + @symbol + SUFFIX
    end

    def scrape_key_stats
        keys = []
        values = []
        key_stats = {}

        raw_data = Nokogiri::HTML(open(requested_url))

        data_table = raw_data.css(CSS_SELECTORS[0])
        table_keys = data_table.css(CSS_SELECTORS[1])
        table_values = data_table.css(CSS_SELECTORS[2])

        table_keys.each { |key| keys << key.text.strip }
        table_values.each { |value| values << value.text.strip }
        keys.each.with_index { |k, v| key_stats[k] = values[v] }
        key_stats
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end

#new_stock_pull = GoogleFinance.new("AAPL")
#binding.pry