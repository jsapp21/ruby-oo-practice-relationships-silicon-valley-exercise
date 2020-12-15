require 'pry'

class FundingRound

    attr_accessor :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize (startup, venture_capitalist, type, investment=0)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end



end

