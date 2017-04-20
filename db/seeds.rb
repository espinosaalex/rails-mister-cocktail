# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = open(url).read
ingredients = JSON.parse(ingredients)
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end


30.times do
  cocktail = Cocktail.create(name: Faker::Ancient.primordial)
  Dose.create(cocktail: cocktail, ingredient: Ingredient.all.sample)
end


