# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Account(id: integer, name: string, description: text, status: boolean, created_at: datetime, updated_at: datetime)
Account.find_or_create_by(name: "Personal", description: "This is first basic startup account, created during seed data of application",status: true)

## Tag(id: integer, name: string, description: text, created_at: datetime, updated_at: datetime)
["Cloths", "Eating Out", "Entertainment","Fuel","General","Gifts","Holidays","Kids","Shoppings","Sports","Travel"].each do |tag|
	Tag.find_or_create_by(name: tag)
end