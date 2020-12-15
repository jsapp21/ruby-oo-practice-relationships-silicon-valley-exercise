require 'pry'

class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth=0)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.map do |investor|
            if investor.total_worth >= 1_000_000_000
            investor
            end 
        end.compact!
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment.to_f)
    end 

    def funding_rounds
        FundingRound.all.map do |funding|
            if funding.venture_capitalist == self
                funding
            end 
        end.compact!
    end 

    def portfolio
        FundingRound.all.map do |funding|
            if funding.venture_capitalist == self
                funding.startup
            end 
        end.compact!
    end 

    def biggest_investment
       big_i = FundingRound.all.map do |funding|
            if funding.venture_capitalist == self
                funding.investment
            end 
        end.compact!
        big_i.max  
    end 

    def invested(domain)
        domain_sum = FundingRound.all.map do |funding|
            binding.pry 
            if funding.venture_capitalist == self
                funding.investment
            end 
        end.compact!
        domain_sum.sum 
    end

end

#binding.pry
