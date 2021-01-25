require 'nokogiri'
require 'open-uri'
require 'pry'

class GoogleFinance
    attr_reader :symbol

    GOOGLE_FINANCE_URL = "https://www.google.com/finance/quote/"
    SUFFIX = [":NASDAQ", ":NYSE", ":NYSEARCA"]
    CSS_SELECTORS = [".eYanAe", ".iYuiXc", ".P6K39c"]

    @@all = []

    def initialize(symbol)
        @symbol = symbol.upcase
        save
    end

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
                raw_data = scraper
    
                data_table = raw_data.css(CSS_SELECTORS[0])
                table_keys = data_table.css(CSS_SELECTORS[1])
                table_values = data_table.css(CSS_SELECTORS[2])
    
                table_keys.each { |key| keys << key.text.strip }
                table_values.each { |value| values << value.text.strip }
                keys.each.with_index { |k, v| key_stats[k] = values[v] }
                key_stats   
            end
        end
        key_stats
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end