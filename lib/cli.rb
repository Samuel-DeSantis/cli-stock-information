require 'pry'
require_relative './stock.rb'

class CLI
    def call
        @status = ""
        until @status == "exit"
            greeting
            binding.pry
        end
        exiting
    end

    def greeting
        puts "\nWelcome to the CLI-Stock-Information Program!\n\n"
        puts "In the following entry, please enter the stock symbol(s) you wish to learn more about. "
        puts "Both comma and space separated symbols will do ( aapl MSFT, FB etc.)\n\n"
        print "Requested Stock Symbols: "
        index = get_input
        iterate_through_index(index)
    end

    def get_input
        input = gets.strip
        clean_input(input)
    end
    
    def clean_input(input)
        split_input = input.split(/[, ]/)
        cleaned = split_input.delete("")
        cleaned
    end

    def look_up_symbol(symbol)
        new_stock = Stock.new(symbol)
        new_stock.load_key_stats
        new_stock.display_key_stats
    end

    def iterate_through_index(index)
        index.each { |symbol| look_up_symbol(symbol) }
    end

    def exiting
        puts "<Now exiting>"
    end
end

x = CLI.new
binding.pry
