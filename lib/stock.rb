require 'pry'
require_relative './google_finance.rb'

class Stock
    attr_accessor :symbol

    @@all = []

    def initialize(symbol)
        @symbol = symbol.upcase
        save
    end

    def load_key_stats
        new_stock_request = GoogleFinance.new(@symbol)
        new_stock_request.scrape_key_stats
    end
    
    def display_key_stats
        display = []
        load_key_stats.each { |key, value| display << "#{key}: #{value}\n" }
        puts display
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
#new_stock = Stock.new("aapl")
#binding.pry