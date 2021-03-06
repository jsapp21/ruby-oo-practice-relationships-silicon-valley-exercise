require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

pizza = Startup.new("Pizza Place", "James", "pizza.com")
burgers = Startup.new("YUM", "Esma", "yum.com")
ice_cream = Startup.new("BYO Ice Cream", "James", "sweet.com")

bob = VentureCapitalist.new("Bob", 99_000_000)
jane = VentureCapitalist.new("Jane", 2_000_000_000)
larry = VentureCapitalist.new("Larry", 6_000_000_000)

fr_one = FundingRound.new(pizza, bob, "Series A", 10_500.00)
fr_two = FundingRound.new(pizza, jane, "Series B", 40_000.00)
fr_three = FundingRound.new(pizza, jane, "Seed", 200_000.00)
fr_four = FundingRound.new(ice_cream, larry, "Seed", 500_000.00)
fr_five = FundingRound.new(ice_cream, bob, "Pre-Seed", 100_000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line