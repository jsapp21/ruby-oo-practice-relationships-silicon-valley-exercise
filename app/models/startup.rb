require 'pry'

class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    # change the domain & name of the startup
    # This is the only public method through which the domain should be changed.
    def pivot(name, domain)
        self.name = name 
        self.domain = domain
    end

    def self.all
        @@all
    end
    
    # creates a new funding round & assoicates it with that startup & vc
    def sign_contract(venture_capitalist, type, investment) 
        FundingRound.new(self, venture_capitalist, type, investment.to_f)
    end

    # creates a list of all funding rounds that the start up has
    def funding_rounds_list
        FundingRound.all.select do |funding_instance|
            funding_instance.startup == self
        end 
    end
    
    # Returns the total number of funding rounds that the startup has
    def num_funding_rounds
        funding_rounds_list.count  
    end 

    # Returns the total sum of investments that the startup has
    def total_funds
        funding_rounds_list.map do |fr_instiance|
            fr_instiance.investment.to_i 
        end.sum
    end

    # Returns a unique array of all VCs that have invested in the startup
    def investor
       funding_rounds_list.map do |fr_instiance|
            fr_instiance.venture_capitalist
       end.uniq 
    end

    # Returns a unique array of all VCs that have invested in this company 
    # are in the Trés Commas club
    def big_investors
        investor.select do |investor|
            investor.total_worth >= 1_000_000_000
        end 
    end 

    private

    # returns first startup through the founders name
    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    # returns an array of all of the different startup domains
    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end
    
end
