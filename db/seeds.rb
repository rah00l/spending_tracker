# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creating few entries in accounts...."
## Account(id: integer, name: string, description: text, status: boolean, created_at: datetime, updated_at: datetime)
Account.destroy_all
Account.find_or_create_by(name: "Personal", description: "This is first basic startup account, created during seed data of application",status: true)

puts "Creating few entries in categories...."
## Category(id: integer, name: string, description: text, created_at: datetime, updated_at: datetime)
Category.destroy_all
["Cloths", "Eating Out", "Entertainment","Fuel","General","Gifts","Holidays","Kids","Salary","Shoppings","Sports","Travel"].each do |category|
	Category.find_or_create_by(name: category)
end
puts "Creating few entries in qoutes...."
Qoute.destroy_all
["Rule No. 1: Never lose money. Rule No. 2: Never forget rule No.1", "Price is what you pay. Value is what you get.",
	"Risk comes from not knowing what you are doing.","The most important thing to do if you find yourself in a hole is to stop digging.",
	"You only find out who is swimming naked when the tide goes
out.","You only have to do a very few things right in your life so long as you don't do too many things wrong.",
	"Honesty is a very expensive gift, Don't expect it from cheap people.","Risk comes from not knowing what you're doing",
	"You can't produce a baby in one month by getting nine women pregnant.","You can't produce a baby in one month by getting nine women pregnant.",
	"What the wise do in the beginning, fools do in the end.","Keep all your eggs in one basket, but watch that basket closely.",
	"Keep all your eggs in one basket, but watch that basket closely.","Tell me who your heroes are and I’ll tell you how you’ll turn out to be.",
	"Intensity is the price of excellence.","I try to invest in businesses that are so wonderful that an idiot can run them. Because sooner or later, one will.",
	"The most important investment you can make is in yourself"].each do |qoute|
		Qoute.find_or_create_by(message: qoute, qoute_by: "Warren Buffett")
	end

["Early to bed, early to rise, keeps you healthy, wealthy and wise.","A penny saved is a penny earned.",
	"If you would be wealthy, think of saving as well as getting.",	"If you would know the value of money, go and try to borrow some.",
	"If you would know the value of money, go and try to borrow some.","Money never made a man happy yet, nor will it. The more a man has, the more he wants. Instead of filling a vacuum, it makes one."
	].each do |qoute|
	Qoute.find_or_create_by(message: qoute, qoute_by: "Benjamin Franklin")
end

Qoute.find_or_create_by(message: "I'd like to live like a poor man - only with lots of money. ",qoute_by: "Pablo Picasso")

["My wallet is like an onion, opening it makes me cry.","They say that love is more important than money, but have you ever tried to pay your bills with a hug? ",
"The hardest thing to find in life is happiness - money is only hard to find because it gets wasted trying to find happiness.","Men are like bank accounts. Without a lot of money they don't generate a lot of interest."
].each do |qoute|
	Qoute.find_or_create_by(message: qoute, qoute_by: "Anonymous")
end