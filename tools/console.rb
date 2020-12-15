require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

pizza = Startup.new("Pizza Place", "James", "pizza.com")
burgers = Startup.new("YUM", "Esma", "yum.com")

bob = VentureCapitalist.new("Bob", 99_000_000)
jane = VentureCapitalist.new("Jane", 2_000_000_000)

fr_one = FundingRound.new(pizza, bob, "Series A", 1_500)
fr_two = FundingRound.new(burgers, jane, "Series B", 2_000)
fr_two = FundingRound.new(pizza, jane, "Series A", 2_000)
fr_three = FundingRound.new(burgers, bob, "Series B", 1_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line