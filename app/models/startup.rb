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

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end
    
    def sign_contract(venture_capitalist, type, investment) 
        FundingRound.new(self, venture_capitalist, type, investment.to_f)
    end

    def num_funding_rounds
        FundingRound.all.map do |startup|
            startup.startup
        end 
    end 

    def total_funds
      total = FundingRound.all.map do |startup| 
            if startup.startup == self 
            startup.investment
            end
        end.compact!
        total.sum
    end

    def investor
        FundingRound.all.map do |startup|
            if startup.startup == self
                startup.venture_capitalist
            end
        end.compact!
    end

    # needs work 
    def big_investors
        investor.each do |investor|
            if investor.total_worth >= 1_000_000_000
                return investor
            end 
        end 
    end 

    private

    def self.find_by_founder(founder)
        self.all.select do |startup|
            startup.founder == founder
            startup.name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end
    
end

#binding.pry 