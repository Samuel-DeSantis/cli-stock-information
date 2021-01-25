require 'pry'
require_relative './stock.rb'

class CLI
    def call
        @status = false
        until @status
            greeting
            index = get_input
            iterate_through_index(index)
            options
        end
        exiting
    end

    def greeting
        puts "\nWelcome to the CLI-Stock-Information Program!\n\n"
        puts "In the following entry, please enter the NASDAQ stock symbol(s) you wish to learn more about. "
        puts "Both comma and space separated symbols will do ( aapl MSFT, FB etc.).\n\n"
        print "Requested Stock Symbols: "
    end

    def get_input
        input = gets.strip
        clean_input(input.upcase)
    end
    
    def clean_input(input)
        split_input = input.split(/[, ]/)
        split_input.delete("")
        split_input
    end

    def look_up_symbol(symbol)
        new_stock = Stock.new(symbol)
        new_stock.load_key_stats
        puts "\n-#{symbol}-"
        new_stock.display_key_stats
    end

    def iterate_through_index(index)
        index.each { |symbol| look_up_symbol(symbol) } 
    end

    def options
        entry = ""
        until entry == "Y" || entry == "n"
            puts "\nWould you like to look up more stock symbols?"
            print "(Y/n): "
            entry = gets.strip
        end
        @status = true if entry == "n"
    end

    def exiting
        puts "<Now exiting>"
    end
end

CLI.new.call
