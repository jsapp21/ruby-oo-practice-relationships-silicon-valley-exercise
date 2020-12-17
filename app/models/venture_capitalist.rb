require 'pry'

class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    # returns an array of all VCs that have more then 1,000,000,000 (total_worth)
    def self.tres_commas_club
        self.all.select do |investor|
            investor.total_worth >= 1_000_000_000
        end
    end

    # creates a new funding round & associates it with that startup & vc
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment.to_f)
    end 

    # returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select do |vc_instance|
            vc_instance.venture_capitalist == self
        end
    end 

    # Returns a unique list of all startups the VC has funded
    def portfolio
        funding_rounds.map do |vc_instance|
            vc_instance.startup
        end.uniq
    end 

    # returns the largest funding round given by the VC
    def biggest_investment
       funding_rounds.map do |vc_instance|
            vc_instance.investment
       end.max 
    end 

    # returns the total amount invested in that domain
    def invested(domain)
        funding_rounds.map do |vc_instance|
            if vc_instance.startup.domain == domain
                vc_instance.investment.to_i
            end
        end.sum  
    end

end

